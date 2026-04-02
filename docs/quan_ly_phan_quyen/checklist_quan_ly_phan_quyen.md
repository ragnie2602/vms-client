# ✅ CHECKLIST AI REVIEW CODE & NGHIỆP VỤ  
## Module: QUẢN LÝ PHÂN QUYỀN – VMS Flutter Client

---

## I. Checklist Tổng quan Kiến trúc & Xử lý chung

### 🔐 Xử lý Phân quyền (Dựa trên Matrix VMS)
- [ ] [cite_start]Mặc định FE vẫn cho phép người dùng thao tác trên giao diện, nhưng khi gọi API lưu (nếu BE trả mã lỗi 403) thì hiển thị thông báo "Bạn không có quyền"[cite: 87].
- [ ] [cite_start]Kiểm tra quyền `role.view`: Ẩn menu "Quản lý phân quyền" trên sidebar nếu người dùng không có quyền này[cite: 89].
- [ ] [cite_start]Ghi log tác động (Audit Log) cho các thao tác thay đổi dữ liệu như thêm mới[cite: 45, 84].

### 🧱 Tiêu chuẩn UI/UX chung
- [ ] [cite_start]Trim Space: Tự động xóa khoảng trắng ở đầu và cuối của tất cả các trường text trước khi gửi payload về server[cite: 44, 83].
- [ ] [cite_start]Xử lý dữ liệu trống trên lưới: Các trường không bắt buộc nếu rỗng/null phải hiển thị ký tự gạch dưới `_`[cite: 24].
- [ ] [cite_start]Text Overflow: Với các trường text dài trên bảng, nếu nội dung vượt quá độ rộng cột thì tự động xuống dòng[cite: 25].
- [ ] [cite_start]Empty State: Nếu danh sách không có dữ liệu, hiển thị thông báo "Không có dữ liệu"[cite: 23].

---

## II. UC-PQ01 – Danh sách Nhóm quyền

### 1. Load mặc định & Hiển thị ban đầu
- [ ] [cite_start]Truy cập từ menu "Cấu hình hệ thống" -> "Quản lý phân quyền"[cite: 14].
- [ ] [cite_start]Hiển thị danh sách nhóm quyền hiện có kèm trạng thái tương ứng[cite: 15].

### 2. Bộ lọc & Tìm kiếm
- [ ] Thanh tìm kiếm (Text Input):
  - [ ] [cite_start]Placeholder: "Tìm kiếm theo tên nhóm quyền, mô tả"[cite: 9].
  - [ ] [cite_start]Hỗ trợ tìm kiếm gần đúng trên 2 trường: Tên nhóm quyền, Mô tả[cite: 9].
- [ ] Dropdown Trạng thái:
  - [ ] [cite_start]Tùy chọn: Tất cả trạng thái (Mặc định), Hoạt động, Tạm dừng[cite: 9].
  - [ ] [cite_start]Hành vi: Tự động gọi API lọc lại danh sách ngay khi chọn giá trị mới[cite: 9].

### 3. Bảng dữ liệu (Grid)
- [ ] [cite_start]Các cột hiển thị đầy đủ: STT, Tên nhóm quyền, Mô tả, Trạng thái, Thao tác[cite: 11].
- [ ] [cite_start]Cột Trạng thái sử dụng thành phần Badge (Hoạt động / Tạm dừng)[cite: 11].
- [ ] [cite_start]Cột Thao tác: Click icon "..." hiển thị Dropdown gồm [Sửa] và [Xóa][cite: 11, 21].

---

## III. UC-PQ02 & UC-PQ03 – Thêm mới / Chỉnh sửa Nhóm quyền

### 1. Mở Popup & Khởi tạo
- [ ] [cite_start]Nút [+ Thêm nhóm quyền] mở Modal cấu hình thông tin[cite: 9, 35].
- [ ] [cite_start]Có nút [Hủy] để đóng popup và xóa toàn bộ dữ liệu đang nhập[cite: 31].
- [ ] [cite_start]Có nút [Xác nhận] để kích hoạt luồng kiểm tra dữ liệu[cite: 31].

### 2. Form Thông tin chung
- [ ] Tên nhóm quyền (Bắt buộc):
  - [ ] [cite_start]Placeholder: "Nhập tên nhóm quyền"[cite: 31].
  - [ ] [cite_start]Giới hạn tối đa 255 ký tự[cite: 31].
  - [ ] [cite_start]Có validate chống trùng lặp tên[cite: 31, 39].
- [ ] [cite_start]Trạng thái (Dropdown): Mặc định là "Hoạt động", có thể đổi sang "Tạm dừng"[cite: 31].
- [ ] Mô tả (Tùy chọn):
  - [ ] [cite_start]Placeholder: "Nhập mô tả"[cite: 31].
  - [ ] [cite_start]Tối đa 200 ký tự (Chặn không cho nhập thêm nếu quá giới hạn)[cite: 31].

### 3. Tab Phân loại quyền (Phân quyền chi tiết)
- [ ] [cite_start]Giao diện chia làm 3 tab: Hệ thống, Nhóm đối tượng, Nhóm Camera[cite: 31].
- [ ] [cite_start]Danh sách quyền trong mỗi tab được hiển thị dưới dạng cây (Tree-view)[cite: 31].
- [ ] [cite_start]Hỗ trợ Multiselect (chọn nhiều) trên cây[cite: 31].
- [ ] [cite_start]Logic Checkbox Cây: Khi tick chọn giá trị cha, hệ thống tự động tick chọn tất cả giá trị con, và ngược lại[cite: 31].

### 4. Xử lý Lưu dữ liệu
- [ ] [cite_start]Validate dữ liệu đầu vào (các trường bắt buộc, trùng tên) trước khi gọi API[cite: 37, 38].
- [ ] [cite_start]Nếu lỗi: Hiển thị thông báo lỗi chi tiết ngay dưới trường thông tin tương ứng[cite: 41].
- [ ] Nếu thành công: 
  - [ ] [cite_start]Đóng Popup[cite: 40].
  - [ ] [cite_start]Hiển thị Toast message "Thêm mới nhóm quyền thành công"[cite: 40].
  - [ ] [cite_start]Tự động reload lại trang danh sách[cite: 42].

---

## IV. UC-PQ04 – Xóa Nhóm quyền

### 1. Kiểm tra Ràng buộc trước khi xóa
- [ ] [cite_start]Kiểm tra nhóm quyền có đang được gán cho tài khoản nào không[cite: 55].
- [ ] [cite_start]Nếu đang được gán: Hiển thị Toast "Không thể xóa [tên nhóm quyền] vì có tài khoản đang được gắn với nhóm quyền này" và chặn xóa[cite: 57].
- [ ] [cite_start]Kiểm tra nhóm đã bị xóa bởi user khác chưa -> Hiển thị Toast và dừng luồng[cite: 62].
- [ ] [cite_start]Kiểm tra nhóm có đang liên kết với cấu hình nghiệp vụ khác không -> Hiển thị Toast và dừng luồng[cite: 63].

### 2. Popup Xác nhận Xóa
- [ ] [cite_start]Tiêu đề: "Xóa nhóm quyền"[cite: 53].
- [ ] [cite_start]Nội dung: "Bạn có chắc chắn muốn xóa [Tên nhóm quyền]?"[cite: 53].
- [ ] [cite_start]Nút [Hủy]: Đóng popup, không thực hiện xóa[cite: 53].

### 3. Xử lý sau khi Xác nhận
- [ ] [cite_start]Cảnh báo nghiệp vụ: Khi xóa nhóm cha, toàn bộ nhóm con và đối tượng trực thuộc cũng sẽ bị xóa khỏi hệ thống[cite: 68].
- [ ] [cite_start]Xóa thành công: Hiển thị Toast "Xóa [tên nhóm quyền] thành công!"[cite: 53].
- [ ] [cite_start]Xóa thất bại: Hiển thị Toast "Xóa thất bại. Vui lòng thử lại sau"[cite: 69].

---

## V. UC-PQ05 – Gán Nhóm quyền cho Tài khoản

### 1. Hiển thị Popup
- [ ] [cite_start]Mở từ màn hình Danh sách tài khoản (Popup "Thêm mới/Cập nhật tài khoản")[cite: 71, 79].
- [ ] [cite_start]Dropdown "Nhóm quyền" load danh sách các nhóm quyền hiện có trên hệ thống[cite: 75].

### 2. Xử lý Cập nhật
- [ ] [cite_start]Nút [Hủy] đóng popup[cite: 75].
- [ ] [cite_start]Nút [Xác nhận] kích hoạt luồng lưu thông tin[cite: 75, 80].
- [ ] [cite_start]Cập nhật thành công: Hiển thị Toast message "Cập nhật tài khoản thành công"[cite: 75].

---