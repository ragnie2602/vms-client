# ✅ CHECKLIST AI REVIEW CODE & NGHIỆP VỤ
## Module: QUẢN LÝ SỰ KIỆN – Flutter Desktop App
### Focus: [UC-LV02] Cấu hình hiển thị thông tin sự kiện (Liveview)

---

### 1. Khởi tạo & Tiền điều kiện (Pre-conditions & Init)

* [ ] User đang ở màn hình Liveview, mở Sidebar "Cảnh báo" bên phải.
* [ ] Truy cập cấu hình: Click vào biểu tượng 3 chấm (⋮) tại Sidebar -> chọn "Cấu hình".
* [ ] Tiêu đề Modal hiển thị đúng: "Cài đặt hiển thị cảnh báo".

* [ ] **Sidebar bên trái (Menu Loại sự kiện):**
* [ ] Load động danh sách từ Master Data các loại sự kiện AI khả dụng.
* [ ] Mặc định chọn loại sự kiện đầu tiên trong danh sách khi mở Popup.

* [ ] **Cấu hình Default (Khi tạo mới):**
* [ ] Dòng 1: Loại sự kiện (Dùng làm tiêu đề in đậm).
* [ ] Dòng 2: Thời gian.
* [ ] Dòng 3: Tên Camera.

---

### 2. Tính Độc lập Của Cấu Hình (Important Rule)

* [ ] **Độc lập dữ liệu:** Cấu hình này độc lập hoàn toàn với cấu hình tại màn hình "Quản lý sự kiện".
* [ ] **Không ảnh hưởng chéo:** Việc thay đổi thứ tự hiển thị ở Liveview tuyệt đối không làm đảo lộn thứ tự hiển thị ở màn hình Quản lý sự kiện và ngược lại.

---

### 3. Xử lý logic theo Loại Sự Kiện
#### A. TH1: Sự kiện không định danh

*(Áp dụng: Cảnh báo xâm nhập, Hút thuốc, Sử dụng điện thoại, Tụ tập, Cảnh báo cháy)* 
* [ ] Dữ liệu đối tượng không định danh được cụ thể nên Dropdown thêm mới chỉ hiển thị dữ liệu từ camera (Loại sự kiện, Thời gian, Tên Camera).

#### B. TH2: Sự kiện định danh (Nhận diện khuôn mặt) 

* [ ] Hiển thị danh sách "Loại đối tượng" dưới dạng Accordion List (Mỗi box = Tên loại đối tượng).
* [ ] Chứa danh sách các trường dữ liệu được cấu hình riêng cho Loại đối tượng khi user click mở rộng.
* [ ] Trường dữ liệu bao gồm: Dữ liệu từ Camera (Default hiển thị ở đầu) + Dữ liệu thông tin đối tượng (Các trường động khai báo trong module Quản lý loại đối tượng).
* [ ] Các hành động Thêm/Sửa/Xóa chỉ có tác dụng **cục bộ** trong Loại đối tượng đó.

---

### 4. Thao tác Thêm / Xóa / Sắp xếp Trường thông tin

* [ ] **Thêm trường mới:**
* [ ] Click `[+ Thêm trường thông tin]` -> Hệ thống hiển thị Dropdown chứa các trường chưa được chọn.
* [ ] Khi chọn 1 trường -> Thêm vào cuối danh sách hiển thị và trường đó biến mất khỏi Dropdown.
* [ ] Trạng thái Disable: Khi User đã chọn tất cả các trường khả dụng -> Nút bị disable (màu xám), không cho phép thao tác.

* [ ] **Xóa trường:**
* [ ] Click icon `(X)` ở cuối dòng -> Dòng dữ liệu bị xóa khỏi danh sách.
* [ ] Trường dữ liệu được trả lại vào Dropdown `[+ Thêm trường thông tin]`.

* [ ] **Kéo thả (Drag & Drop) & Mapping UI:**
* [ ] Click giữ icon `(::)` ở đầu dòng và kéo thả để thay đổi thứ tự.
* [ ] Vị trí số 1: Luôn đóng vai trò là Tiêu đề + In đậm.
* [ ] Vị trí số 2 trở đi: Hiển thị dạng metadata (Icon) cho thẻ sự kiện và dạng metadata (Icon + Text thường) cho popup chi tiết.

---

### 5. Validate & Submit Data (Lưu / Hủy)

* [ ] **Lưu cấu hình thành công:**
* [ ] Gửi cấu hình lên Server.
* [ ] Đóng Popup và hiển thị Toast Message: "Lưu cấu hình thành công".
* [ ] Sidebar cập nhật hiển thị ngay lập tức theo cấu hình mới (Reload lại dữ liệu để áp dụng).

* [ ] **Lưu cấu hình thất bại:**
* [ ] Hiển thị thông báo lỗi "Có lỗi xảy ra, vui lòng thử lại".

* [ ] **Hủy cấu hình:**
* [ ] Đóng Popup ngay lập tức, không lưu dữ liệu.

---

### 6. Render Rule (Giới hạn hiển thị)

* [ ] **Màn hình Cấu hình:** Người dùng có thể thêm N trường thông tin (không giới hạn).
* [ ] **Sidebar Liveview:** Hệ thống chỉ render **max 5 trường đầu tiên** theo đúng thứ tự cấu hình.
* [ ] **Popup chi tiết:** Các trường từ thứ 6 trở đi sẽ bị ẩn ở màn danh sách (Sidebar), nhưng sẽ hiện tất cả trong popup chi tiết.