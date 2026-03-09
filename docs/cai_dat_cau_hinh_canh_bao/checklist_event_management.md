# ✅ CHECKLIST AI REVIEW CODE & NGHIỆP VỤ
## Module: QUẢN LÝ SỰ KIỆN – Flutter Desktop App
### Focus: [UC-SK02] Cấu hình hiển thị thông tin sự kiện
---
### 1. Khởi tạo & Tiền điều kiện (Pre-conditions & Init)
* [ ] Popup cấu hình được mở từ màn hình Danh sách quản lý sự kiện [UC-01].

* [ ] **Sidebar bên trái (Menu Loại sự kiện):**
* [ ] Load động danh sách từ Master Data các loại sự kiện AI khả dụng.

* [ ] Mặc định auto-focus/chọn loại sự kiện đầu tiên trong danh sách khi vừa mở popup.

* [ ] **Cấu hình Default (Khi tạo mới):**
* [ ] Dòng 1: Loại sự kiện (In đậm làm tiêu đề).
* [ ] Dòng 2: Thời gian.
* [ ] Dòng 3: Tên Camera.

---

### 2. Xử lý logic theo Loại Sự Kiện

#### A. TH1: Sự kiện không định danh

*(Áp dụng cho: Cảnh báo xâm nhập, hút thuốc, sử dụng điện thoại, tụ tập, cháy, người lạ)* 
* [ ] Dữ liệu Dropdown thêm mới chỉ được hiển thị các thông tin cơ bản từ Camera (Loại sự kiện, Thời gian, Tên Camera).

#### B. TH2: Sự kiện định danh (Nhận diện khuôn mặt)
* [ ] Hiển thị danh sách "Loại đối tượng" dưới dạng Accordion List (Mỗi box = Tên loại đối tượng).
* [ ] Mở rộng (Expand) loại đối tượng nào thì hiển thị cấu hình riêng cho đối tượng đó.
* [ ] Trường dữ liệu hiển thị phải bao gồm: Dữ liệu Camera (mặc định ở đầu) + Các trường dữ liệu động khai báo từ module "Quản lý loại đối tượng".
* [ ] Các thao tác Thêm / Sắp xếp / Xóa chỉ có tác dụng **cục bộ** trong Loại đối tượng đang thao tác.

---

### 3. Thao tác Thêm / Xóa / Sắp xếp Trường thông tin

* [ ] **Thêm trường mới:**
* [ ] Click `[+ Thêm trường thông tin]` -> Dropdown chỉ hiển thị các trường **chưa được chọn**.
* [ ] Khi chọn thành công: Append dữ liệu xuống cuối danh sách hiển thị và remove trường đó khỏi Dropdown.
* [ ] Trạng thái Disable: Khi đã chọn hết trường khả dụng, nút Thêm phải chuyển xám và block thao tác click.

* [ ] **Xóa trường:**
* [ ] Click icon `(X)` -> Xóa dòng dữ liệu khỏi danh sách.
* [ ] Phải push lại trường vừa xóa vào Dropdown Thêm mới để user có thể chọn lại.

* [ ] **Kéo thả (Drag & Drop) & Mapping UI:**
* [ ] Cho phép click giữ icon `(::)` để kéo thả thay đổi thứ tự trường.
* [ ] Logic hiển thị vị trí số 1: Luôn là Tiêu đề + In đậm.
* [ ] Logic hiển thị vị trí số 2 trở đi: Map thành Icon (màn quản lý sự kiện) hoặc Icon + Text (popup chi tiết).

---

### 4. Validate & Submit Data (Lưu / Hủy)

* [ ] **Validate Rule:**
* [ ] Min = 1 trường. Nếu xóa hết và bấm Lưu -> Chặn submit và show Toast message: `"Cần chọn tối thiểu 1 trường thông tin"`.

* [ ] **Lưu cấu hình thành công:**
* [ ] Gửi cấu hình update lên Server.
* [ ] Đóng popup cấu hình.
* [ ] Show Toast message: `"Lưu cấu hình thành công"` (Hiển thị góc trái màn hình, tự tắt sau 3s).

* [ ] **Bắt buộc:** Trigger reload lại dữ liệu màn hình Danh sách [UC-01] để apply UI mới ngay lập tức.

* [ ] **Lưu cấu hình thất bại:**
* [ ] Show thông báo lỗi: `"Có lỗi xảy ra, vui lòng thử lại"`.

* [ ] **Hủy cấu hình:**
* [ ] Đóng popup ngay lập tức và không lưu lại bất cứ state nào.

---

### 5. Render Rule (Quy tắc áp dụng hiển thị)

* [ ] Giới hạn trong màn Cấu hình: User được phép thêm N trường thông tin (không giới hạn số lượng).
* [ ] Giới hạn render thẻ màn Danh sách `[UC-SK01]`: Render **tối đa 5 trường đầu tiên** đúng theo thứ tự đã kéo thả.
* [ ] Giới hạn render màn Chi tiết: Các trường từ vị trí thứ 6 trở đi sẽ bị ẩn ở màn danh sách và phải được show đầy đủ trong Popup chi tiết.

---

Dưới đây là file Markdown checklist chi tiết cho module **[UC-SK03] Xem chi tiết sự kiện**, được xây dựng sát với tài liệu URD bạn cung cấp.

---

# ✅ CHECKLIST AI REVIEW CODE & NGHIỆP VỤ
## Module: QUẢN LÝ SỰ KIỆN – Flutter Desktop App
### Focus: [UC-SK03] Xem chi tiết sự kiện

---

### 1. Khởi tạo & Hiển thị ban đầu

* [ ] Mở popup "Chi tiết sự kiện" khi người dùng click vào một thẻ sự kiện bất kỳ từ màn hình Danh sách quản lý sự kiện.
* [ ] Popup hiển thị mặc định ở tab "Ảnh sự kiện".

---

### 2. Khu vực Trình chiếu Media (Media Viewer)

* [ ] **Tab "Ảnh sự kiện":**
* [ ] Hiển thị ảnh Snapshot chất lượng cao được AI cắt ra tại thời điểm phát sinh sự kiện.
* [ ] Các nút điều khiển Zoom (+/-) và Fullscreen phải hoạt động bình thường.
* [ ] Bắt buộc ẩn các nút điều khiển Video (Play/Pause, Tua) ở thanh control bên dưới.

* [ ] **Tab "Video ghi hình" (Nếu Video khả dụng):**
* [ ] Hệ thống tự động cắt và phát đoạn video trong khoảng: `[Thời gian sự kiện - T giây]` đến `[Thời gian sự kiện + T giây]`.
* [ ] Thanh điều khiển hoạt động đầy đủ: Loa (Volume/Mute), Tua lại, Play/Pause, Tua đi, Zoom In (+), Zoom Out (-), Fullscreen.

* [ ] **Tab "Video ghi hình" (Nếu Video KHÔNG khả dụng):**
* [ ] Không load trình phát video và ẩn toàn bộ thanh control.
* [ ] Hiển thị chính xác thông báo lỗi: `"Dữ liệu video không khả dụng do [message nguyên nhân]"`.
* [ ] Áp dụng đúng message nguyên nhân theo mã lỗi: `[mất kết nối đến máy chủ lưu trữ]`, `[lỗi playback từ thiết bị]`, hoặc `[lỗi không xác định]`.

---

### 3. Thông tin sự kiện & Ghi chú

* [ ] **Danh sách thông tin sự kiện:**
* [ ] Hiển thị tên sự kiện (lấy từ metadata).
* [ ] Danh sách trường dữ liệu hiển thị theo format: `Icon + Label + Value` và ở trạng thái Read-only.
* [ ] **Lưu ý quan trọng:** Phải hiển thị **tất cả** các trường thông tin, KHÔNG bị giới hạn hay phụ thuộc vào số lượng trường được cấu hình bên màn hình danh sách `[UC-SK02]`.

* [ ] **Ghi chú (Note):**
* [ ] Hiển thị dưới dạng Text Area (nhập nhiều dòng) với giới hạn tối đa 500 ký tự.
* [ ] Placeholder phải là: `"Nhập nội dung ghi chú"`.
* [ ] Khởi tạo dữ liệu: Để trống nếu chưa có ghi chú, hoặc hiển thị nội dung cũ nếu đã lưu trước đó.

---

### 4. Nhóm Nút Chức Năng & Điều Hướng

* [ ] **Tải ảnh:**
* [ ] Tải file `.jpg` hoặc `.png`.
* [ ] Tên file chuẩn: `[Tên sự kiện]_[YYYYMMDD_HHmmss].jpg`.

* [ ] **Tải video:**
* [ ] File tải về là đoạn clip sự kiện cắt ngắn (.mp4), không tải toàn bộ video 24h.
* [ ] Tên file chuẩn: `Video_[Tên sự kiện]_[YYYYMMDD_HHmmss].mp4`.
* [ ] Nếu video không khả dụng: Nút bị disable và hiển thị tooltip `"Không thể tải video do [message nguyên nhân]"` khi hover.

* [ ] **Xem trực tiếp:** Điều hướng user sang màn hình Liveview của chính camera ghi nhận sự kiện.

* [ ] **Xem playback:**
* [ ] Điều hướng user sang màn hình Playback tại thời điểm diễn ra sự kiện.
* [ ] Nếu video không khả dụng: Nút bị disable và hiển thị tooltip `"Không thể xem playback do [message nguyên nhân]"` khi hover.

* [ ] **Nút Lưu:**
* [ ] Thành công: Đóng popup, hiển thị Toast message `"Cập nhật ghi chú thành công"` (ở góc trái màn hình, biến mất sau 3s), redirect về màn danh sách `[UC-01]`.
* [ ] Thất bại: Báo lỗi `"Có lỗi xảy ra, vui lòng thử lại"`.

* [ ] **Nút Hủy:**
* [ ] Chưa thay đổi: Đóng popup, về màn hình danh sách, không lưu dữ liệu.
* [ ] Đã nhập liệu: Hiển thị popup xác nhận `"Bạn có chắc chắn muốn hủy bỏ hành động đang thực hiện mà không lưu?"` kèm 2 lựa chọn (Xác nhận / Hủy).

---

### 5. Audit Log (Ghi nhận hệ thống)

* [ ] Đảm bảo backend/frontend có cơ chế ghi log hệ thống đầy đủ khi user thực hiện các hành động: Xem chi tiết sự kiện, Tải video, Cập nhật ghi chú.

---