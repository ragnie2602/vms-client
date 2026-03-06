
# QA Checklist – Quản Lý Đối Tượng & Nhóm Đối Tượng

## 1. UC-NDT01 – Xem danh sách đối tượng & nhóm đối tượng
- [ ] Người dùng có quyền truy cập module Quản lý nhóm đối tượng
- [ ] Click menu mở đúng màn hình
- [ ] Hệ thống load cây nhóm bên trái
- [ ] Hệ thống load các Tab loại đối tượng đang hoạt động
- [ ] Tab đầu tiên active mặc định
- [ ] Node mặc định được chọn là “Tất cả đối tượng”

## 2. Tab loại đối tượng
- [ ] Tab hiển thị đúng loại đối tượng có trạng thái hoạt động
- [ ] Thứ tự tab đúng theo thứ tự tạo
- [ ] Khi chuyển tab chỉ reload bảng dữ liệu
- [ ] Dữ liệu hiển thị đúng loại đối tượng

## 3. Cây thư mục nhóm
- [ ] Node gốc hiển thị “Tất cả đối tượng”
- [ ] Hiển thị đúng cấu trúc cha con
- [ ] Expand / collapse hoạt động đúng
- [ ] Node level 5 không hiển thị nút thêm nhóm
- [ ] Click node reload data đúng theo nhóm + tab

## 4. Search nhóm
- [ ] Search theo tên nhóm
- [ ] LIKE search
- [ ] Không phân biệt hoa thường
- [ ] Không có kết quả hiển thị rỗng

## 5. Menu thao tác nhóm
- [ ] Click icon (...) hiển thị menu
- [ ] Có đủ: Thêm nhóm / Thêm đối tượng / Sửa nhóm / Xóa nhóm
- [ ] Click đúng action mở đúng popup

## 6. Data table đối tượng
- [ ] Load theo Nhóm + Tab
- [ ] Nhóm cha hiển thị data của nhóm con
- [ ] Cột render theo metadata
- [ ] Thứ tự cột đúng cấu hình
- [ ] Giá trị null hiển thị trống

## 7. Search đối tượng
- [ ] Tìm theo tên
- [ ] Tìm theo text field
- [ ] LIKE search
- [ ] Chỉ áp dụng trong phạm vi nhóm + tab

## 8. Pagination
- [ ] Default 20 record / page
- [ ] Pagination đúng số trang
- [ ] Chuyển trang load đúng data
- [ ] Giữ filter / tab / group

## 9. Thêm nhóm đối tượng
- [ ] Click + Thêm mở popup
- [ ] Validate tên nhóm không được trống
- [ ] Trim khoảng trắng
- [ ] Không trùng tên trong cùng nhóm cha
- [ ] Cho phép trùng khác nhánh
- [ ] Dropdown nhóm cha có search
- [ ] Nhóm level 5 không hiển thị

## 10. Lưu nhóm
- [ ] Click xác nhận lưu thành công
- [ ] Hiển thị toast thành công
- [ ] Reload cây nhóm
- [ ] Nhóm mới nằm cuối cùng cùng cấp

## 11. Sửa nhóm
- [ ] Mở popup sửa
- [ ] Dữ liệu hiển thị đúng
- [ ] Validate giống thêm nhóm
- [ ] Lưu thành công

## 12. Xóa nhóm
- [ ] Popup confirm hiển thị đúng
- [ ] Hủy không xóa
- [ ] Đồng ý xóa thành công
- [ ] Nếu có nhóm con → xóa cascade
- [ ] Nếu ràng buộc → hiển thị lỗi

## 13. Thêm đối tượng
- [ ] Click + Thêm đối tượng mở popup
- [ ] Header hiển thị đúng loại đối tượng
- [ ] Field render từ metadata
- [ ] Thứ tự field đúng cấu hình

## 14. Validate field
- [ ] Tên đối tượng là required
- [ ] Hiển thị lỗi inline khi bỏ trống

## 15. Upload ảnh
- [ ] Cho phép BMP JPG PNG
- [ ] Tối đa 6 ảnh
- [ ] Upload đủ 6 disable nút thêm
- [ ] Click preview ảnh
- [ ] Xóa ảnh bằng icon x

## 16. Validate AI ảnh
- [ ] Partial success vẫn lưu
- [ ] All success lưu tất cả
- [ ] All fail hiển thị lỗi

## 17. Nhóm đối tượng multi select
- [ ] Auto chọn nhóm đang click
- [ ] Cho phép chọn nhiều nhóm
- [ ] Quan hệ N:N hoạt động đúng

## 18. Lưu đối tượng
- [ ] Click xác nhận validate
- [ ] Lưu thành công
- [ ] Toast success
- [ ] Reload bảng
- [ ] Record mới nằm đầu

## 19. Sửa đối tượng
- [ ] Popup sửa mở đúng
- [ ] Có thể sửa text / ảnh / nhóm

## 20. Xóa đối tượng
- [ ] Popup confirm
- [ ] Hủy không xóa
- [ ] Đồng ý xóa
- [ ] Data table reload

## 21. Tải file mẫu
- [ ] Download file xlsx
- [ ] Tên file đúng format
- [ ] Có cột STT
- [ ] Cột metadata đúng thứ tự

## 22. Import dữ liệu
- [ ] Chỉ cho phép file xlsx
- [ ] File >5MB báo lỗi
- [ ] Thành công 100% hiển thị đúng message
- [ ] Partial success hiển thị X/Y
- [ ] Fail hiển thị lỗi

## 23. Xuất file
- [ ] Export đúng dữ liệu đang filter
- [ ] Chỉ export tab đang active
- [ ] Chỉ export nhóm đang chọn
- [ ] Tên file đúng format

## 24. Concurrency
- [ ] Admin A mở form thêm
- [ ] Admin B thay đổi metadata
- [ ] Admin A vẫn lưu thành công

## 25. UI / UX
- [ ] UI đúng thiết kế
- [ ] Tooltip hiển thị đúng
- [ ] Toast message đúng nội dung
