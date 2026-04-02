# ✅ CHECKLIST AI REVIEW CODE & NGHIỆP VỤ  
## Module: QUẢN LÝ THÔNG BÁO – VMS Flutter Client

---

## [cite_start]I. UC-TB01 – Danh sách Thông báo (Quả chuông) [cite: 100]

### 1. Logic Badge (Số đếm)
- [ ] [cite_start]Hiển thị tổng số lượng thông báo có trạng thái chưa đọc[cite: 106].
- [ ] [cite_start]Giới hạn hiển thị: Nếu số lượng từ 1-99 thì hiển thị chính xác; nếu > 99 thì hiển thị "99+"[cite: 106].
- [ ] [cite_start]Ẩn Badge (không hiển thị) khi số thông báo chưa đọc = 0[cite: 106].
- [ ] [cite_start]Tự động tăng số (+1) khi có sự kiện AI mới trả về (cập nhật real-time không cần reload trang)[cite: 106, 110].
- [ ] [cite_start]Khi click mở danh sách thông báo, Badge lập tức bị xóa (Reset về 0 và ẩn đi)[cite: 106, 114, 121].

### 2. Giao diện Danh sách & Trạng thái UI
- [ ] [cite_start]Mặc định tải và hiển thị 5 bản ghi đầu tiên, sắp xếp theo thời gian mới nhất trên cùng[cite: 106].
- [ ] [cite_start]Trạng thái chưa đọc hiển thị với nền màu xanh nhạt; trạng thái đã đọc hiển thị nền trắng[cite: 106].
- [ ] [cite_start]Sau khi Badge bên ngoài bị clear, các thông báo bên trong danh sách vẫn phải giữ nguyên màu nền (trạng thái chưa đọc) cho đến khi người dùng chủ động bấm vào[cite: 106, 122].
- [ ] [cite_start]Nội dung thông báo hiển thị tối đa 3 dòng; nếu dài hơn phải có dấu (...), khi hover chuột vào (...) sẽ hiển thị toàn bộ[cite: 106].

### 3. Format Thời gian
- [ ] [cite_start]Dưới 60 giây: Hiển thị "Vừa xong"[cite: 106].
- [ ] [cite_start]Từ 1 phút - 59 phút: Hiển thị "[x] phút trước"[cite: 106].
- [ ] [cite_start]Từ 1 giờ trở lên (trong cùng ngày): Hiển thị "[x] giờ trước"[cite: 106].
- [ ] [cite_start]Khác ngày nhưng cùng năm: Hiển thị định dạng dd/mm[cite: 106].
- [ ] [cite_start]Khác năm: Hiển thị định dạng dd/mm/yyyy[cite: 106].

### 4. Thao tác điều hướng
- [ ] [cite_start]Nút [Xem chi tiết]: Mở popup chi tiết sự kiện (UC-SK03) của chính sự kiện đó và chuyển thông báo sang trạng thái "Đã đọc"[cite: 106, 117, 118].
- [ ] [cite_start]Nút [Xem thêm]: Chỉ xuất hiện khi tổng số thông báo > 5, bấm vào để mở xem toàn bộ danh sách[cite: 106].

---

## II. [cite_start]UC-TB02 – Cài đặt Thông báo [cite: 123]

### 1. Cấu hình Thời gian giãn cách
- [ ] [cite_start]Textbox chỉ cho phép nhập số nguyên dương[cite: 129].
- [ ] [cite_start]Xử lý giá trị rỗng: Nếu để trống và bấm lưu, hệ thống tự động điền giá trị default là 10 giây[cite: 129].
- [ ] [cite_start]Block Popup: Nếu một Popup vừa xuất hiện tại thời điểm T, trong khoảng `[T + Thời gian giãn cách]`, mọi sự kiện cảnh báo tiếp theo đều bị chặn hiển thị popup[cite: 129, 142].
- [ ] [cite_start]Dữ liệu không mất: Dù bị chặn popup do khoảng giãn cách, sự kiện đó vẫn phải được ghi nhận đầy đủ vào danh sách thông báo (Quả chuông)[cite: 129].

### 2. Cơ chế hiển thị (Cửa sổ tự động & Âm thanh)
- [ ] [cite_start]Ràng buộc Checkbox: Nếu người dùng bỏ chọn "Cửa sổ tự động", hệ thống phải tự động bỏ chọn và làm mờ (disable) checkbox "Âm thanh" tương ứng[cite: 131, 144, 145].
- [ ] [cite_start]Default checked: Sự kiện cảnh báo cháy, cảnh báo xâm nhập, cảnh báo người lạ được đánh dấu tick sẵn[cite: 131].
- [ ] [cite_start]Default unchecked: Các sự kiện còn lại không đánh dấu tick sẵn ở ô "Cửa sổ tự động"[cite: 131].
- [ ] [cite_start]Lặp âm thanh: Nếu được cấu hình, âm thanh phải phát lặp lại liên tục ngay khi cửa sổ tự động xuất hiện[cite: 131].
- [ ] [cite_start]Dừng âm thanh: Phải dừng ngay khi người dùng thao tác tắt popup bằng nút [X], [Hủy], [Xem chi tiết] hoặc bấm [Tắt tiếng] trên popup đó[cite: 131, 154, 164].

---

## III. [cite_start]UC-TB03 – Xem chi tiết Popup Cảnh báo [cite: 146]

### 1. Hiển thị thông tin
- [ ] [cite_start]Chỉ hiển thị duy nhất 01 popup khẩn cấp đè lên UI làm việc tại một thời điểm (không cho phép mở đè nhiều popup sự kiện chồng lên nhau)[cite: 158, 163].
- [ ] [cite_start]Header chứa đầy đủ title (tên sự kiện) và subtext[cite: 152].
- [ ] [cite_start]Hình ảnh Snapshot chất lượng cao, đúng khoảnh khắc AI ghi nhận[cite: 152].
- [ ] [cite_start]Hiển thị các trường Read-only: Loại sự kiện, Tên camera, Thời gian cảnh báo[cite: 152].

### 2. Thao tác & Bộ đếm thời gian
- [ ] [cite_start]Bấm nút [Hủy] hoặc nút [X]: Hệ thống tắt âm thanh, đóng popup và bắt đầu kích hoạt bộ đếm ngược "Thời gian giãn cách"[cite: 154, 160].
- [ ] [cite_start]Bấm nút [Xem chi tiết]: Ngắt âm thanh, đóng popup, bắt đầu đếm thời gian giãn cách và điều hướng trực tiếp sang màn hình Chi tiết sự kiện (UC-SK03)[cite: 154].
- [ ] [cite_start]Trong suốt quá trình bộ đếm thời gian giãn cách đang chạy, đảm bảo mọi popup sự kiện AI mới trả về đều bị chặn hoàn toàn[cite: 161].

---