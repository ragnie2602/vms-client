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
  '3': [Login_Request$json, Login_Reply$json],
  '4': [Login_Error$json],
};

@$core.Deprecated('Use loginDescriptor instead')
const Login_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

@$core.Deprecated('Use loginDescriptor instead')
const Login_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'server_time', '3': 1, '4': 1, '5': 4, '10': 'serverTime'},
    {'1': 'profile', '3': 2, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'profile'},
    {'1': 'base_api_url', '3': 3, '4': 1, '5': 9, '10': 'baseApiUrl'},
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
    'CgVMb2dpbhIOCgJJRBhmIAEoDVICSUQaOgoHUmVxdWVzdBIQCgN1aWQYASABKAlSA3VpZBIdCg'
    'pzZXNzaW9uX2lkGAIgASgJUglzZXNzaW9uSWQacwoFUmVwbHkSHwoLc2VydmVyX3RpbWUYASAB'
    'KARSCnNlcnZlclRpbWUSJwoHcHJvZmlsZRgCIAEoCzINLmNvbW0uUHJvZmlsZVIHcHJvZmlsZR'
    'IgCgxiYXNlX2FwaV91cmwYAyABKAlSCmJhc2VBcGlVcmwijgEKBUVycm9yEhEKDUVSUk9SX0RF'
    'RkFVTFQQABITCg9TRVNTSU9OX0VYUElSRUQQARIQCgxVU0VSX0lOVkFMSUQQAhIdChlWRVJTVF'
    '9JSU9OX0FQSV9ERVBSRUNBVEVEEAMSFwoTUFJPSkVDVF9UQVJHRU5WQUxJRBAEEhMKD0xJQ0VO'
    'U0VfRVhQSVJFRBAG');

