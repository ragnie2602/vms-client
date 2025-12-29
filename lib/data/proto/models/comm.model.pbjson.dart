//
//  Generated code. Do not modify.
//  source: comm.model.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resultTypeDescriptor instead')
const ResultType$json = {
  '1': 'ResultType',
  '2': [
    {'1': 'OK', '2': 0},
    {'1': 'REQUEST_INVALID', '2': 1000},
    {'1': 'SESSION_INVALID', '2': 1001},
    {'1': 'SESSION_EXPIRE', '2': 1002},
    {'1': 'SIZE_LIMITED', '2': 1003},
    {'1': 'DB_ERROR', '2': 1004},
    {'1': 'NO_CHANGED', '2': 1005},
    {'1': 'NETWORK_ERROR', '2': 1006},
    {'1': 'DATA_ERROR', '2': 1007},
    {'1': 'INTERNAL_ERROR_500', '2': 1008},
    {'1': 'PERMISSION_DENIED_401', '2': 1009},
  ],
};

/// Descriptor for `ResultType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resultTypeDescriptor = $convert.base64Decode(
    'CgpSZXN1bHRUeXBlEgYKAk9LEAASFAoPUkVRVUVTVF9JTlZBTElEEOgHEhQKD1NFU1NJT05fSU'
    '5WQUxJRBDpBxITCg5TRVNTSU9OX0VYUElSRRDqBxIRCgxTSVpFX0xJTUlURUQQ6wcSDQoIREJf'
    'RVJST1IQ7AcSDwoKTk9fQ0hBTkdFRBDtBxISCg1ORVRXT1JLX0VSUk9SEO4HEg8KCkRBVEFfRV'
    'JST1IQ7wcSFwoSSU5URVJOQUxfRVJST1JfNTAwEPAHEhoKFVBFUk1JU1NJT05fREVOSUVEXzQw'
    'MRDxBw==');

@$core.Deprecated('Use eventTypeDescriptor instead')
const EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'MOTION_DETECTION', '2': 0},
    {'1': 'LINE_CROSSING', '2': 1},
    {'1': 'INTRUSION_DETECTION', '2': 2},
    {'1': 'IVA_FACE_DETECTION', '2': 3},
    {'1': 'IVA_SMOKE_DETECTION', '2': 4},
    {'1': 'IVA_ALPR', '2': 5},
    {'1': 'ALL_TYPE', '2': 98},
    {'1': 'ALL', '2': 99},
  ],
};

/// Descriptor for `EventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventTypeDescriptor = $convert.base64Decode(
    'CglFdmVudFR5cGUSFAoQTU9USU9OX0RFVEVDVElPThAAEhEKDUxJTkVfQ1JPU1NJTkcQARIXCh'
    'NJTlRSVVNJT05fREVURUNUSU9OEAISFgoSSVZBX0ZBQ0VfREVURUNUSU9OEAMSFwoTSVZBX1NN'
    'T0tFX0RFVEVDVElPThAEEgwKCElWQV9BTFBSEAUSDAoIQUxMX1RZUEUQYhIHCgNBTEwQYw==');

@$core.Deprecated('Use qualityDescriptor instead')
const Quality$json = {
  '1': 'Quality',
  '2': [
    {'1': 'AUTO', '2': 0},
    {'1': 'SD', '2': 1},
    {'1': 'HD', '2': 2},
    {'1': 'FHD', '2': 3},
  ],
};

/// Descriptor for `Quality`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List qualityDescriptor = $convert.base64Decode(
    'CgdRdWFsaXR5EggKBEFVVE8QABIGCgJTRBABEgYKAkhEEAISBwoDRkhEEAM=');

@$core.Deprecated('Use projectTargetDescriptor instead')
const ProjectTarget$json = {
  '1': 'ProjectTarget',
  '2': [
    {'1': 'VIVAS', '2': 0},
    {'1': 'VIVAS_CLOUD', '2': 1},
    {'1': 'KC01', '2': 99},
  ],
};

/// Descriptor for `ProjectTarget`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List projectTargetDescriptor = $convert.base64Decode(
    'Cg1Qcm9qZWN0VGFyZ2V0EgkKBVZJVkFTEAASDwoLVklWQVNfQ0xPVUQQARIICgRLQzAxEGM=');

@$core.Deprecated('Use box_TypeDescriptor instead')
const Box_Type$json = {
  '1': 'Box_Type',
  '2': [
    {'1': 'BOX_UNDEFINED', '2': 0},
    {'1': 'RASPBERRY', '2': 1},
    {'1': 'ORANGEPI', '2': 2},
  ],
};

/// Descriptor for `Box_Type`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List box_TypeDescriptor = $convert.base64Decode(
    'CghCb3hfVHlwZRIRCg1CT1hfVU5ERUZJTkVEEAASDQoJUkFTUEJFUlJZEAESDAoIT1JBTkdFUE'
    'kQAg==');

@$core.Deprecated('Use box_StateDescriptor instead')
const Box_State$json = {
  '1': 'Box_State',
  '2': [
    {'1': 'VBOX_ACTIVE', '2': 0},
    {'1': 'VBOX_INACTIVE', '2': 1},
    {'1': 'VBOX_LOST', '2': 2},
  ],
};

/// Descriptor for `Box_State`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List box_StateDescriptor = $convert.base64Decode(
    'CglCb3hfU3RhdGUSDwoLVkJPWF9BQ1RJVkUQABIRCg1WQk9YX0lOQUNUSVZFEAESDQoJVkJPWF'
    '9MT1NUEAI=');

@$core.Deprecated('Use languageDescriptor instead')
const Language$json = {
  '1': 'Language',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'VI', '2': 1},
    {'1': 'EN', '2': 2},
  ],
};

/// Descriptor for `Language`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List languageDescriptor = $convert.base64Decode(
    'CghMYW5ndWFnZRILCgdERUZBVUxUEAASBgoCVkkQARIGCgJFThAC');

@$core.Deprecated('Use cameraTypeDescriptor instead')
const CameraType$json = {
  '1': 'CameraType',
  '2': [
    {'1': 'UNKNOW', '2': 0},
    {'1': 'RTSP', '2': 1},
    {'1': 'ONVIF', '2': 2},
    {'1': 'ONEHOME_VNT', '2': 3},
    {'1': 'RTMP', '2': 4},
  ],
};

/// Descriptor for `CameraType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cameraTypeDescriptor = $convert.base64Decode(
    'CgpDYW1lcmFUeXBlEgoKBlVOS05PVxAAEggKBFJUU1AQARIJCgVPTlZJRhACEg8KC09ORUhPTU'
    'VfVk5UEAMSCAoEUlRNUBAE');

@$core.Deprecated('Use ptzActionDescriptor instead')
const PtzAction$json = {
  '1': 'PtzAction',
  '2': [
    {'1': 'PTZ_STOP', '2': 0},
    {'1': 'PTZ_UP', '2': 1},
    {'1': 'PTZ_DOWN', '2': 2},
    {'1': 'PTZ_LEFT', '2': 3},
    {'1': 'PTZ_RIGHT', '2': 6},
  ],
};

/// Descriptor for `PtzAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ptzActionDescriptor = $convert.base64Decode(
    'CglQdHpBY3Rpb24SDAoIUFRaX1NUT1AQABIKCgZQVFpfVVAQARIMCghQVFpfRE9XThACEgwKCF'
    'BUWl9MRUZUEAMSDQoJUFRaX1JJR0hUEAY=');

@$core.Deprecated('Use userStatusDescriptor instead')
const UserStatus$json = {
  '1': 'UserStatus',
  '2': [
    {'1': 'ACTIVE', '2': 0},
    {'1': 'INACTIVE', '2': 1},
  ],
};

/// Descriptor for `UserStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userStatusDescriptor = $convert.base64Decode(
    'CgpVc2VyU3RhdHVzEgoKBkFDVElWRRAAEgwKCElOQUNUSVZFEAE=');

@$core.Deprecated('Use aPIDescriptor instead')
const API$json = {
  '1': 'API',
  '2': [
    {'1': 'UNDEFINED', '2': 0},
    {'1': 'API_VERSION', '2': 111},
  ],
};

/// Descriptor for `API`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List aPIDescriptor = $convert.base64Decode(
    'CgNBUEkSDQoJVU5ERUZJTkVEEAASDwoLQVBJX1ZFUlNJT04Qbw==');

@$core.Deprecated('Use networkTypeDescriptor instead')
const NetworkType$json = {
  '1': 'NetworkType',
  '2': [
    {'1': 'DHCP', '2': 0},
    {'1': 'STATIC', '2': 1},
  ],
};

/// Descriptor for `NetworkType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List networkTypeDescriptor = $convert.base64Decode(
    'CgtOZXR3b3JrVHlwZRIICgRESENQEAASCgoGU1RBVElDEAE=');

@$core.Deprecated('Use vehicle_TypeDescriptor instead')
const Vehicle_Type$json = {
  '1': 'Vehicle_Type',
  '2': [
    {'1': 'CAR', '2': 0},
    {'1': 'MOTOBIKE', '2': 1},
    {'1': 'TRUCK', '2': 2},
  ],
};

/// Descriptor for `Vehicle_Type`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List vehicle_TypeDescriptor = $convert.base64Decode(
    'CgxWZWhpY2xlX1R5cGUSBwoDQ0FSEAASDAoITU9UT0JJS0UQARIJCgVUUlVDSxAC');

@$core.Deprecated('Use base_ViewDescriptor instead')
const Base_View$json = {
  '1': 'Base_View',
  '2': [
    {'1': 'V_1X1', '2': 0},
    {'1': 'V_2X2', '2': 1},
    {'1': 'V_3X3', '2': 2},
    {'1': 'V_4X4', '2': 3},
    {'1': 'V_5X5', '2': 4},
    {'1': 'V_6X6', '2': 5},
  ],
};

/// Descriptor for `Base_View`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List base_ViewDescriptor = $convert.base64Decode(
    'CglCYXNlX1ZpZXcSCQoFVl8xWDEQABIJCgVWXzJYMhABEgkKBVZfM1gzEAISCQoFVl80WDQQAx'
    'IJCgVWXzVYNRAEEgkKBVZfNlg2EAU=');

@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'presences', '3': 2, '4': 3, '5': 11, '6': '.comm.Presence', '10': 'presences'},
    {'1': 'time', '3': 3, '4': 1, '5': 4, '10': 'time'},
    {'1': 'reply', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'reply'},
    {'1': 'id', '3': 5, '4': 1, '5': 4, '10': 'id'},
    {'1': 'message_Error', '3': 6, '4': 1, '5': 9, '10': 'messageError'},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode(
    'CgVSZXBseRISCgR0eXBlGAEgASgNUgR0eXBlEiwKCXByZXNlbmNlcxgCIAMoCzIOLmNvbW0uUH'
    'Jlc2VuY2VSCXByZXNlbmNlcxISCgR0aW1lGAMgASgEUgR0aW1lEioKBXJlcGx5GAQgASgLMhQu'
    'Z29vZ2xlLnByb3RvYnVmLkFueVIFcmVwbHkSDgoCaWQYBSABKARSAmlkEiMKDW1lc3NhZ2VfRX'
    'Jyb3IYBiABKAlSDG1lc3NhZ2VFcnJvcg==');

@$core.Deprecated('Use httpReplyDescriptor instead')
const HttpReply$json = {
  '1': 'HttpReply',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'time', '3': 2, '4': 1, '5': 4, '10': 'time'},
    {'1': 'reply', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'reply'},
    {'1': 'message_Error', '3': 4, '4': 1, '5': 9, '10': 'messageError'},
  ],
};

/// Descriptor for `HttpReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpReplyDescriptor = $convert.base64Decode(
    'CglIdHRwUmVwbHkSEgoEdHlwZRgBIAEoDVIEdHlwZRISCgR0aW1lGAIgASgEUgR0aW1lEioKBX'
    'JlcGx5GAMgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIFcmVwbHkSIwoNbWVzc2FnZV9FcnJv'
    'chgEIAEoCVIMbWVzc2FnZUVycm9y');

@$core.Deprecated('Use requestDescriptor instead')
const Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'toppic_from', '3': 2, '4': 1, '5': 9, '10': 'toppicFrom'},
    {'1': 'toppic_to', '3': 3, '4': 1, '5': 9, '10': 'toppicTo'},
    {'1': 'node_uuid', '3': 4, '4': 1, '5': 9, '10': 'nodeUuid'},
    {'1': 'request', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'request'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0EhIKBHR5cGUYASABKA1SBHR5cGUSHwoLdG9wcGljX2Zyb20YAiABKAlSCnRvcH'
    'BpY0Zyb20SGwoJdG9wcGljX3RvGAMgASgJUgh0b3BwaWNUbxIbCglub2RlX3V1aWQYBCABKAlS'
    'CG5vZGVVdWlkEi4KB3JlcXVlc3QYBSABKAsyFC5nb29nbGUucHJvdG9idWYuQW55UgdyZXF1ZX'
    'N0');

@$core.Deprecated('Use httpRequestDescriptor instead')
const HttpRequest$json = {
  '1': 'HttpRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'sid', '3': 2, '4': 1, '5': 12, '10': 'sid'},
    {'1': 'uid', '3': 3, '4': 1, '5': 12, '10': 'uid'},
    {'1': 'request', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'request'},
  ],
};

/// Descriptor for `HttpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpRequestDescriptor = $convert.base64Decode(
    'CgtIdHRwUmVxdWVzdBISCgR0eXBlGAEgASgNUgR0eXBlEhAKA3NpZBgCIAEoDFIDc2lkEhAKA3'
    'VpZBgDIAEoDFIDdWlkEi4KB3JlcXVlc3QYBCABKAsyFC5nb29nbGUucHJvdG9idWYuQW55Ugdy'
    'ZXF1ZXN0');

@$core.Deprecated('Use receiveDescriptor instead')
const Receive$json = {
  '1': 'Receive',
  '2': [
    {'1': 'time', '3': 1, '4': 1, '5': 4, '10': 'time'},
    {'1': 'device_token', '3': 2, '4': 1, '5': 9, '10': 'deviceToken'},
    {'1': 'receive', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'receive'},
  ],
};

/// Descriptor for `Receive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDescriptor = $convert.base64Decode(
    'CgdSZWNlaXZlEhIKBHRpbWUYASABKARSBHRpbWUSIQoMZGV2aWNlX3Rva2VuGAIgASgJUgtkZX'
    'ZpY2VUb2tlbhIuCgdyZWNlaXZlGAMgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIHcmVjZWl2'
    'ZQ==');

@$core.Deprecated('Use presenceDescriptor instead')
const Presence$json = {
  '1': 'Presence',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'active_time', '3': 2, '4': 1, '5': 4, '10': 'activeTime'},
  ],
};

/// Descriptor for `Presence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List presenceDescriptor = $convert.base64Decode(
    'CghQcmVzZW5jZRIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEh8KC2FjdGl2ZV90aW1lGA'
    'IgASgEUgphY3RpdmVUaW1l');

@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = {
  '1': 'Session',
  '2': [
    {'1': 'image_base_url', '3': 1, '4': 1, '5': 9, '10': 'imageBaseUrl'},
  ],
  '4': [Session_Platform$json],
};

@$core.Deprecated('Use sessionDescriptor instead')
const Session_Platform$json = {
  '1': 'Platform',
  '2': [
    {'1': 'BLACKBERRY_', '2': 0},
    {'1': 'IOS_', '2': 1},
    {'1': 'ANDROID_', '2': 2},
    {'1': 'WINPHONE_', '2': 3},
    {'1': 'MACX_', '2': 4},
    {'1': 'WINDOWS_', '2': 5},
    {'1': 'LINUX_', '2': 6},
    {'1': 'WEB_SOCK_', '2': 7},
    {'1': '_VBOX', '2': 8},
    {'1': 'OTHER_', '2': 99},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode(
    'CgdTZXNzaW9uEiQKDmltYWdlX2Jhc2VfdXJsGAEgASgJUgxpbWFnZUJhc2VVcmwijQEKCFBsYX'
    'Rmb3JtEg8KC0JMQUNLQkVSUllfEAASCAoESU9TXxABEgwKCEFORFJPSURfEAISDQoJV0lOUEhP'
    'TkVfEAMSCQoFTUFDWF8QBBIMCghXSU5ET1dTXxAFEgoKBkxJTlVYXxAGEg0KCVdFQl9TT0NLXx'
    'AHEgkKBV9WQk9YEAgSCgoGT1RIRVJfEGM=');

@$core.Deprecated('Use turnAccountDescriptor instead')
const TurnAccount$json = {
  '1': 'TurnAccount',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'host', '3': 3, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 4, '4': 1, '5': 13, '10': 'port'},
  ],
};

/// Descriptor for `TurnAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List turnAccountDescriptor = $convert.base64Decode(
    'CgtUdXJuQWNjb3VudBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAi'
    'ABKAlSCHBhc3N3b3JkEhIKBGhvc3QYAyABKAlSBGhvc3QSEgoEcG9ydBgEIAEoDVIEcG9ydA==');

@$core.Deprecated('Use cameraEmapInfoDescriptor instead')
const CameraEmapInfo$json = {
  '1': 'CameraEmapInfo',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'type_icon', '3': 2, '4': 1, '5': 13, '10': 'typeIcon'},
    {'1': 'x_coordinate', '3': 3, '4': 1, '5': 5, '10': 'xCoordinate'},
    {'1': 'y_coordinate', '3': 4, '4': 1, '5': 5, '10': 'yCoordinate'},
    {'1': 'camera_emap_info_id', '3': 5, '4': 1, '5': 12, '10': 'cameraEmapInfoId'},
  ],
};

/// Descriptor for `CameraEmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraEmapInfoDescriptor = $convert.base64Decode(
    'Cg5DYW1lcmFFbWFwSW5mbxIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEhsKCXR5cGVfaW'
    'NvbhgCIAEoDVIIdHlwZUljb24SIQoMeF9jb29yZGluYXRlGAMgASgFUgt4Q29vcmRpbmF0ZRIh'
    'Cgx5X2Nvb3JkaW5hdGUYBCABKAVSC3lDb29yZGluYXRlEi0KE2NhbWVyYV9lbWFwX2luZm9faW'
    'QYBSABKAxSEGNhbWVyYUVtYXBJbmZvSWQ=');

@$core.Deprecated('Use emapInfoDescriptor instead')
const EmapInfo$json = {
  '1': 'EmapInfo',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
    {'1': 'emap_name', '3': 2, '4': 1, '5': 9, '10': 'emapName'},
    {'1': 'background_path', '3': 3, '4': 1, '5': 9, '10': 'backgroundPath'},
  ],
};

/// Descriptor for `EmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emapInfoDescriptor = $convert.base64Decode(
    'CghFbWFwSW5mbxIXCgdlbWFwX2lkGAEgASgMUgZlbWFwSWQSGwoJZW1hcF9uYW1lGAIgASgJUg'
    'hlbWFwTmFtZRInCg9iYWNrZ3JvdW5kX3BhdGgYAyABKAlSDmJhY2tncm91bmRQYXRo');

@$core.Deprecated('Use profileDescriptor instead')
const Profile$json = {
  '1': 'Profile',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'is_send_email_event', '3': 3, '4': 1, '5': 8, '10': 'isSendEmailEvent'},
    {'1': 'email_receive', '3': 4, '4': 3, '5': 9, '10': 'emailReceive'},
    {'1': 'display_name', '3': 5, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'camera_record_on', '3': 6, '4': 1, '5': 8, '10': 'cameraRecordOn'},
    {'1': 'camera_sd_card_fully_override', '3': 7, '4': 1, '5': 8, '10': 'cameraSdCardFullyOverride'},
    {'1': 'cloud_record_on', '3': 8, '4': 1, '5': 8, '10': 'cloudRecordOn'},
    {'1': 'number_day_storage', '3': 9, '4': 1, '5': 13, '10': 'numberDayStorage'},
    {'1': 'tel', '3': 10, '4': 1, '5': 9, '10': 'tel'},
    {'1': 'email', '3': 11, '4': 1, '5': 9, '10': 'email'},
    {'1': 'changePassDenied', '3': 12, '4': 1, '5': 8, '10': 'changePassDenied'},
    {'1': 'addCamDenied', '3': 13, '4': 1, '5': 8, '10': 'addCamDenied'},
    {'1': 'sme_name', '3': 14, '4': 1, '5': 9, '10': 'smeName'},
    {'1': 'msg_unread_count', '3': 15, '4': 1, '5': 13, '10': 'msgUnreadCount'},
    {'1': 'on_off_barrier', '3': 16, '4': 1, '5': 8, '10': 'onOffBarrier'},
    {'1': 'start_time', '3': 17, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 18, '4': 1, '5': 9, '10': 'endTime'},
    {'1': 'user_type', '3': 19, '4': 1, '5': 14, '6': '.comm.Profile.Type', '10': 'userType'},
  ],
  '4': [Profile_Type$json],
};

@$core.Deprecated('Use profileDescriptor instead')
const Profile_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'USER', '2': 0},
    {'1': 'ADMIN', '2': 1},
    {'1': 'SUPER_ADMIN', '2': 2},
    {'1': 'SYS_ADMIN', '2': 3},
    {'1': 'AGENT', '2': 4},
    {'1': 'ADMIN_CLIENT', '2': 5},
  ],
};

/// Descriptor for `Profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileDescriptor = $convert.base64Decode(
    'CgdQcm9maWxlEhgKB2FjY291bnQYASABKAlSB2FjY291bnQSGAoHYWRkcmVzcxgCIAEoCVIHYW'
    'RkcmVzcxItChNpc19zZW5kX2VtYWlsX2V2ZW50GAMgASgIUhBpc1NlbmRFbWFpbEV2ZW50EiMK'
    'DWVtYWlsX3JlY2VpdmUYBCADKAlSDGVtYWlsUmVjZWl2ZRIhCgxkaXNwbGF5X25hbWUYBSABKA'
    'lSC2Rpc3BsYXlOYW1lEigKEGNhbWVyYV9yZWNvcmRfb24YBiABKAhSDmNhbWVyYVJlY29yZE9u'
    'EkAKHWNhbWVyYV9zZF9jYXJkX2Z1bGx5X292ZXJyaWRlGAcgASgIUhljYW1lcmFTZENhcmRGdW'
    'xseU92ZXJyaWRlEiYKD2Nsb3VkX3JlY29yZF9vbhgIIAEoCFINY2xvdWRSZWNvcmRPbhIsChJu'
    'dW1iZXJfZGF5X3N0b3JhZ2UYCSABKA1SEG51bWJlckRheVN0b3JhZ2USEAoDdGVsGAogASgJUg'
    'N0ZWwSFAoFZW1haWwYCyABKAlSBWVtYWlsEioKEGNoYW5nZVBhc3NEZW5pZWQYDCABKAhSEGNo'
    'YW5nZVBhc3NEZW5pZWQSIgoMYWRkQ2FtRGVuaWVkGA0gASgIUgxhZGRDYW1EZW5pZWQSGQoIc2'
    '1lX25hbWUYDiABKAlSB3NtZU5hbWUSKAoQbXNnX3VucmVhZF9jb3VudBgPIAEoDVIObXNnVW5y'
    'ZWFkQ291bnQSJAoOb25fb2ZmX2JhcnJpZXIYECABKAhSDG9uT2ZmQmFycmllchIdCgpzdGFydF'
    '90aW1lGBEgASgJUglzdGFydFRpbWUSGQoIZW5kX3RpbWUYEiABKAlSB2VuZFRpbWUSLwoJdXNl'
    'cl90eXBlGBMgASgOMhIuY29tbS5Qcm9maWxlLlR5cGVSCHVzZXJUeXBlIlgKBFR5cGUSCAoEVV'
    'NFUhAAEgkKBUFETUlOEAESDwoLU1VQRVJfQURNSU4QAhINCglTWVNfQURNSU4QAxIJCgVBR0VO'
    'VBAEEhAKDEFETUlOX0NMSUVOVBAF');

@$core.Deprecated('Use boxInfoDescriptor instead')
const BoxInfo$json = {
  '1': 'BoxInfo',
  '2': [
    {'1': 'box_name', '3': 1, '4': 1, '5': 9, '10': 'boxName'},
    {'1': 'box_serial_number', '3': 2, '4': 1, '5': 9, '10': 'boxSerialNumber'},
    {'1': 'box_type', '3': 3, '4': 1, '5': 14, '6': '.comm.BoxInfo.Box_Type', '10': 'boxType'},
    {'1': 'owner_user_id', '3': 4, '4': 1, '5': 12, '10': 'ownerUserId'},
    {'1': 'box_State', '3': 5, '4': 1, '5': 14, '6': '.comm.Box_State', '10': 'boxState'},
  ],
  '4': [BoxInfo_Box_Type$json],
};

@$core.Deprecated('Use boxInfoDescriptor instead')
const BoxInfo_Box_Type$json = {
  '1': 'Box_Type',
  '2': [
    {'1': 'BOX_UNDEFINED', '2': 0},
    {'1': 'RASPBERRY', '2': 1},
    {'1': 'ORANGEPI', '2': 2},
  ],
};

/// Descriptor for `BoxInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boxInfoDescriptor = $convert.base64Decode(
    'CgdCb3hJbmZvEhkKCGJveF9uYW1lGAEgASgJUgdib3hOYW1lEioKEWJveF9zZXJpYWxfbnVtYm'
    'VyGAIgASgJUg9ib3hTZXJpYWxOdW1iZXISMQoIYm94X3R5cGUYAyABKA4yFi5jb21tLkJveElu'
    'Zm8uQm94X1R5cGVSB2JveFR5cGUSIgoNb3duZXJfdXNlcl9pZBgEIAEoDFILb3duZXJVc2VySW'
    'QSLAoJYm94X1N0YXRlGAUgASgOMg8uY29tbS5Cb3hfU3RhdGVSCGJveFN0YXRlIjoKCEJveF9U'
    'eXBlEhEKDUJPWF9VTkRFRklORUQQABINCglSQVNQQkVSUlkQARIMCghPUkFOR0VQSRAC');

@$core.Deprecated('Use scheduleTimeDescriptor instead')
const ScheduleTime$json = {
  '1': 'ScheduleTime',
  '2': [
    {'1': 'start_time', '3': 1, '4': 1, '5': 13, '10': 'startTime'},
    {'1': 'end_time', '3': 2, '4': 1, '5': 13, '10': 'endTime'},
    {'1': 'day_record', '3': 3, '4': 1, '5': 14, '6': '.comm.ScheduleTime.Day', '10': 'dayRecord'},
    {'1': 'schedule_Time_Enable', '3': 4, '4': 1, '5': 8, '10': 'scheduleTimeEnable'},
  ],
  '4': [ScheduleTime_Day$json],
};

@$core.Deprecated('Use scheduleTimeDescriptor instead')
const ScheduleTime_Day$json = {
  '1': 'Day',
  '2': [
    {'1': 'CN', '2': 0},
    {'1': 'T2', '2': 1},
    {'1': 'T3', '2': 2},
    {'1': 'T4', '2': 3},
    {'1': 'T5', '2': 4},
    {'1': 'T6', '2': 5},
    {'1': 'T7', '2': 6},
  ],
};

/// Descriptor for `ScheduleTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleTimeDescriptor = $convert.base64Decode(
    'CgxTY2hlZHVsZVRpbWUSHQoKc3RhcnRfdGltZRgBIAEoDVIJc3RhcnRUaW1lEhkKCGVuZF90aW'
    '1lGAIgASgNUgdlbmRUaW1lEjUKCmRheV9yZWNvcmQYAyABKA4yFi5jb21tLlNjaGVkdWxlVGlt'
    'ZS5EYXlSCWRheVJlY29yZBIwChRzY2hlZHVsZV9UaW1lX0VuYWJsZRgEIAEoCFISc2NoZWR1bG'
    'VUaW1lRW5hYmxlIj0KA0RheRIGCgJDThAAEgYKAlQyEAESBgoCVDMQAhIGCgJUNBADEgYKAlQ1'
    'EAQSBgoCVDYQBRIGCgJUNxAG');

@$core.Deprecated('Use recordingDescriptor instead')
const Recording$json = {
  '1': 'Recording',
  '2': [
    {'1': 'turn_on_recording', '3': 1, '4': 1, '5': 8, '10': 'turnOnRecording'},
    {'1': 'type_schedule_recording', '3': 2, '4': 1, '5': 14, '6': '.comm.Recording.TypeSchedule', '10': 'typeScheduleRecording'},
    {'1': 'schedules', '3': 3, '4': 3, '5': 11, '6': '.comm.ScheduleTime', '10': 'schedules'},
    {'1': 'recordingForm', '3': 4, '4': 1, '5': 14, '6': '.comm.Recording.RecordingForm', '10': 'recordingForm'},
    {'1': 'prefix_path', '3': 5, '4': 1, '5': 9, '10': 'prefixPath'},
    {'1': 'rtsp_server_local', '3': 6, '4': 1, '5': 9, '10': 'rtspServerLocal'},
    {'1': 'rtsp_server_public', '3': 7, '4': 1, '5': 9, '10': 'rtspServerPublic'},
    {'1': 'rtsp_push_user', '3': 8, '4': 1, '5': 9, '10': 'rtspPushUser'},
    {'1': 'rtsp_puss_pass', '3': 9, '4': 1, '5': 9, '10': 'rtspPussPass'},
    {'1': 'upload_url_path', '3': 10, '4': 1, '5': 9, '10': 'uploadUrlPath'},
  ],
  '4': [Recording_TypeSchedule$json, Recording_RecordingForm$json],
};

@$core.Deprecated('Use recordingDescriptor instead')
const Recording_TypeSchedule$json = {
  '1': 'TypeSchedule',
  '2': [
    {'1': 'ALWAY_RECORDING', '2': 0},
    {'1': 'CUSTOMIZE_RECORDING', '2': 2},
  ],
};

@$core.Deprecated('Use recordingDescriptor instead')
const Recording_RecordingForm$json = {
  '1': 'RecordingForm',
  '2': [
    {'1': 'CLOUD', '2': 0},
    {'1': 'SD_CARD', '2': 1},
    {'1': 'ALL', '2': 2},
  ],
};

/// Descriptor for `Recording`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingDescriptor = $convert.base64Decode(
    'CglSZWNvcmRpbmcSKgoRdHVybl9vbl9yZWNvcmRpbmcYASABKAhSD3R1cm5PblJlY29yZGluZx'
    'JUChd0eXBlX3NjaGVkdWxlX3JlY29yZGluZxgCIAEoDjIcLmNvbW0uUmVjb3JkaW5nLlR5cGVT'
    'Y2hlZHVsZVIVdHlwZVNjaGVkdWxlUmVjb3JkaW5nEjAKCXNjaGVkdWxlcxgDIAMoCzISLmNvbW'
    '0uU2NoZWR1bGVUaW1lUglzY2hlZHVsZXMSQwoNcmVjb3JkaW5nRm9ybRgEIAEoDjIdLmNvbW0u'
    'UmVjb3JkaW5nLlJlY29yZGluZ0Zvcm1SDXJlY29yZGluZ0Zvcm0SHwoLcHJlZml4X3BhdGgYBS'
    'ABKAlSCnByZWZpeFBhdGgSKgoRcnRzcF9zZXJ2ZXJfbG9jYWwYBiABKAlSD3J0c3BTZXJ2ZXJM'
    'b2NhbBIsChJydHNwX3NlcnZlcl9wdWJsaWMYByABKAlSEHJ0c3BTZXJ2ZXJQdWJsaWMSJAoOcn'
    'RzcF9wdXNoX3VzZXIYCCABKAlSDHJ0c3BQdXNoVXNlchIkCg5ydHNwX3B1c3NfcGFzcxgJIAEo'
    'CVIMcnRzcFB1c3NQYXNzEiYKD3VwbG9hZF91cmxfcGF0aBgKIAEoCVINdXBsb2FkVXJsUGF0aC'
    'I8CgxUeXBlU2NoZWR1bGUSEwoPQUxXQVlfUkVDT1JESU5HEAASFwoTQ1VTVE9NSVpFX1JFQ09S'
    'RElORxACIjAKDVJlY29yZGluZ0Zvcm0SCQoFQ0xPVUQQABILCgdTRF9DQVJEEAESBwoDQUxMEA'
    'I=');

@$core.Deprecated('Use roiDescriptor instead')
const Roi$json = {
  '1': 'Roi',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 13, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 13, '10': 'y'},
  ],
};

/// Descriptor for `Roi`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roiDescriptor = $convert.base64Decode(
    'CgNSb2kSDAoBeBgBIAEoDVIBeBIMCgF5GAIgASgNUgF5');

@$core.Deprecated('Use camNetworkDescriptor instead')
const CamNetwork$json = {
  '1': 'CamNetwork',
  '2': [
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.comm.NetworkType', '10': 'type'},
    {'1': 'ip_address', '3': 3, '4': 1, '5': 9, '10': 'ipAddress'},
    {'1': 'subness', '3': 4, '4': 1, '5': 9, '10': 'subness'},
    {'1': 'gateway', '3': 5, '4': 1, '5': 9, '10': 'gateway'},
    {'1': 'DNS', '3': 6, '4': 1, '5': 9, '10': 'DNS'},
  ],
};

/// Descriptor for `CamNetwork`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List camNetworkDescriptor = $convert.base64Decode(
    'CgpDYW1OZXR3b3JrEiUKBHR5cGUYAiABKA4yES5jb21tLk5ldHdvcmtUeXBlUgR0eXBlEh0KCm'
    'lwX2FkZHJlc3MYAyABKAlSCWlwQWRkcmVzcxIYCgdzdWJuZXNzGAQgASgJUgdzdWJuZXNzEhgK'
    'B2dhdGV3YXkYBSABKAlSB2dhdGV3YXkSEAoDRE5TGAYgASgJUgNETlM=');

@$core.Deprecated('Use kC01_LineCrossingDescriptor instead')
const KC01_LineCrossing$json = {
  '1': 'KC01_LineCrossing',
  '2': [
    {'1': 'line_crossing_enable', '3': 1, '4': 1, '5': 8, '10': 'lineCrossingEnable'},
    {'1': 'direction', '3': 2, '4': 1, '5': 13, '10': 'direction'},
    {'1': 'width', '3': 3, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 13, '10': 'height'},
    {'1': 'startX', '3': 5, '4': 1, '5': 2, '10': 'startX'},
    {'1': 'startY', '3': 6, '4': 1, '5': 2, '10': 'startY'},
    {'1': 'endX', '3': 7, '4': 1, '5': 2, '10': 'endX'},
    {'1': 'endY', '3': 8, '4': 1, '5': 2, '10': 'endY'},
    {'1': 'isSendEmail', '3': 9, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'is_record', '3': 10, '4': 1, '5': 8, '10': 'isRecord'},
  ],
};

/// Descriptor for `KC01_LineCrossing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kC01_LineCrossingDescriptor = $convert.base64Decode(
    'ChFLQzAxX0xpbmVDcm9zc2luZxIwChRsaW5lX2Nyb3NzaW5nX2VuYWJsZRgBIAEoCFISbGluZU'
    'Nyb3NzaW5nRW5hYmxlEhwKCWRpcmVjdGlvbhgCIAEoDVIJZGlyZWN0aW9uEhQKBXdpZHRoGAMg'
    'ASgNUgV3aWR0aBIWCgZoZWlnaHQYBCABKA1SBmhlaWdodBIWCgZzdGFydFgYBSABKAJSBnN0YX'
    'J0WBIWCgZzdGFydFkYBiABKAJSBnN0YXJ0WRISCgRlbmRYGAcgASgCUgRlbmRYEhIKBGVuZFkY'
    'CCABKAJSBGVuZFkSIAoLaXNTZW5kRW1haWwYCSABKAhSC2lzU2VuZEVtYWlsEhsKCWlzX3JlY2'
    '9yZBgKIAEoCFIIaXNSZWNvcmQ=');

@$core.Deprecated('Use kC01_IntrusionDetectionDescriptor instead')
const KC01_IntrusionDetection$json = {
  '1': 'KC01_IntrusionDetection',
  '2': [
    {'1': 'intrusion_detection_enable', '3': 1, '4': 1, '5': 8, '10': 'intrusionDetectionEnable'},
    {'1': 'width', '3': 2, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 13, '10': 'height'},
    {'1': 'p_x1', '3': 4, '4': 1, '5': 2, '10': 'pX1'},
    {'1': 'p_y1', '3': 5, '4': 1, '5': 2, '10': 'pY1'},
    {'1': 'p_x2', '3': 6, '4': 1, '5': 2, '10': 'pX2'},
    {'1': 'p_y2', '3': 7, '4': 1, '5': 2, '10': 'pY2'},
    {'1': 'p_x3', '3': 8, '4': 1, '5': 2, '10': 'pX3'},
    {'1': 'p_y3', '3': 9, '4': 1, '5': 2, '10': 'pY3'},
    {'1': 'p_x4', '3': 10, '4': 1, '5': 2, '10': 'pX4'},
    {'1': 'p_y4', '3': 11, '4': 1, '5': 2, '10': 'pY4'},
    {'1': 'isSendEmail', '3': 12, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'is_record', '3': 13, '4': 1, '5': 8, '10': 'isRecord'},
  ],
};

/// Descriptor for `KC01_IntrusionDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kC01_IntrusionDetectionDescriptor = $convert.base64Decode(
    'ChdLQzAxX0ludHJ1c2lvbkRldGVjdGlvbhI8ChppbnRydXNpb25fZGV0ZWN0aW9uX2VuYWJsZR'
    'gBIAEoCFIYaW50cnVzaW9uRGV0ZWN0aW9uRW5hYmxlEhQKBXdpZHRoGAIgASgNUgV3aWR0aBIW'
    'CgZoZWlnaHQYAyABKA1SBmhlaWdodBIRCgRwX3gxGAQgASgCUgNwWDESEQoEcF95MRgFIAEoAl'
    'IDcFkxEhEKBHBfeDIYBiABKAJSA3BYMhIRCgRwX3kyGAcgASgCUgNwWTISEQoEcF94MxgIIAEo'
    'AlIDcFgzEhEKBHBfeTMYCSABKAJSA3BZMxIRCgRwX3g0GAogASgCUgNwWDQSEQoEcF95NBgLIA'
    'EoAlIDcFk0EiAKC2lzU2VuZEVtYWlsGAwgASgIUgtpc1NlbmRFbWFpbBIbCglpc19yZWNvcmQY'
    'DSABKAhSCGlzUmVjb3Jk');

@$core.Deprecated('Use kC01_TimeSettingDescriptor instead')
const KC01_TimeSetting$json = {
  '1': 'KC01_TimeSetting',
  '2': [
    {'1': 'is24H', '3': 1, '4': 1, '5': 8, '10': 'is24H'},
    {'1': 'isAutoUpdateTime', '3': 2, '4': 1, '5': 8, '10': 'isAutoUpdateTime'},
    {'1': 'camera_time_zone', '3': 3, '4': 1, '5': 13, '10': 'cameraTimeZone'},
    {'1': 'isEnablerNTP', '3': 4, '4': 1, '5': 8, '10': 'isEnablerNTP'},
    {'1': 'ntp_server', '3': 5, '4': 1, '5': 9, '10': 'ntpServer'},
  ],
};

/// Descriptor for `KC01_TimeSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kC01_TimeSettingDescriptor = $convert.base64Decode(
    'ChBLQzAxX1RpbWVTZXR0aW5nEhQKBWlzMjRIGAEgASgIUgVpczI0SBIqChBpc0F1dG9VcGRhdG'
    'VUaW1lGAIgASgIUhBpc0F1dG9VcGRhdGVUaW1lEigKEGNhbWVyYV90aW1lX3pvbmUYAyABKA1S'
    'DmNhbWVyYVRpbWVab25lEiIKDGlzRW5hYmxlck5UUBgEIAEoCFIMaXNFbmFibGVyTlRQEh0KCm'
    '50cF9zZXJ2ZXIYBSABKAlSCW50cFNlcnZlcg==');

@$core.Deprecated('Use privacyMaskDescriptor instead')
const PrivacyMask$json = {
  '1': 'PrivacyMask',
  '2': [
    {'1': 'privacyMaskEnable', '3': 1, '4': 1, '5': 8, '10': 'privacyMaskEnable'},
    {'1': 'StartPointX', '3': 2, '4': 1, '5': 2, '10': 'StartPointX'},
    {'1': 'EndPointX', '3': 3, '4': 1, '5': 2, '10': 'EndPointX'},
    {'1': 'StartPointY', '3': 4, '4': 1, '5': 2, '10': 'StartPointY'},
    {'1': 'EndPointY', '3': 5, '4': 1, '5': 2, '10': 'EndPointY'},
  ],
};

/// Descriptor for `PrivacyMask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privacyMaskDescriptor = $convert.base64Decode(
    'CgtQcml2YWN5TWFzaxIsChFwcml2YWN5TWFza0VuYWJsZRgBIAEoCFIRcHJpdmFjeU1hc2tFbm'
    'FibGUSIAoLU3RhcnRQb2ludFgYAiABKAJSC1N0YXJ0UG9pbnRYEhwKCUVuZFBvaW50WBgDIAEo'
    'AlIJRW5kUG9pbnRYEiAKC1N0YXJ0UG9pbnRZGAQgASgCUgtTdGFydFBvaW50WRIcCglFbmRQb2'
    'ludFkYBSABKAJSCUVuZFBvaW50WQ==');

@$core.Deprecated('Use activityRegionDescriptor instead')
const ActivityRegion$json = {
  '1': 'ActivityRegion',
  '2': [
    {'1': 'activityRegionEnable', '3': 1, '4': 1, '5': 8, '10': 'activityRegionEnable'},
    {'1': 'activity_region_width_major', '3': 2, '4': 1, '5': 2, '10': 'activityRegionWidthMajor'},
    {'1': 'activity_region_width_minor', '3': 3, '4': 1, '5': 2, '10': 'activityRegionWidthMinor'},
    {'1': 'activity_region_height_major', '3': 4, '4': 1, '5': 2, '10': 'activityRegionHeightMajor'},
    {'1': 'activity_region_height_minor', '3': 5, '4': 1, '5': 2, '10': 'activityRegionHeightMinor'},
  ],
};

/// Descriptor for `ActivityRegion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityRegionDescriptor = $convert.base64Decode(
    'Cg5BY3Rpdml0eVJlZ2lvbhIyChRhY3Rpdml0eVJlZ2lvbkVuYWJsZRgBIAEoCFIUYWN0aXZpdH'
    'lSZWdpb25FbmFibGUSPQobYWN0aXZpdHlfcmVnaW9uX3dpZHRoX21ham9yGAIgASgCUhhhY3Rp'
    'dml0eVJlZ2lvbldpZHRoTWFqb3ISPQobYWN0aXZpdHlfcmVnaW9uX3dpZHRoX21pbm9yGAMgAS'
    'gCUhhhY3Rpdml0eVJlZ2lvbldpZHRoTWlub3ISPwocYWN0aXZpdHlfcmVnaW9uX2hlaWdodF9t'
    'YWpvchgEIAEoAlIZYWN0aXZpdHlSZWdpb25IZWlnaHRNYWpvchI/ChxhY3Rpdml0eV9yZWdpb2'
    '5faGVpZ2h0X21pbm9yGAUgASgCUhlhY3Rpdml0eVJlZ2lvbkhlaWdodE1pbm9y');

@$core.Deprecated('Use iVAJobRegionMotionDetectDescriptor instead')
const IVAJobRegionMotionDetect$json = {
  '1': 'IVAJobRegionMotionDetect',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'isRuning', '3': 3, '4': 1, '5': 8, '10': 'isRuning'},
    {'1': 'level', '3': 4, '4': 1, '5': 14, '6': '.comm.IVAJobRegionMotionDetect.Level', '10': 'level'},
    {'1': 'is_region_detect_enable', '3': 5, '4': 1, '5': 8, '10': 'isRegionDetectEnable'},
    {'1': 'rois', '3': 6, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'stream', '3': 7, '4': 1, '5': 11, '6': '.comm.CameraStream', '10': 'stream'},
    {'1': 'isSendEmail', '3': 8, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'isPushNotification', '3': 9, '4': 1, '5': 8, '10': 'isPushNotification'},
    {'1': 'is_record_event', '3': 10, '4': 1, '5': 8, '10': 'isRecordEvent'},
    {'1': 'isActivePackage', '3': 11, '4': 1, '5': 8, '10': 'isActivePackage'},
    {'1': 'msg', '3': 12, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'soundAlarm', '3': 13, '4': 1, '5': 8, '10': 'soundAlarm'},
  ],
  '4': [IVAJobRegionMotionDetect_Level$json],
};

@$core.Deprecated('Use iVAJobRegionMotionDetectDescriptor instead')
const IVAJobRegionMotionDetect_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

/// Descriptor for `IVAJobRegionMotionDetect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVAJobRegionMotionDetectDescriptor = $convert.base64Decode(
    'ChhJVkFKb2JSZWdpb25Nb3Rpb25EZXRlY3QSFQoGam9iX2lkGAEgASgJUgVqb2JJZBIaCghpc1'
    'J1bmluZxgDIAEoCFIIaXNSdW5pbmcSOgoFbGV2ZWwYBCABKA4yJC5jb21tLklWQUpvYlJlZ2lv'
    'bk1vdGlvbkRldGVjdC5MZXZlbFIFbGV2ZWwSNQoXaXNfcmVnaW9uX2RldGVjdF9lbmFibGUYBS'
    'ABKAhSFGlzUmVnaW9uRGV0ZWN0RW5hYmxlEh0KBHJvaXMYBiADKAsyCS5jb21tLlJvaVIEcm9p'
    'cxIqCgZzdHJlYW0YByABKAsyEi5jb21tLkNhbWVyYVN0cmVhbVIGc3RyZWFtEiAKC2lzU2VuZE'
    'VtYWlsGAggASgIUgtpc1NlbmRFbWFpbBIuChJpc1B1c2hOb3RpZmljYXRpb24YCSABKAhSEmlz'
    'UHVzaE5vdGlmaWNhdGlvbhImCg9pc19yZWNvcmRfZXZlbnQYCiABKAhSDWlzUmVjb3JkRXZlbn'
    'QSKAoPaXNBY3RpdmVQYWNrYWdlGAsgASgIUg9pc0FjdGl2ZVBhY2thZ2USEAoDbXNnGAwgASgJ'
    'UgNtc2cSHgoKc291bmRBbGFybRgNIAEoCFIKc291bmRBbGFybSImCgVMZXZlbBIHCgNMT1cQAB'
    'IKCgZNRURJVU0QARIICgRISUdIEAI=');

@$core.Deprecated('Use iVA_JobLineCrossing_DetectDescriptor instead')
const IVA_JobLineCrossing_Detect$json = {
  '1': 'IVA_JobLineCrossing_Detect',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'isRuning', '3': 2, '4': 1, '5': 8, '10': 'isRuning'},
    {'1': 'isSendEmail', '3': 3, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'isPushNotification', '3': 4, '4': 1, '5': 8, '10': 'isPushNotification'},
    {'1': 'is_record_event', '3': 5, '4': 1, '5': 8, '10': 'isRecordEvent'},
    {'1': 'level', '3': 6, '4': 1, '5': 14, '6': '.comm.IVA_JobLineCrossing_Detect.Level', '10': 'level'},
    {'1': 'direction', '3': 7, '4': 1, '5': 14, '6': '.comm.IVA_JobLineCrossing_Detect.DirectionType', '10': 'direction'},
    {'1': 'stream', '3': 8, '4': 1, '5': 11, '6': '.comm.CameraStream', '10': 'stream'},
    {'1': 'roi_start', '3': 9, '4': 1, '5': 11, '6': '.comm.Roi', '10': 'roiStart'},
    {'1': 'roi_end', '3': 10, '4': 1, '5': 11, '6': '.comm.Roi', '10': 'roiEnd'},
    {'1': 'isActivePackage', '3': 11, '4': 1, '5': 8, '10': 'isActivePackage'},
    {'1': 'msg', '3': 12, '4': 1, '5': 9, '10': 'msg'},
  ],
  '4': [IVA_JobLineCrossing_Detect_DirectionType$json, IVA_JobLineCrossing_Detect_Level$json],
};

@$core.Deprecated('Use iVA_JobLineCrossing_DetectDescriptor instead')
const IVA_JobLineCrossing_Detect_DirectionType$json = {
  '1': 'DirectionType',
  '2': [
    {'1': 'A__B', '2': 0},
    {'1': 'B__A', '2': 1},
    {'1': 'AB', '2': 2},
  ],
};

@$core.Deprecated('Use iVA_JobLineCrossing_DetectDescriptor instead')
const IVA_JobLineCrossing_Detect_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

/// Descriptor for `IVA_JobLineCrossing_Detect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVA_JobLineCrossing_DetectDescriptor = $convert.base64Decode(
    'ChpJVkFfSm9iTGluZUNyb3NzaW5nX0RldGVjdBIVCgZqb2JfaWQYASABKAlSBWpvYklkEhoKCG'
    'lzUnVuaW5nGAIgASgIUghpc1J1bmluZxIgCgtpc1NlbmRFbWFpbBgDIAEoCFILaXNTZW5kRW1h'
    'aWwSLgoSaXNQdXNoTm90aWZpY2F0aW9uGAQgASgIUhJpc1B1c2hOb3RpZmljYXRpb24SJgoPaX'
    'NfcmVjb3JkX2V2ZW50GAUgASgIUg1pc1JlY29yZEV2ZW50EjwKBWxldmVsGAYgASgOMiYuY29t'
    'bS5JVkFfSm9iTGluZUNyb3NzaW5nX0RldGVjdC5MZXZlbFIFbGV2ZWwSTAoJZGlyZWN0aW9uGA'
    'cgASgOMi4uY29tbS5JVkFfSm9iTGluZUNyb3NzaW5nX0RldGVjdC5EaXJlY3Rpb25UeXBlUglk'
    'aXJlY3Rpb24SKgoGc3RyZWFtGAggASgLMhIuY29tbS5DYW1lcmFTdHJlYW1SBnN0cmVhbRImCg'
    'lyb2lfc3RhcnQYCSABKAsyCS5jb21tLlJvaVIIcm9pU3RhcnQSIgoHcm9pX2VuZBgKIAEoCzIJ'
    'LmNvbW0uUm9pUgZyb2lFbmQSKAoPaXNBY3RpdmVQYWNrYWdlGAsgASgIUg9pc0FjdGl2ZVBhY2'
    'thZ2USEAoDbXNnGAwgASgJUgNtc2ciKwoNRGlyZWN0aW9uVHlwZRIICgRBX19CEAASCAoEQl9f'
    'QRABEgYKAkFCEAIiJgoFTGV2ZWwSBwoDTE9XEAASCgoGTUVESVVNEAESCAoESElHSBAC');

@$core.Deprecated('Use iVA_IntrusionDetection_DetectDescriptor instead')
const IVA_IntrusionDetection_Detect$json = {
  '1': 'IVA_IntrusionDetection_Detect',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'isRuning', '3': 2, '4': 1, '5': 8, '10': 'isRuning'},
    {'1': 'isSendEmail', '3': 3, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'isPushNotification', '3': 4, '4': 1, '5': 8, '10': 'isPushNotification'},
    {'1': 'is_record_event', '3': 5, '4': 1, '5': 8, '10': 'isRecordEvent'},
    {'1': 'level', '3': 6, '4': 1, '5': 14, '6': '.comm.IVA_IntrusionDetection_Detect.Level', '10': 'level'},
    {'1': 'rois', '3': 7, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'stream', '3': 8, '4': 1, '5': 11, '6': '.comm.CameraStream', '10': 'stream'},
    {'1': 'isActivePackage', '3': 9, '4': 1, '5': 8, '10': 'isActivePackage'},
    {'1': 'msg', '3': 10, '4': 1, '5': 9, '10': 'msg'},
  ],
  '4': [IVA_IntrusionDetection_Detect_Level$json],
};

@$core.Deprecated('Use iVA_IntrusionDetection_DetectDescriptor instead')
const IVA_IntrusionDetection_Detect_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

/// Descriptor for `IVA_IntrusionDetection_Detect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVA_IntrusionDetection_DetectDescriptor = $convert.base64Decode(
    'Ch1JVkFfSW50cnVzaW9uRGV0ZWN0aW9uX0RldGVjdBIVCgZqb2JfaWQYASABKAlSBWpvYklkEh'
    'oKCGlzUnVuaW5nGAIgASgIUghpc1J1bmluZxIgCgtpc1NlbmRFbWFpbBgDIAEoCFILaXNTZW5k'
    'RW1haWwSLgoSaXNQdXNoTm90aWZpY2F0aW9uGAQgASgIUhJpc1B1c2hOb3RpZmljYXRpb24SJg'
    'oPaXNfcmVjb3JkX2V2ZW50GAUgASgIUg1pc1JlY29yZEV2ZW50Ej8KBWxldmVsGAYgASgOMiku'
    'Y29tbS5JVkFfSW50cnVzaW9uRGV0ZWN0aW9uX0RldGVjdC5MZXZlbFIFbGV2ZWwSHQoEcm9pcx'
    'gHIAMoCzIJLmNvbW0uUm9pUgRyb2lzEioKBnN0cmVhbRgIIAEoCzISLmNvbW0uQ2FtZXJhU3Ry'
    'ZWFtUgZzdHJlYW0SKAoPaXNBY3RpdmVQYWNrYWdlGAkgASgIUg9pc0FjdGl2ZVBhY2thZ2USEA'
    'oDbXNnGAogASgJUgNtc2ciJgoFTGV2ZWwSBwoDTE9XEAASCgoGTUVESVVNEAESCAoESElHSBAC');

@$core.Deprecated('Use iVA_Smoke_DetectDescriptor instead')
const IVA_Smoke_Detect$json = {
  '1': 'IVA_Smoke_Detect',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'isRuning', '3': 2, '4': 1, '5': 8, '10': 'isRuning'},
    {'1': 'isSendEmail', '3': 3, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'isPushNotification', '3': 4, '4': 1, '5': 8, '10': 'isPushNotification'},
    {'1': 'is_record_event', '3': 5, '4': 1, '5': 8, '10': 'isRecordEvent'},
    {'1': 'level', '3': 6, '4': 1, '5': 14, '6': '.comm.IVA_Smoke_Detect.Level', '10': 'level'},
    {'1': 'rois', '3': 7, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'stream', '3': 8, '4': 1, '5': 11, '6': '.comm.CameraStream', '10': 'stream'},
    {'1': 'isActivePackage', '3': 9, '4': 1, '5': 8, '10': 'isActivePackage'},
    {'1': 'msg', '3': 10, '4': 1, '5': 9, '10': 'msg'},
  ],
  '4': [IVA_Smoke_Detect_Level$json],
};

@$core.Deprecated('Use iVA_Smoke_DetectDescriptor instead')
const IVA_Smoke_Detect_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

/// Descriptor for `IVA_Smoke_Detect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVA_Smoke_DetectDescriptor = $convert.base64Decode(
    'ChBJVkFfU21va2VfRGV0ZWN0EhUKBmpvYl9pZBgBIAEoCVIFam9iSWQSGgoIaXNSdW5pbmcYAi'
    'ABKAhSCGlzUnVuaW5nEiAKC2lzU2VuZEVtYWlsGAMgASgIUgtpc1NlbmRFbWFpbBIuChJpc1B1'
    'c2hOb3RpZmljYXRpb24YBCABKAhSEmlzUHVzaE5vdGlmaWNhdGlvbhImCg9pc19yZWNvcmRfZX'
    'ZlbnQYBSABKAhSDWlzUmVjb3JkRXZlbnQSMgoFbGV2ZWwYBiABKA4yHC5jb21tLklWQV9TbW9r'
    'ZV9EZXRlY3QuTGV2ZWxSBWxldmVsEh0KBHJvaXMYByADKAsyCS5jb21tLlJvaVIEcm9pcxIqCg'
    'ZzdHJlYW0YCCABKAsyEi5jb21tLkNhbWVyYVN0cmVhbVIGc3RyZWFtEigKD2lzQWN0aXZlUGFj'
    'a2FnZRgJIAEoCFIPaXNBY3RpdmVQYWNrYWdlEhAKA21zZxgKIAEoCVIDbXNnIiYKBUxldmVsEg'
    'cKA0xPVxAAEgoKBk1FRElVTRABEggKBEhJR0gQAg==');

@$core.Deprecated('Use iVA_Face_DetectDescriptor instead')
const IVA_Face_Detect$json = {
  '1': 'IVA_Face_Detect',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'isRuning', '3': 2, '4': 1, '5': 8, '10': 'isRuning'},
    {'1': 'isStrangerDetectNoti', '3': 3, '4': 1, '5': 8, '10': 'isStrangerDetectNoti'},
    {'1': 'isRelativeDetectNoti', '3': 4, '4': 1, '5': 8, '10': 'isRelativeDetectNoti'},
    {'1': 'is_record_event', '3': 5, '4': 1, '5': 8, '10': 'isRecordEvent'},
    {'1': 'rois', '3': 6, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'isActivePackage', '3': 7, '4': 1, '5': 8, '10': 'isActivePackage'},
    {'1': 'msg', '3': 8, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `IVA_Face_Detect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVA_Face_DetectDescriptor = $convert.base64Decode(
    'Cg9JVkFfRmFjZV9EZXRlY3QSFQoGam9iX2lkGAEgASgJUgVqb2JJZBIaCghpc1J1bmluZxgCIA'
    'EoCFIIaXNSdW5pbmcSMgoUaXNTdHJhbmdlckRldGVjdE5vdGkYAyABKAhSFGlzU3RyYW5nZXJE'
    'ZXRlY3ROb3RpEjIKFGlzUmVsYXRpdmVEZXRlY3ROb3RpGAQgASgIUhRpc1JlbGF0aXZlRGV0ZW'
    'N0Tm90aRImCg9pc19yZWNvcmRfZXZlbnQYBSABKAhSDWlzUmVjb3JkRXZlbnQSHQoEcm9pcxgG'
    'IAMoCzIJLmNvbW0uUm9pUgRyb2lzEigKD2lzQWN0aXZlUGFja2FnZRgHIAEoCFIPaXNBY3Rpdm'
    'VQYWNrYWdlEhAKA21zZxgIIAEoCVIDbXNn');

@$core.Deprecated('Use iVAALPRDescriptor instead')
const IVAALPR$json = {
  '1': 'IVAALPR',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'isRuning', '3': 2, '4': 1, '5': 8, '10': 'isRuning'},
    {'1': 'isSendEmail', '3': 3, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'isPushNotification', '3': 4, '4': 1, '5': 8, '10': 'isPushNotification'},
    {'1': 'is_record_event', '3': 5, '4': 1, '5': 8, '10': 'isRecordEvent'},
    {'1': 'rois', '3': 6, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'stream', '3': 8, '4': 1, '5': 11, '6': '.comm.CameraStream', '10': 'stream'},
    {'1': 'isActivePackage', '3': 9, '4': 1, '5': 8, '10': 'isActivePackage'},
    {'1': 'msg', '3': 10, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'in', '3': 11, '4': 1, '5': 8, '10': 'in'},
  ],
};

/// Descriptor for `IVAALPR`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVAALPRDescriptor = $convert.base64Decode(
    'CgdJVkFBTFBSEhUKBmpvYl9pZBgBIAEoCVIFam9iSWQSGgoIaXNSdW5pbmcYAiABKAhSCGlzUn'
    'VuaW5nEiAKC2lzU2VuZEVtYWlsGAMgASgIUgtpc1NlbmRFbWFpbBIuChJpc1B1c2hOb3RpZmlj'
    'YXRpb24YBCABKAhSEmlzUHVzaE5vdGlmaWNhdGlvbhImCg9pc19yZWNvcmRfZXZlbnQYBSABKA'
    'hSDWlzUmVjb3JkRXZlbnQSHQoEcm9pcxgGIAMoCzIJLmNvbW0uUm9pUgRyb2lzEioKBnN0cmVh'
    'bRgIIAEoCzISLmNvbW0uQ2FtZXJhU3RyZWFtUgZzdHJlYW0SKAoPaXNBY3RpdmVQYWNrYWdlGA'
    'kgASgIUg9pc0FjdGl2ZVBhY2thZ2USEAoDbXNnGAogASgJUgNtc2cSDgoCaW4YCyABKAhSAmlu');

@$core.Deprecated('Use mapLocationDescriptor instead')
const MapLocation$json = {
  '1': 'MapLocation',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'log', '3': 2, '4': 1, '5': 1, '10': 'log'},
    {'1': 'location_des', '3': 3, '4': 1, '5': 9, '10': 'locationDes'},
  ],
};

/// Descriptor for `MapLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mapLocationDescriptor = $convert.base64Decode(
    'CgtNYXBMb2NhdGlvbhIQCgNsYXQYASABKAFSA2xhdBIQCgNsb2cYAiABKAFSA2xvZxIhCgxsb2'
    'NhdGlvbl9kZXMYAyABKAlSC2xvY2F0aW9uRGVz');

@$core.Deprecated('Use homeVision_Camera_ConfigDescriptor instead')
const HomeVision_Camera_Config$json = {
  '1': 'HomeVision_Camera_Config',
  '2': [
    {'1': 'device_type', '3': 1, '4': 1, '5': 13, '10': 'deviceType'},
    {'1': 'volume', '3': 2, '4': 1, '5': 13, '10': 'volume'},
    {'1': 'ip', '3': 3, '4': 1, '5': 9, '10': 'ip'},
    {'1': 'mac', '3': 4, '4': 1, '5': 9, '10': 'mac'},
    {'1': 'pictureURL', '3': 5, '4': 1, '5': 9, '10': 'pictureURL'},
    {'1': 'phpServer', '3': 6, '4': 1, '5': 9, '10': 'phpServer'},
    {'1': 'flip', '3': 7, '4': 1, '5': 8, '10': 'flip'},
    {'1': 'total_sd', '3': 8, '4': 1, '5': 13, '10': 'totalSd'},
    {'1': 'sd_use', '3': 9, '4': 1, '5': 13, '10': 'sdUse'},
    {'1': 'vendor', '3': 10, '4': 1, '5': 9, '10': 'vendor'},
    {'1': 'version', '3': 11, '4': 1, '5': 13, '10': 'version'},
    {'1': 'model', '3': 12, '4': 1, '5': 9, '10': 'model'},
    {'1': 'recordType', '3': 13, '4': 1, '5': 13, '10': 'recordType'},
  ],
};

/// Descriptor for `HomeVision_Camera_Config`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeVision_Camera_ConfigDescriptor = $convert.base64Decode(
    'ChhIb21lVmlzaW9uX0NhbWVyYV9Db25maWcSHwoLZGV2aWNlX3R5cGUYASABKA1SCmRldmljZV'
    'R5cGUSFgoGdm9sdW1lGAIgASgNUgZ2b2x1bWUSDgoCaXAYAyABKAlSAmlwEhAKA21hYxgEIAEo'
    'CVIDbWFjEh4KCnBpY3R1cmVVUkwYBSABKAlSCnBpY3R1cmVVUkwSHAoJcGhwU2VydmVyGAYgAS'
    'gJUglwaHBTZXJ2ZXISEgoEZmxpcBgHIAEoCFIEZmxpcBIZCgh0b3RhbF9zZBgIIAEoDVIHdG90'
    'YWxTZBIVCgZzZF91c2UYCSABKA1SBXNkVXNlEhYKBnZlbmRvchgKIAEoCVIGdmVuZG9yEhgKB3'
    'ZlcnNpb24YCyABKA1SB3ZlcnNpb24SFAoFbW9kZWwYDCABKAlSBW1vZGVsEh4KCnJlY29yZFR5'
    'cGUYDSABKA1SCnJlY29yZFR5cGU=');

@$core.Deprecated('Use cameraConfigDescriptor instead')
const CameraConfig$json = {
  '1': 'CameraConfig',
  '2': [
    {'1': 'nightvision', '3': 1, '4': 1, '5': 8, '10': 'nightvision'},
    {'1': 'brightness', '3': 2, '4': 1, '5': 13, '10': 'brightness'},
    {'1': 'flip', '3': 3, '4': 1, '5': 8, '10': 'flip'},
    {'1': 'mirror', '3': 4, '4': 1, '5': 8, '10': 'mirror'},
    {'1': 'rotate', '3': 5, '4': 1, '5': 14, '6': '.comm.CameraConfig.Rotate', '10': 'rotate'},
    {'1': 'current_major_version', '3': 6, '4': 1, '5': 13, '10': 'currentMajorVersion'},
    {'1': 'current_minor_version', '3': 7, '4': 1, '5': 13, '10': 'currentMinorVersion'},
    {'1': 'power_cloud_storage', '3': 8, '4': 1, '5': 8, '10': 'powerCloudStorage'},
    {'1': 'storage_mode', '3': 9, '4': 1, '5': 14, '6': '.comm.CameraConfig.StorageMode', '10': 'storageMode'},
    {'1': 'number_days_storage', '3': 10, '4': 1, '5': 13, '10': 'numberDaysStorage'},
    {'1': 'use_default_account_setting', '3': 32, '4': 1, '5': 8, '10': 'useDefaultAccountSetting'},
    {'1': 'wifi_name', '3': 11, '4': 1, '5': 9, '10': 'wifiName'},
    {'1': 'wifi_password', '3': 12, '4': 1, '5': 9, '10': 'wifiPassword'},
    {'1': 'motion_detection', '3': 13, '4': 1, '5': 8, '10': 'motionDetection'},
    {'1': 'audio_detection', '3': 14, '4': 1, '5': 8, '10': 'audioDetection'},
    {'1': 'fully_override', '3': 15, '4': 1, '5': 8, '10': 'fullyOverride'},
    {'1': 'recording', '3': 16, '4': 1, '5': 11, '6': '.comm.Recording', '10': 'recording'},
    {'1': 'is_send_email_event', '3': 17, '4': 1, '5': 8, '10': 'isSendEmailEvent'},
    {'1': 'is_record', '3': 18, '4': 1, '5': 8, '10': 'isRecord'},
    {'1': 'is_region_detect_enable', '3': 19, '4': 1, '5': 8, '10': 'isRegionDetectEnable'},
    {'1': 'rois', '3': 20, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'md_level', '3': 21, '4': 1, '5': 14, '6': '.comm.CameraConfig.Level', '10': 'mdLevel'},
    {'1': 'network', '3': 22, '4': 1, '5': 11, '6': '.comm.CamNetwork', '10': 'network'},
    {'1': 'lineCrossing', '3': 23, '4': 1, '5': 11, '6': '.comm.KC01_LineCrossing', '10': 'lineCrossing'},
    {'1': 'intrusionDetection', '3': 24, '4': 1, '5': 11, '6': '.comm.KC01_IntrusionDetection', '10': 'intrusionDetection'},
    {'1': 'timeSetting', '3': 25, '4': 1, '5': 11, '6': '.comm.KC01_TimeSetting', '10': 'timeSetting'},
    {'1': 'rtsp_current_quatity', '3': 26, '4': 1, '5': 14, '6': '.comm.Quality', '10': 'rtspCurrentQuatity'},
    {'1': 'privacyMask1', '3': 27, '4': 1, '5': 11, '6': '.comm.PrivacyMask', '10': 'privacyMask1'},
    {'1': 'privacyMask2', '3': 28, '4': 1, '5': 11, '6': '.comm.PrivacyMask', '10': 'privacyMask2'},
    {'1': 'privacyMask3', '3': 29, '4': 1, '5': 11, '6': '.comm.PrivacyMask', '10': 'privacyMask3'},
    {'1': 'KC01_MD_isSendMD', '3': 30, '4': 1, '5': 8, '10': 'KC01MDIsSendMD'},
    {'1': 'activityRegion', '3': 31, '4': 1, '5': 11, '6': '.comm.ActivityRegion', '10': 'activityRegion'},
    {'1': 'iva_md', '3': 33, '4': 1, '5': 11, '6': '.comm.IVAJobRegionMotionDetect', '10': 'ivaMd'},
    {'1': 'iva_line_crossing', '3': 34, '4': 1, '5': 11, '6': '.comm.IVA_JobLineCrossing_Detect', '10': 'ivaLineCrossing'},
    {'1': 'iva_ins_detection', '3': 35, '4': 1, '5': 11, '6': '.comm.IVA_IntrusionDetection_Detect', '10': 'ivaInsDetection'},
    {'1': 'location', '3': 36, '4': 1, '5': 11, '6': '.comm.MapLocation', '10': 'location'},
    {'1': 'iva_smoke_detection', '3': 37, '4': 1, '5': 11, '6': '.comm.IVA_Smoke_Detect', '10': 'ivaSmokeDetection'},
    {'1': 'iva_face_detection', '3': 38, '4': 1, '5': 11, '6': '.comm.IVA_Face_Detect', '10': 'ivaFaceDetection'},
    {'1': 'home_vision_camera_config', '3': 39, '4': 1, '5': 11, '6': '.comm.HomeVision_Camera_Config', '10': 'homeVisionCameraConfig'},
    {'1': 'current_micro_version', '3': 40, '4': 1, '5': 13, '10': 'currentMicroVersion'},
    {'1': 'iva_ALPR', '3': 41, '4': 1, '5': 11, '6': '.comm.IVAALPR', '10': 'ivaALPR'},
  ],
  '4': [CameraConfig_Rotate$json, CameraConfig_StorageMode$json, CameraConfig_Level$json],
};

@$core.Deprecated('Use cameraConfigDescriptor instead')
const CameraConfig_Rotate$json = {
  '1': 'Rotate',
  '2': [
    {'1': 'NORMAL', '2': 0},
    {'1': 'RIGHT', '2': 1},
    {'1': 'LEFT', '2': 2},
  ],
};

@$core.Deprecated('Use cameraConfigDescriptor instead')
const CameraConfig_StorageMode$json = {
  '1': 'StorageMode',
  '2': [
    {'1': 'CLOUD', '2': 0},
    {'1': 'CLOUD_AND_SDCARD', '2': 1},
  ],
};

@$core.Deprecated('Use cameraConfigDescriptor instead')
const CameraConfig_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

/// Descriptor for `CameraConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraConfigDescriptor = $convert.base64Decode(
    'CgxDYW1lcmFDb25maWcSIAoLbmlnaHR2aXNpb24YASABKAhSC25pZ2h0dmlzaW9uEh4KCmJyaW'
    'dodG5lc3MYAiABKA1SCmJyaWdodG5lc3MSEgoEZmxpcBgDIAEoCFIEZmxpcBIWCgZtaXJyb3IY'
    'BCABKAhSBm1pcnJvchIxCgZyb3RhdGUYBSABKA4yGS5jb21tLkNhbWVyYUNvbmZpZy5Sb3RhdG'
    'VSBnJvdGF0ZRIyChVjdXJyZW50X21ham9yX3ZlcnNpb24YBiABKA1SE2N1cnJlbnRNYWpvclZl'
    'cnNpb24SMgoVY3VycmVudF9taW5vcl92ZXJzaW9uGAcgASgNUhNjdXJyZW50TWlub3JWZXJzaW'
    '9uEi4KE3Bvd2VyX2Nsb3VkX3N0b3JhZ2UYCCABKAhSEXBvd2VyQ2xvdWRTdG9yYWdlEkEKDHN0'
    'b3JhZ2VfbW9kZRgJIAEoDjIeLmNvbW0uQ2FtZXJhQ29uZmlnLlN0b3JhZ2VNb2RlUgtzdG9yYW'
    'dlTW9kZRIuChNudW1iZXJfZGF5c19zdG9yYWdlGAogASgNUhFudW1iZXJEYXlzU3RvcmFnZRI9'
    'Cht1c2VfZGVmYXVsdF9hY2NvdW50X3NldHRpbmcYICABKAhSGHVzZURlZmF1bHRBY2NvdW50U2'
    'V0dGluZxIbCgl3aWZpX25hbWUYCyABKAlSCHdpZmlOYW1lEiMKDXdpZmlfcGFzc3dvcmQYDCAB'
    'KAlSDHdpZmlQYXNzd29yZBIpChBtb3Rpb25fZGV0ZWN0aW9uGA0gASgIUg9tb3Rpb25EZXRlY3'
    'Rpb24SJwoPYXVkaW9fZGV0ZWN0aW9uGA4gASgIUg5hdWRpb0RldGVjdGlvbhIlCg5mdWxseV9v'
    'dmVycmlkZRgPIAEoCFINZnVsbHlPdmVycmlkZRItCglyZWNvcmRpbmcYECABKAsyDy5jb21tLl'
    'JlY29yZGluZ1IJcmVjb3JkaW5nEi0KE2lzX3NlbmRfZW1haWxfZXZlbnQYESABKAhSEGlzU2Vu'
    'ZEVtYWlsRXZlbnQSGwoJaXNfcmVjb3JkGBIgASgIUghpc1JlY29yZBI1Chdpc19yZWdpb25fZG'
    'V0ZWN0X2VuYWJsZRgTIAEoCFIUaXNSZWdpb25EZXRlY3RFbmFibGUSHQoEcm9pcxgUIAMoCzIJ'
    'LmNvbW0uUm9pUgRyb2lzEjMKCG1kX2xldmVsGBUgASgOMhguY29tbS5DYW1lcmFDb25maWcuTG'
    'V2ZWxSB21kTGV2ZWwSKgoHbmV0d29yaxgWIAEoCzIQLmNvbW0uQ2FtTmV0d29ya1IHbmV0d29y'
    'axI7CgxsaW5lQ3Jvc3NpbmcYFyABKAsyFy5jb21tLktDMDFfTGluZUNyb3NzaW5nUgxsaW5lQ3'
    'Jvc3NpbmcSTQoSaW50cnVzaW9uRGV0ZWN0aW9uGBggASgLMh0uY29tbS5LQzAxX0ludHJ1c2lv'
    'bkRldGVjdGlvblISaW50cnVzaW9uRGV0ZWN0aW9uEjgKC3RpbWVTZXR0aW5nGBkgASgLMhYuY2'
    '9tbS5LQzAxX1RpbWVTZXR0aW5nUgt0aW1lU2V0dGluZxI/ChRydHNwX2N1cnJlbnRfcXVhdGl0'
    'eRgaIAEoDjINLmNvbW0uUXVhbGl0eVIScnRzcEN1cnJlbnRRdWF0aXR5EjUKDHByaXZhY3lNYX'
    'NrMRgbIAEoCzIRLmNvbW0uUHJpdmFjeU1hc2tSDHByaXZhY3lNYXNrMRI1Cgxwcml2YWN5TWFz'
    'azIYHCABKAsyES5jb21tLlByaXZhY3lNYXNrUgxwcml2YWN5TWFzazISNQoMcHJpdmFjeU1hc2'
    'szGB0gASgLMhEuY29tbS5Qcml2YWN5TWFza1IMcHJpdmFjeU1hc2szEigKEEtDMDFfTURfaXNT'
    'ZW5kTUQYHiABKAhSDktDMDFNRElzU2VuZE1EEjwKDmFjdGl2aXR5UmVnaW9uGB8gASgLMhQuY2'
    '9tbS5BY3Rpdml0eVJlZ2lvblIOYWN0aXZpdHlSZWdpb24SNQoGaXZhX21kGCEgASgLMh4uY29t'
    'bS5JVkFKb2JSZWdpb25Nb3Rpb25EZXRlY3RSBWl2YU1kEkwKEWl2YV9saW5lX2Nyb3NzaW5nGC'
    'IgASgLMiAuY29tbS5JVkFfSm9iTGluZUNyb3NzaW5nX0RldGVjdFIPaXZhTGluZUNyb3NzaW5n'
    'Ek8KEWl2YV9pbnNfZGV0ZWN0aW9uGCMgASgLMiMuY29tbS5JVkFfSW50cnVzaW9uRGV0ZWN0aW'
    '9uX0RldGVjdFIPaXZhSW5zRGV0ZWN0aW9uEi0KCGxvY2F0aW9uGCQgASgLMhEuY29tbS5NYXBM'
    'b2NhdGlvblIIbG9jYXRpb24SRgoTaXZhX3Ntb2tlX2RldGVjdGlvbhglIAEoCzIWLmNvbW0uSV'
    'ZBX1Ntb2tlX0RldGVjdFIRaXZhU21va2VEZXRlY3Rpb24SQwoSaXZhX2ZhY2VfZGV0ZWN0aW9u'
    'GCYgASgLMhUuY29tbS5JVkFfRmFjZV9EZXRlY3RSEGl2YUZhY2VEZXRlY3Rpb24SWQoZaG9tZV'
    '92aXNpb25fY2FtZXJhX2NvbmZpZxgnIAEoCzIeLmNvbW0uSG9tZVZpc2lvbl9DYW1lcmFfQ29u'
    'ZmlnUhZob21lVmlzaW9uQ2FtZXJhQ29uZmlnEjIKFWN1cnJlbnRfbWljcm9fdmVyc2lvbhgoIA'
    'EoDVITY3VycmVudE1pY3JvVmVyc2lvbhIoCghpdmFfQUxQUhgpIAEoCzINLmNvbW0uSVZBQUxQ'
    'UlIHaXZhQUxQUiIpCgZSb3RhdGUSCgoGTk9STUFMEAASCQoFUklHSFQQARIICgRMRUZUEAIiLg'
    'oLU3RvcmFnZU1vZGUSCQoFQ0xPVUQQABIUChBDTE9VRF9BTkRfU0RDQVJEEAEiJgoFTGV2ZWwS'
    'BwoDTE9XEAASCgoGTUVESVVNEAESCAoESElHSBAC');

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream$json = {
  '1': 'CameraStream',
  '2': [
    {'1': 'stream_origin_url', '3': 1, '4': 1, '5': 9, '10': 'streamOriginUrl'},
    {'1': 'stream_iva_url', '3': 2, '4': 1, '5': 9, '10': 'streamIvaUrl'},
    {'1': 'stream_name', '3': 3, '4': 1, '5': 9, '10': 'streamName'},
    {'1': 'res', '3': 4, '4': 1, '5': 11, '6': '.comm.CameraStream.Resolution', '10': 'res'},
    {'1': 'encoder', '3': 5, '4': 1, '5': 11, '6': '.comm.CameraStream.Encoder', '10': 'encoder'},
    {'1': 'ptz_range', '3': 6, '4': 1, '5': 11, '6': '.comm.CameraStream.PtzRange', '10': 'ptzRange'},
    {'1': 'user_origin_added_url', '3': 7, '4': 1, '5': 9, '10': 'userOriginAddedUrl'},
    {'1': 'stream_hls_url', '3': 8, '4': 1, '5': 9, '10': 'streamHlsUrl'},
    {'1': 'default_url', '3': 9, '4': 1, '5': 14, '6': '.comm.CameraStream.DefaultURL', '10': 'defaultUrl'},
    {'1': 'streamLinks', '3': 10, '4': 3, '5': 11, '6': '.comm.CameraStream.UrlStream', '10': 'streamLinks'},
  ],
  '3': [CameraStream_Resolution$json, CameraStream_Encoder$json, CameraStream_PtzRange$json, CameraStream_UrlStream$json],
  '4': [CameraStream_DefaultURL$json],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_Resolution$json = {
  '1': 'Resolution',
  '2': [
    {'1': 'width', '3': 1, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 2, '4': 1, '5': 13, '10': 'height'},
  ],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_Encoder$json = {
  '1': 'Encoder',
  '2': [
    {'1': 'quality', '3': 1, '4': 1, '5': 13, '10': 'quality'},
    {'1': 'framerate', '3': 2, '4': 1, '5': 13, '10': 'framerate'},
    {'1': 'bitrate', '3': 3, '4': 1, '5': 13, '10': 'bitrate'},
    {'1': 'encoding', '3': 4, '4': 1, '5': 9, '10': 'encoding'},
  ],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_PtzRange$json = {
  '1': 'PtzRange',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 11, '6': '.comm.CameraStream.PtzRange.range', '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 11, '6': '.comm.CameraStream.PtzRange.range', '10': 'y'},
    {'1': 'z', '3': 3, '4': 1, '5': 11, '6': '.comm.CameraStream.PtzRange.range', '10': 'z'},
  ],
  '3': [CameraStream_PtzRange_range$json],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_PtzRange_range$json = {
  '1': 'range',
  '2': [
    {'1': 'min', '3': 1, '4': 1, '5': 13, '10': 'min'},
    {'1': 'max', '3': 2, '4': 1, '5': 13, '10': 'max'},
  ],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_UrlStream$json = {
  '1': 'UrlStream',
  '2': [
    {'1': 'isDefault', '3': 1, '4': 1, '5': 8, '10': 'isDefault'},
    {'1': 'name_of_stream', '3': 2, '4': 1, '5': 9, '10': 'nameOfStream'},
    {'1': 'url_of_stream', '3': 3, '4': 1, '5': 9, '10': 'urlOfStream'},
    {'1': 'stype', '3': 4, '4': 1, '5': 14, '6': '.comm.CameraStream.UrlStream.StreamType', '10': 'stype'},
    {'1': 'isMainStream', '3': 5, '4': 1, '5': 8, '10': 'isMainStream'},
    {'1': 'origin_stream', '3': 6, '4': 1, '5': 9, '10': 'originStream'},
  ],
  '4': [CameraStream_UrlStream_StreamType$json],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_UrlStream_StreamType$json = {
  '1': 'StreamType',
  '2': [
    {'1': 'HLS', '2': 0},
    {'1': 'RTSP', '2': 1},
    {'1': 'UDP', '2': 2},
    {'1': 'RTSP_PROXY', '2': 3},
    {'1': 'RTMP', '2': 4},
  ],
};

@$core.Deprecated('Use cameraStreamDescriptor instead')
const CameraStream_DefaultURL$json = {
  '1': 'DefaultURL',
  '2': [
    {'1': 'HLS', '2': 0},
    {'1': 'RTSP_ORIGIN', '2': 1},
    {'1': 'RTSP_PROXY', '2': 2},
    {'1': 'RTMP', '2': 3},
  ],
};

/// Descriptor for `CameraStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraStreamDescriptor = $convert.base64Decode(
    'CgxDYW1lcmFTdHJlYW0SKgoRc3RyZWFtX29yaWdpbl91cmwYASABKAlSD3N0cmVhbU9yaWdpbl'
    'VybBIkCg5zdHJlYW1faXZhX3VybBgCIAEoCVIMc3RyZWFtSXZhVXJsEh8KC3N0cmVhbV9uYW1l'
    'GAMgASgJUgpzdHJlYW1OYW1lEi8KA3JlcxgEIAEoCzIdLmNvbW0uQ2FtZXJhU3RyZWFtLlJlc2'
    '9sdXRpb25SA3JlcxI0CgdlbmNvZGVyGAUgASgLMhouY29tbS5DYW1lcmFTdHJlYW0uRW5jb2Rl'
    'clIHZW5jb2RlchI4CglwdHpfcmFuZ2UYBiABKAsyGy5jb21tLkNhbWVyYVN0cmVhbS5QdHpSYW'
    '5nZVIIcHR6UmFuZ2USMQoVdXNlcl9vcmlnaW5fYWRkZWRfdXJsGAcgASgJUhJ1c2VyT3JpZ2lu'
    'QWRkZWRVcmwSJAoOc3RyZWFtX2hsc191cmwYCCABKAlSDHN0cmVhbUhsc1VybBI+CgtkZWZhdW'
    'x0X3VybBgJIAEoDjIdLmNvbW0uQ2FtZXJhU3RyZWFtLkRlZmF1bHRVUkxSCmRlZmF1bHRVcmwS'
    'PgoLc3RyZWFtTGlua3MYCiADKAsyHC5jb21tLkNhbWVyYVN0cmVhbS5VcmxTdHJlYW1SC3N0cm'
    'VhbUxpbmtzGjoKClJlc29sdXRpb24SFAoFd2lkdGgYASABKA1SBXdpZHRoEhYKBmhlaWdodBgC'
    'IAEoDVIGaGVpZ2h0GncKB0VuY29kZXISGAoHcXVhbGl0eRgBIAEoDVIHcXVhbGl0eRIcCglmcm'
    'FtZXJhdGUYAiABKA1SCWZyYW1lcmF0ZRIYCgdiaXRyYXRlGAMgASgNUgdiaXRyYXRlEhoKCGVu'
    'Y29kaW5nGAQgASgJUghlbmNvZGluZxrKAQoIUHR6UmFuZ2USLwoBeBgBIAEoCzIhLmNvbW0uQ2'
    'FtZXJhU3RyZWFtLlB0elJhbmdlLnJhbmdlUgF4Ei8KAXkYAiABKAsyIS5jb21tLkNhbWVyYVN0'
    'cmVhbS5QdHpSYW5nZS5yYW5nZVIBeRIvCgF6GAMgASgLMiEuY29tbS5DYW1lcmFTdHJlYW0uUH'
    'R6UmFuZ2UucmFuZ2VSAXoaKwoFcmFuZ2USEAoDbWluGAEgASgNUgNtaW4SEAoDbWF4GAIgASgN'
    'UgNtYXgavwIKCVVybFN0cmVhbRIcCglpc0RlZmF1bHQYASABKAhSCWlzRGVmYXVsdBIkCg5uYW'
    '1lX29mX3N0cmVhbRgCIAEoCVIMbmFtZU9mU3RyZWFtEiIKDXVybF9vZl9zdHJlYW0YAyABKAlS'
    'C3VybE9mU3RyZWFtEj0KBXN0eXBlGAQgASgOMicuY29tbS5DYW1lcmFTdHJlYW0uVXJsU3RyZW'
    'FtLlN0cmVhbVR5cGVSBXN0eXBlEiIKDGlzTWFpblN0cmVhbRgFIAEoCFIMaXNNYWluU3RyZWFt'
    'EiMKDW9yaWdpbl9zdHJlYW0YBiABKAlSDG9yaWdpblN0cmVhbSJCCgpTdHJlYW1UeXBlEgcKA0'
    'hMUxAAEggKBFJUU1AQARIHCgNVRFAQAhIOCgpSVFNQX1BST1hZEAMSCAoEUlRNUBAEIkAKCkRl'
    'ZmF1bHRVUkwSBwoDSExTEAASDwoLUlRTUF9PUklHSU4QARIOCgpSVFNQX1BST1hZEAISCAoEUl'
    'RNUBAD');

@$core.Deprecated('Use onvifDescriptor instead')
const Onvif$json = {
  '1': 'Onvif',
  '2': [
    {'1': 'urn', '3': 1, '4': 1, '5': 9, '10': 'urn'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'hardware', '3': 3, '4': 1, '5': 9, '10': 'hardware'},
    {'1': 'xaddr', '3': 4, '4': 1, '5': 9, '10': 'xaddr'},
    {'1': 'scopes', '3': 5, '4': 3, '5': 9, '10': 'scopes'},
    {'1': 'onvif_rtsp_url', '3': 6, '4': 1, '5': 9, '10': 'onvifRtspUrl'},
  ],
};

/// Descriptor for `Onvif`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvifDescriptor = $convert.base64Decode(
    'CgVPbnZpZhIQCgN1cm4YASABKAlSA3VybhISCgRuYW1lGAIgASgJUgRuYW1lEhoKCGhhcmR3YX'
    'JlGAMgASgJUghoYXJkd2FyZRIUCgV4YWRkchgEIAEoCVIFeGFkZHISFgoGc2NvcGVzGAUgAygJ'
    'UgZzY29wZXMSJAoOb252aWZfcnRzcF91cmwYBiABKAlSDG9udmlmUnRzcFVybA==');

@$core.Deprecated('Use cameraDescriptor instead')
const Camera$json = {
  '1': 'Camera',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'serial_number', '3': 3, '4': 1, '5': 9, '10': 'serialNumber'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
    {'1': 'username', '3': 5, '4': 1, '5': 9, '10': 'username'},
    {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.comm.Camera.Type', '10': 'type'},
    {'1': 'role', '3': 7, '4': 1, '5': 14, '6': '.comm.Camera.Role', '10': 'role'},
    {'1': 'on', '3': 8, '4': 1, '5': 8, '10': 'on'},
    {'1': 'config', '3': 9, '4': 1, '5': 11, '6': '.comm.CameraConfig', '10': 'config'},
    {'1': 'position', '3': 10, '4': 1, '5': 13, '10': 'position'},
    {'1': 'time_added', '3': 11, '4': 1, '5': 4, '10': 'timeAdded'},
    {'1': 'current_major_version', '3': 12, '4': 1, '5': 13, '10': 'currentMajorVersion'},
    {'1': 'current_minor_version', '3': 13, '4': 1, '5': 13, '10': 'currentMinorVersion'},
    {'1': 'stream_url', '3': 14, '4': 1, '5': 11, '6': '.comm.CameraStream', '10': 'streamUrl'},
    {'1': 'onvif', '3': 15, '4': 1, '5': 11, '6': '.comm.Onvif', '10': 'onvif'},
    {'1': 'isOnvif', '3': 16, '4': 1, '5': 8, '10': 'isOnvif'},
    {'1': 'isRTSP', '3': 17, '4': 1, '5': 8, '10': 'isRTSP'},
    {'1': 'plaintext_pw', '3': 18, '4': 1, '5': 9, '10': 'plaintextPw'},
    {'1': 'group_owner_id', '3': 19, '4': 1, '5': 12, '10': 'groupOwnerId'},
    {'1': 'owner_user_id', '3': 20, '4': 1, '5': 12, '10': 'ownerUserId'},
    {'1': 'group_owner_name', '3': 21, '4': 1, '5': 9, '10': 'groupOwnerName'},
    {'1': 'box_owner_id', '3': 22, '4': 1, '5': 12, '10': 'boxOwnerId'},
    {'1': 'cam_id', '3': 23, '4': 1, '5': 9, '10': 'camId'},
    {'1': 'cameraType', '3': 24, '4': 1, '5': 14, '6': '.comm.CameraType', '10': 'cameraType'},
    {'1': 'status', '3': 25, '4': 1, '5': 14, '6': '.comm.Camera.Status', '10': 'status'},
    {'1': 'subscribed', '3': 26, '4': 1, '5': 8, '10': 'subscribed'},
    {'1': 'tags', '3': 27, '4': 3, '5': 11, '6': '.comm.CamTag', '10': 'tags'},
  ],
  '4': [Camera_Type$json, Camera_Role$json, Camera_Status$json],
};

@$core.Deprecated('Use cameraDescriptor instead')
const Camera_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'OWNER', '2': 0},
    {'1': 'SHARED', '2': 1},
    {'1': 'GROUP_SHARED', '2': 2},
  ],
};

@$core.Deprecated('Use cameraDescriptor instead')
const Camera_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'ALL', '2': 1},
  ],
};

@$core.Deprecated('Use cameraDescriptor instead')
const Camera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'INACTIVE', '2': 0},
    {'1': 'ACTIVE', '2': 1},
  ],
};

/// Descriptor for `Camera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraDescriptor = $convert.base64Decode(
    'CgZDYW1lcmESDgoCaWQYASABKAxSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIwoNc2VyaWFsX2'
    '51bWJlchgDIAEoCVIMc2VyaWFsTnVtYmVyEhoKCHBhc3N3b3JkGAQgASgJUghwYXNzd29yZBIa'
    'Cgh1c2VybmFtZRgFIAEoCVIIdXNlcm5hbWUSJQoEdHlwZRgGIAEoDjIRLmNvbW0uQ2FtZXJhLl'
    'R5cGVSBHR5cGUSJQoEcm9sZRgHIAEoDjIRLmNvbW0uQ2FtZXJhLlJvbGVSBHJvbGUSDgoCb24Y'
    'CCABKAhSAm9uEioKBmNvbmZpZxgJIAEoCzISLmNvbW0uQ2FtZXJhQ29uZmlnUgZjb25maWcSGg'
    'oIcG9zaXRpb24YCiABKA1SCHBvc2l0aW9uEh0KCnRpbWVfYWRkZWQYCyABKARSCXRpbWVBZGRl'
    'ZBIyChVjdXJyZW50X21ham9yX3ZlcnNpb24YDCABKA1SE2N1cnJlbnRNYWpvclZlcnNpb24SMg'
    'oVY3VycmVudF9taW5vcl92ZXJzaW9uGA0gASgNUhNjdXJyZW50TWlub3JWZXJzaW9uEjEKCnN0'
    'cmVhbV91cmwYDiABKAsyEi5jb21tLkNhbWVyYVN0cmVhbVIJc3RyZWFtVXJsEiEKBW9udmlmGA'
    '8gASgLMgsuY29tbS5PbnZpZlIFb252aWYSGAoHaXNPbnZpZhgQIAEoCFIHaXNPbnZpZhIWCgZp'
    'c1JUU1AYESABKAhSBmlzUlRTUBIhCgxwbGFpbnRleHRfcHcYEiABKAlSC3BsYWludGV4dFB3Ei'
    'QKDmdyb3VwX293bmVyX2lkGBMgASgMUgxncm91cE93bmVySWQSIgoNb3duZXJfdXNlcl9pZBgU'
    'IAEoDFILb3duZXJVc2VySWQSKAoQZ3JvdXBfb3duZXJfbmFtZRgVIAEoCVIOZ3JvdXBPd25lck'
    '5hbWUSIAoMYm94X293bmVyX2lkGBYgASgMUgpib3hPd25lcklkEhUKBmNhbV9pZBgXIAEoCVIF'
    'Y2FtSWQSMAoKY2FtZXJhVHlwZRgYIAEoDjIQLmNvbW0uQ2FtZXJhVHlwZVIKY2FtZXJhVHlwZR'
    'IrCgZzdGF0dXMYGSABKA4yEy5jb21tLkNhbWVyYS5TdGF0dXNSBnN0YXR1cxIeCgpzdWJzY3Jp'
    'YmVkGBogASgIUgpzdWJzY3JpYmVkEiAKBHRhZ3MYGyADKAsyDC5jb21tLkNhbVRhZ1IEdGFncy'
    'IvCgRUeXBlEgkKBU9XTkVSEAASCgoGU0hBUkVEEAESEAoMR1JPVVBfU0hBUkVEEAIiGQoEUm9s'
    'ZRIICgRWSUVXEAASBwoDQUxMEAEiIgoGU3RhdHVzEgwKCElOQUNUSVZFEAASCgoGQUNUSVZFEA'
    'E=');

@$core.Deprecated('Use alarmDescriptor instead')
const Alarm$json = {
  '1': 'Alarm',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'camera_name', '3': 3, '4': 1, '5': 9, '10': 'cameraName'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.comm.Alarm.Type', '10': 'type'},
    {'1': 'time', '3': 5, '4': 1, '5': 4, '10': 'time'},
    {'1': 'url_video', '3': 6, '4': 1, '5': 9, '10': 'urlVideo'},
    {'1': 'url_thumbnail', '3': 7, '4': 1, '5': 9, '10': 'urlThumbnail'},
    {'1': 'storage', '3': 8, '4': 1, '5': 14, '6': '.comm.Alarm.Storage', '10': 'storage'},
  ],
  '4': [Alarm_Type$json, Alarm_Storage$json],
};

@$core.Deprecated('Use alarmDescriptor instead')
const Alarm_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'MOTION_DETECTION', '2': 0},
    {'1': 'SOUND_DETECTION', '2': 1},
  ],
};

@$core.Deprecated('Use alarmDescriptor instead')
const Alarm_Storage$json = {
  '1': 'Storage',
  '2': [
    {'1': 'CLOUD_STORAGE', '2': 0},
    {'1': 'SD_CARD', '2': 1},
  ],
};

/// Descriptor for `Alarm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List alarmDescriptor = $convert.base64Decode(
    'CgVBbGFybRIOCgJpZBgBIAEoDFICaWQSGwoJY2FtZXJhX2lkGAIgASgMUghjYW1lcmFJZBIfCg'
    'tjYW1lcmFfbmFtZRgDIAEoCVIKY2FtZXJhTmFtZRIkCgR0eXBlGAQgASgOMhAuY29tbS5BbGFy'
    'bS5UeXBlUgR0eXBlEhIKBHRpbWUYBSABKARSBHRpbWUSGwoJdXJsX3ZpZGVvGAYgASgJUgh1cm'
    'xWaWRlbxIjCg11cmxfdGh1bWJuYWlsGAcgASgJUgx1cmxUaHVtYm5haWwSLQoHc3RvcmFnZRgI'
    'IAEoDjITLmNvbW0uQWxhcm0uU3RvcmFnZVIHc3RvcmFnZSIxCgRUeXBlEhQKEE1PVElPTl9ERV'
    'RFQ1RJT04QABITCg9TT1VORF9ERVRFQ1RJT04QASIpCgdTdG9yYWdlEhEKDUNMT1VEX1NUT1JB'
    'R0UQABILCgdTRF9DQVJEEAE=');

@$core.Deprecated('Use ivaMotionDetectionDescriptor instead')
const IvaMotionDetection$json = {
  '1': 'IvaMotionDetection',
  '2': [
    {'1': 'capture_image', '3': 1, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'video_record_url', '3': 2, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {'1': 'capture_image_thumb', '3': 3, '4': 1, '5': 9, '10': 'captureImageThumb'},
  ],
};

/// Descriptor for `IvaMotionDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivaMotionDetectionDescriptor = $convert.base64Decode(
    'ChJJdmFNb3Rpb25EZXRlY3Rpb24SIwoNY2FwdHVyZV9pbWFnZRgBIAEoCVIMY2FwdHVyZUltYW'
    'dlEigKEHZpZGVvX3JlY29yZF91cmwYAiABKAlSDnZpZGVvUmVjb3JkVXJsEi4KE2NhcHR1cmVf'
    'aW1hZ2VfdGh1bWIYAyABKAlSEWNhcHR1cmVJbWFnZVRodW1i');

@$core.Deprecated('Use ivaIntrusionDetectionDescriptor instead')
const IvaIntrusionDetection$json = {
  '1': 'IvaIntrusionDetection',
  '2': [
    {'1': 'capture_image', '3': 1, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'video_record_url', '3': 2, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {'1': 'capture_image_thumb', '3': 3, '4': 1, '5': 9, '10': 'captureImageThumb'},
  ],
};

/// Descriptor for `IvaIntrusionDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivaIntrusionDetectionDescriptor = $convert.base64Decode(
    'ChVJdmFJbnRydXNpb25EZXRlY3Rpb24SIwoNY2FwdHVyZV9pbWFnZRgBIAEoCVIMY2FwdHVyZU'
    'ltYWdlEigKEHZpZGVvX3JlY29yZF91cmwYAiABKAlSDnZpZGVvUmVjb3JkVXJsEi4KE2NhcHR1'
    'cmVfaW1hZ2VfdGh1bWIYAyABKAlSEWNhcHR1cmVJbWFnZVRodW1i');

@$core.Deprecated('Use ivaLineCrossingDetectionDescriptor instead')
const IvaLineCrossingDetection$json = {
  '1': 'IvaLineCrossingDetection',
  '2': [
    {'1': 'capture_image', '3': 1, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'video_record_url', '3': 2, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {'1': 'capture_image_thumb', '3': 3, '4': 1, '5': 9, '10': 'captureImageThumb'},
  ],
};

/// Descriptor for `IvaLineCrossingDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivaLineCrossingDetectionDescriptor = $convert.base64Decode(
    'ChhJdmFMaW5lQ3Jvc3NpbmdEZXRlY3Rpb24SIwoNY2FwdHVyZV9pbWFnZRgBIAEoCVIMY2FwdH'
    'VyZUltYWdlEigKEHZpZGVvX3JlY29yZF91cmwYAiABKAlSDnZpZGVvUmVjb3JkVXJsEi4KE2Nh'
    'cHR1cmVfaW1hZ2VfdGh1bWIYAyABKAlSEWNhcHR1cmVJbWFnZVRodW1i');

@$core.Deprecated('Use ivaSmokeDetectionDescriptor instead')
const IvaSmokeDetection$json = {
  '1': 'IvaSmokeDetection',
  '2': [
    {'1': 'capture_image', '3': 1, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'video_record_url', '3': 2, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {'1': 'capture_image_thumb', '3': 3, '4': 1, '5': 9, '10': 'captureImageThumb'},
  ],
};

/// Descriptor for `IvaSmokeDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivaSmokeDetectionDescriptor = $convert.base64Decode(
    'ChFJdmFTbW9rZURldGVjdGlvbhIjCg1jYXB0dXJlX2ltYWdlGAEgASgJUgxjYXB0dXJlSW1hZ2'
    'USKAoQdmlkZW9fcmVjb3JkX3VybBgCIAEoCVIOdmlkZW9SZWNvcmRVcmwSLgoTY2FwdHVyZV9p'
    'bWFnZV90aHVtYhgDIAEoCVIRY2FwdHVyZUltYWdlVGh1bWI=');

@$core.Deprecated('Use faceDetectionDescriptor instead')
const FaceDetection$json = {
  '1': 'FaceDetection',
  '2': [
    {'1': 'display_name', '3': 1, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'company_name', '3': 2, '4': 1, '5': 9, '10': 'companyName'},
    {'1': 'department', '3': 3, '4': 1, '5': 9, '10': 'department'},
    {'1': 'origin_image', '3': 4, '4': 1, '5': 9, '10': 'originImage'},
    {'1': 'capture_image', '3': 5, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'face_id', '3': 6, '4': 1, '5': 9, '10': 'faceId'},
    {'1': 'detectionType', '3': 7, '4': 1, '5': 14, '6': '.comm.FaceDetection.DetectionType', '10': 'detectionType'},
    {'1': 'video_record_url', '3': 8, '4': 1, '5': 9, '10': 'videoRecordUrl'},
  ],
  '4': [FaceDetection_DetectionType$json],
};

@$core.Deprecated('Use faceDetectionDescriptor instead')
const FaceDetection_DetectionType$json = {
  '1': 'DetectionType',
  '2': [
    {'1': 'FACE_DETECTION', '2': 0},
    {'1': 'UNKNOWN_DETECTION', '2': 1},
  ],
};

/// Descriptor for `FaceDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List faceDetectionDescriptor = $convert.base64Decode(
    'Cg1GYWNlRGV0ZWN0aW9uEiEKDGRpc3BsYXlfbmFtZRgBIAEoCVILZGlzcGxheU5hbWUSIQoMY2'
    '9tcGFueV9uYW1lGAIgASgJUgtjb21wYW55TmFtZRIeCgpkZXBhcnRtZW50GAMgASgJUgpkZXBh'
    'cnRtZW50EiEKDG9yaWdpbl9pbWFnZRgEIAEoCVILb3JpZ2luSW1hZ2USIwoNY2FwdHVyZV9pbW'
    'FnZRgFIAEoCVIMY2FwdHVyZUltYWdlEhcKB2ZhY2VfaWQYBiABKAlSBmZhY2VJZBJHCg1kZXRl'
    'Y3Rpb25UeXBlGAcgASgOMiEuY29tbS5GYWNlRGV0ZWN0aW9uLkRldGVjdGlvblR5cGVSDWRldG'
    'VjdGlvblR5cGUSKAoQdmlkZW9fcmVjb3JkX3VybBgIIAEoCVIOdmlkZW9SZWNvcmRVcmwiOgoN'
    'RGV0ZWN0aW9uVHlwZRISCg5GQUNFX0RFVEVDVElPThAAEhUKEVVOS05PV05fREVURUNUSU9OEA'
    'E=');

@$core.Deprecated('Use iVAALPRDetectionDescriptor instead')
const IVAALPRDetection$json = {
  '1': 'IVAALPRDetection',
  '2': [
    {'1': 'vehicle_plate_capture', '3': 1, '4': 1, '5': 9, '10': 'vehiclePlateCapture'},
    {'1': 'img_capture', '3': 2, '4': 1, '5': 9, '10': 'imgCapture'},
    {'1': 'vehicle_plate', '3': 3, '4': 1, '5': 9, '10': 'vehiclePlate'},
    {'1': 'vehicle_type', '3': 4, '4': 1, '5': 9, '10': 'vehicleType'},
    {'1': 'video_record_url', '3': 5, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {'1': 'img_vehicle', '3': 6, '4': 1, '5': 9, '10': 'imgVehicle'},
  ],
};

/// Descriptor for `IVAALPRDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVAALPRDetectionDescriptor = $convert.base64Decode(
    'ChBJVkFBTFBSRGV0ZWN0aW9uEjIKFXZlaGljbGVfcGxhdGVfY2FwdHVyZRgBIAEoCVITdmVoaW'
    'NsZVBsYXRlQ2FwdHVyZRIfCgtpbWdfY2FwdHVyZRgCIAEoCVIKaW1nQ2FwdHVyZRIjCg12ZWhp'
    'Y2xlX3BsYXRlGAMgASgJUgx2ZWhpY2xlUGxhdGUSIQoMdmVoaWNsZV90eXBlGAQgASgJUgt2ZW'
    'hpY2xlVHlwZRIoChB2aWRlb19yZWNvcmRfdXJsGAUgASgJUg52aWRlb1JlY29yZFVybBIfCgtp'
    'bWdfdmVoaWNsZRgGIAEoCVIKaW1nVmVoaWNsZQ==');

@$core.Deprecated('Use vehicleDescriptor instead')
const Vehicle$json = {
  '1': 'Vehicle',
  '2': [
    {'1': 'vehicle_id', '3': 1, '4': 1, '5': 12, '10': 'vehicleId'},
    {'1': 'vehicle_plate', '3': 2, '4': 1, '5': 9, '10': 'vehiclePlate'},
    {'1': 'vehicle_type', '3': 3, '4': 1, '5': 14, '6': '.comm.Vehicle_Type', '10': 'vehicleType'},
    {'1': 'owner', '3': 4, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `Vehicle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleDescriptor = $convert.base64Decode(
    'CgdWZWhpY2xlEh0KCnZlaGljbGVfaWQYASABKAxSCXZlaGljbGVJZBIjCg12ZWhpY2xlX3BsYX'
    'RlGAIgASgJUgx2ZWhpY2xlUGxhdGUSNQoMdmVoaWNsZV90eXBlGAMgASgOMhIuY29tbS5WZWhp'
    'Y2xlX1R5cGVSC3ZlaGljbGVUeXBlEhQKBW93bmVyGAQgASgJUgVvd25lcg==');

@$core.Deprecated('Use eventDescriptor instead')
const Event$json = {
  '1': 'Event',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'time', '3': 2, '4': 1, '5': 4, '10': 'time'},
    {'1': 'camera_name', '3': 3, '4': 1, '5': 9, '10': 'cameraName'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.comm.EventType', '10': 'type'},
    {'1': 'event_metadata', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'eventMetadata'},
    {'1': 'event_id', '3': 6, '4': 1, '5': 12, '10': 'eventId'},
    {'1': 'capture_image', '3': 7, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'video_record_url', '3': 8, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {'1': 'capture_image_thumb', '3': 9, '4': 1, '5': 9, '10': 'captureImageThumb'},
    {'1': 'description', '3': 10, '4': 1, '5': 9, '10': 'description'},
    {'1': 'has_video_record_url', '3': 11, '4': 1, '5': 8, '10': 'hasVideoRecordUrl'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEhIKBHRpbWUYAiABKARSBHRpbW'
    'USHwoLY2FtZXJhX25hbWUYAyABKAlSCmNhbWVyYU5hbWUSIwoEdHlwZRgEIAEoDjIPLmNvbW0u'
    'RXZlbnRUeXBlUgR0eXBlEjsKDmV2ZW50X21ldGFkYXRhGAUgASgLMhQuZ29vZ2xlLnByb3RvYn'
    'VmLkFueVINZXZlbnRNZXRhZGF0YRIZCghldmVudF9pZBgGIAEoDFIHZXZlbnRJZBIjCg1jYXB0'
    'dXJlX2ltYWdlGAcgASgJUgxjYXB0dXJlSW1hZ2USKAoQdmlkZW9fcmVjb3JkX3VybBgIIAEoCV'
    'IOdmlkZW9SZWNvcmRVcmwSLgoTY2FwdHVyZV9pbWFnZV90aHVtYhgJIAEoCVIRY2FwdHVyZUlt'
    'YWdlVGh1bWISIAoLZGVzY3JpcHRpb24YCiABKAlSC2Rlc2NyaXB0aW9uEi8KFGhhc192aWRlb1'
    '9yZWNvcmRfdXJsGAsgASgIUhFoYXNWaWRlb1JlY29yZFVybA==');

@$core.Deprecated('Use deviceGroupDescriptor instead')
const DeviceGroup$json = {
  '1': 'DeviceGroup',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'parent_group_id', '3': 2, '4': 1, '5': 12, '10': 'parentGroupId'},
    {'1': 'status', '3': 3, '4': 1, '5': 14, '6': '.comm.DeviceGroup.Status', '10': 'status'},
    {'1': 'level', '3': 4, '4': 1, '5': 13, '10': 'level'},
    {'1': 'created_date', '3': 5, '4': 1, '5': 4, '10': 'createdDate'},
    {'1': 'last_update', '3': 6, '4': 1, '5': 4, '10': 'lastUpdate'},
    {'1': 'user_created', '3': 7, '4': 1, '5': 12, '10': 'userCreated'},
    {'1': 'groups', '3': 8, '4': 3, '5': 11, '6': '.comm.DeviceGroup', '10': 'groups'},
    {'1': 'group_id', '3': 10, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'group_type', '3': 11, '4': 1, '5': 14, '6': '.comm.DeviceGroup.Type', '10': 'groupType'},
    {'1': 'group_role', '3': 12, '4': 1, '5': 14, '6': '.comm.DeviceGroup.Role', '10': 'groupRole'},
  ],
  '4': [DeviceGroup_Status$json, DeviceGroup_Type$json, DeviceGroup_Role$json],
};

@$core.Deprecated('Use deviceGroupDescriptor instead')
const DeviceGroup_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'INACTIVE', '2': 0},
    {'1': 'ACTIVE', '2': 1},
  ],
};

@$core.Deprecated('Use deviceGroupDescriptor instead')
const DeviceGroup_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'OWNER', '2': 0},
    {'1': 'SHARED', '2': 1},
    {'1': 'MOVED', '2': 2},
  ],
};

@$core.Deprecated('Use deviceGroupDescriptor instead')
const DeviceGroup_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'FULL', '2': 0},
    {'1': 'GVIEW', '2': 1},
    {'1': 'GMANAGER', '2': 2},
  ],
};

/// Descriptor for `DeviceGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceGroupDescriptor = $convert.base64Decode(
    'CgtEZXZpY2VHcm91cBISCgRuYW1lGAEgASgJUgRuYW1lEiYKD3BhcmVudF9ncm91cF9pZBgCIA'
    'EoDFINcGFyZW50R3JvdXBJZBIwCgZzdGF0dXMYAyABKA4yGC5jb21tLkRldmljZUdyb3VwLlN0'
    'YXR1c1IGc3RhdHVzEhQKBWxldmVsGAQgASgNUgVsZXZlbBIhCgxjcmVhdGVkX2RhdGUYBSABKA'
    'RSC2NyZWF0ZWREYXRlEh8KC2xhc3RfdXBkYXRlGAYgASgEUgpsYXN0VXBkYXRlEiEKDHVzZXJf'
    'Y3JlYXRlZBgHIAEoDFILdXNlckNyZWF0ZWQSKQoGZ3JvdXBzGAggAygLMhEuY29tbS5EZXZpY2'
    'VHcm91cFIGZ3JvdXBzEhkKCGdyb3VwX2lkGAogASgMUgdncm91cElkEjUKCmdyb3VwX3R5cGUY'
    'CyABKA4yFi5jb21tLkRldmljZUdyb3VwLlR5cGVSCWdyb3VwVHlwZRI1Cgpncm91cF9yb2xlGA'
    'wgASgOMhYuY29tbS5EZXZpY2VHcm91cC5Sb2xlUglncm91cFJvbGUiIgoGU3RhdHVzEgwKCElO'
    'QUNUSVZFEAASCgoGQUNUSVZFEAEiKAoEVHlwZRIJCgVPV05FUhAAEgoKBlNIQVJFRBABEgkKBU'
    '1PVkVEEAIiKQoEUm9sZRIICgRGVUxMEAASCQoFR1ZJRVcQARIMCghHTUFOQUdFUhAC');

@$core.Deprecated('Use liveViewPositionDescriptor instead')
const LiveViewPosition$json = {
  '1': 'LiveViewPosition',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'camera', '3': 3, '4': 1, '5': 11, '6': '.comm.Camera', '10': 'camera'},
  ],
};

/// Descriptor for `LiveViewPosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List liveViewPositionDescriptor = $convert.base64Decode(
    'ChBMaXZlVmlld1Bvc2l0aW9uEhQKBWluZGV4GAEgASgNUgVpbmRleBIbCgljYW1lcmFfaWQYAi'
    'ABKAxSCGNhbWVyYUlkEiQKBmNhbWVyYRgDIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcmE=');

@$core.Deprecated('Use customLiveViewDescriptor instead')
const CustomLiveView$json = {
  '1': 'CustomLiveView',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'base', '3': 2, '4': 1, '5': 14, '6': '.comm.Base_View', '10': 'base'},
    {'1': 'postision', '3': 3, '4': 3, '5': 11, '6': '.comm.LiveViewPosition', '10': 'postision'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customLiveViewDescriptor = $convert.base64Decode(
    'Cg5DdXN0b21MaXZlVmlldxIOCgJpZBgBIAEoDFICaWQSIwoEYmFzZRgCIAEoDjIPLmNvbW0uQm'
    'FzZV9WaWV3UgRiYXNlEjQKCXBvc3Rpc2lvbhgDIAMoCzIWLmNvbW0uTGl2ZVZpZXdQb3NpdGlv'
    'blIJcG9zdGlzaW9uEhIKBG5hbWUYBCABKAlSBG5hbWU=');

@$core.Deprecated('Use inviteMessageDescriptor instead')
const InviteMessage$json = {
  '1': 'InviteMessage',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'role', '3': 2, '4': 1, '5': 14, '6': '.comm.InviteMessage.Role', '10': 'role'},
    {'1': 'status', '3': 3, '4': 1, '5': 14, '6': '.comm.InviteMessage.Status', '10': 'status'},
    {'1': 'account_share', '3': 4, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'accountShare'},
    {'1': 'account_shared', '3': 5, '4': 1, '5': 11, '6': '.comm.Profile', '10': 'accountShared'},
    {'1': 'last_update', '3': 6, '4': 1, '5': 4, '10': 'lastUpdate'},
    {'1': 'account_share_id', '3': 7, '4': 1, '5': 12, '10': 'accountShareId'},
    {'1': 'account_shared_id', '3': 8, '4': 1, '5': 12, '10': 'accountSharedId'},
    {'1': 'time_share', '3': 9, '4': 1, '5': 4, '10': 'timeShare'},
    {'1': 'shareType', '3': 10, '4': 1, '5': 14, '6': '.comm.InviteMessage.ShareType', '10': 'shareType'},
    {'1': 'group_id', '3': 11, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'groupShareRole', '3': 12, '4': 1, '5': 14, '6': '.comm.InviteMessage.GroupShareRole', '10': 'groupShareRole'},
    {'1': 'invite_msg_id', '3': 13, '4': 1, '5': 12, '10': 'inviteMsgId'},
  ],
  '4': [InviteMessage_Role$json, InviteMessage_GroupShareRole$json, InviteMessage_Status$json, InviteMessage_ShareType$json],
};

@$core.Deprecated('Use inviteMessageDescriptor instead')
const InviteMessage_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'ALL', '2': 1},
  ],
};

@$core.Deprecated('Use inviteMessageDescriptor instead')
const InviteMessage_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': 'GFULL', '2': 0},
    {'1': 'GVIEW', '2': 1},
    {'1': 'GMANAGER', '2': 2},
  ],
};

@$core.Deprecated('Use inviteMessageDescriptor instead')
const InviteMessage_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'PENDING', '2': 0},
    {'1': 'ACCEPT', '2': 1},
    {'1': 'DECLINE', '2': 2},
  ],
};

@$core.Deprecated('Use inviteMessageDescriptor instead')
const InviteMessage_ShareType$json = {
  '1': 'ShareType',
  '2': [
    {'1': 'CAMERA', '2': 0},
    {'1': 'GROUP_CAMERA', '2': 1},
  ],
};

/// Descriptor for `InviteMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteMessageDescriptor = $convert.base64Decode(
    'Cg1JbnZpdGVNZXNzYWdlEhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSLAoEcm9sZRgCIA'
    'EoDjIYLmNvbW0uSW52aXRlTWVzc2FnZS5Sb2xlUgRyb2xlEjIKBnN0YXR1cxgDIAEoDjIaLmNv'
    'bW0uSW52aXRlTWVzc2FnZS5TdGF0dXNSBnN0YXR1cxIyCg1hY2NvdW50X3NoYXJlGAQgASgLMg'
    '0uY29tbS5Qcm9maWxlUgxhY2NvdW50U2hhcmUSNAoOYWNjb3VudF9zaGFyZWQYBSABKAsyDS5j'
    'b21tLlByb2ZpbGVSDWFjY291bnRTaGFyZWQSHwoLbGFzdF91cGRhdGUYBiABKARSCmxhc3RVcG'
    'RhdGUSKAoQYWNjb3VudF9zaGFyZV9pZBgHIAEoDFIOYWNjb3VudFNoYXJlSWQSKgoRYWNjb3Vu'
    'dF9zaGFyZWRfaWQYCCABKAxSD2FjY291bnRTaGFyZWRJZBIdCgp0aW1lX3NoYXJlGAkgASgEUg'
    'l0aW1lU2hhcmUSOwoJc2hhcmVUeXBlGAogASgOMh0uY29tbS5JbnZpdGVNZXNzYWdlLlNoYXJl'
    'VHlwZVIJc2hhcmVUeXBlEhkKCGdyb3VwX2lkGAsgASgMUgdncm91cElkEkoKDmdyb3VwU2hhcm'
    'VSb2xlGAwgASgOMiIuY29tbS5JbnZpdGVNZXNzYWdlLkdyb3VwU2hhcmVSb2xlUg5ncm91cFNo'
    'YXJlUm9sZRIiCg1pbnZpdGVfbXNnX2lkGA0gASgMUgtpbnZpdGVNc2dJZCIZCgRSb2xlEggKBF'
    'ZJRVcQABIHCgNBTEwQASI0Cg5Hcm91cFNoYXJlUm9sZRIJCgVHRlVMTBAAEgkKBUdWSUVXEAES'
    'DAoIR01BTkFHRVIQAiIuCgZTdGF0dXMSCwoHUEVORElORxAAEgoKBkFDQ0VQVBABEgsKB0RFQ0'
    'xJTkUQAiIpCglTaGFyZVR5cGUSCgoGQ0FNRVJBEAASEAoMR1JPVVBfQ0FNRVJBEAE=');

@$core.Deprecated('Use vboxDescriptor instead')
const Vbox$json = {
  '1': 'Vbox',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
    {'1': 'box_name', '3': 2, '4': 1, '5': 9, '10': 'boxName'},
    {'1': 'box_serial_number', '3': 3, '4': 1, '5': 9, '10': 'boxSerialNumber'},
    {'1': 'box_type', '3': 4, '4': 1, '5': 14, '6': '.comm.Box_Type', '10': 'boxType'},
    {'1': 'box_State', '3': 5, '4': 1, '5': 14, '6': '.comm.Box_State', '10': 'boxState'},
    {'1': 'owner_user_id', '3': 6, '4': 1, '5': 12, '10': 'ownerUserId'},
    {'1': 'time_added', '3': 7, '4': 1, '5': 4, '10': 'timeAdded'},
    {'1': 'last_update', '3': 8, '4': 1, '5': 4, '10': 'lastUpdate'},
    {'1': 'box_id_str', '3': 9, '4': 1, '5': 9, '10': 'boxIdStr'},
    {'1': 'isBoxOnline', '3': 10, '4': 1, '5': 8, '10': 'isBoxOnline'},
    {'1': 'camera_count', '3': 11, '4': 1, '5': 13, '10': 'cameraCount'},
    {'1': 'box_local_ip', '3': 23, '4': 1, '5': 9, '10': 'boxLocalIp'},
    {'1': 'box_public_ip', '3': 24, '4': 1, '5': 9, '10': 'boxPublicIp'},
  ],
};

/// Descriptor for `Vbox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vboxDescriptor = $convert.base64Decode(
    'CgRWYm94EhUKBmJveF9pZBgBIAEoDFIFYm94SWQSGQoIYm94X25hbWUYAiABKAlSB2JveE5hbW'
    'USKgoRYm94X3NlcmlhbF9udW1iZXIYAyABKAlSD2JveFNlcmlhbE51bWJlchIpCghib3hfdHlw'
    'ZRgEIAEoDjIOLmNvbW0uQm94X1R5cGVSB2JveFR5cGUSLAoJYm94X1N0YXRlGAUgASgOMg8uY2'
    '9tbS5Cb3hfU3RhdGVSCGJveFN0YXRlEiIKDW93bmVyX3VzZXJfaWQYBiABKAxSC293bmVyVXNl'
    'cklkEh0KCnRpbWVfYWRkZWQYByABKARSCXRpbWVBZGRlZBIfCgtsYXN0X3VwZGF0ZRgIIAEoBF'
    'IKbGFzdFVwZGF0ZRIcCgpib3hfaWRfc3RyGAkgASgJUghib3hJZFN0chIgCgtpc0JveE9ubGlu'
    'ZRgKIAEoCFILaXNCb3hPbmxpbmUSIQoMY2FtZXJhX2NvdW50GAsgASgNUgtjYW1lcmFDb3VudB'
    'IgCgxib3hfbG9jYWxfaXAYFyABKAlSCmJveExvY2FsSXASIgoNYm94X3B1YmxpY19pcBgYIAEo'
    'CVILYm94UHVibGljSXA=');

@$core.Deprecated('Use ack_forDescriptor instead')
const Ack_for$json = {
  '1': 'Ack_for',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 12, '10': 'userId'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 12, '10': 'sessionId'},
    {'1': 'connection_id', '3': 3, '4': 1, '5': 12, '10': 'connectionId'},
    {'1': 'message_id', '3': 4, '4': 1, '5': 4, '10': 'messageId'},
    {'1': 'request_ID', '3': 5, '4': 1, '5': 13, '10': 'requestID'},
    {'1': 'time_request', '3': 6, '4': 1, '5': 4, '10': 'timeRequest'},
    {'1': 'metadata', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'metadata'},
  ],
};

/// Descriptor for `Ack_for`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ack_forDescriptor = $convert.base64Decode(
    'CgdBY2tfZm9yEhcKB3VzZXJfaWQYASABKAxSBnVzZXJJZBIdCgpzZXNzaW9uX2lkGAIgASgMUg'
    'lzZXNzaW9uSWQSIwoNY29ubmVjdGlvbl9pZBgDIAEoDFIMY29ubmVjdGlvbklkEh0KCm1lc3Nh'
    'Z2VfaWQYBCABKARSCW1lc3NhZ2VJZBIdCgpyZXF1ZXN0X0lEGAUgASgNUglyZXF1ZXN0SUQSIQ'
    'oMdGltZV9yZXF1ZXN0GAYgASgEUgt0aW1lUmVxdWVzdBIwCghtZXRhZGF0YRgHIAEoCzIULmdv'
    'b2dsZS5wcm90b2J1Zi5BbnlSCG1ldGFkYXRh');

@$core.Deprecated('Use license_profileDescriptor instead')
const License_profile$json = {
  '1': 'License_profile',
  '2': [
    {'1': 'iva', '3': 1, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'iva'},
    {'1': 'motion_detection', '3': 2, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'motionDetection'},
    {'1': 'instrument_detection', '3': 3, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'instrumentDetection'},
    {'1': 'line_crossing_detection', '3': 4, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'lineCrossingDetection'},
    {'1': 'smoke_detection', '3': 5, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'smokeDetection'},
    {'1': 'face_detection', '3': 6, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'faceDetection'},
    {'1': 'admin_management', '3': 7, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'adminManagement'},
    {'1': 'opt_verify', '3': 8, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'optVerify'},
    {'1': 'service_management', '3': 9, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'serviceManagement'},
    {'1': 'forgot_password', '3': 10, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'forgotPassword'},
    {'1': 'register_form', '3': 11, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'registerForm'},
    {'1': 'playback', '3': 12, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'playback'},
    {'1': 'notification', '3': 13, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'notification'},
    {'1': 'emap', '3': 14, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'emap'},
    {'1': 'user_edit_md_log', '3': 15, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'userEditMdLog'},
    {'1': 'setting_default_storage', '3': 16, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'settingDefaultStorage'},
    {'1': 'use_cam_box', '3': 17, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'useCamBox'},
    {'1': 'add_rtsp_cam', '3': 18, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'addRtspCam'},
    {'1': 'add_onvif_cam', '3': 19, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'addOnvifCam'},
    {'1': 'alpr_detection', '3': 20, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'alprDetection'},
    {'1': 'mail_config', '3': 21, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'mailConfig'},
    {'1': 'scan_onvif', '3': 22, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'scanOnvif'},
    {'1': 'vehicle_management', '3': 23, '4': 1, '5': 14, '6': '.comm.License_profile.ISON', '10': 'vehicleManagement'},
  ],
  '4': [License_profile_ISON$json],
};

@$core.Deprecated('Use license_profileDescriptor instead')
const License_profile_ISON$json = {
  '1': 'ISON',
  '2': [
    {'1': 'OFF', '2': 0},
    {'1': 'ON', '2': 1},
  ],
};

/// Descriptor for `License_profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List license_profileDescriptor = $convert.base64Decode(
    'Cg9MaWNlbnNlX3Byb2ZpbGUSLAoDaXZhGAEgASgOMhouY29tbS5MaWNlbnNlX3Byb2ZpbGUuSV'
    'NPTlIDaXZhEkUKEG1vdGlvbl9kZXRlY3Rpb24YAiABKA4yGi5jb21tLkxpY2Vuc2VfcHJvZmls'
    'ZS5JU09OUg9tb3Rpb25EZXRlY3Rpb24STQoUaW5zdHJ1bWVudF9kZXRlY3Rpb24YAyABKA4yGi'
    '5jb21tLkxpY2Vuc2VfcHJvZmlsZS5JU09OUhNpbnN0cnVtZW50RGV0ZWN0aW9uElIKF2xpbmVf'
    'Y3Jvc3NpbmdfZGV0ZWN0aW9uGAQgASgOMhouY29tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlIVbG'
    'luZUNyb3NzaW5nRGV0ZWN0aW9uEkMKD3Ntb2tlX2RldGVjdGlvbhgFIAEoDjIaLmNvbW0uTGlj'
    'ZW5zZV9wcm9maWxlLklTT05SDnNtb2tlRGV0ZWN0aW9uEkEKDmZhY2VfZGV0ZWN0aW9uGAYgAS'
    'gOMhouY29tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlINZmFjZURldGVjdGlvbhJFChBhZG1pbl9t'
    'YW5hZ2VtZW50GAcgASgOMhouY29tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlIPYWRtaW5NYW5hZ2'
    'VtZW50EjkKCm9wdF92ZXJpZnkYCCABKA4yGi5jb21tLkxpY2Vuc2VfcHJvZmlsZS5JU09OUglv'
    'cHRWZXJpZnkSSQoSc2VydmljZV9tYW5hZ2VtZW50GAkgASgOMhouY29tbS5MaWNlbnNlX3Byb2'
    'ZpbGUuSVNPTlIRc2VydmljZU1hbmFnZW1lbnQSQwoPZm9yZ290X3Bhc3N3b3JkGAogASgOMhou'
    'Y29tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlIOZm9yZ290UGFzc3dvcmQSPwoNcmVnaXN0ZXJfZm'
    '9ybRgLIAEoDjIaLmNvbW0uTGljZW5zZV9wcm9maWxlLklTT05SDHJlZ2lzdGVyRm9ybRI2Cghw'
    'bGF5YmFjaxgMIAEoDjIaLmNvbW0uTGljZW5zZV9wcm9maWxlLklTT05SCHBsYXliYWNrEj4KDG'
    '5vdGlmaWNhdGlvbhgNIAEoDjIaLmNvbW0uTGljZW5zZV9wcm9maWxlLklTT05SDG5vdGlmaWNh'
    'dGlvbhIuCgRlbWFwGA4gASgOMhouY29tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlIEZW1hcBJDCh'
    'B1c2VyX2VkaXRfbWRfbG9nGA8gASgOMhouY29tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlINdXNl'
    'ckVkaXRNZExvZxJSChdzZXR0aW5nX2RlZmF1bHRfc3RvcmFnZRgQIAEoDjIaLmNvbW0uTGljZW'
    '5zZV9wcm9maWxlLklTT05SFXNldHRpbmdEZWZhdWx0U3RvcmFnZRI6Cgt1c2VfY2FtX2JveBgR'
    'IAEoDjIaLmNvbW0uTGljZW5zZV9wcm9maWxlLklTT05SCXVzZUNhbUJveBI8CgxhZGRfcnRzcF'
    '9jYW0YEiABKA4yGi5jb21tLkxpY2Vuc2VfcHJvZmlsZS5JU09OUgphZGRSdHNwQ2FtEj4KDWFk'
    'ZF9vbnZpZl9jYW0YEyABKA4yGi5jb21tLkxpY2Vuc2VfcHJvZmlsZS5JU09OUgthZGRPbnZpZk'
    'NhbRJBCg5hbHByX2RldGVjdGlvbhgUIAEoDjIaLmNvbW0uTGljZW5zZV9wcm9maWxlLklTT05S'
    'DWFscHJEZXRlY3Rpb24SOwoLbWFpbF9jb25maWcYFSABKA4yGi5jb21tLkxpY2Vuc2VfcHJvZm'
    'lsZS5JU09OUgptYWlsQ29uZmlnEjkKCnNjYW5fb252aWYYFiABKA4yGi5jb21tLkxpY2Vuc2Vf'
    'cHJvZmlsZS5JU09OUglzY2FuT252aWYSSQoSdmVoaWNsZV9tYW5hZ2VtZW50GBcgASgOMhouY2'
    '9tbS5MaWNlbnNlX3Byb2ZpbGUuSVNPTlIRdmVoaWNsZU1hbmFnZW1lbnQiFwoESVNPThIHCgNP'
    'RkYQABIGCgJPThAB');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'email_address', '3': 2, '4': 1, '5': 9, '10': 'emailAddress'},
    {'1': 'tel_number', '3': 3, '4': 1, '5': 9, '10': 'telNumber'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.comm.User.Status', '10': 'status'},
    {'1': 'last_update', '3': 6, '4': 1, '5': 4, '10': 'lastUpdate'},
    {'1': 'type', '3': 7, '4': 1, '5': 14, '6': '.comm.User.Type', '10': 'type'},
    {'1': 'create_at', '3': 9, '4': 1, '5': 4, '10': 'createAt'},
    {'1': 'desc', '3': 12, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'full_name', '3': 13, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'id', '3': 14, '4': 1, '5': 12, '10': 'id'},
    {'1': 'changePassDenied', '3': 15, '4': 1, '5': 8, '10': 'changePassDenied'},
    {'1': 'addCamDenied', '3': 16, '4': 1, '5': 8, '10': 'addCamDenied'},
    {'1': 'msg_unread_count', '3': 17, '4': 1, '5': 13, '10': 'msgUnreadCount'},
  ],
  '4': [User_Status$json, User_Type$json],
};

@$core.Deprecated('Use userDescriptor instead')
const User_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'INACTIVE', '2': 0},
    {'1': 'ACTIVE', '2': 1},
    {'1': 'AGENT_CREATE', '2': 2},
  ],
};

@$core.Deprecated('Use userDescriptor instead')
const User_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'USER', '2': 0},
    {'1': 'ADMIN', '2': 1},
    {'1': 'SUPER_ADMIN', '2': 2},
    {'1': 'SYS_ADMIN', '2': 3},
    {'1': 'AGENT', '2': 4},
    {'1': 'ADMIN_CLIENT', '2': 5},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhgKB2FjY291bnQYASABKAlSB2FjY291bnQSIwoNZW1haWxfYWRkcmVzcxgCIAEoCV'
    'IMZW1haWxBZGRyZXNzEh0KCnRlbF9udW1iZXIYAyABKAlSCXRlbE51bWJlchIaCghwYXNzd29y'
    'ZBgEIAEoCVIIcGFzc3dvcmQSKQoGc3RhdHVzGAUgASgOMhEuY29tbS5Vc2VyLlN0YXR1c1IGc3'
    'RhdHVzEh8KC2xhc3RfdXBkYXRlGAYgASgEUgpsYXN0VXBkYXRlEiMKBHR5cGUYByABKA4yDy5j'
    'b21tLlVzZXIuVHlwZVIEdHlwZRIbCgljcmVhdGVfYXQYCSABKARSCGNyZWF0ZUF0EhIKBGRlc2'
    'MYDCABKAlSBGRlc2MSGwoJZnVsbF9uYW1lGA0gASgJUghmdWxsTmFtZRIOCgJpZBgOIAEoDFIC'
    'aWQSKgoQY2hhbmdlUGFzc0RlbmllZBgPIAEoCFIQY2hhbmdlUGFzc0RlbmllZBIiCgxhZGRDYW'
    '1EZW5pZWQYECABKAhSDGFkZENhbURlbmllZBIoChBtc2dfdW5yZWFkX2NvdW50GBEgASgNUg5t'
    'c2dVbnJlYWRDb3VudCI0CgZTdGF0dXMSDAoISU5BQ1RJVkUQABIKCgZBQ1RJVkUQARIQCgxBR0'
    'VOVF9DUkVBVEUQAiJYCgRUeXBlEggKBFVTRVIQABIJCgVBRE1JThABEg8KC1NVUEVSX0FETUlO'
    'EAISDQoJU1lTX0FETUlOEAMSCQoFQUdFTlQQBBIQCgxBRE1JTl9DTElFTlQQBQ==');

@$core.Deprecated('Use rtspServerSettingDescriptor instead')
const RtspServerSetting$json = {
  '1': 'RtspServerSetting',
  '2': [
    {'1': 'max_camera', '3': 1, '4': 1, '5': 13, '10': 'maxCamera'},
    {'1': 'current_Camera', '3': 2, '4': 1, '5': 13, '10': 'currentCamera'},
    {'1': 'server_host', '3': 3, '4': 1, '5': 9, '10': 'serverHost'},
    {'1': 'server_local_host', '3': 4, '4': 1, '5': 9, '10': 'serverLocalHost'},
    {'1': 'server_port', '3': 5, '4': 1, '5': 13, '10': 'serverPort'},
    {'1': 'public_user', '3': 6, '4': 1, '5': 9, '10': 'publicUser'},
    {'1': 'public_pass', '3': 7, '4': 1, '5': 9, '10': 'publicPass'},
    {'1': 'read_user', '3': 8, '4': 1, '5': 9, '10': 'readUser'},
    {'1': 'read_pass', '3': 9, '4': 1, '5': 9, '10': 'readPass'},
    {'1': 'sv_name', '3': 10, '4': 1, '5': 9, '10': 'svName'},
  ],
};

/// Descriptor for `RtspServerSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rtspServerSettingDescriptor = $convert.base64Decode(
    'ChFSdHNwU2VydmVyU2V0dGluZxIdCgptYXhfY2FtZXJhGAEgASgNUgltYXhDYW1lcmESJQoOY3'
    'VycmVudF9DYW1lcmEYAiABKA1SDWN1cnJlbnRDYW1lcmESHwoLc2VydmVyX2hvc3QYAyABKAlS'
    'CnNlcnZlckhvc3QSKgoRc2VydmVyX2xvY2FsX2hvc3QYBCABKAlSD3NlcnZlckxvY2FsSG9zdB'
    'IfCgtzZXJ2ZXJfcG9ydBgFIAEoDVIKc2VydmVyUG9ydBIfCgtwdWJsaWNfdXNlchgGIAEoCVIK'
    'cHVibGljVXNlchIfCgtwdWJsaWNfcGFzcxgHIAEoCVIKcHVibGljUGFzcxIbCglyZWFkX3VzZX'
    'IYCCABKAlSCHJlYWRVc2VyEhsKCXJlYWRfcGFzcxgJIAEoCVIIcmVhZFBhc3MSFwoHc3ZfbmFt'
    'ZRgKIAEoCVIGc3ZOYW1l');

@$core.Deprecated('Use notificationMsgDescriptor instead')
const NotificationMsg$json = {
  '1': 'NotificationMsg',
  '2': [
    {'1': 'msg_id', '3': 1, '4': 1, '5': 12, '10': 'msgId'},
    {'1': 'title_msg', '3': 2, '4': 1, '5': 9, '10': 'titleMsg'},
    {'1': 'short_des', '3': 3, '4': 1, '5': 9, '10': 'shortDes'},
    {'1': 'des', '3': 4, '4': 1, '5': 9, '10': 'des'},
    {'1': 'isRead', '3': 5, '4': 1, '5': 8, '10': 'isRead'},
    {'1': 'time', '3': 6, '4': 1, '5': 4, '10': 'time'},
    {'1': 'msgType', '3': 7, '4': 1, '5': 14, '6': '.comm.NotificationMsg.MsgType', '10': 'msgType'},
    {'1': 'data', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'data'},
  ],
  '4': [NotificationMsg_MsgType$json],
};

@$core.Deprecated('Use notificationMsgDescriptor instead')
const NotificationMsg_MsgType$json = {
  '1': 'MsgType',
  '2': [
    {'1': 'GENERIC', '2': 0},
    {'1': 'SHARE', '2': 1},
  ],
};

/// Descriptor for `NotificationMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationMsgDescriptor = $convert.base64Decode(
    'Cg9Ob3RpZmljYXRpb25Nc2cSFQoGbXNnX2lkGAEgASgMUgVtc2dJZBIbCgl0aXRsZV9tc2cYAi'
    'ABKAlSCHRpdGxlTXNnEhsKCXNob3J0X2RlcxgDIAEoCVIIc2hvcnREZXMSEAoDZGVzGAQgASgJ'
    'UgNkZXMSFgoGaXNSZWFkGAUgASgIUgZpc1JlYWQSEgoEdGltZRgGIAEoBFIEdGltZRI3Cgdtc2'
    'dUeXBlGAcgASgOMh0uY29tbS5Ob3RpZmljYXRpb25Nc2cuTXNnVHlwZVIHbXNnVHlwZRIoCgRk'
    'YXRhGAggASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIEZGF0YSIhCgdNc2dUeXBlEgsKB0dFTk'
    'VSSUMQABIJCgVTSEFSRRAB');

@$core.Deprecated('Use sDCardFilesDescriptor instead')
const SDCardFiles$json = {
  '1': 'SDCardFiles',
  '2': [
    {'1': 'isEnd', '3': 1, '4': 1, '5': 8, '10': 'isEnd'},
    {'1': 'files', '3': 2, '4': 3, '5': 11, '6': '.comm.SDCardFiles.File', '10': 'files'},
  ],
  '3': [SDCardFiles_File$json],
};

@$core.Deprecated('Use sDCardFilesDescriptor instead')
const SDCardFiles_File$json = {
  '1': 'File',
  '2': [
    {'1': 'video_file_time', '3': 1, '4': 1, '5': 13, '10': 'videoFileTime'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'play_total_time', '3': 3, '4': 1, '5': 13, '10': 'playTotalTime'},
  ],
};

/// Descriptor for `SDCardFiles`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sDCardFilesDescriptor = $convert.base64Decode(
    'CgtTRENhcmRGaWxlcxIUCgVpc0VuZBgBIAEoCFIFaXNFbmQSLAoFZmlsZXMYAiADKAsyFi5jb2'
    '1tLlNEQ2FyZEZpbGVzLkZpbGVSBWZpbGVzGnMKBEZpbGUSJgoPdmlkZW9fZmlsZV90aW1lGAEg'
    'ASgNUg12aWRlb0ZpbGVUaW1lEhsKCWZpbGVfbmFtZRgCIAEoCVIIZmlsZU5hbWUSJgoPcGxheV'
    '90b3RhbF90aW1lGAMgASgNUg1wbGF5VG90YWxUaW1l');

@$core.Deprecated('Use configBarrierDescriptor instead')
const ConfigBarrier$json = {
  '1': 'ConfigBarrier',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 9, '10': 'endTime'},
    {'1': 'parking_lots', '3': 4, '4': 1, '5': 13, '10': 'parkingLots'},
    {'1': 'used_lots', '3': 5, '4': 1, '5': 13, '10': 'usedLots'},
  ],
};

/// Descriptor for `ConfigBarrier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configBarrierDescriptor = $convert.base64Decode(
    'Cg1Db25maWdCYXJyaWVyEg4KAm9uGAEgASgIUgJvbhIdCgpzdGFydF90aW1lGAIgASgJUglzdG'
    'FydFRpbWUSGQoIZW5kX3RpbWUYAyABKAlSB2VuZFRpbWUSIQoMcGFya2luZ19sb3RzGAQgASgN'
    'UgtwYXJraW5nTG90cxIbCgl1c2VkX2xvdHMYBSABKA1SCHVzZWRMb3Rz');

@$core.Deprecated('Use inOutCamDescriptor instead')
const InOutCam$json = {
  '1': 'InOutCam',
  '2': [
    {'1': 'in', '3': 1, '4': 1, '5': 12, '10': 'in'},
    {'1': 'out', '3': 2, '4': 1, '5': 12, '10': 'out'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.comm.InOutCam.VehicleType', '10': 'type'},
  ],
  '4': [InOutCam_VehicleType$json],
};

@$core.Deprecated('Use inOutCamDescriptor instead')
const InOutCam_VehicleType$json = {
  '1': 'VehicleType',
  '2': [
    {'1': 'CAR', '2': 0},
    {'1': 'BIKE', '2': 1},
  ],
};

/// Descriptor for `InOutCam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inOutCamDescriptor = $convert.base64Decode(
    'CghJbk91dENhbRIOCgJpbhgBIAEoDFICaW4SEAoDb3V0GAIgASgMUgNvdXQSLgoEdHlwZRgDIA'
    'EoDjIaLmNvbW0uSW5PdXRDYW0uVmVoaWNsZVR5cGVSBHR5cGUiIAoLVmVoaWNsZVR5cGUSBwoD'
    'Q0FSEAASCAoEQklLRRAB');

@$core.Deprecated('Use camTagDescriptor instead')
const CamTag$json = {
  '1': 'CamTag',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 12, '10': 'tagId'},
    {'1': 'tag_name', '3': 2, '4': 1, '5': 9, '10': 'tagName'},
    {'1': 'tag_color', '3': 3, '4': 1, '5': 9, '10': 'tagColor'},
  ],
};

/// Descriptor for `CamTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List camTagDescriptor = $convert.base64Decode(
    'CgZDYW1UYWcSFQoGdGFnX2lkGAEgASgMUgV0YWdJZBIZCgh0YWdfbmFtZRgCIAEoCVIHdGFnTm'
    'FtZRIbCgl0YWdfY29sb3IYAyABKAlSCHRhZ0NvbG9y');

