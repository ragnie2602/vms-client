# ✅ CHECKLIST AI REVIEW CODE & NGHIỆP VỤ  
## Module: QUẢN LÝ SỰ KIỆN – Flutter Desktop App

---

## I. Checklist Tổng quan Kiến trúc & Phân quyền

### 🔐 Phân quyền & Bảo mật
- [ ] API enforce phân quyền theo **Camera / Nhóm Camera**, không chỉ filter phía UI
- [ ] User chỉ nhìn thấy sự kiện thuộc camera được cấp quyền
- [ ] Kiểm tra role (Admin / Khách hàng DN) lấy từ backend, không hardcode
- [ ] Audit Log được ghi cho các hành động:
  - [ ] Xem chi tiết sự kiện
  - [ ] Tải ảnh
  - [ ] Tải video
  - [ ] Cập nhật ghi chú

### 🧱 Kiến trúc Flutter
- [ ] Tách rõ các layer:
  - UI (Widget)
  - State Management
  - Domain / Usecase
  - Repository / Data Source
- [ ] Không xử lý business logic trực tiếp trong Widget
- [ ] FilterCondition được model hóa rõ ràng
- [ ] Pagination, Sort, Filter được xử lý thống nhất
- [ ] Có debounce cho search input

### State Management Details
- [ ] Loading state được emit trước khi gọi API
- [ ] Error state được emit khi exception xảy ra
- [ ] Success state chứa đầy đủ data cần thiết

---

## II. UC-SK01 – Danh sách Quản lý Sự kiện

### 1. Load mặc định & Hiển thị ban đầu
- [ ] Khi vào màn hình:
  - [ ] Active filter **[Hôm nay]**
  - [ ] Sắp xếp theo thời gian mới nhất (DESC)
- [ ] DatePicker mặc định:
  - [ ] Từ: 00:00:00 hôm nay
  - [ ] Đến: Thời gian hiện tại
- [ ] Load mặc định 20 bản ghi / trang
- [ ] Ảnh Snapshot load lazy, không block UI

---

### 2. Bộ lọc nhanh (Quick Action Buttons)

#### Logic thời gian
- [ ] [1 giờ trước]:
  - [ ] From = Now - 1h
  - [ ] To = Now
- [ ] [Hôm nay]:
  - [ ] From = 00:00:00 hôm nay
  - [ ] To = Now hoặc 23:59:59
- [ ] [7 ngày trước]:
  - [ ] From = 00:00:00 (Today - 6)
  - [ ] To = Now
- [ ] [30 ngày trước]:
  - [ ] From = 00:00:00 (Today - 29)
  - [ ] To = Now

#### Hành vi
- [ ] Click filter nhanh → Gán DatePicker + auto search
- [ ] Sửa DatePicker thủ công → Filter nhanh inactive
- [ ] Click filter nhanh khi đang chọn custom date → Override DatePicker

---

### 3. Thanh Tìm kiếm & Lọc (Filter Bar)

#### A. Quy tắc chung cho Dropdown
- [ ] Trạng thái chưa chọn hiển thị: **“Tất cả”**
- [ ] Chọn 1 giá trị:
  - [ ] Hiển thị Chip
  - [ ] Fixed width + ellipsis (...)
- [ ] Chọn ≥2 giá trị:
  - [ ] Hiển thị giá trị đầu tiên
  - [ ] Hiển thị (+N)

---

#### B. DatePicker “Thời gian”
- [ ] Default: Today - 30 ngày → Today
- [ ] Validate:
  - [ ] From ≤ To
  - [ ] Nếu From > To → auto swap
- [ ] Thay đổi DatePicker không auto search (trừ filter nhanh)

---

#### C. Dropdown “Loại sự kiện”
- [ ] Cho phép chọn nhiều (Multiselect)
- [ ] Data load từ Metadata
- [ ] Default: “Tất cả”

---

#### D. Dropdown “Nhóm Camera”
- [ ] Single select
- [ ] Thay đổi giá trị → reload danh sách Camera
- [ ] Default: “Tất cả”

---

#### E. Dropdown “Tên Camera”
- [ ] Multiselect
- [ ] Nếu Nhóm Camera = Tất cả:
  - [ ] Load toàn bộ camera user có quyền
- [ ] Nếu Nhóm Camera cụ thể:
  - [ ] Chỉ load camera thuộc nhóm đó

---

#### F. Searchbox
- [ ] Chỉ hiển thị khi Loại sự kiện có khả năng định danh đối tượng
- [ ] Placeholder thay đổi động theo Loại sự kiện
- [ ] Like Search, không phân biệt hoa thường
- [ ] Có debounce, tránh spam API

---

### 4. Nút chức năng phụ

#### 🔄 Nút “Làm mới”
- [ ] Giữ nguyên toàn bộ filter hiện tại
- [ ] Gọi API với tham số hiện tại
- [ ] Event mới thỏa filter:
  - [ ] Insert/Update lên đầu grid
- [ ] Update lại phân trang nếu cần

---

#### 📥 Nút “Tải về danh sách”
- [ ] Xuất Excel / CSV theo filter hiện tại
- [ ] Tên file đúng format:
  - `DanhSachSuKien_ddMMyyyy_HHmmss.xlsx`
- [ ] File chứa đầy đủ các cột:
  - Mã sự kiện
  - Thời gian
  - Loại sự kiện
  - Tên camera
  - Nhóm camera
  - Metadata động
  - Ghi chú

---

#### ⚙️ Nút “Cấu hình”
- [ ] Mở Popup UC-SK02
- [ ] Reload lại grid sau khi lưu thành công

---

### 5. Lưới hiển thị Sự kiện (Event Grid)

- [ ] Mỗi thẻ gồm:
  - [ ] Snapshot ảnh
  - [ ] Metadata theo cấu hình
- [ ] Dòng 1:
  - [ ] In đậm
  - [ ] Là tiêu đề thẻ
- [ ] Thứ tự metadata tuân thủ cấu hình UC-SK02
- [ ] Dữ liệu null → hiển thị `_`
- [ ] Sắp xếp:
  - [ ] Event mới nhất nằm góc trên trái
- [ ] Phân trang truyền thống
  - [ ] 20 bản ghi / trang

---

## III. UC-SK02 – Cấu hình hiển thị Thông tin Sự kiện

### 1. Popup & Load dữ liệu
- [ ] Mở từ UC-SK01
- [ ] Load danh sách Loại sự kiện từ Master Data
- [ ] Mặc định chọn loại đầu tiên

---

### 2. Thêm / Xóa / Sắp xếp Trường
- [ ] [+ Thêm trường]:
  - [ ] Chỉ hiển thị các trường chưa được chọn
  - [ ] Khi chọn → thêm vào cuối danh sách
- [ ] Khi đã chọn hết:
  - [ ] Disable nút thêm
- [ ] Xóa trường:
  - [ ] Trả lại field vào dropdown
- [ ] Kéo thả:
  - [ ] Thay đổi thứ tự hiển thị
- [ ] Vị trí #1:
  - [ ] Là tiêu đề (In đậm)

---

### 3. Lưu / Hủy
- [ ] Lưu thành công:
  - [ ] Đóng popup
  - [ ] Toast “Lưu cấu hình thành công”
  - [ ] Reload UC-SK01
- [ ] Lưu thất bại:
  - [ ] Thông báo lỗi
- [ ] Hủy:
  - [ ] Không lưu dữ liệu

---

### 4. Quy định hiển thị
- [ ] Màn danh sách:
  - [ ] Chỉ hiển thị 5 field đầu
- [ ] Popup chi tiết:
  - [ ] Hiển thị toàn bộ field

---

## IV. UC-SK03 – Chi tiết Sự kiện

### 1. Popup Chi tiết
- [ ] Tiêu đề: “Chi tiết sự kiện”
- [ ] Mở đúng event được chọn

---

### 2. Media Viewer
#### Tab “Ảnh sự kiện”
- [ ] Hiển thị Snapshot chất lượng cao
- [ ] Zoom + Fullscreen hoạt động
- [ ] Không hiển thị control video

#### Tab “Video ghi hình”
- [ ] Playback từ (T - Xs) đến (T + Xs)
- [ ] Đầy đủ control:
  - Volume
  - Rewind / Forward
  - Play / Pause
  - Zoom
  - Fullscreen

---

### 3. Thông tin & Ghi chú
- [ ] Metadata hiển thị đầy đủ theo cấu hình
- [ ] Ghi chú:
  - [ ] TextArea nhiều dòng
  - [ ] Tối đa 500 ký tự
  - [ ] Load lại ghi chú cũ nếu có

---

### 4. Nút chức năng
- [ ] Tải ảnh:
  - [ ] Đúng format file
- [ ] Tải video:
  - [ ] Chỉ clip sự kiện
  - [ ] Định dạng mp4
- [ ] Xem trực tiếp → Điều hướng Liveview
- [ ] Xem playback → Điều hướng Playback

---

### 5. Footer
- [ ] Lưu:
  - [ ] Thành công → Toast + đóng popup
  - [ ] Thất bại → Thông báo lỗi
- [ ] Hủy:
  - [ ] Có thay đổi → Popup xác nhận
  - [ ] Không thay đổi → Thoát ngay

---

## V. Hiệu năng & UX
- [ ] Không gọi API thừa khi filter thay đổi liên tiếp
- [ ] Có loading / skeleton hợp lý
- [ ] Không giật UI khi load ảnh/video
- [ ] Responsive tốt cho Desktop resize

### Error Handling
- [ ] Validate DatePicker (From ≤ To) trước khi search
- [ ] Toast/Dialog hiển thị error message user-friendly
- [ ] Timeout handling cho API calls

---

## VI. Checklist Review Cuối
- [ ] Đúng nghiệp vụ
- [ ] Đúng phân quyền
- [ ] Đúng UX theo đặc tả
- [ ] Dễ mở rộng cho loại sự kiện AI mới
- [ ] Dễ test & maintain

---
