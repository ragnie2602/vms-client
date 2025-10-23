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

  // CheckAccount_err
  'ALREADY_INVITE': 'Đã chia sẻ cho tài khoản trước đó',
  'ALREADY_SHARE': 'Tài khoản đã được chia sẻ',
  'ACCOUNT_IVALID': 'Không tồn tại tài khoản',
  'SHARE_YOURSELF': 'Không thể chia sẻ cho chính mình',
  'SHARE_TO_ADMIN': 'Không thể chia sẻ cho chính admin',
  'SHARE_TO_OWNER': 'Không thể chia sẻ cho chính chủ sở hữu',
  'OVER_SHARED_USER_NUMBER': 'Vượt quá số người được chia sẻ',
};
