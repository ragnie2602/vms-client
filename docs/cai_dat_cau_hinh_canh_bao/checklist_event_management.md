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