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

  // CheckCameraOnvif_Error
  'IP_OR_DOMAIN_ERROR': "Lỗi IP hoặc domain",
  'USER_OR_PASSWORD_INVALID': "Tên người dùng hoặc mật khẩu không hợp lệ",

  // UpdateCamera_Error
  'RTSP_URL_INVALID': "URL RTSP không hợp lệ",
  'NAME_INVALID': "Tên không hợp lệ",
  'CAMERA_ID_INVALID': "ID camera không hợp lệ",
  'IP_OR_DOMAIN_INVALID': "IP hoặc domain không hợp lệ",
  'RTSP_PORT_ERROR': "Port RTSP lỗi",
  'USER_NAME_OR_PASSWORD_ERROR': "Sai tài khoản hoặc mật khẩu",
  'CAMERA_EXIST': "Camera đã tồn tại",
  'CAMERA_UUID_INVALID': "UUID camera không hợp lệ",
  'XADDR_EMPTY': "XAddr trống",
  'XADDR_INVALID': "Lỗi ONVIF API",
  'LOCATION_INVALID': "Vị trí không hợp lệ",
  'CAMERA_NAME_EXIST': "Tên camera đã tồn tại",
  'GET_SERIAL_NUMBER_CAMERA_ERROR': "Không lấy được thông tin serial number",
  'SERIAL_NUMBER_NOT_MATH': "Serial number camera update không giống camera cũ",
  'BOX_ID_INVALID': "ID box không hợp lệ",
  'BOX_OFFLINE': "Box offline",
  'SUB_STREAM_INVALID': "Lỗi luồng phụ",

  // CheckAccountShare_Error
  'TEL_INVALID': "Số điện thoại không hợp lệ",
  'EMAIL_INVALID': "Email không hợp lệ",
  'TEL_NOT_IN_USE': "Số điện thoại chưa được sử dụng",
  'EMAIL_NOT_IN_USE': "Email chưa được sử dụng",
  'ALREADY_SHARE': "Đã được chia sẻ",
  'ALREADY_INVITE': "Đã được mời",
  'SHARE_YOURSELF': "Không thể chia sẻ cho chính mình",
  'PERMISSION_DENIED': "Không có quyền",
  'ACCOUNT_IVALID': "Tài khoản không hợp lệ",
  'SHARE_TO_ADMIN': "Không thể chia sẻ cho admin",
  'SHARE_TO_OWNER': "Không thể chia sẻ cho chủ sở hữu camera",
  'OVER_SHARED_USER_NUMBER': "Vượt quá số người được chia sẻ",

  // ShareCamera_Error
  'CAMERA_NOT_FOUND': "Không tìm thấy camera",

  // AddGroupCamera_Error
  'GROUP_NAME_EMPTY': "Tên nhóm trống",
  'PARENT_GROUP_NOT_FOUND_OR_INVALID':
      "Nhóm cha không tìm thấy hoặc không hợp lệ",
  'PARENT_GROUP_MAX_LEVEL': "Nhóm cha đã đạt mức tối đa",

};
