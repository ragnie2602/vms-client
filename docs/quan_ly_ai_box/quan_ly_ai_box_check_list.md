# ✅ CHECKLIST AI REVIEW – QUẢN LÝ AI BOX (FLUTTER DESKTOP)

Checklist dùng cho **AI review code + review nghiệp vụ**, áp dụng cho các use case:
- UC-AB01: Danh sách AI Box
- UC-AB02: Thêm mới AI Box
- UC-AB04: Chỉnh sửa AI Box
- UC-AB05: Xóa AI Box

---

## I. KIẾN TRÚC & TỔNG THỂ (Flutter Desktop)

### 1. Kiến trúc & tổ chức code
- [ ] Áp dụng kiến trúc rõ ràng (Theo thông tin tổng quan đã được cung cấ)
- [ ] UI (Widget) không chứa logic nghiệp vụ
- [ ] Logic nghiệp vụ tách riêng
- [ ] Service / API layer tách biệt rõ ràng
- [ ] Model AI Box mapping đúng với API response
- [ ] Không hardcode text, trạng thái, enum trong UI

### 2. State Management
- [ ] Danh sách AI Box được quản lý bằng state tập trung
- [ ] Có state: loading / error / empty
- [ ] Filter + Search không gây fetch API dư thừa
- [ ] Danh sách được refresh sau Thêm / Sửa / Xóa

---

## II. UC-AB01 – DANH SÁCH AI BOX

### 1. Hiển thị dữ liệu
- [ ] Hiển thị đầy đủ các cột:
  - [ ] STT  
  - [ ] Tên AI Box  
  - [ ] Hãng AI Box  
  - [ ] Model  
  - [ ] IP:Port (`[IP]:[Port]`)  
  - [ ] Số camera (đang gán / tối đa)  
  - [ ] Trạng thái  
  - [ ] Thao tác  
- [ ] Dữ liệu null / empty hiển thị `_`
- [ ] Badge trạng thái hiển thị đúng (Online / Offline)

### 2. Trạng thái Online / Offline
- [ ] Trạng thái lấy từ backend
- [ ] Không hardcode trạng thái
- [ ] Reload danh sách phản ánh trạng thái mới nhất

### 3. Tìm kiếm
- [ ] Tìm kiếm gần đúng (contains, không phân biệt hoa thường)
- [ ] Quét đúng 3 trường:
  - [ ] Tên AI Box
  - [ ] Model
  - [ ] IP
- [ ] Không crash khi dữ liệu null

### 4. Bộ lọc trạng thái
- [ ] Dropdown có đủ: Tất cả / Online / Offline
- [ ] Mặc định là “Tất cả”
- [ ] Thay đổi filter → tự động cập nhật danh sách
- [ ] Filter + Search kết hợp đúng logic

### 5. Thao tác
- [ ] Menu (...) hiển thị đúng các option: Sửa / Xóa
- [ ] Kiểm tra quyền user trước khi hiển thị action
- [ ] Click action không gây side-effect ngoài ý muốn

---

## III. UC-AB02 – THÊM MỚI AI BOX

### 1. Popup & UI
- [ ] Popup modal hiển thị đúng title
- [ ] Nút **Hủy** đóng popup và reset form
- [ ] Nút **Xác nhận** disable khi form invalid
- [ ] Không cho submit nhiều lần liên tiếp

### 2. Validate dữ liệu

**Trường bắt buộc**
- [ ] Tên AI Box: không rỗng, đã trim
- [ ] Địa chỉ IP: đúng format
- [ ] Port: số nguyên dương
- [ ] Tài khoản: không rỗng, không chứa ký tự cấm
- [ ] Mật khẩu: không rỗng

**Trường không bắt buộc**
- [ ] Số camera tối đa: số nguyên dương
- [ ] Ghi chú: tối đa 200 ký tự, chặn nhập nếu vượt

### 3. Kiểm tra trùng lặp
- [ ] Check trùng IP + Port
- [ ] Check trùng Tên AI Box
- [ ] Thông báo lỗi hiển thị đúng vị trí / toast

### 4. Mật khẩu
- [ ] Có icon Ẩn / Hiện mật khẩu
- [ ] Không log plaintext password
- [ ] Không giữ password trong state quá lâu

### 5. Kết nối thiết bị
- [ ] Gửi request kết nối tới IP:Port
- [ ] Thành công → toast “Thêm mới AI Box thành công”
- [ ] Thất bại → toast “Không thể kết nối tới thiết bị.”

### 6. Nghiệp vụ hệ thống
- [ ] Trim space tất cả field text trước khi gửi server
- [ ] Ghi Audit Log khi thêm mới
- [ ] Reload danh sách sau khi tạo thành công

---

## IV. UC-AB04 – CHỈNH SỬA AI BOX

### 1. Load dữ liệu
- [ ] Popup load đúng dữ liệu hiện tại
- [ ] Không load password plaintext
- [ ] Field không cho sửa được disable rõ ràng

### 2. Validate khi chỉnh sửa
- [ ] Check các trường bắt buộc
- [ ] Chỉ check trùng IP/Port khi có thay đổi
- [ ] Không cho lưu khi dữ liệu không đổi (khuyến nghị)

### 3. Xử lý mật khẩu
- [ ] Không gửi password rỗng lên backend

### 4. Sau khi lưu
- [ ] Toast “Cập nhật AI Box thành công”
- [ ] Đóng popup
- [ ] Refresh danh sách

---

## V. UC-AB05 – XÓA AI BOX

### 1. Kiểm tra ràng buộc
- [ ] Check `camera_count > 0`
- [ ] Nếu có camera:
  - [ ] Không cho xóa
  - [ ] Toast: “Không thể xóa [Tên AI Box] do đang quản lý [n] camera.”

### 2. Popup xác nhận
- [ ] Popup hiển thị đúng tên AI Box
- [ ] Nút **Hủy** → đóng popup
- [ ] Nút **Đồng ý** → thực hiện xóa

### 3. Sau khi xóa
- [ ] Toast “Xóa thiết bị [Tên AI Box] thành công!”
- [ ] Reload danh sách
- [ ] Redirect về màn danh sách (nếu cần)

---

## VI. HIỆU NĂNG & UX (DESKTOP)

- [ ] Không block UI khi call API
- [ ] Có loading indicator rõ ràng
- [ ] Toast không spam

---

## VII. BẢO MẬT & CHẤT LƯỢNG CODE

- [ ] Không log thông tin nhạy cảm (IP, password)
- [ ] Không hardcode credential
- [ ] Handle đầy đủ API error
- [ ] Exception không làm crash app
- [ ] Tên biến, hàm phản ánh đúng nghiệp vụ
- [ ] Không duplicate logic validate giữa Add / Edit

---

