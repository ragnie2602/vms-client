# QA Checklist -- Quản Lý Loại Đối Tượng

## UC-LDT01 -- Xem danh sách loại đối tượng

### Load danh sách

-   [ ] Truy cập menu **Quản lý loại đối tượng** hiển thị danh sách
    đúng.
-   [ ] Hệ thống load dữ liệu khi mở màn hình.
-   [ ] Danh sách hiển thị đúng số lượng record từ API.
-   [ ] Mặc định hiển thị **20 bản ghi/trang**.
-   [ ] Nếu không có dữ liệu hiển thị trạng thái **Empty state**.

### Kiểm tra hiển thị bảng

-   [ ] Cột **STT** hiển thị số thứ tự tăng dần.
-   [ ] Cột **Tên loại đối tượng** hiển thị đúng dữ liệu.
-   [ ] Cột **Mô tả** hiển thị text đúng.
-   [ ] Cột **Trạng thái** hiển thị đúng giá trị (Hoạt động / Tạm dừng).
-   [ ] Cột **Thao tác** hiển thị icon: Sửa, Xóa.

### Tìm kiếm

-   [ ] Tìm kiếm theo **Tên loại đối tượng**.
-   [ ] Tìm kiếm theo **Mô tả**.
-   [ ] Tìm kiếm **không phân biệt hoa thường**.
-   [ ] Tìm kiếm **LIKE search**.
-   [ ] Tìm kiếm với text không tồn tại → danh sách rỗng.
-   [ ] Click **Nút tìm kiếm** reload bảng.

### Filter trạng thái

-   [ ] Default filter = **Tất cả**.
-   [ ] Filter **Hoạt động** hiển thị đúng dữ liệu.
-   [ ] Filter **Tạm dừng** hiển thị đúng dữ liệu.
-   [ ] Kết hợp **Search + Filter** hoạt động đúng.

### Pagination

-   [ ] Pagination hiển thị đúng số trang.
-   [ ] Click page number load đúng dữ liệu.
-   [ ] Pagination giữ nguyên filter/search.

### Nút Thêm loại đối tượng

-   [ ] Click **+ Thêm loại đối tượng** mở popup thêm mới.

------------------------------------------------------------------------

## UC-LDT02 -- Thêm loại đối tượng

### Mở popup

-   [ ] Click **+ Thêm loại đối tượng** mở popup.
-   [ ] Default trạng thái = **Hoạt động**.
-   [ ] Tên loại đối tượng = rỗng.
-   [ ] Hiển thị sẵn field cố định **Tên đối tượng**.

### Validate thông tin chung

-   [ ] Không nhập tên loại đối tượng → hiển thị lỗi.
-   [ ] Nhập tên loại đối tượng trùng → hiển thị *Tên loại đối tượng đã
    tồn tại*.

### Thêm trường dữ liệu

#### Thông tin nhận diện

-   [ ] Thêm **Ảnh nhận diện**.
-   [ ] Thêm **Biển số xe**.

#### Thông tin đối tượng (custom field)

-   [ ] Thêm dòng field mới.
-   [ ] Nhập Tên trường dữ liệu.
-   [ ] Chọn Icon.
-   [ ] Nhập Tên hiển thị.
-   [ ] Chọn Kiểu dữ liệu.

### Validate tên trường dữ liệu

-   [ ] \>50 ký tự → bị chặn.
-   [ ] Rỗng → hiển thị lỗi.
-   [ ] Trùng tên mã dữ liệu → báo lỗi.

### Validate tên hiển thị

-   [ ] \>50 ký tự → chặn nhập.
-   [ ] Rỗng → hiển thị lỗi.
-   [ ] Trùng → báo lỗi.

### Validate Icon

-   [ ] Chưa chọn icon → hiển thị lỗi.

### Validate kiểu dữ liệu

#### Text

-   [ ] Nhập text tiếng Việt.
-   [ ] Nhập số.
-   [ ] Giới hạn 50 ký tự.
-   [ ] Trim space khi lưu.

#### File

-   [ ] Upload file jpg/jpeg/png.
-   [ ] Upload sai format → hiển thị lỗi.

### Validate dung lượng

-   [ ] File \>5MB → client resize.

### Validate số lượng file

-   [ ] Tối đa 6 file.
-   [ ] Đủ 6 file → ẩn nút thêm.

### Xóa trường dữ liệu

-   [ ] Custom field → xóa ngay.
-   [ ] Fixed field → hiển thị toast **Trường bắt buộc không thể xóa**.

### Drag & Drop

-   [ ] Kéo field lên.
-   [ ] Kéo field xuống.
-   [ ] Thứ tự cập nhật đúng.

### Lưu dữ liệu

-   [ ] Click **Lưu** → tạo thành công.
-   [ ] Hiển thị toast **Thêm mới loại đối tượng thành công**.
-   [ ] Reload danh sách.

### Lỗi server

-   [ ] API lỗi → hiển thị **Có lỗi xảy ra, vui lòng thử lại**.

### Hủy

-   [ ] Click **Hủy** → đóng popup.
-   [ ] Không lưu dữ liệu.

------------------------------------------------------------------------

## UC-LDT03 -- Chỉnh sửa loại đối tượng

### Mở popup

-   [ ] Click **Sửa** mở popup.
-   [ ] Dữ liệu hiển thị đúng.

### Chỉnh sửa

-   [ ] Sửa tên loại đối tượng.
-   [ ] Sửa mô tả.
-   [ ] Sửa tên hiển thị field.
-   [ ] Sửa icon.

### Validate xóa field

#### Field mới tạo

-   [ ] Xóa ngay.

#### Field đã lưu chưa có data

-   [ ] Hiển thị popup xác nhận.
-   [ ] Click **Đồng ý** → xóa.

#### Field đã có data

-   [ ] Hiển thị popup cảnh báo.
-   [ ] Click **Đồng ý** → xóa field và data.

------------------------------------------------------------------------

## UC-LDT04 -- Xóa loại đối tượng

### Không có dữ liệu

-   [ ] Click **Xóa**.
-   [ ] Hiển thị popup xác nhận.
-   [ ] Click **Hủy** → đóng popup.
-   [ ] Click **Đồng ý** → xóa thành công.
-   [ ] Hiển thị toast **Xóa loại đối tượng thành công**.
-   [ ] Reload danh sách.

### Có dữ liệu

-   [ ] Click **Xóa**.
-   [ ] Hiển thị toast **Loại đối tượng đang có dữ liệu đối tượng đi
    kèm, không thể xóa**.

------------------------------------------------------------------------

## Kiểm tra trạng thái Tạm dừng

-   [ ] Chuyển trạng thái → **Tạm dừng**.
-   [ ] Không hiển thị trong màn quản lý nhóm đối tượng.
-   [ ] Dữ liệu lịch sử vẫn giữ nguyên.
-   [ ] Sync trạng thái xuống **AI Box**.

------------------------------------------------------------------------

## UI / UX

-   [ ] UI đúng theo Figma.
-   [ ] Toast hiển thị đúng.
-   [ ] Popup hiển thị đúng layout.
-   [ ] Tooltip hiển thị đúng.
