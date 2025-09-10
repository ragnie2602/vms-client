//
//  Generated code. Do not modify.
//  source: comm.profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use receiveProfileDescriptor instead')
const ReceiveProfile$json = {
  '1': 'ReceiveProfile',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'profile', '3': 2, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'profile'},
    {'1': 'RECEIVE_PROFILE', '3': 4, '4': 1, '5': 13, '10': 'RECEIVEPROFILE'},
  ],
  '4': [ReceiveProfile_Type$json],
};

@$core.Deprecated('Use receiveProfileDescriptor instead')
const ReceiveProfile_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'UPDATE', '2': 0},
    {'1': 'KICK', '2': 1},
  ],
};

/// Descriptor for `ReceiveProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveProfileDescriptor = $convert.base64Decode(
    'Cg5SZWNlaXZlUHJvZmlsZRISCgR0eXBlGAEgASgNUgR0eXBlEicKB3Byb2ZpbGUYAiABKAsyDS'
    '5jb21tLlByb2ZpbGVSB3Byb2ZpbGUSJwoPUkVDRUlWRV9QUk9GSUxFGAQgASgNUg5SRUNFSVZF'
    'UFJPRklMRSIcCgRUeXBlEgoKBlVQREFURRAAEggKBEtJQ0sQAQ==');

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive$json = {
  '1': 'KeepAlive',
  '2': [
    {'1': 'ID', '3': 100, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [KeepAlive_Request$json, KeepAlive_Reply$json],
};

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'idle', '3': 1, '4': 1, '5': 8, '10': 'idle'},
  ],
};

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `KeepAlive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keepAliveDescriptor = $convert.base64Decode(
    'CglLZWVwQWxpdmUSDgoCSUQYZCABKA1SAklEGh0KB1JlcXVlc3QSEgoEaWRsZRgBIAEoCFIEaW'
    'RsZRoHCgVSZXBseQ==');

@$core.Deprecated('Use authenticateDescriptor instead')
const Authenticate$json = {
  '1': 'Authenticate',
  '2': [
    {'1': 'ID', '3': 101, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Authenticate_Request$json, Authenticate_Reply$json],
  '4': [Authenticate_Error$json],
};

@$core.Deprecated('Use authenticateDescriptor instead')
const Authenticate_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'platform', '3': 3, '4': 1, '5': 13, '10': 'platform'},
    {'1': 'token', '3': 4, '4': 1, '5': 9, '10': 'token'},
    {'1': 'app_version', '3': 5, '4': 1, '5': 9, '10': 'appVersion'},
  ],
};

@$core.Deprecated('Use authenticateDescriptor instead')
const Authenticate_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 12, '10': 'uid'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 12, '10': 'sessionId'},
    {'1': 'host', '3': 3, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 4, '4': 1, '5': 13, '10': 'port'},
    {'1': 'webSock_host', '3': 5, '4': 1, '5': 9, '10': 'webSockHost'},
    {'1': 'webSock_port', '3': 6, '4': 1, '5': 13, '10': 'webSockPort'},
    {'1': 'ssid', '3': 7, '4': 1, '5': 9, '10': 'ssid'},
    {'1': 'license_profile', '3': 8, '4': 1, '5': 11, '6': '.comm.License_profile', '10': 'licenseProfile'},
    {'1': 'web_socket_tls_enable', '3': 9, '4': 1, '5': 8, '10': 'webSocketTlsEnable'},
  ],
};

@$core.Deprecated('Use authenticateDescriptor instead')
const Authenticate_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'ACCOUNT_INVALID', '2': 1},
    {'1': 'PASSWORD_INVALID', '2': 2},
    {'1': 'PLATFORM_INVALID', '2': 3},
    {'1': 'TOKEN_INVALID', '2': 4},
    {'1': 'ACCOUNT_NOT_ACTIVE', '2': 5},
    {'1': 'LICENSE_EXPIRED', '2': 6},
  ],
};

/// Descriptor for `Authenticate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateDescriptor = $convert.base64Decode(
    'CgxBdXRoZW50aWNhdGUSDgoCSUQYZSABKA1SAklEGpIBCgdSZXF1ZXN0EhgKB2FjY291bnQYAS'
    'ABKAlSB2FjY291bnQSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEhoKCHBsYXRmb3JtGAMg'
    'ASgNUghwbGF0Zm9ybRIUCgV0b2tlbhgEIAEoCVIFdG9rZW4SHwoLYXBwX3ZlcnNpb24YBSABKA'
    'lSCmFwcFZlcnNpb24arQIKBVJlcGx5EhAKA3VpZBgBIAEoDFIDdWlkEh0KCnNlc3Npb25faWQY'
    'AiABKAxSCXNlc3Npb25JZBISCgRob3N0GAMgASgJUgRob3N0EhIKBHBvcnQYBCABKA1SBHBvcn'
    'QSIQoMd2ViU29ja19ob3N0GAUgASgJUgt3ZWJTb2NrSG9zdBIhCgx3ZWJTb2NrX3BvcnQYBiAB'
    'KA1SC3dlYlNvY2tQb3J0EhIKBHNzaWQYByABKAlSBHNzaWQSPgoPbGljZW5zZV9wcm9maWxlGA'
    'ggASgLMhUuY29tbS5MaWNlbnNlX3Byb2ZpbGVSDmxpY2Vuc2VQcm9maWxlEjEKFXdlYl9zb2Nr'
    'ZXRfdGxzX2VuYWJsZRgJIAEoCFISd2ViU29ja2V0VGxzRW5hYmxlIpsBCgVFcnJvchIRCg1FUl'
    'JPUl9ERUZBVUxUEAASEwoPQUNDT1VOVF9JTlZBTElEEAESFAoQUEFTU1dPUkRfSU5WQUxJRBAC'
    'EhQKEFBMQVRGT1JNX0lOVkFMSUQQAxIRCg1UT0tFTl9JTlZBTElEEAQSFgoSQUNDT1VOVF9OT1'
    'RfQUNUSVZFEAUSEwoPTElDRU5TRV9FWFBJUkVEEAY=');

@$core.Deprecated('Use loginDescriptor instead')
const Login$json = {
  '1': 'Login',
  '2': [
    {'1': 'ID', '3': 102, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Login_Request$json, Login_Reply$json, Login_BaseURL$json],
  '4': [Login_Error$json],
};

@$core.Deprecated('Use loginDescriptor instead')
const Login_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 12, '10': 'uid'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 12, '10': 'sessionId'},
    {'1': 'target', '3': 3, '4': 1, '5': 14, '6': '.comm.ProjectTarget', '10': 'target'},
    {'1': 'apiVersion', '3': 4, '4': 1, '5': 5, '10': 'apiVersion'},
    {'1': 'platform', '3': 5, '4': 1, '5': 13, '10': 'platform'},
  ],
};

@$core.Deprecated('Use loginDescriptor instead')
const Login_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'turn_account', '3': 1, '4': 1, '5': 11, '6': '.comm.TurnAccount', '10': 'turnAccount'},
    {'1': 'server_time', '3': 2, '4': 1, '5': 4, '10': 'serverTime'},
    {'1': 'profile', '3': 3, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'profile'},
    {'1': 'server_version_build', '3': 4, '4': 1, '5': 13, '10': 'serverVersionBuild'},
    {'1': 'base_image_url', '3': 5, '4': 1, '5': 9, '10': 'baseImageUrl'},
    {'1': 'list_ntp_server', '3': 6, '4': 3, '5': 9, '10': 'listNtpServer'},
    {'1': 'build_number', '3': 7, '4': 1, '5': 13, '10': 'buildNumber'},
    {'1': 'link_download', '3': 8, '4': 1, '5': 9, '10': 'linkDownload'},
    {'1': 'target', '3': 9, '4': 1, '5': 14, '6': '.comm.ProjectTarget', '10': 'target'},
    {'1': 'base_url', '3': 10, '4': 1, '5': 11, '6': '.comm.Login.BaseURL', '10': 'baseUrl'},
    {'1': 'license_profile', '3': 11, '4': 1, '5': 11, '6': '.comm.License_profile', '10': 'licenseProfile'},
  ],
};

@$core.Deprecated('Use loginDescriptor instead')
const Login_BaseURL$json = {
  '1': 'BaseURL',
  '2': [
    {'1': 'face_base_url', '3': 1, '4': 1, '5': 9, '10': 'faceBaseUrl'},
  ],
};

@$core.Deprecated('Use loginDescriptor instead')
const Login_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'SESSION_EXPIRED', '2': 1},
    {'1': 'USER_INVALID', '2': 2},
    {'1': 'VERST_IION_API_DEPRECATED', '2': 3},
    {'1': 'PROJECT_TARGENVALID', '2': 4},
    {'1': 'LICENSE_EXPIRED', '2': 6},
  ],
};

/// Descriptor for `Login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginDescriptor = $convert.base64Decode(
    'CgVMb2dpbhIOCgJJRBhmIAEoDVICSUQaowEKB1JlcXVlc3QSEAoDdWlkGAEgASgMUgN1aWQSHQ'
    'oKc2Vzc2lvbl9pZBgCIAEoDFIJc2Vzc2lvbklkEisKBnRhcmdldBgDIAEoDjITLmNvbW0uUHJv'
    'amVjdFRhcmdldFIGdGFyZ2V0Eh4KCmFwaVZlcnNpb24YBCABKAVSCmFwaVZlcnNpb24SGgoIcG'
    'xhdGZvcm0YBSABKA1SCHBsYXRmb3JtGuwDCgVSZXBseRI0Cgx0dXJuX2FjY291bnQYASABKAsy'
    'ES5jb21tLlR1cm5BY2NvdW50Ugt0dXJuQWNjb3VudBIfCgtzZXJ2ZXJfdGltZRgCIAEoBFIKc2'
    'VydmVyVGltZRInCgdwcm9maWxlGAMgASgLMg0uY29tbS5Qcm9maWxlUgdwcm9maWxlEjAKFHNl'
    'cnZlcl92ZXJzaW9uX2J1aWxkGAQgASgNUhJzZXJ2ZXJWZXJzaW9uQnVpbGQSJAoOYmFzZV9pbW'
    'FnZV91cmwYBSABKAlSDGJhc2VJbWFnZVVybBImCg9saXN0X250cF9zZXJ2ZXIYBiADKAlSDWxp'
    'c3ROdHBTZXJ2ZXISIQoMYnVpbGRfbnVtYmVyGAcgASgNUgtidWlsZE51bWJlchIjCg1saW5rX2'
    'Rvd25sb2FkGAggASgJUgxsaW5rRG93bmxvYWQSKwoGdGFyZ2V0GAkgASgOMhMuY29tbS5Qcm9q'
    'ZWN0VGFyZ2V0UgZ0YXJnZXQSLgoIYmFzZV91cmwYCiABKAsyEy5jb21tLkxvZ2luLkJhc2VVUk'
    'xSB2Jhc2VVcmwSPgoPbGljZW5zZV9wcm9maWxlGAsgASgLMhUuY29tbS5MaWNlbnNlX3Byb2Zp'
    'bGVSDmxpY2Vuc2VQcm9maWxlGi0KB0Jhc2VVUkwSIgoNZmFjZV9iYXNlX3VybBgBIAEoCVILZm'
    'FjZUJhc2VVcmwijgEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABITCg9TRVNTSU9OX0VYUElS'
    'RUQQARIQCgxVU0VSX0lOVkFMSUQQAhIdChlWRVJTVF9JSU9OX0FQSV9ERVBSRUNBVEVEEAMSFw'
    'oTUFJPSkVDVF9UQVJHRU5WQUxJRBAEEhMKD0xJQ0VOU0VfRVhQSVJFRBAG');

@$core.Deprecated('Use logoutDescriptor instead')
const Logout$json = {
  '1': 'Logout',
  '2': [
    {'1': 'ID', '3': 103, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Logout_Request$json, Logout_Reply$json],
};

@$core.Deprecated('Use logoutDescriptor instead')
const Logout_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use logoutDescriptor instead')
const Logout_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `Logout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutDescriptor = $convert.base64Decode(
    'CgZMb2dvdXQSDgoCSUQYZyABKA1SAklEGgkKB1JlcXVlc3QaBwoFUmVwbHk=');

@$core.Deprecated('Use registerDescriptor instead')
const Register$json = {
  '1': 'Register',
  '2': [
    {'1': 'ID', '3': 104, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Register_Request$json, Register_Reply$json],
  '4': [Register_Error$json],
};

@$core.Deprecated('Use registerDescriptor instead')
const Register_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'otp', '3': 3, '4': 1, '5': 9, '10': 'otp'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'tel', '3': 6, '4': 1, '5': 9, '10': 'tel'},
  ],
};

@$core.Deprecated('Use registerDescriptor instead')
const Register_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use registerDescriptor instead')
const Register_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'ACCOUNT_EXIST', '2': 1},
    {'1': 'OTP_NOT_MATCH', '2': 2},
    {'1': 'OTP_EXPIRED', '2': 3},
    {'1': 'EMAIL_INVALID', '2': 4},
    {'1': 'TEL_INVALID', '2': 5},
    {'1': 'PASSWORD_INVALID', '2': 6},
    {'1': 'ACCOUNT_INVALID', '2': 7},
    {'1': 'PASSWORD_CONTAINING_SPECIAL_CHARACTERS', '2': 8},
    {'1': 'PASSWORD_WEAKNESS', '2': 9},
  ],
};

/// Descriptor for `Register`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDescriptor = $convert.base64Decode(
    'CghSZWdpc3RlchIOCgJJRBhoIAEoDVICSUQakwEKB1JlcXVlc3QSGAoHYWNjb3VudBgBIAEoCV'
    'IHYWNjb3VudBIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSEAoDb3RwGAMgASgJUgNvdHAS'
    'GAoHYWRkcmVzcxgEIAEoCVIHYWRkcmVzcxIUCgVlbWFpbBgFIAEoCVIFZW1haWwSEAoDdGVsGA'
    'YgASgJUgN0ZWwaBwoFUmVwbHki4wEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg1BQ0NP'
    'VU5UX0VYSVNUEAESEQoNT1RQX05PVF9NQVRDSBACEg8KC09UUF9FWFBJUkVEEAMSEQoNRU1BSU'
    'xfSU5WQUxJRBAEEg8KC1RFTF9JTlZBTElEEAUSFAoQUEFTU1dPUkRfSU5WQUxJRBAGEhMKD0FD'
    'Q09VTlRfSU5WQUxJRBAHEioKJlBBU1NXT1JEX0NPTlRBSU5JTkdfU1BFQ0lBTF9DSEFSQUNURV'
    'JTEAgSFQoRUEFTU1dPUkRfV0VBS05FU1MQCQ==');

@$core.Deprecated('Use updateDeviceTokenDescriptor instead')
const UpdateDeviceToken$json = {
  '1': 'UpdateDeviceToken',
  '2': [
    {'1': 'ID', '3': 105, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateDeviceToken_Request$json, UpdateDeviceToken_Reply$json],
};

@$core.Deprecated('Use updateDeviceTokenDescriptor instead')
const UpdateDeviceToken_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

@$core.Deprecated('Use updateDeviceTokenDescriptor instead')
const UpdateDeviceToken_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `UpdateDeviceToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDeviceTokenDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVEZXZpY2VUb2tlbhIOCgJJRBhpIAEoDVICSUQaHwoHUmVxdWVzdBIUCgV0b2tlbh'
    'gBIAEoCVIFdG9rZW4aBwoFUmVwbHk=');

@$core.Deprecated('Use changePasswordDescriptor instead')
const ChangePassword$json = {
  '1': 'ChangePassword',
  '2': [
    {'1': 'ID', '3': 106, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ChangePassword_Request$json, ChangePassword_Reply$json],
  '4': [ChangePassword_Error$json],
};

@$core.Deprecated('Use changePasswordDescriptor instead')
const ChangePassword_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'current', '3': 1, '4': 1, '5': 9, '10': 'current'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'kick_others', '3': 3, '4': 1, '5': 8, '10': 'kickOthers'},
  ],
};

@$core.Deprecated('Use changePasswordDescriptor instead')
const ChangePassword_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use changePasswordDescriptor instead')
const ChangePassword_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'PASSWORD_INVALID', '2': 1},
    {'1': 'PASSWORD_WEAKNESS', '2': 2},
    {'1': 'PASSWORD_NOT_SAME', '2': 3},
  ],
};

/// Descriptor for `ChangePassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordDescriptor = $convert.base64Decode(
    'Cg5DaGFuZ2VQYXNzd29yZBIOCgJJRBhqIAEoDVICSUQaYAoHUmVxdWVzdBIYCgdjdXJyZW50GA'
    'EgASgJUgdjdXJyZW50EhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZBIfCgtraWNrX290aGVy'
    'cxgDIAEoCFIKa2lja090aGVycxoHCgVSZXBseSJeCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEA'
    'ASFAoQUEFTU1dPUkRfSU5WQUxJRBABEhUKEVBBU1NXT1JEX1dFQUtORVNTEAISFQoRUEFTU1dP'
    'UkRfTk9UX1NBTUUQAw==');

@$core.Deprecated('Use forgotPasswordDescriptor instead')
const ForgotPassword$json = {
  '1': 'ForgotPassword',
  '2': [
    {'1': 'ID', '3': 107, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ForgotPassword_Request$json, ForgotPassword_Reply$json],
  '4': [ForgotPassword_Error$json],
};

@$core.Deprecated('Use forgotPasswordDescriptor instead')
const ForgotPassword_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'otp', '3': 3, '4': 1, '5': 9, '10': 'otp'},
    {'1': 'kick_out', '3': 4, '4': 1, '5': 8, '10': 'kickOut'},
  ],
};

@$core.Deprecated('Use forgotPasswordDescriptor instead')
const ForgotPassword_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use forgotPasswordDescriptor instead')
const ForgotPassword_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'PASSWORD_INVALID', '2': 1},
    {'1': 'OTP_NOT_MATCH', '2': 2},
    {'1': 'OTP_EXPIRED', '2': 3},
    {'1': 'TEL_INVALID', '2': 4},
    {'1': 'EMAIL_INVALID', '2': 5},
    {'1': 'PASSWORD_OTP_INVALID', '2': 6},
    {'1': 'ACCOUNT_INVALID', '2': 7},
    {'1': 'PASSWORD_CONTAINING_SPECIAL_CHARACTERS', '2': 8},
    {'1': 'PASSWORD_WEAKNESS', '2': 9},
  ],
};

/// Descriptor for `ForgotPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordDescriptor = $convert.base64Decode(
    'Cg5Gb3Jnb3RQYXNzd29yZBIOCgJJRBhrIAEoDVICSUQabAoHUmVxdWVzdBIYCgdhY2NvdW50GA'
    'EgASgJUgdhY2NvdW50EhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZBIQCgNvdHAYAyABKAlS'
    'A290cBIZCghraWNrX291dBgEIAEoCFIHa2lja091dBoHCgVSZXBseSLqAQoFRXJyb3ISEQoNRV'
    'JST1JfREVGQVVMVBAAEhQKEFBBU1NXT1JEX0lOVkFMSUQQARIRCg1PVFBfTk9UX01BVENIEAIS'
    'DwoLT1RQX0VYUElSRUQQAxIPCgtURUxfSU5WQUxJRBAEEhEKDUVNQUlMX0lOVkFMSUQQBRIYCh'
    'RQQVNTV09SRF9PVFBfSU5WQUxJRBAGEhMKD0FDQ09VTlRfSU5WQUxJRBAHEioKJlBBU1NXT1JE'
    'X0NPTlRBSU5JTkdfU1BFQ0lBTF9DSEFSQUNURVJTEAgSFQoRUEFTU1dPUkRfV0VBS05FU1MQCQ'
    '==');

@$core.Deprecated('Use requestOTPDescriptor instead')
const RequestOTP$json = {
  '1': 'RequestOTP',
  '2': [
    {'1': 'ID', '3': 108, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [RequestOTP_Request$json, RequestOTP_Reply$json],
  '4': [RequestOTP_Error$json],
};

@$core.Deprecated('Use requestOTPDescriptor instead')
const RequestOTP_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
  ],
};

@$core.Deprecated('Use requestOTPDescriptor instead')
const RequestOTP_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'wait_time', '3': 1, '4': 1, '5': 13, '10': 'waitTime'},
  ],
};

@$core.Deprecated('Use requestOTPDescriptor instead')
const RequestOTP_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'TEL_INVALID', '2': 1},
    {'1': 'EMAIL_INVALID', '2': 2},
    {'1': 'ALREADY_GET_OTP', '2': 3},
    {'1': 'EXCEEDED_TIMES_GET_OTP', '2': 4},
    {'1': 'ACCOUNT_INVALID', '2': 5},
  ],
};

/// Descriptor for `RequestOTP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestOTPDescriptor = $convert.base64Decode(
    'CgpSZXF1ZXN0T1RQEg4KAklEGGwgASgFUgJJRBojCgdSZXF1ZXN0EhgKB2FjY291bnQYASABKA'
    'lSB2FjY291bnQaJAoFUmVwbHkSGwoJd2FpdF90aW1lGAEgASgNUgh3YWl0VGltZSKEAQoFRXJy'
    'b3ISEQoNRVJST1JfREVGQVVMVBAAEg8KC1RFTF9JTlZBTElEEAESEQoNRU1BSUxfSU5WQUxJRB'
    'ACEhMKD0FMUkVBRFlfR0VUX09UUBADEhoKFkVYQ0VFREVEX1RJTUVTX0dFVF9PVFAQBBITCg9B'
    'Q0NPVU5UX0lOVkFMSUQQBQ==');

@$core.Deprecated('Use checkAccountDescriptor instead')
const CheckAccount$json = {
  '1': 'CheckAccount',
  '2': [
    {'1': 'ID', '3': 109, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [CheckAccount_Request$json, CheckAccount_Reply$json],
  '4': [CheckAccount_State$json, CheckAccount_Error$json],
};

@$core.Deprecated('Use checkAccountDescriptor instead')
const CheckAccount_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

@$core.Deprecated('Use checkAccountDescriptor instead')
const CheckAccount_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.comm.CheckAccount.State', '10': 'state'},
  ],
};

@$core.Deprecated('Use checkAccountDescriptor instead')
const CheckAccount_State$json = {
  '1': 'State',
  '2': [
    {'1': 'NOT_EXISTED', '2': 0},
    {'1': 'TEL_EXISTS', '2': 1},
    {'1': 'EMAIL_EXISTS', '2': 2},
  ],
};

@$core.Deprecated('Use checkAccountDescriptor instead')
const CheckAccount_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'TEL_INVALID', '2': 1},
    {'1': 'EMAIL_INVALID', '2': 2},
    {'1': 'TEL_ALREADY_IN_USE', '2': 3},
    {'1': 'EMAIL_ALREADY_IN_USE', '2': 4},
    {'1': 'ACCOUNT_INVALID', '2': 5},
    {'1': 'PASSWORD_INVALID', '2': 6},
    {'1': 'PASSWORD_EMPTY', '2': 7},
    {'1': 'PASSWORD_CONTAINING_SPECIAL_CHARACTERS', '2': 8},
    {'1': 'PASSWORD_WEAKNESS', '2': 9},
  ],
};

/// Descriptor for `CheckAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkAccountDescriptor = $convert.base64Decode(
    'CgxDaGVja0FjY291bnQSDgoCSUQYbSABKAVSAklEGj8KB1JlcXVlc3QSGAoHYWNjb3VudBgBIA'
    'EoCVIHYWNjb3VudBIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQaNwoFUmVwbHkSLgoFc3Rh'
    'dGUYASABKA4yGC5jb21tLkNoZWNrQWNjb3VudC5TdGF0ZVIFc3RhdGUiOgoFU3RhdGUSDwoLTk'
    '9UX0VYSVNURUQQABIOCgpURUxfRVhJU1RTEAESEAoMRU1BSUxfRVhJU1RTEAIi8gEKBUVycm9y'
    'EhEKDUVSUk9SX0RFRkFVTFQQABIPCgtURUxfSU5WQUxJRBABEhEKDUVNQUlMX0lOVkFMSUQQAh'
    'IWChJURUxfQUxSRUFEWV9JTl9VU0UQAxIYChRFTUFJTF9BTFJFQURZX0lOX1VTRRAEEhMKD0FD'
    'Q09VTlRfSU5WQUxJRBAFEhQKEFBBU1NXT1JEX0lOVkFMSUQQBhISCg5QQVNTV09SRF9FTVBUWR'
    'AHEioKJlBBU1NXT1JEX0NPTlRBSU5JTkdfU1BFQ0lBTF9DSEFSQUNURVJTEAgSFQoRUEFTU1dP'
    'UkRfV0VBS05FU1MQCQ==');

@$core.Deprecated('Use feedbackUserDescriptor instead')
const FeedbackUser$json = {
  '1': 'FeedbackUser',
  '2': [
    {'1': 'ID', '3': 110, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [FeedbackUser_Request$json, FeedbackUser_Reply$json],
  '4': [FeedbackUser_Error$json],
};

@$core.Deprecated('Use feedbackUserDescriptor instead')
const FeedbackUser_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'feedback', '3': 1, '4': 1, '5': 9, '10': 'feedback'},
  ],
};

@$core.Deprecated('Use feedbackUserDescriptor instead')
const FeedbackUser_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use feedbackUserDescriptor instead')
const FeedbackUser_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'FEEDBACK_EMPTY', '2': 1},
  ],
};

/// Descriptor for `FeedbackUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedbackUserDescriptor = $convert.base64Decode(
    'CgxGZWVkYmFja1VzZXISDgoCSUQYbiABKAVSAklEGiUKB1JlcXVlc3QSGgoIZmVlZGJhY2sYAS'
    'ABKAlSCGZlZWRiYWNrGgcKBVJlcGx5Ii4KBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABISCg5G'
    'RUVEQkFDS19FTVBUWRAB');

@$core.Deprecated('Use checkAccountExistsDescriptor instead')
const CheckAccountExists$json = {
  '1': 'CheckAccountExists',
  '2': [
    {'1': 'ID', '3': 111, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [CheckAccountExists_Request$json, CheckAccountExists_Reply$json],
  '4': [CheckAccountExists_Error$json],
};

@$core.Deprecated('Use checkAccountExistsDescriptor instead')
const CheckAccountExists_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
  ],
};

@$core.Deprecated('Use checkAccountExistsDescriptor instead')
const CheckAccountExists_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'isExists', '3': 1, '4': 1, '5': 8, '10': 'isExists'},
    {'1': 'info', '3': 2, '4': 1, '5': 9, '10': 'info'},
  ],
};

@$core.Deprecated('Use checkAccountExistsDescriptor instead')
const CheckAccountExists_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'TEL_INVALID', '2': 1},
    {'1': 'EMAIL_INVALID', '2': 2},
    {'1': 'TEL_NOT_IN_USE', '2': 3},
    {'1': 'EMAIL_NOT_IN_USE', '2': 4},
    {'1': 'ACCOUNT_INVALID', '2': 5},
  ],
};

/// Descriptor for `CheckAccountExists`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkAccountExistsDescriptor = $convert.base64Decode(
    'ChJDaGVja0FjY291bnRFeGlzdHMSDgoCSUQYbyABKAVSAklEGiMKB1JlcXVlc3QSGAoHYWNjb3'
    'VudBgBIAEoCVIHYWNjb3VudBo3CgVSZXBseRIaCghpc0V4aXN0cxgBIAEoCFIIaXNFeGlzdHMS'
    'EgoEaW5mbxgCIAEoCVIEaW5mbyJ9CgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASDwoLVEVMX0'
    'lOVkFMSUQQARIRCg1FTUFJTF9JTlZBTElEEAISEgoOVEVMX05PVF9JTl9VU0UQAxIUChBFTUFJ'
    'TF9OT1RfSU5fVVNFEAQSEwoPQUNDT1VOVF9JTlZBTElEEAU=');

@$core.Deprecated('Use requestUpdateTelProfileDescriptor instead')
const RequestUpdateTelProfile$json = {
  '1': 'RequestUpdateTelProfile',
  '2': [
    {'1': 'ID', '3': 112, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [RequestUpdateTelProfile_Request$json, RequestUpdateTelProfile_Reply$json],
  '4': [RequestUpdateTelProfile_Error$json],
};

@$core.Deprecated('Use requestUpdateTelProfileDescriptor instead')
const RequestUpdateTelProfile_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'tel', '3': 1, '4': 1, '5': 9, '10': 'tel'},
    {'1': 'current_password', '3': 2, '4': 1, '5': 9, '10': 'currentPassword'},
  ],
};

@$core.Deprecated('Use requestUpdateTelProfileDescriptor instead')
const RequestUpdateTelProfile_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'wait_time', '3': 1, '4': 1, '5': 13, '10': 'waitTime'},
  ],
};

@$core.Deprecated('Use requestUpdateTelProfileDescriptor instead')
const RequestUpdateTelProfile_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'PASSWORD_NOT_MATCH', '2': 1},
    {'1': 'TEL_INVALID', '2': 2},
    {'1': 'TEL_EXIST', '2': 3},
    {'1': 'SYN_ERROR', '2': 4},
  ],
};

/// Descriptor for `RequestUpdateTelProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestUpdateTelProfileDescriptor = $convert.base64Decode(
    'ChdSZXF1ZXN0VXBkYXRlVGVsUHJvZmlsZRIOCgJJRBhwIAEoBVICSUQaRgoHUmVxdWVzdBIQCg'
    'N0ZWwYASABKAlSA3RlbBIpChBjdXJyZW50X3Bhc3N3b3JkGAIgASgJUg9jdXJyZW50UGFzc3dv'
    'cmQaJAoFUmVwbHkSGwoJd2FpdF90aW1lGAEgASgNUgh3YWl0VGltZSJhCgVFcnJvchIRCg1FUl'
    'JPUl9ERUZBVUxUEAASFgoSUEFTU1dPUkRfTk9UX01BVENIEAESDwoLVEVMX0lOVkFMSUQQAhIN'
    'CglURUxfRVhJU1QQAxINCglTWU5fRVJST1IQBA==');

@$core.Deprecated('Use updateTelProfileDescriptor instead')
const UpdateTelProfile$json = {
  '1': 'UpdateTelProfile',
  '2': [
    {'1': 'ID', '3': 113, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [UpdateTelProfile_Request$json, UpdateTelProfile_Reply$json],
  '4': [UpdateTelProfile_Error$json],
};

@$core.Deprecated('Use updateTelProfileDescriptor instead')
const UpdateTelProfile_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'otp', '3': 2, '4': 1, '5': 9, '10': 'otp'},
  ],
};

@$core.Deprecated('Use updateTelProfileDescriptor instead')
const UpdateTelProfile_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'newProfile', '3': 1, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'newProfile'},
  ],
};

@$core.Deprecated('Use updateTelProfileDescriptor instead')
const UpdateTelProfile_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'OTP_EMPTY', '2': 1},
    {'1': 'OTP_NOT_MATCH', '2': 2},
    {'1': 'OPT_EXPIRED', '2': 3},
    {'1': 'OPT_NOT_FOUND', '2': 4},
    {'1': 'TEL_EXIST', '2': 5},
    {'1': 'SYN_ERROR', '2': 6},
  ],
};

/// Descriptor for `UpdateTelProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTelProfileDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVUZWxQcm9maWxlEg4KAklEGHEgASgFUgJJRBobCgdSZXF1ZXN0EhAKA290cBgCIA'
    'EoCVIDb3RwGjYKBVJlcGx5Ei0KCm5ld1Byb2ZpbGUYASABKAsyDS5jb21tLlByb2ZpbGVSCm5l'
    'd1Byb2ZpbGUifgoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEg0KCU9UUF9FTVBUWRABEhEKDU'
    '9UUF9OT1RfTUFUQ0gQAhIPCgtPUFRfRVhQSVJFRBADEhEKDU9QVF9OT1RfRk9VTkQQBBINCglU'
    'RUxfRVhJU1QQBRINCglTWU5fRVJST1IQBg==');

@$core.Deprecated('Use requestUpdateEmailProfileDescriptor instead')
const RequestUpdateEmailProfile$json = {
  '1': 'RequestUpdateEmailProfile',
  '2': [
    {'1': 'ID', '3': 114, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [RequestUpdateEmailProfile_Request$json, RequestUpdateEmailProfile_Reply$json],
  '4': [RequestUpdateEmailProfile_Error$json],
};

@$core.Deprecated('Use requestUpdateEmailProfileDescriptor instead')
const RequestUpdateEmailProfile_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'current_password', '3': 2, '4': 1, '5': 9, '10': 'currentPassword'},
  ],
};

@$core.Deprecated('Use requestUpdateEmailProfileDescriptor instead')
const RequestUpdateEmailProfile_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'wait_time', '3': 1, '4': 1, '5': 13, '10': 'waitTime'},
  ],
};

@$core.Deprecated('Use requestUpdateEmailProfileDescriptor instead')
const RequestUpdateEmailProfile_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'PASSWORD_NOT_MATCH', '2': 1},
    {'1': 'EMAIL_INVALID', '2': 2},
    {'1': 'EMAIL_EXIST', '2': 3},
    {'1': 'SYN_ERROR', '2': 4},
  ],
};

/// Descriptor for `RequestUpdateEmailProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestUpdateEmailProfileDescriptor = $convert.base64Decode(
    'ChlSZXF1ZXN0VXBkYXRlRW1haWxQcm9maWxlEg4KAklEGHIgASgFUgJJRBpKCgdSZXF1ZXN0Eh'
    'QKBWVtYWlsGAEgASgJUgVlbWFpbBIpChBjdXJyZW50X3Bhc3N3b3JkGAIgASgJUg9jdXJyZW50'
    'UGFzc3dvcmQaJAoFUmVwbHkSGwoJd2FpdF90aW1lGAEgASgNUgh3YWl0VGltZSJlCgVFcnJvch'
    'IRCg1FUlJPUl9ERUZBVUxUEAASFgoSUEFTU1dPUkRfTk9UX01BVENIEAESEQoNRU1BSUxfSU5W'
    'QUxJRBACEg8KC0VNQUlMX0VYSVNUEAMSDQoJU1lOX0VSUk9SEAQ=');

@$core.Deprecated('Use updateEmailProfileDescriptor instead')
const UpdateEmailProfile$json = {
  '1': 'UpdateEmailProfile',
  '2': [
    {'1': 'ID', '3': 115, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [UpdateEmailProfile_Request$json, UpdateEmailProfile_Reply$json],
  '4': [UpdateEmailProfile_Error$json],
};

@$core.Deprecated('Use updateEmailProfileDescriptor instead')
const UpdateEmailProfile_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'otp', '3': 2, '4': 1, '5': 9, '10': 'otp'},
  ],
};

@$core.Deprecated('Use updateEmailProfileDescriptor instead')
const UpdateEmailProfile_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'newProfile', '3': 1, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'newProfile'},
  ],
};

@$core.Deprecated('Use updateEmailProfileDescriptor instead')
const UpdateEmailProfile_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'OTP_EMPTY', '2': 1},
    {'1': 'OTP_NOT_MATCH', '2': 2},
    {'1': 'OPT_EXPIRED', '2': 3},
    {'1': 'OPT_NOT_FOUND', '2': 4},
    {'1': 'EMAIL_EXIST', '2': 5},
    {'1': 'SYN_ERROR', '2': 6},
  ],
};

/// Descriptor for `UpdateEmailProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEmailProfileDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVFbWFpbFByb2ZpbGUSDgoCSUQYcyABKAVSAklEGhsKB1JlcXVlc3QSEAoDb3RwGA'
    'IgASgJUgNvdHAaNgoFUmVwbHkSLQoKbmV3UHJvZmlsZRgBIAEoCzINLmNvbW0uUHJvZmlsZVIK'
    'bmV3UHJvZmlsZSKAAQoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEg0KCU9UUF9FTVBUWRABEh'
    'EKDU9UUF9OT1RfTUFUQ0gQAhIPCgtPUFRfRVhQSVJFRBADEhEKDU9QVF9OT1RfRk9VTkQQBBIP'
    'CgtFTUFJTF9FWElTVBAFEg0KCVNZTl9FUlJPUhAG');

@$core.Deprecated('Use cloudDefaultSettingDescriptor instead')
const CloudDefaultSetting$json = {
  '1': 'CloudDefaultSetting',
  '2': [
    {'1': 'ID', '3': 116, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [CloudDefaultSetting_Request$json, CloudDefaultSetting_Reply$json],
  '4': [CloudDefaultSetting_Error$json],
};

@$core.Deprecated('Use cloudDefaultSettingDescriptor instead')
const CloudDefaultSetting_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'power_cloud_storage', '3': 1, '4': 1, '5': 8, '10': 'powerCloudStorage'},
    {'1': 'number_days_storage', '3': 2, '4': 1, '5': 13, '10': 'numberDaysStorage'},
  ],
};

@$core.Deprecated('Use cloudDefaultSettingDescriptor instead')
const CloudDefaultSetting_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'newProfile', '3': 1, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'newProfile'},
  ],
};

@$core.Deprecated('Use cloudDefaultSettingDescriptor instead')
const CloudDefaultSetting_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
  ],
};

/// Descriptor for `CloudDefaultSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cloudDefaultSettingDescriptor = $convert.base64Decode(
    'ChNDbG91ZERlZmF1bHRTZXR0aW5nEg4KAklEGHQgASgFUgJJRBppCgdSZXF1ZXN0Ei4KE3Bvd2'
    'VyX2Nsb3VkX3N0b3JhZ2UYASABKAhSEXBvd2VyQ2xvdWRTdG9yYWdlEi4KE251bWJlcl9kYXlz'
    'X3N0b3JhZ2UYAiABKA1SEW51bWJlckRheXNTdG9yYWdlGjYKBVJlcGx5Ei0KCm5ld1Byb2ZpbG'
    'UYASABKAsyDS5jb21tLlByb2ZpbGVSCm5ld1Byb2ZpbGUiGgoFRXJyb3ISEQoNRVJST1JfREVG'
    'QVVMVBAA');

@$core.Deprecated('Use verifyURLDescriptor instead')
const VerifyURL$json = {
  '1': 'VerifyURL',
  '2': [
    {'1': 'ID', '3': 117, '4': 1, '5': 5, '10': 'ID'},
  ],
  '3': [VerifyURL_Request$json, VerifyURL_Reply$json],
  '4': [VerifyURL_Error$json],
};

@$core.Deprecated('Use verifyURLDescriptor instead')
const VerifyURL_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

@$core.Deprecated('Use verifyURLDescriptor instead')
const VerifyURL_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'license_profile', '3': 1, '4': 1, '5': 11, '6': '.comm.License_profile', '10': 'licenseProfile'},
  ],
};

@$core.Deprecated('Use verifyURLDescriptor instead')
const VerifyURL_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'URL_INVALID', '2': 1},
  ],
};

/// Descriptor for `VerifyURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyURLDescriptor = $convert.base64Decode(
    'CglWZXJpZnlVUkwSDgoCSUQYdSABKAVSAklEGhsKB1JlcXVlc3QSEAoDdXJsGAEgASgJUgN1cm'
    'waRwoFUmVwbHkSPgoPbGljZW5zZV9wcm9maWxlGAEgASgLMhUuY29tbS5MaWNlbnNlX3Byb2Zp'
    'bGVSDmxpY2Vuc2VQcm9maWxlIisKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIPCgtVUkxfSU'
    '5WQUxJRBAB');

@$core.Deprecated('Use vconnexLoginDescriptor instead')
const VconnexLogin$json = {
  '1': 'VconnexLogin',
  '2': [
    {'1': 'ID', '3': 118, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [VconnexLogin_Request$json, VconnexLogin_Reply$json, VconnexLogin_BaseURL$json],
  '4': [VconnexLogin_Error$json],
};

@$core.Deprecated('Use vconnexLoginDescriptor instead')
const VconnexLogin_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'target', '3': 3, '4': 1, '5': 14, '6': '.comm.ProjectTarget', '10': 'target'},
    {'1': 'apiVersion', '3': 4, '4': 1, '5': 5, '10': 'apiVersion'},
    {'1': 'platform', '3': 5, '4': 1, '5': 13, '10': 'platform'},
  ],
};

@$core.Deprecated('Use vconnexLoginDescriptor instead')
const VconnexLogin_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'turn_account', '3': 1, '4': 1, '5': 11, '6': '.comm.TurnAccount', '10': 'turnAccount'},
    {'1': 'server_time', '3': 2, '4': 1, '5': 4, '10': 'serverTime'},
    {'1': 'profile', '3': 3, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'profile'},
    {'1': 'server_version_build', '3': 4, '4': 1, '5': 13, '10': 'serverVersionBuild'},
    {'1': 'base_image_url', '3': 5, '4': 1, '5': 9, '10': 'baseImageUrl'},
    {'1': 'list_ntp_server', '3': 6, '4': 3, '5': 9, '10': 'listNtpServer'},
    {'1': 'build_number', '3': 7, '4': 1, '5': 13, '10': 'buildNumber'},
    {'1': 'link_download', '3': 8, '4': 1, '5': 9, '10': 'linkDownload'},
    {'1': 'target', '3': 9, '4': 1, '5': 14, '6': '.comm.ProjectTarget', '10': 'target'},
    {'1': 'base_url', '3': 10, '4': 1, '5': 11, '6': '.comm.VconnexLogin.BaseURL', '10': 'baseUrl'},
    {'1': 'license_profile', '3': 11, '4': 1, '5': 11, '6': '.comm.License_profile', '10': 'licenseProfile'},
  ],
};

@$core.Deprecated('Use vconnexLoginDescriptor instead')
const VconnexLogin_BaseURL$json = {
  '1': 'BaseURL',
  '2': [
    {'1': 'face_base_url', '3': 1, '4': 1, '5': 9, '10': 'faceBaseUrl'},
  ],
};

@$core.Deprecated('Use vconnexLoginDescriptor instead')
const VconnexLogin_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'SESSION_EXPIRED', '2': 1},
    {'1': 'USER_INVALID', '2': 2},
    {'1': 'VERST_IION_API_DEPRECATED', '2': 3},
    {'1': 'PROJECT_TARGENVALID', '2': 4},
    {'1': 'LICENSE_EXPIRED', '2': 6},
  ],
};

/// Descriptor for `VconnexLogin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vconnexLoginDescriptor = $convert.base64Decode(
    'CgxWY29ubmV4TG9naW4SDgoCSUQYdiABKA1SAklEGogBCgdSZXF1ZXN0EhQKBXRva2VuGAIgAS'
    'gJUgV0b2tlbhIrCgZ0YXJnZXQYAyABKA4yEy5jb21tLlByb2plY3RUYXJnZXRSBnRhcmdldBIe'
    'CgphcGlWZXJzaW9uGAQgASgFUgphcGlWZXJzaW9uEhoKCHBsYXRmb3JtGAUgASgNUghwbGF0Zm'
    '9ybRrzAwoFUmVwbHkSNAoMdHVybl9hY2NvdW50GAEgASgLMhEuY29tbS5UdXJuQWNjb3VudFIL'
    'dHVybkFjY291bnQSHwoLc2VydmVyX3RpbWUYAiABKARSCnNlcnZlclRpbWUSJwoHcHJvZmlsZR'
    'gDIAEoCzINLmNvbW0uUHJvZmlsZVIHcHJvZmlsZRIwChRzZXJ2ZXJfdmVyc2lvbl9idWlsZBgE'
    'IAEoDVISc2VydmVyVmVyc2lvbkJ1aWxkEiQKDmJhc2VfaW1hZ2VfdXJsGAUgASgJUgxiYXNlSW'
    '1hZ2VVcmwSJgoPbGlzdF9udHBfc2VydmVyGAYgAygJUg1saXN0TnRwU2VydmVyEiEKDGJ1aWxk'
    'X251bWJlchgHIAEoDVILYnVpbGROdW1iZXISIwoNbGlua19kb3dubG9hZBgIIAEoCVIMbGlua0'
    'Rvd25sb2FkEisKBnRhcmdldBgJIAEoDjITLmNvbW0uUHJvamVjdFRhcmdldFIGdGFyZ2V0EjUK'
    'CGJhc2VfdXJsGAogASgLMhouY29tbS5WY29ubmV4TG9naW4uQmFzZVVSTFIHYmFzZVVybBI+Cg'
    '9saWNlbnNlX3Byb2ZpbGUYCyABKAsyFS5jb21tLkxpY2Vuc2VfcHJvZmlsZVIObGljZW5zZVBy'
    'b2ZpbGUaLQoHQmFzZVVSTBIiCg1mYWNlX2Jhc2VfdXJsGAEgASgJUgtmYWNlQmFzZVVybCKOAQ'
    'oFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhMKD1NFU1NJT05fRVhQSVJFRBABEhAKDFVTRVJf'
    'SU5WQUxJRBACEh0KGVZFUlNUX0lJT05fQVBJX0RFUFJFQ0FURUQQAxIXChNQUk9KRUNUX1RBUk'
    'dFTlZBTElEEAQSEwoPTElDRU5TRV9FWFBJUkVEEAY=');

