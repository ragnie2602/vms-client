part of 'language.dart';

// Common error codes shared across multiple packet types
const Map<String, String> _commonErrors = {
  'OK': "OK",
  'REQUEST_INVALID': "Yêu cầu không hợp lệ",
  'SESSION_INVALID': "Phiên đăng nhập không hợp lệ",
  'SESSION_EXPIRE': "Phiên đăng nhập đã hết hạn",
  'SESSION_EXPIRED': "Phiên đăng nhập đã hết hạn",
  'SIZE_LIMITED': "Kích thước lớn hơn tối đa",
  'DB_ERROR': "Lỗi cơ sở dữ liệu",
  'NO_CHANGED': "Không thay đổi",
  'NETWORK_ERROR': "Lỗi mạng",
  'DATA_ERROR': "Dữ liệu lỗi",
  'PERMISSION_DENIED': 'Bạn không có quyền được sử dụng chức năng này.',
};

// PacketType-specific error translations: Map<PacketTypeValue, Map<ErrorCode, TranslatedString>>
const Map<int, Map<String, String>> vi = {
  // authenticate (101)
  101: {
    ..._commonErrors,
    'ACCOUNT_INVALID': "Thông tin Email/số điện thoại không hợp lệ",
    'PASSWORD_INVALID': "Mật khẩu không hợp lệ",
    'PLATFORM_INVALID': "Loại thiết bị không hợp lệ",
    'TOKEN_INVALID': "Token không hợp lệ",
    'ACCOUNT_NOT_ACTIVE': "Tài khoản chưa kích hoạt",
  },

  // login (102)
  102: {
    ..._commonErrors,
    'USER_INVALID': "Người dùng không hợp lệ",
    'ACCOUNT_INVALID': "Thông tin Email/số điện thoại không hợp lệ",
    'PASSWORD_INVALID': "Mật khẩu không hợp lệ",
  },

  // register (104)
  104: {
    ..._commonErrors,
    'ACCOUNT_EXIST': "Tên tài khoản đã tồn tại",
    'TEL_EXIST': 'Số điện thoại đã tồn tại',
    'EMAIL_EXIST': "Email đã tồn tại trên hệ thống. Vui lòng thử lại",
    'USER_NOT_FOUND': 'Không tìm thấy người dùng',
    'USER_EMPTY': 'Tên đăng nhập trống',
    'USER_TYPE_EMPTY': 'Loại  tài khoản không được để trống',
  },

  // change_password (106)
  106: {
    ..._commonErrors,
    'PASSWORD_INVALID': 'Mật khẩu cũ không đúng!',
		'PASSWORD_WEAKNESS': 'Vui lòng nhập mật khẩu 8-16 ký tự, không chứa ký tự khoảng trống!',
		'PASSWORD_NOT_SAME': 'Mật khẩu mới phải khác mật khẩu cũ!',
  },

  // checkCameraOnvif (247)
  247: {
    ..._commonErrors,
    'IP_OR_DOMAIN_ERROR': "Lỗi IP hoặc domain",
    'USER_OR_PASSWORD_INVALID': "Tên người dùng hoặc mật khẩu không hợp lệ",
  },

  // updateCamera (142)
  142: {
    ..._commonErrors,
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
    'SERIAL_NUMBER_NOT_MATH':
        "Serial number camera update không giống camera cũ",
    'BOX_ID_INVALID': "ID box không hợp lệ",
    'BOX_OFFLINE': "Box offline",
    'SUB_STREAM_INVALID': "Lỗi luồng phụ",
  },

  // checkAccountShare (502)
  502: {
    ..._commonErrors,
    'ALREADY_INVITE': "Đã được mời",
    'TEL_INVALID': "Số điện thoại không hợp lệ",
    'EMAIL_INVALID': "Email không hợp lệ",
    'TEL_NOT_IN_USE': "Số điện thoại chưa được sử dụng",
    'EMAIL_NOT_IN_USE': "Email chưa được sử dụng",
    'ALREADY_SHARE': "Đã được chia sẻ",
    'SHARE_YOURSELF': "Không thể chia sẻ cho chính mình",
    'ACCOUNT_IVALID': "Tài khoản không hợp lệ",
    'SHARE_TO_ADMIN': "Không thể chia sẻ cho admin",
    'SHARE_TO_OWNER': "Không thể chia sẻ cho chủ sở hữu camera",
    'OVER_SHARED_USER_NUMBER': "Vượt quá số người được chia sẻ",
  },

  // shareCamera (154)
  154: {..._commonErrors, 'CAMERA_NOT_FOUND': "Không tìm thấy camera"},

  // addGroupCamera (203)
  203: {
    ..._commonErrors,
    'GROUP_NAME_EMPTY': "Tên nhóm trống",
    'PARENT_GROUP_NOT_FOUND_OR_INVALID':
        "Nhóm cha không tìm thấy hoặc không hợp lệ",
    'PARENT_GROUP_MAX_LEVEL': "Nhóm cha đã đạt mức tối đa",
  },

  // addCameraRTSP (192)
  192: {
    ..._commonErrors,
    'RTSP_EMPTY': "URL RTSP trống",
    'USER_NOT_FOUND': "Không tìm thấy người dùng",
    'CAMERA_NAME_EMPTY': "Tên camera trống",
    'IP_OR_DOMAIN_NOT_AVAILABLE': "IP hoặc domain không khả dụng",
    'USER_NAME_OR_PASSWORD_ERROR': "Sai tài khoản hoặc mật khẩu",
    'CAMERA_PORT_ERROR': "Port camera lỗi",
    'CAMERA_EXIST': "Camera đã tồn tại",
    'LOCATION_INVALID': "Vị trí không hợp lệ",
    'CAMERA_NAME_EXIST': "Tên camera đã tồn tại",
    'BOX_ID_INVALID': "ID box không hợp lệ",
    'BOX_OFFLINE': "Box offline",
    'OVER_QUOTA': "Vượt quá số camera được thêm (theo license)",
    'GROUP_INVALID': "Nhóm không tồn tại",
    'PACKAGE_NOT_SUPPORT':
        "Không có hoặc gói cước không hỗ trợ thêm camera loại này",
    'SUB_STREAM_INVALID': "Lỗi luồng phụ",
  },

  // addCameraOnVif (199)
  199: {
    ..._commonErrors,
    'RTSP_EMPTY': "URL RTSP trống",
    'USER_NOT_FOUND': "Không tìm thấy người dùng",
    'CAMERA_NAME_EMPTY': "Tên camera trống",
    'IP_OR_DOMAIN_NOT_AVAILABLE': "IP hoặc domain không khả dụng",
    'USER_NAME_OR_PASSWORD_ERROR': "Sai tài khoản hoặc mật khẩu",
    'SERIAL_NUMBER_EMPTY': "Serial number trống",
    'CAMERA_EXIST': "Camera đã tồn tại",
    'RTSP_PORT_ERROR': "Port RTSP lỗi",
    'LOCATION_INVALID': "Vị trí không hợp lệ",
    'CAMERA_NAME_EXIST': "Tên camera đã tồn tại",
    'SERIAL_NUMBER_NOT_MATH': "Serial number camera không khớp",
    'BOX_ID_INVALID': "ID box không hợp lệ",
    'BOX_OFFLINE': "Box offline",
    'RTSP_IP_OR_DOMAIN_NOT_AVAILABLE': "IP hoặc domain RTSP không khả dụng",
    'RTSP_USER_NAME_OR_PASSWORD_ERROR': "Sai tài khoản hoặc mật khẩu RTSP",
    'OVER_QUOTA': "Vượt quá số camera được thêm (theo license)",
    'GROUP_INVALID': "Nhóm không tồn tại",
    'PACKAGE_NOT_SUPPORT':
        "Không có hoặc gói cước không hỗ trợ thêm camera loại này",
    'SUB_STREAM_INVALID': "Lỗi luồng phụ",
  },

  // deleteCamera (155)
  155: {..._commonErrors},

  // addCameraToGroup (205)
  205: {
    ..._commonErrors,
    'CAMERA_ID_EMPTY': "ID camera trống",
    'GROUP_ID_EMPTY': "ID nhóm trống",
    'CAMERA_ID_NOT_FOUND': "Không tìm thấy camera",
    'GROUP_ID_NOT_FOUND': "Không tìm thấy nhóm",
    'CAMERA_EXIST_GROUP': "Camera đã tồn tại trong nhóm",
  },

  // removeCameraFromGroup (206)
  206: {
    ..._commonErrors,
    'CAMERA_ID_EMPTY': "ID camera trống",
    'GROUP_ID_EMPTY': "ID nhóm trống",
    'CAMERA_ID_NOT_FOUND': "Không tìm thấy camera",
    'GROUP_ID_NOT_FOUND': "Không tìm thấy nhóm",
  },

  // updateGroupDevice (208)
  208: {
    ..._commonErrors,
    'GROUP_ID_EMPTY': "ID nhóm trống",
    'GROUP_ID_NOT_FOUND': "Không tìm thấy nhóm",
    'PARENT_GROUP_NOT_FOUND': "Không tìm thấy nhóm cha",
    'PARENT_LEVEL_INVALID': "Cấp độ nhóm cha không hợp lệ",
    'PARENT_GROUP_INVALID': "Nhóm cha không hợp lệ",
    'PARENT_GROUP_LEVEL_INVALID': "Cấp độ nhóm cha không hợp lệ",
  },

  // listShareInviteGroup (235)
  235: {
    ..._commonErrors,
    'GROUP_ID_EMPTY': "ID nhóm trống",
    'GROUP_NOT_FOUND': "Không tìm thấy nhóm",
  },

  // shareGroupCamera (234)
  234: {
    ..._commonErrors,
    'ALREADY_SHARE': "Đã được chia sẻ",
    'SHARE_YOURSELF': "Không thể chia sẻ cho chính mình",
    'ALREADY_INVITE': "Đã được mời",
    'ACCOUNT_INVALID': "Tài khoản không hợp lệ",
    'GROUP_ID_EMPTY': "ID nhóm trống",
    'GROUP_NOT_FOUND': "Không tìm thấy nhóm",
  },
};
