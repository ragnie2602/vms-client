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

  // Authenticate_Error
  'ACCOUNT_INVALID': "Tài khoản không hợp lệ",
  'PASSWORD_INVALID': "Mật khẩu không hợp lệ",
  'PLATFORM_INVALID': "Loại thiết bị không hợp lệ",
  'TOKEN_INVALID': "Token không hợp lệ",
  'ACCOUNT_NOT_ACTIVE': "Tài khoản chưa kích hoạt",

  // Login_Error
  'SESSION_EXPIRED': "Phiên đăng nhập đã hết hạn",
  'USER_INVALID': "Người dùng không hợp lệ",
};
