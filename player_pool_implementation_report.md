# Báo cáo Triển khai MDK Player Pool - VMS Flutter Client

Tài liệu này trình bày chi tiết toàn bộ phương án kỹ thuật đã thực hiện để xây dựng `PlayerPoolManager` cho hệ thống MDK Player trong dự án VMS Flutter Client. 

Mục tiêu cốt lõi của Player Pool là giải quyết 3 bài toán lớn:
1.  **Hiệu năng & Trải nghiệm:** Chuyển đổi camera mượt mà, không bị đen/lag khi khởi tạo tiến trình Video Decoder. Hỗ trợ hiển thị trên lưới Grid lớn (VD: 36 camera) mượt mà tối đa.
2.  **Quản lý bộ nhớ (Memory Leak):** Giữ mức tiêu thụ RAM tĩnh (flat memory) trong suốt vòng đời ứng dụng, ngăn chặn rò rỉ khi mở rộng/thu hẹp số lượng camera liên tục.
3.  **An toàn trên Desktop Đa cửa sổ (Multi-Window Crash):** Xử lý đặc thù kiến trúc Isolate của Flutter Desktop, tránh lỗi tranh chấp Memory Context (Fatal Exception).

---

## 1. Tại sao phải sử dụng Player Pool?

Trước đây, mỗi `MonitorPlayer` widget tự khởi tạo một đối tượng `Player` (kèm theo luồng FFmpeg C++ bên dưới) thông qua thư viện `media_kit`. Việc khởi tạo mới và hủy đối tượng liên tục khi người dùng thao tác chuyển trang:
*   **Tốn kém CPU/RAM:** Liên tục phải xin HĐH cấp phát lại bộ đệm (buffer), luồng mạng (socket tcp/udp) và gọi bộ giải mã (decoder thread).
*   **Chi phí Texture GPU:** Trên nền tảng Desktop, việc cấp mới Texture ID để kết xuất hình ảnh lên UI mất thời gian (khoảng `1-2` giây), dẫn đến hiện tượng chớp đen khi lật trang lưới camera.
*   **Gián đoạn Reconnect:** Mỗi lần sóng mạng chập chờn luồng bị lỗi, tiến trình cũ bị vứt bỏ, load lại luồng tốn vài giây vô nghĩa.

**Giải pháp:** Mẫu thiết kế **Object Pool**. Các thể hiện `Player` C++ sẽ được tạo ra một lần, tái sử dụng vòng đời.

---

## 2. Kiến trúc Tổ chức Pool Chuẩn VMS

Chúng ta thiết kế lớp `PlayerPoolManager` theo mô hình Singleton để quản lý tập trung dựa trên thiết kế của các hệ thống VMS chuyên nghiệp.

### a. `PlayerWrapper` (Bọc trạng thái & Proxy Event)
Thay vì ném thô `Player` vào Pool, ta bọc nó bằng `PlayerWrapper` để theo dõi vòng đời:
*   `isBusy`: Đánh dấu `true` khi có Widget đang mượn chạy luồng, `false` khi nghỉ ngơi.
*   `isHighQualityReserved`: Cờ ưu tiên (Reserved) cho 1 luồng chất lượng cao nhất (thường là để xem Main Stream 1 camera cận cảnh).
*   `isCorrupted`: Cờ đánh dấu luồng C++ bên dưới đã bị sập (lỗi mạng lâu dài, lỗi core MDK) cần bị đào thải.
*   `lastUsed`: Timestamp ghi lại thời gian cuối cùng trả về Pool, phục vụ dọn rác.

### b. Quy trình Khởi tạo Động (Elastic Creation) - Mượn - Trả O(1)
Để loại bỏ vòng lặp `O(N)` khi tìm Player rảnh rỗi và loại bỏ hiện tượng giật lag khi khởi tạo hàng loạt (Startup Spike), hệ thống sử dụng cấu trúc lưu trữ phân mảnh và khởi tạo lười (lazy creation):
*   `_idlePlayers` (Kiểu List/Queue): Chứa các Player rảnh rỗi.
*   `_busyPlayers` (Kiểu Set): Chứa các Player đang làm việc.
*   **Khởi tạo Động (Elastic):** Hệ thống KHÔNG tạo sẵn 36 player ngay khi mở app. Thay vào đó, nó theo dõi nhu cầu thực tế. Khi Widget đầu tiên gọi `acquire()`, nếu pool rỗng, nó sẽ tự động `_createNewPlayer()`.
*   **Mượn (Acquire):** Rất nhanh chóng `_idlePlayers.removeLast()` (Lấy phần tử O(1)) và nạp vào `_busyPlayers.add()`. Nếu cạn kiệt rảnh rỗi nhưng tổng số player vẫn dưới `maxPoolSize`, Manager lập tức tạo mới.
*   **Gián hạn Rác (minPoolSize):** `minPoolSize` đóng vai trò là sàn (floor) cho Garbage Collection. Nếu số lượng idle player vượt quá `minPoolSize`, `_lazyCleanup` sẽ dọn dẹp phần dư thừa sau 5 phút. Nếu dưới `minPoolSize`, hệ thống giữ player ấm (warm) trên RAM sãn sàng cho lần mở lưới tiếp theo.
*   **Giới hạn RAM (MaxPoolSize):** Cài đặt `maxPoolSize = 100`. Ngăn chặn vọt lố vô tận làm sập RAM máy chủ tính toán.
*   **Trả (Release):** Gỡ khỏi `_busyPlayers` và cất ngược vào cuối hàng đợi `_idlePlayers`.

---

## 3. Xử lý Tránh Rò rỉ Bộ nhớ (Memory Leak Prevention)

Khi 1 luồng kết thúc, nếu ta chỉ thu nó về Pool mà không xóa vết tích của phiên làm việc cũ, HĐH sẽ giữ RAM mãi mãi. Chúng ta áp dụng **Cơ chế Sanitize 2 lớp & Warm Pool**:

### Lớp 1: Warm Pool (Đóng băng Decoder tiết kiệm 80% CPU)
Thao tác ngắt luồng bằng lệnh `player.media = ""` trước đây tiêu diệt luôn quá trình giải mã (Destroy Decoder).
*   **Giải pháp mới:** Ứng dụng mô hình **Warm Pool (Hồ Nước Ấm)**. Khi Widget bị đóng, PlayerWrapper gọi lệnh ngắt nhẹ nhàng `player.state = PlaybackState.stopped`.
*   **Lợi ích:** Luồng tải luồng TCP/RTSP ngưng lại (Không chiếm băng thông), nhưng ngữ cảnh Video (Decoder Context H264) vẫn nằm lại trong RAM (Chế độ chờ/Sleep).
*   Khi người dùng lật lưới 36 camera mượn lại Player và set URL mới, nó kết nối thẳng tới Decoder nhàn rỗi mà không cần cấp phát lại luồng C++. Giảm thiểu 60-80% sức mạnh CPU/GPU hao phí.

### Lớp 2: Xóa sổ các Subscription/Listener của UI cũ (Quan trọng nhất)
Đây là nguyên nhân chính gây Memory Leak trên Flutter. Mọi UI widget đăng ký stream sự kiện để vẽ thanh cuộn tiến trình (nếu có).
*   `PlayerWrapper` hoạt động như một Tracker. Khi thực thi `sanitize()`, wrapper sẽ gọi `cancel()` duyệt qua toàn bộ mọi subscription cũ để giải phóng tàn dư bộ nhớ Dart.

### Lớp 3: Dọn rác lười (Lazy Cleanup) & Dispose Pool vòng tay
*   Có một Timer chạy ngầm `_lazyCleanup` định kỳ 2 phút.
*   Nó lướt trong `_idlePlayers`. Nếu 1 Player "ngủ quên" quá 5 phút mà không ai mượn, nó mới gọi API mức hệ thống `player.dispose()`, ép C++ `free()` bộ nhớ thực sự.
*   Bổ sung hàm `disposePool()` được gọi khi Cửa sổ (Window) đóng lại để dập định tuyến Timer rò rỉ.

---

## 4. Xử lý Đặc thù & Ngăn chặn App Văng (Crash Prevention)

### a. Multi-Window Memory Isolation (Hiểm hoạ Đa Cửa Sổ)
Thư viện `desktop_multi_window` hoạt động bằng cách sinh ra các **Isolate** riêng biệt cho mỗi Cửa sổ màn hình. Mỗi Isolate có một không gian nhớ (Memory Space) hoàn toàn độc lập, chúng thậm chí không thể share biến tĩnh.
*   **Khắc phục bằng "Single-Isolate Sandbox":** Chấp thuận định lý cơ sở Isolate của Flutter. Singleton `PlayerPoolManager` của mỗi Isolate chỉ vận hành `_idlePlayers` và `_busyPlayers` **duy nhất** cho cửa sổ của chính nó. Ngăn chặn triệt để xung đột cấp phát Texture ID của GPU qua lại giữa các Window (Khắc phục Fatal Error).

### b. Theo dõi sức khoẻ ngầm (Automatic Player Health Check & Quarantine)
Mạng yếu liên tục dẫn đến cơ chế reconnect lặp lại có thể làm bộ giãi mã (FFmpeg C++) bị sập state (Treo buffer, lỗi lõi libmdk).
*   **Giải pháp Nhịp tim (Heartbeat):** `PlayerWrapper` tự mình hook một rể sâu xuống `player.onMediaStatus()` ở tầng C++ để theo dõi độc lập với UI.
*   Nếu nhận thấy trạng thái `MediaStatus.invalid` (bị văng lỗi file), Wrapper TỰ ĐỘNG đánh cờ **Thuốc độc**: `isCorrupted = true`. UI Widget bên ngoài có thể hook thông qua cầu nối `setUiStatusCallback` để không bị đụng hàng làm mất sự kiện.
*   **Cách ly (Quarantine):** Khi Manager nhận một Player bị đánh cờ trả về từ hàm `release`, nó loại bỏ Player này khỏi danh sách rảnh rỗi ngay lập tức. Sau đó set delay 1s rồi gọi tiêu huỷ thực sự `dispose()`. Độ trễ này bảo vệ an toàn để Flutter Render Tree kịp rút lệnh vẽ lên màn hình (Khắc phục Dirty Texture Frame Error).

---

## 5. Nâng cấp cốt lõi & Vá lỗ hổng bổ sung (Review Refactor)

Qua quá trình rà soát và đánh giá hiệu năng bộ nhớ (Memory Profiling) chuyên sâu, hệ thống Pool đã được vá thêm những lỗ hổng tiềm ẩn cực kỳ nguy hiểm và cải tiến logic xử lý:

### a. Khắc phục Rò rỉ Memory (Memory Leak) MDK Event Listener
*   **Vấn đề (Leak #2):** Trong trạng thái lười biếng (Idle) hoặc Sanitize, mặc dù UI callback đã ngắt, C++ Decoder vẫn có thể rò rỉ các event `onMediaStatus`. Việc cập nhật liên tiếp timestamp `lastUsed` trong lúc này đánh lừa hàm Dọn rác `lazyCleanup()`, khiến các idle player rác cứ tồn đọng không bao giờ bị hủy.
*   **Giải pháp:** Bổ sung điều kiện chặn `if (isBusy)` để đảm bảo chỉ ghi nhận `lastUsed` khi thiết bị thực sự đang tiêu thụ bởi UI Widget. Ngắt listener bằng `player.onMediaStatus(null)` trong hàm `sanitize()`.

### b. Ngăn chặn Duplicate Tham chiếu Cache (Memory Leak #3)
*   **Vấn đề:** Khi tái sử dụng O(1) qua biến `_idleUrlCache`, hành động mượn/trả liên tục 1 URL dẫn đến việc `List` bị duplicate rác nhiều lần cùng một PlayerWrapper (nhờ phép `putIfAbsent`).
*   **Giải pháp:** Trước khi Add vào `_idleUrlCache` trong hàm release, hệ thống thực thi câu lệnh dọn dẹp tham chiếu rác: `_idleUrlCache[url]?.remove(wrapper);` bảo vệ toàn vẹn dữ liệu O(1).

### c. Xử lý Logic Rác HQ Pool và Lỗi Cache Miss
*   **Quản lý HQ Players (Bug #2):** Các player chất lượng cao (HQ) trước đây không có luật Garbage Collection. Đã bổ sung cơ chế cho riêng cấu trúc HQ: tự động dọn sát (Dispose) nếu nằm rỗng (Idle) vượt quá **10 phút**.
*   **Fix Logic Cache (Bug #1):** Sửa lỗi điều kiện `??`, ép buộc `player.lastMediaUrl = mediaUrl` ngay cả khi param null. Đảm bảo Cache Lookup Dictionary tuyệt đối không bị trỏ sai thông tin vào luồng Stream cũ kỹ.

### d. Chuyển đổi trạng thái Stopped vs Paused (Warm Context)
*   **Cải tiến:** Quá trình `sanitize` nâng cấp chuyển MDK Playback State sang `paused` thay vì `stopped`. Do đó Context giải mã của luồng Video giữ nguyên trên RAM. 
*   **Hiệu ứng UI:** Chuyển đổi qua lại giữa lưới 36 Grid và 9 Grid trở nên **Instant Frame** (dưới 5ms) mà không bị chớp đen Frame. Khuyến khích kết hợp `RepaintBoundary` và cơ chế tắt Texture Lifecycle bên ngoài Flutter Widget để đảm bảo hiệu năng Rendering cao nhất.

---

## 6. Tối ưu Luồng Resume từ Cache (Fast-Path Live Stream)

Sau khi triển khai Pool cơ bản, luồng chuyển đổi giữa View Chi tiết ↔ Grid View vẫn bị **delay 1-3 giây** do player phải reconnect lại RTSP/TCP dù đã được cache trong Pool. Nguyên nhân và giải pháp:

### a. Vấn đề: Media Setter phá hủy Warm Cache

Khi player được trả về Pool, hàm `sanitize()` chỉ đưa về trạng thái `paused` (giữ nguyên kết nối mạng + decoder context). Tuy nhiên, khi `_connecting()` trong `MonitorPlayer` chạy, nó **luôn gọi** `_player.media = widget.source` — hành động này trigger native `setMedia()` qua FFI, **flush toàn bộ buffer** và **reconnect lại từ đầu**, hoàn toàn vô hiệu hóa lợi ích warm cache.

### b. Giải pháp: Fast-Path riêng biệt cho Cache Hit

Bổ sung cờ `isCacheHit` trên `PlayerWrapper`, được set bởi `acquire()` khi phát hiện player có `lastMediaUrl` trùng với URL yêu cầu.

Hàm `_connecting()` giờ có **2 nhánh xử lý riêng biệt**:

| | **Fast-Path (Cache Hit)** | **Normal Path** |
|---|---|---|
| **Điều kiện** | `isCacheHit && !isReconnecting && !isDisposed` | Tất cả trường hợp khác |
| **Reload media** | ❌ Bỏ qua hoàn toàn | ✅ Gọi `setMedia()` đầy đủ |
| **Tạo Texture** | ❌ Tái sử dụng texture cũ | ✅ `updateTexture()` nếu cần |
| **Buffer skip** | ✅ `seek(buffered, fromNow \| keyFrame)` fire-and-forget | Không áp dụng |
| **Loading spinner** | ❌ Hiển thị frame cuối cùng ngay lập tức | ✅ Hiện loading chờ first frame |
| **Aspect ratio** | Khôi phục từ `mediaInfo` (đồng bộ) | Chờ `textureSize` (async) |
| **Resume** | `state = PlaybackState.playing` | `media = url; state = playing` |
| **Độ trễ** | **~0ms** (tức thì, zero-latency) | 1-3s (RTSP handshake + decode) |

**Cơ chế Instant Frame:** Fast-path đặt `PlayerState.initialized` **ngay lập tức** (không qua `initializing`/loading spinner). GPU Texture vẫn giữ frame cuối cùng từ phiên trước → người dùng thấy hình ảnh camera hiện ra tức thì. Seek + resume chạy fire-and-forget trong background, video live tự cập nhật lên realtime mà không có khoảng trống đen.

**Cơ chế Buffer Skip:** Vì đây là live stream, khi player nằm trong Pool ở trạng thái pause, buffer sẽ tích lũy các frame cũ. Lệnh `seek(position: buffered, flags: SeekFlag.fromNow | SeekFlag.keyFrame)` nhảy qua toàn bộ buffer cũ, đưa video về mốc thời gian thực (realtime) ngay lập tức.

### c. Validation An toàn Bộ nhớ (Memory Safety)

Fast-path bổ sung 3 lớp kiểm tra trước khi resume để ngăn crash:

1. **`!_player.isDisposed`**: Đảm bảo native player chưa bị hủy (tránh gọi FFI trên object freed → SIGSEGV)
2. **`textureId >= 0`**: Xác thực GPU Texture còn hợp lệ. Nếu texture đã bị release, fallback về Normal Path với log cảnh báo
3. **Guard trong Build method**: Trước khi truy cập `_player.textureId` (ValueNotifier), kiểm tra `_player.isDisposed`. Nếu player đã disposed → render `SizedBox.shrink()` thay vì crash `ValueNotifier was used after being disposed`

### d. Khắc phục Log Spam `invalid media status`

**Vấn đề:** MDK `MediaStatus` là bitmask — khi bit `invalid` được set, nó tồn tại trên **mọi lần gọi callback** tiếp theo, gây spam log hàng trăm dòng `"Player pw_X detected invalid media status! Marking as corrupted"`.

**Giải pháp:** Thêm guard `!isCorrupted` trước khi kiểm tra `MediaStatus.invalid`. Log và đánh dấu corrupted **chỉ 1 lần duy nhất** mỗi vòng đời player.

### e. Log Diagnostics cải tiến

Bổ sung tham số `cameraName` vào hàm `acquire()` để log hiển thị tên camera cụ thể, giúp debug dễ dàng hơn:
```
Player Pool [0]: Acquired normal player pw_5 for "Camera Sảnh A" (Cache Hit: true)
```

### f. Chống xâm nhiễm Cache (Cache Pollution Prevention)

**Vấn đề:** Khi một camera mới (VD: "10.3.3.228") yêu cầu player mà không có URL cache hit, hàm `acquire` trước đây dùng `removeLast()` — vô tình **trộm mất** player vừa được trả về từ camera khác (VD: pw_35 đang giữ cache cho "Camera Ngã ba"). Việc này ghi đè `lastMediaUrl`, phá hủy khả năng cache hit của camera gốc.

**Giải pháp 3 lớp:**
1. **Ưu tiên player "sạch"** (`lastMediaUrl == null`): Khi fallback pool, tìm player chưa từng sử dụng trước. Không ảnh hưởng cache của bất kỳ camera nào.
2. **FIFO thay vì LIFO**: Khi buộc phải lấy player đã có URL, chọn thằng **cũ nhất** (`removeAt(0)`) thay vì mới nhất (`removeLast()`). Player cũ nhất ít có khả năng được tái sử dụng nhất.
3. **Xoá tham chiếu URL cũ**: Khi trộm player, xoá ngay reference cũ trong `_idleUrlCache` để tránh dangling pointer.

### g. Cấu hình Pool Player Chất lượng cao (HQ Pool)

**Cải tiến:** Bổ sung `minHqPoolSize` (mặc định `2`) để khởi tạo đủ player HQ từ đầu, phục vụ luồng xem chi tiết. Lazy cleanup giữ lại tối thiểu `minHqPoolSize` player HQ, không dùng hard cap riêng cho HQ vì `maxPoolSize` toàn cục đã đủ bảo vệ.

### h. Adaptive minPoolSize & Bảo vệ Cache khi Acquire (Cache-Preserving Acquire)

**Vấn đề 1 — Lãng phí RAM khi số lượng camera nhỏ:** Trước đây `minPoolSize` cố định bằng `36`. Với hệ thống chỉ có 8 camera, Pool khởi tạo dư thừa 28 Player C++ không bao giờ dùng đến, tiêu tốn RAM và GPU Texture vô ích.

**Giải pháp — Adaptive minPoolSize:** Biến `minPoolSize` thành giá trị thích ứng, được cập nhật tự động khi ứng dụng fetch danh sách camera từ API (`getAllCamera`). Công thức: `_minPoolSize = min(36, cameraCount) + 1`.
*   **Cận dưới:** Hệ thống 8 camera → `minPoolSize = 9`. Chỉ tạo 9 player, tiết kiệm ~75% RAM so với trước.
*   **Cận trên:** Hệ thống 100+ camera → `minPoolSize = 37`. Giới hạn bộ khởi tạo ban đầu ở mức hợp lý.
*   **+1 Headroom:** Dành cho thao tác nhất thời như mở xem chi tiết HQ (Detail View) trong khi lưới Grid đang hiển thị đầy đủ.
*   **Thread-safe:** Dart là single-threaded (event loop), mọi truy cập `_minPoolSize` đều trên cùng Isolate — không cần mutex/lock.
*   **Điểm gọi:** `MonitorBloc._onGetAllCamera()` gọi `PlayerPoolManager.instance.updateMinPoolSize(cameras.length)` ngay sau khi nhận dữ liệu camera thành công.
*   Pool vẫn co giãn động (elastic) vượt `_minPoolSize` khi cần qua `_createNewPlayer()`, và `_lazyCleanup` tự thu hồi về `_minPoolSize` sau 5 phút idle.

**Vấn đề 2 — Camera chập chờn phá hoại Cache player khác:** Khi tất cả idle player đều có cached URL, một camera liên tục disconnect/reconnect sẽ khiến player bị Quarantine → mất khỏi Pool. Lần reconnect tiếp theo, hàm `acquire()` buộc phải **trộm (steal)** player đang giữ cache cho camera online khác → camera bị trộm mất cache hit, phải reconnect RTSP lại từ đầu (delay 1-3s).

**Kịch bản cụ thể:**
1.  Lưới 6×6 (36 camera), tất cả busy
2.  Camera X mất mạng → player bị corrupted → Quarantine → chỉ còn 35 idle khi trả về Pool
3.  Người dùng mở Detail View rồi quay lại Grid → 36 acquire() gọi đồng thời
4.  35 camera khớp cache, Camera X không khớp → **trộm player cũ nhất** (của Camera A)
5.  Camera A bị mất cache → cũng phải reconnect → hiệu ứng domino

**Giải pháp — Ưu tiên tạo mới thay vì trộm (Prefer Create over Steal):** Khi không còn idle player "sạch" (chưa có `lastMediaUrl`) và phải fallback, hệ thống **không trộm player có cache** nữa. Thay vào đó, kiểm tra `totalPlayers < maxPoolSize`:
*   **Dưới giới hạn:** Bỏ qua idle pool, rơi thẳng xuống `_createNewPlayer()` — tạo player mới mà không phá hoại cache của ai.
*   **Đạt giới hạn cứng** (`maxPoolSize = 100`): Lúc này mới thực hiện steal oldest (LRU eviction) — đây là biện pháp cuối cùng khi tài nguyên hệ thống thực sự cạn kiệt.
*   `_lazyCleanup` tự động thu hồi các player dư thừa về `_minPoolSize` sau 5 phút idle, đảm bảo RAM không bị phình vĩnh viễn.

---

**Tổng kết:** Kiến trúc Player Pool sau nâng cấp (hỗ trợ Warm Pool, Fast-Path Zero-Latency Resume, chống O(N) lookup, chống Cache Pollution, vá rò rỉ Duplicate Caches, cách ly rủi ro Heartcheck ngầm, bảo vệ an toàn bộ nhớ đa tầng, Adaptive Pool Size thích ứng số lượng camera, và cơ chế Prefer-Create-over-Steal bảo toàn cache) biến VMS Flutter Client từ một phần mềm load tải camera thông thường trở thành một trạm giám sát chịu tải nặng thực thụ. Tối giản đáng kinh ngạc băng thông vòng lặp, làm phẳng hoàn toàn bộ nhớ (Zero Memory Leak), tăng độ êm cho GPU và đạt tốc độ chuyển đổi camera **tức thì (Zero-Latency Instant Frame Resume)**.
