# ✅ CHECKLIST AI REVIEW – CẤU HÌNH CẢNH BÁO (FLUTTER DESKTOP)

Checklist dùng cho **AI review code + review nghiệp vụ**, áp dụng cho các use case:

- UC-CH01: Xem danh sách cấu hình cảnh báo AI
- UC-CH02: Chỉnh sửa cấu hình cảnh báo AI

---

## I. KIẾN TRÚC & TỔNG THỂ (Flutter Desktop)

- [ ] Áp dụng kiến trúc rõ ràng (Theo thông tin tổng quan đã được cung cấp)
- [ ] Logic nghiệp vụ tách riêng
- [ ] Các tầng layer được tách biệt rõ ràng
  - UI (Widget)
  - State Management
  - Domain / Usecase
  - Repository / Data Source
- [ ] Không hardcode text, trạng thái, enum trong UI

### 2. State Management

- [ ] Có các state xử lý riêng biệt: loading / error / empty
- [ ] Xử lý các state tương ứng và hỗ trợ refresh lại danh sách khi lỗi

---

## II. UC-CH01 – XEM DANH SÁCH CẤU HÌNH CẢNH BÁO AI

### 1. Hiển thị dữ liệu

- [ ] Nội dung tab và title "Cấu hình cảnh báo"
- [ ] Subtitle "Thiết lập các loại sự kiện an ninh cần giám sát cho camera $name"
- [ ] Hiển thị đầy đủ thông tin các sự kiện AI theo thứ tự: “Cảnh báo xâm nhập”, “Cảnh báo hút thuốc”, “Cảnh báo sử dụng điện thoại”, “Cảnh báo tụ tập”, ”Cảnh báo cháy”
- [ ] Mỗi loại cảnh báo bao gồm icon, tên cảnh báo, mô tả và trạng thái hiện tại
- [ ] Badge trạng thái hiển thị đúng (Bật / Tắt)

### 2. Trạng thái Bật / Tắt

- [ ] Trạng thái dựa vào status lấy từ backend
- [ ] Không hardcode trạng thái
- [ ] Trạng thái hiển thị trên danh sách phải được đồng bộ hoặc cập nhật ngay lập tức sau khi người dùng thay đổi cấu hình tại màn hình chi tiết UC-CH02

### 3. Thao tác

- [ ] Click vào một cảnh báo cụ thể để mở popup chi tiết hỗ trợ chỉnh sửa cấu hình của cảnh báo đó

---

## III. UC-CH02 – CHỈNH SỬA CẤU HÌNH CẢNH BÁO

### 1. Popup & UI

- [ ] Popup modal hiển thị đúng title và subtitle như ở danh sách cấu hình cảnh báo AI
- [ ] Nút **Hủy** đóng popup và reset form
- [ ] Nút **Xác nhận** disable khi form invalid
- [ ] Không cho submit nhiều lần liên tiếp
- [ ] Cơ chế Đồng bộ Switch: Trạng thái Bật/Tắt trong popup có giá trị tương đương và đồng bộ 1:1 với trạng thái tại màn hình danh sách UC-CH01

### 2. Validate dữ liệu

**Trường bắt buộc**

- [ ] Điều kiện cảnh báo (Áp dụng với Cảnh báo xâm nhập, Cảnh báo sử dụng điện thoại, Cảnh báo cháy)
  - Với cảnh báo xâm nhập và Cảnh báo sử dụng điện thoại: Nhập số nguyên dương, min = 1s, max = 3600s và default = 10s
  - Với cảnh báo cháy: Dropdown lựa chọn giữa 3 giá trị Phát hiện khói (mặc định), Phát hiện lửa, Phát hiện pháo hoa.
- [ ] Thiết bị phân tích AI: Bắt buộc phải chọn
  - Trường hợp chưa có config
    - Tự động điền sẵn một box đang online + còn kênh trống
    - Trường hợp không có, hiển thị lỗi "Không còn kênh phân tích trống nào." và hiển thị placeholder "Vui lòng chọn thiết bị phân tích AI"
  - Trường hợp đã có config: Hiển thị đúng thông tin box hiện tại
  - Trường hợp box đã đầy: Hiển thị lỗi "Thiết bị này đã hết kênh phân tích, vui lòng chọn thiết bị khác" và disable nút Lưu
- [ ] Âm thanh cảnh báo
  - Ấn play để nghe thử
  - Placeholder khi chưa được chọn "Vui lòng chọn âm thanh cảnh báo"
  - Nếu chưa chọn thì disable nút Lưu

**Trường không bắt buộc**

- [ ] Switch trạng thái: Off (Các trường bên dưới vẫn cho phép chỉnh sửa và lưu nháp nhưng chưa kích hoạt tính năng AI), On (Kích hoạt luồng phân tích tại thời điểm lưu)
- [ ] Vùng giám sát (ROI)
  - Click button "Vẽ vùng" để bắt đầu mode vẽ.
  - Click chuột trái lên ảnh để tạo các điểm neo.
  - Click chuột phải để hoàn thành vùng đa giác
  - Được phép vẽ nhiều đa giác khác nhau không giới hạn.
  - Thao tác xóa: Click nút (X) hiển thị trên góc của mỗi vùng đã vẽ để xóa vùng đó
  - Nếu người dùng không vẽ vùng (Canvas trống) -> Hệ thống mặc định vùng Giám sát = Toàn màn hình
- [ ] Thời gian gửi cảnh báo
  - Cấu trúc: Thời gian bắt đầu - Thời gian kết thúc - Ngày áp dụng (Checklist T2-CN).
  - Logic mặc định: Khi mới mở pop-up cấu hình, hệ thống setup trước thời gian 00:00 - 23:59 áp dụng cho tất cả các thứ (ngày)
  - Người dùng có thể xóa bớt hoặc tạo thêm khoảng thời gian
  - Validate
    - Start Time bắt buộc nhập.
    - End Time bắt buộc nhập và phải > Start Time.
    - Không được tạo quá 6 khoảng thời gian cho cùng 1 thứ (ngày). Nếu tạo thêm khoảng thứ 7 -> Hiển thị Toast message "Không được tạo quá 6 khoảng thời gian trong 1 ngày."
