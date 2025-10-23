part of 'language.dart';

const Map<String?, String> vi = {
  null: DEFAULT_ERROR_MESSAGE,
  'ERROR_DEFAULT': DEFAULT_ERROR_MESSAGE,

  // ResultType
  'OK': "OK",
  'REQUEST_INVALID': "Yêu cầu không hợp lệ",
  'SESSION_INVALID': "Phiên đăng nhập không hợp lệ",
  'SESSION_EXPIRE': "Phiên đăng nhập đã hết hạn",
  'SIZE_LIMITED': "Kích thước lớn hơn tối đa",
  'DB_ERROR': "Lỗi cơ sở dữ liệu",
  'NO_CHANGED': "Không thay đổi",
  'NETWORK_ERROR': "Lỗi mạng",
  'DATA_ERROR': "Dữ liệu lỗi",
  //user
  'ACCOUNT_EXIST': "Tên tài khoản đã tồn tại",
  'TEL_EXIST': 'Số điện thoại đã tồn tại',
  'EMAIL_EXIST': "Email đã tồn tại trên hệ thống. Vui lòng thử lại",
  'EMAIL_INVALID': 'Email không đúng định dạng',
  'USER_NOT_FOUND': 'Không tìm thấy người dùng',
  'PERMISSION_DENIED': 'Bạn không có quyền được sử dụng chức năng này.',
  'USER_EMPTY': 'Tên đăng nhập trống',
  'USER_TYPE_EMPTY': 'Loại  tài khoản không được để trống',
  // Authenticate_Error
  'ACCOUNT_INVALID': "Thông tin Email/số điện thoại không hợp lệ",
  'PASSWORD_INVALID': "Mật khẩu không hợp lệ",
  'PLATFORM_INVALID': "Loại thiết bị không hợp lệ",
  'TOKEN_INVALID': "Token không hợp lệ",
  'ACCOUNT_NOT_ACTIVE': "Tài khoản chưa kích hoạt",

  // Login_Error
  'SESSION_EXPIRED': "Phiên đăng nhập đã hết hạn",
  'USER_INVALID': "Người dùng không hợp lệ",
};
