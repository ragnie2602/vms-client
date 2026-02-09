# CHECKLIST TEST – LIVEVIEW EVENT SIDEBAR (VMS)

---

## I. UC-LV01 – Xem danh sách sự kiện tại màn Liveview

### A. Điều kiện & Khởi tạo
- [ ] User chưa đăng nhập → Không truy cập được Liveview
- [ ] User đã đăng nhập → Truy cập được Liveview
- [ ] Click button “Cảnh báo” → Sidebar mở bên phải
- [ ] Tab mặc định là “Tất cả”
- [ ] Bộ lọc loại sự kiện mặc định là “Tất cả”

---

### B. Header & Menu tác vụ
- [ ] Header hiển thị đúng text “Cảnh báo”
- [ ] Icon menu 3 chấm (⋮) hiển thị
- [ ] Click menu → Hiển thị option “Cấu hình”
- [ ] Click “Cấu hình” → Redirect sang UC-LV02
- [ ] Không có option dư / sai quyền

---

### C. Tab Filter – “Tất cả”
- [ ] Hiển thị sự kiện từ toàn bộ camera user có quyền
- [ ] Bao gồm cả camera không nằm trong lưới video
- [ ] Sự kiện realtime xuất hiện ngay lập tức
- [ ] Event mới được chèn lên đầu danh sách
- [ ] Event cũ bị đẩy xuống dưới

---

### D. Tab Filter – “Cam đang xem”
- [ ] Lấy đúng danh sách CameraID đang render trên lưới
- [ ] Chỉ hiển thị event có CameraID trùng
- [ ] Chuyển page trên grid → Event list reload theo camera mới
- [ ] Camera đang xem nhưng mất kết nối:
  - [ ] Nếu server vẫn gửi event → vẫn hiển thị
- [ ] Camera không còn trong viewport → Event không hiển thị

---

### E. Bộ lọc Loại sự kiện (Multiselect)
- [ ] Load danh sách loại sự kiện từ Master Data
- [ ] Cho phép chọn nhiều loại
- [ ] Mặc định chọn “Tất cả”
- [ ] Logic AND đúng:
  - [ ] Thuộc Tab đang chọn
  - [ ] Thuộc Loại sự kiện đang chọn
- [ ] Thay đổi filter → List update ngay lập tức

---

### F. Logic Realtime Event
- [ ] Event mới đến khi Sidebar đang mở
- [ ] Thỏa filter → Insert lên đầu
- [ ] Không thỏa filter → Không hiển thị
- [ ] Không gây scroll jump
- [ ] Không mất event khi đổi filter

---

### G. Danh sách Thẻ sự kiện – Cấu trúc

#### 1. Snapshot
- [ ] Snapshot hiển thị đúng
- [ ] Snapshot lỗi → Có placeholder / fallback

#### 2. Nội dung text
- [ ] Áp dụng đúng cấu hình Liveview (UC-LV02)
- [ ] Hiển thị tối đa 5 dòng
- [ ] Dòng 1:
  - [ ] In đậm
  - [ ] Là tiêu đề
  - [ ] Quá dài → Cắt + “...”
- [ ] Dòng 2–5:
  - [ ] Format: [Icon] + [Giá trị]

---

### H. Quy tắc dữ liệu
- [ ] Thứ tự field đúng theo cấu hình Admin
- [ ] Không hiển thị field từ vị trí số 6
- [ ] Field null / empty:
  - [ ] Hiển thị “_”
  - [ ] Icon vẫn hiển thị
- [ ] Không bị ảnh hưởng bởi cấu hình màn Quản lý sự kiện

---

### I. Giới hạn 100 sự kiện
- [ ] Sidebar chỉ giữ tối đa 100 event
- [ ] Khi >100 event:
  - [ ] Hiển thị nút “Xem tất cả”
- [ ] Click “Xem tất cả”:
  - [ ] Redirect sang màn Quản lý sự kiện

---

### J. Xem chi tiết sự kiện
- [ ] Click vào thẻ sự kiện
- [ ] Popup chi tiết hiển thị
- [ ] Hiển thị đầy đủ field (kể cả field >5)
- [ ] Đúng UC-SK03

---

## II. UC-LV02 – Cấu hình hiển thị thông tin sự kiện

---

### A. Mở Popup cấu hình
- [ ] Click menu (⋮) → “Cấu hình”
- [ ] Popup hiển thị
- [ ] Title: “Cài đặt hiển thị cảnh báo”
- [ ] Không reload Liveview khi mở

---

### B. Menu Loại sự kiện (Left Panel)
- [ ] Load danh sách loại sự kiện từ Master Data
- [ ] Mặc định chọn item đầu tiên
- [ ] Click loại khác → Right Panel reload đúng cấu hình
- [ ] Không mất dữ liệu khi switch loại

---

### C. Dropdown Thêm trường dữ liệu
- [ ] Click “[+ Thêm trường thông tin]”
- [ ] Dropdown chỉ hiển thị field chưa được chọn
- [ ] Với sự kiện thường → chỉ có field Camera
<!-- - [ ] Với “Phát hiện khuôn mặt” → có thêm field Object -->
- [ ] Chọn field:
  - [ ] Thêm vào cuối list
  - [ ] Field biến mất khỏi dropdown

---

### D. Disable trạng thái
- [ ] Chọn hết field:
  - [ ] Nút “[+ Thêm trường thông tin]” bị disable
  - [ ] Không thao tác được

---

### E. Xóa trường dữ liệu
- [ ] Click icon (X)
- [ ] Field bị xóa khỏi list
- [ ] Field quay lại dropdown

---

### F. Sắp xếp Drag & Drop
- [ ] Kéo icon (::) để thay đổi thứ tự
- [ ] Thứ tự thay đổi chính xác
- [ ] Vị trí 1:
  - [ ] Là tiêu đề
  - [ ] In đậm
- [ ] Vị trí 6+:
  - [ ] Lưu được
  - [ ] Không hiển thị ở Sidebar Liveview

---

### G. Nút Lưu
- [ ] Click “Lưu”
- [ ] Gửi API cấu hình đúng
- [ ] Thành công:
  - [ ] Popup đóng
  - [ ] Toast “Lưu cấu hình thành công”
  - [ ] Sidebar reload ngay
- [ ] Thất bại:
  - [ ] Popup không đóng
  - [ ] Hiển thị lỗi đúng text

---

### H. Nút Hủy
- [ ] Click “Hủy”
- [ ] Popup đóng
- [ ] Không gửi API
- [ ] Không thay đổi Sidebar

---

### I. Độc lập cấu hình
- [ ] Thay đổi cấu hình Liveview
- [ ] Không ảnh hưởng màn Quản lý sự kiện
- [ ] Thay đổi bên Quản lý sự kiện
- [ ] Không ảnh hưởng Liveview

---

### J. Cấu hình mặc định
- [ ] Dòng 1: Loại sự kiện (in đậm)
- [ ] Dòng 2: Thời gian
- [ ] Dòng 3: Tên Camera

---

## III. Edge Cases & Performance
- [ ] Event realtime đến dồn dập
- [ ] UI không lag / giật
- [ ] Không duplicate event
- [ ] Reload Liveview → Config vẫn giữ
- [ ] Mở nhiều tab → Config sync đúng

---
