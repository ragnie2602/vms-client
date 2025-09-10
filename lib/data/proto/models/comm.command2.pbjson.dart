// This is a generated file - do not edit.
//
// Generated from comm.command2.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listAlarmDescriptor instead')
const ListAlarm$json = {
  '1': 'ListAlarm',
  '2': [
    {'1': 'ID', '3': 159, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListAlarm_Request$json, ListAlarm_Reply$json],
};

@$core.Deprecated('Use listAlarmDescriptor instead')
const ListAlarm_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'last_id', '3': 2, '4': 1, '5': 12, '10': 'lastId'},
    {'1': 'count', '3': 3, '4': 1, '5': 13, '10': 'count'},
  ],
};

@$core.Deprecated('Use listAlarmDescriptor instead')
const ListAlarm_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'alarms',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Alarm',
      '10': 'alarms'
    },
    {'1': 'end', '3': 2, '4': 1, '5': 8, '10': 'end'},
  ],
};

/// Descriptor for `ListAlarm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAlarmDescriptor = $convert.base64Decode(
    'CglMaXN0QWxhcm0SDwoCSUQYnwEgASgNUgJJRBpVCgdSZXF1ZXN0EhsKCWNhbWVyYV9pZBgBIA'
    'EoDFIIY2FtZXJhSWQSFwoHbGFzdF9pZBgCIAEoDFIGbGFzdElkEhQKBWNvdW50GAMgASgNUgVj'
    'b3VudBo+CgVSZXBseRIjCgZhbGFybXMYASADKAsyCy5jb21tLkFsYXJtUgZhbGFybXMSEAoDZW'
    '5kGAIgASgIUgNlbmQ=');

@$core.Deprecated('Use deleteAlarmCameraDescriptor instead')
const DeleteAlarmCamera$json = {
  '1': 'DeleteAlarmCamera',
  '2': [
    {'1': 'ID', '3': 160, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteAlarmCamera_Request$json, DeleteAlarmCamera_Reply$json],
};

@$core.Deprecated('Use deleteAlarmCameraDescriptor instead')
const DeleteAlarmCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'alarms', '3': 2, '4': 3, '5': 12, '10': 'alarms'},
  ],
};

@$core.Deprecated('Use deleteAlarmCameraDescriptor instead')
const DeleteAlarmCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'alarms', '3': 1, '4': 3, '5': 12, '10': 'alarms'},
  ],
};

/// Descriptor for `DeleteAlarmCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAlarmCameraDescriptor = $convert.base64Decode(
    'ChFEZWxldGVBbGFybUNhbWVyYRIPCgJJRBigASABKA1SAklEGj4KB1JlcXVlc3QSGwoJY2FtZX'
    'JhX2lkGAEgASgMUghjYW1lcmFJZBIWCgZhbGFybXMYAiADKAxSBmFsYXJtcxofCgVSZXBseRIW'
    'CgZhbGFybXMYASADKAxSBmFsYXJtcw==');

@$core.Deprecated('Use filterAlarmCameraDescriptor instead')
const FilterAlarmCamera$json = {
  '1': 'FilterAlarmCamera',
  '2': [
    {'1': 'ID', '3': 161, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [FilterAlarmCamera_Request$json, FilterAlarmCamera_Reply$json],
  '4': [FilterAlarmCamera_Type$json],
};

@$core.Deprecated('Use filterAlarmCameraDescriptor instead')
const FilterAlarmCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'from_date', '3': 1, '4': 1, '5': 4, '10': 'fromDate'},
    {'1': 'to_date', '3': 2, '4': 1, '5': 4, '10': 'toDate'},
    {'1': 'cameras', '3': 3, '4': 3, '5': 12, '10': 'cameras'},
    {
      '1': 'type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.FilterAlarmCamera.Type',
      '10': 'type'
    },
    {'1': 'last_id', '3': 5, '4': 1, '5': 12, '10': 'lastId'},
    {'1': 'count', '3': 6, '4': 1, '5': 13, '10': 'count'},
  ],
};

@$core.Deprecated('Use filterAlarmCameraDescriptor instead')
const FilterAlarmCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'alarms',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Alarm',
      '10': 'alarms'
    },
    {'1': 'end', '3': 2, '4': 1, '5': 8, '10': 'end'},
  ],
};

@$core.Deprecated('Use filterAlarmCameraDescriptor instead')
const FilterAlarmCamera_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'DETECT_MOTION', '2': 0},
    {'1': 'DETECT_SOUND', '2': 1},
    {'1': 'ALL', '2': 2},
    {'1': 'LINE_CROSSING', '2': 3},
    {'1': 'INTRUSION_DETECTION', '2': 4},
  ],
};

/// Descriptor for `FilterAlarmCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterAlarmCameraDescriptor = $convert.base64Decode(
    'ChFGaWx0ZXJBbGFybUNhbWVyYRIPCgJJRBihASABKA1SAklEGroBCgdSZXF1ZXN0EhsKCWZyb2'
    '1fZGF0ZRgBIAEoBFIIZnJvbURhdGUSFwoHdG9fZGF0ZRgCIAEoBFIGdG9EYXRlEhgKB2NhbWVy'
    'YXMYAyADKAxSB2NhbWVyYXMSMAoEdHlwZRgEIAEoDjIcLmNvbW0uRmlsdGVyQWxhcm1DYW1lcm'
    'EuVHlwZVIEdHlwZRIXCgdsYXN0X2lkGAUgASgMUgZsYXN0SWQSFAoFY291bnQYBiABKA1SBWNv'
    'dW50Gj4KBVJlcGx5EiMKBmFsYXJtcxgBIAMoCzILLmNvbW0uQWxhcm1SBmFsYXJtcxIQCgNlbm'
    'QYAiABKAhSA2VuZCJgCgRUeXBlEhEKDURFVEVDVF9NT1RJT04QABIQCgxERVRFQ1RfU09VTkQQ'
    'ARIHCgNBTEwQAhIRCg1MSU5FX0NST1NTSU5HEAMSFwoTSU5UUlVTSU9OX0RFVEVDVElPThAE');

@$core.Deprecated('Use filterVideoImageCameraDescriptor instead')
const FilterVideoImageCamera$json = {
  '1': 'FilterVideoImageCamera',
  '2': [
    {'1': 'ID', '3': 163, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [FilterVideoImageCamera_Request$json, FilterVideoImageCamera_Reply$json],
  '4': [
    FilterVideoImageCamera_Storage$json,
    FilterVideoImageCamera_Type$json,
    FilterVideoImageCamera_Error$json
  ],
};

@$core.Deprecated('Use filterVideoImageCameraDescriptor instead')
const FilterVideoImageCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'from_date', '3': 2, '4': 1, '5': 4, '10': 'fromDate'},
    {'1': 'to_date', '3': 3, '4': 1, '5': 4, '10': 'toDate'},
    {
      '1': 'type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.FilterVideoImageCamera.Type',
      '10': 'type'
    },
    {
      '1': 'storage',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.comm.FilterVideoImageCamera.Storage',
      '10': 'storage'
    },
    {'1': 'file_id', '3': 6, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'count', '3': 7, '4': 1, '5': 13, '10': 'count'},
    {'1': 'last_id', '3': 8, '4': 1, '5': 12, '10': 'lastId'},
    {
      '1': 'event_type',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.comm.EventType',
      '10': 'eventType'
    },
  ],
};

@$core.Deprecated('Use filterVideoImageCameraDescriptor instead')
const FilterVideoImageCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use filterVideoImageCameraDescriptor instead')
const FilterVideoImageCamera_Storage$json = {
  '1': 'Storage',
  '2': [
    {'1': 'CLOUD_STORAGE', '2': 0},
    {'1': 'SD_CARD', '2': 1},
  ],
};

@$core.Deprecated('Use filterVideoImageCameraDescriptor instead')
const FilterVideoImageCamera_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'VIDEO', '2': 0},
    {'1': 'IMAGE', '2': 1},
  ],
};

@$core.Deprecated('Use filterVideoImageCameraDescriptor instead')
const FilterVideoImageCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_OFFLINE', '2': 1},
  ],
};

/// Descriptor for `FilterVideoImageCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterVideoImageCameraDescriptor = $convert.base64Decode(
    'ChZGaWx0ZXJWaWRlb0ltYWdlQ2FtZXJhEg8KAklEGKMBIAEoDVICSUQaywIKB1JlcXVlc3QSGw'
    'oJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIbCglmcm9tX2RhdGUYAiABKARSCGZyb21EYXRl'
    'EhcKB3RvX2RhdGUYAyABKARSBnRvRGF0ZRI1CgR0eXBlGAQgASgOMiEuY29tbS5GaWx0ZXJWaW'
    'Rlb0ltYWdlQ2FtZXJhLlR5cGVSBHR5cGUSPgoHc3RvcmFnZRgFIAEoDjIkLmNvbW0uRmlsdGVy'
    'VmlkZW9JbWFnZUNhbWVyYS5TdG9yYWdlUgdzdG9yYWdlEhcKB2ZpbGVfaWQYBiABKAlSBmZpbG'
    'VJZBIUCgVjb3VudBgHIAEoDVIFY291bnQSFwoHbGFzdF9pZBgIIAEoDFIGbGFzdElkEi4KCmV2'
    'ZW50X3R5cGUYCSABKA4yDy5jb21tLkV2ZW50VHlwZVIJZXZlbnRUeXBlGiQKBVJlcGx5EhsKCW'
    'NhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQiKQoHU3RvcmFnZRIRCg1DTE9VRF9TVE9SQUdFEAAS'
    'CwoHU0RfQ0FSRBABIhwKBFR5cGUSCQoFVklERU8QABIJCgVJTUFHRRABIi4KBUVycm9yEhEKDU'
    'VSUk9SX0RFRkFVTFQQABISCg5DQU1FUkFfT0ZGTElORRAB');

@$core.Deprecated('Use getConfigCameraDescriptor instead')
const GetConfigCamera$json = {
  '1': 'GetConfigCamera',
  '2': [
    {'1': 'ID', '3': 173, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetConfigCamera_Request$json, GetConfigCamera_Reply$json],
};

@$core.Deprecated('Use getConfigCameraDescriptor instead')
const GetConfigCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use getConfigCameraDescriptor instead')
const GetConfigCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'config',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CameraConfig',
      '10': 'config'
    },
  ],
};

/// Descriptor for `GetConfigCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getConfigCameraDescriptor = $convert.base64Decode(
    'Cg9HZXRDb25maWdDYW1lcmESDwoCSUQYrQEgASgNUgJJRBomCgdSZXF1ZXN0EhsKCWNhbWVyYV'
    '9pZBgBIAEoDFIIY2FtZXJhSWQaMwoFUmVwbHkSKgoGY29uZmlnGAEgASgLMhIuY29tbS5DYW1l'
    'cmFDb25maWdSBmNvbmZpZw==');

@$core.Deprecated('Use responseShareCameraDescriptor instead')
const ResponseShareCamera$json = {
  '1': 'ResponseShareCamera',
  '2': [
    {'1': 'ID', '3': 176, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ResponseShareCamera_Request$json, ResponseShareCamera_Reply$json],
  '4': [ResponseShareCamera_Action$json, ResponseShareCamera_Error$json],
};

@$core.Deprecated('Use responseShareCameraDescriptor instead')
const ResponseShareCamera_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'action',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.comm.ResponseShareCamera.Action',
      '10': 'action'
    },
    {'1': 'invite_msg_id', '3': 2, '4': 1, '5': 12, '10': 'inviteMsgId'},
  ],
};

@$core.Deprecated('Use responseShareCameraDescriptor instead')
const ResponseShareCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use responseShareCameraDescriptor instead')
const ResponseShareCamera_Action$json = {
  '1': 'Action',
  '2': [
    {'1': 'ACCEPT', '2': 0},
    {'1': 'DECLINE', '2': 1},
  ],
};

@$core.Deprecated('Use responseShareCameraDescriptor instead')
const ResponseShareCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'INVALID_SHARE', '2': 1},
  ],
};

/// Descriptor for `ResponseShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseShareCameraDescriptor = $convert.base64Decode(
    'ChNSZXNwb25zZVNoYXJlQ2FtZXJhEg8KAklEGLABIAEoDVICSUQaZwoHUmVxdWVzdBI4CgZhY3'
    'Rpb24YASABKA4yIC5jb21tLlJlc3BvbnNlU2hhcmVDYW1lcmEuQWN0aW9uUgZhY3Rpb24SIgoN'
    'aW52aXRlX21zZ19pZBgCIAEoDFILaW52aXRlTXNnSWQaJAoFUmVwbHkSGwoJY2FtZXJhX2lkGA'
    'EgASgMUghjYW1lcmFJZCIhCgZBY3Rpb24SCgoGQUNDRVBUEAASCwoHREVDTElORRABIi0KBUVy'
    'cm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg1JTlZBTElEX1NIQVJFEAE=');

@$core.Deprecated('Use listShareCameraDescriptor instead')
const ListShareCamera$json = {
  '1': 'ListShareCamera',
  '2': [
    {'1': 'ID', '3': 178, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListShareCamera_Request$json, ListShareCamera_Reply$json],
};

@$core.Deprecated('Use listShareCameraDescriptor instead')
const ListShareCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use listShareCameraDescriptor instead')
const ListShareCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'sharing_records',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.InviteMessage',
      '10': 'sharingRecords'
    },
  ],
};

/// Descriptor for `ListShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listShareCameraDescriptor = $convert.base64Decode(
    'Cg9MaXN0U2hhcmVDYW1lcmESDwoCSUQYsgEgASgNUgJJRBomCgdSZXF1ZXN0EhsKCWNhbWVyYV'
    '9pZBgBIAEoDFIIY2FtZXJhSWQaRQoFUmVwbHkSPAoPc2hhcmluZ19yZWNvcmRzGAEgAygLMhMu'
    'Y29tbS5JbnZpdGVNZXNzYWdlUg5zaGFyaW5nUmVjb3Jkcw==');

@$core.Deprecated('Use updateShareCameraDescriptor instead')
const UpdateShareCamera$json = {
  '1': 'UpdateShareCamera',
  '2': [
    {'1': 'ID', '3': 179, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateShareCamera_Request$json, UpdateShareCamera_Reply$json],
  '4': [UpdateShareCamera_Role$json, UpdateShareCamera_Error$json],
};

@$core.Deprecated('Use updateShareCameraDescriptor instead')
const UpdateShareCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.UpdateShareCamera.Role',
      '10': 'role'
    },
    {'1': 'account_b', '3': 3, '4': 1, '5': 9, '10': 'accountB'},
    {'1': 'invite_msg_id', '3': 4, '4': 1, '5': 12, '10': 'inviteMsgId'},
  ],
};

@$core.Deprecated('Use updateShareCameraDescriptor instead')
const UpdateShareCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use updateShareCameraDescriptor instead')
const UpdateShareCamera_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'FULL', '2': 1},
  ],
};

@$core.Deprecated('Use updateShareCameraDescriptor instead')
const UpdateShareCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'ROLE_NOT_CHANGE', '2': 1},
    {'1': 'ACCOUNT_SHARED_NOT_EXIST', '2': 2},
  ],
};

/// Descriptor for `UpdateShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateShareCameraDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVTaGFyZUNhbWVyYRIPCgJJRBizASABKA1SAklEGpkBCgdSZXF1ZXN0EhsKCWNhbW'
    'VyYV9pZBgBIAEoDFIIY2FtZXJhSWQSMAoEcm9sZRgCIAEoDjIcLmNvbW0uVXBkYXRlU2hhcmVD'
    'YW1lcmEuUm9sZVIEcm9sZRIbCglhY2NvdW50X2IYAyABKAlSCGFjY291bnRCEiIKDWludml0ZV'
    '9tc2dfaWQYBCABKAxSC2ludml0ZU1zZ0lkGiQKBVJlcGx5EhsKCWNhbWVyYV9pZBgBIAEoDFII'
    'Y2FtZXJhSWQiGgoEUm9sZRIICgRWSUVXEAASCAoERlVMTBABIk0KBUVycm9yEhEKDUVSUk9SX0'
    'RFRkFVTFQQABITCg9ST0xFX05PVF9DSEFOR0UQARIcChhBQ0NPVU5UX1NIQVJFRF9OT1RfRVhJ'
    'U1QQAg==');

@$core.Deprecated('Use deleteShareCameraDescriptor instead')
const DeleteShareCamera$json = {
  '1': 'DeleteShareCamera',
  '2': [
    {'1': 'ID', '3': 180, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteShareCamera_Request$json, DeleteShareCamera_Reply$json],
  '4': [DeleteShareCamera_Error$json],
};

@$core.Deprecated('Use deleteShareCameraDescriptor instead')
const DeleteShareCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'account_b', '3': 2, '4': 1, '5': 9, '10': 'accountB'},
    {'1': 'share_id', '3': 3, '4': 1, '5': 12, '10': 'shareId'},
  ],
};

@$core.Deprecated('Use deleteShareCameraDescriptor instead')
const DeleteShareCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'share_id', '3': 2, '4': 1, '5': 12, '10': 'shareId'},
  ],
};

@$core.Deprecated('Use deleteShareCameraDescriptor instead')
const DeleteShareCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'INVALID_SHARE', '2': 1},
  ],
};

/// Descriptor for `DeleteShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteShareCameraDescriptor = $convert.base64Decode(
    'ChFEZWxldGVTaGFyZUNhbWVyYRIPCgJJRBi0ASABKA1SAklEGl4KB1JlcXVlc3QSGwoJY2FtZX'
    'JhX2lkGAEgASgMUghjYW1lcmFJZBIbCglhY2NvdW50X2IYAiABKAlSCGFjY291bnRCEhkKCHNo'
    'YXJlX2lkGAMgASgMUgdzaGFyZUlkGj8KBVJlcGx5EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZX'
    'JhSWQSGQoIc2hhcmVfaWQYAiABKAxSB3NoYXJlSWQiLQoFRXJyb3ISEQoNRVJST1JfREVGQVVM'
    'VBAAEhEKDUlOVkFMSURfU0hBUkUQAQ==');

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera$json = {
  '1': 'ListSharedCamera',
  '2': [
    {'1': 'ID', '3': 181, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    ListSharedCamera_ShareData$json,
    ListSharedCamera_ShareGroupData$json,
    ListSharedCamera_SharingRecord$json,
    ListSharedCamera_Request$json,
    ListSharedCamera_Reply$json
  ],
  '4': [
    ListSharedCamera_Role$json,
    ListSharedCamera_GroupShareRole$json,
    ListSharedCamera_Status$json
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_ShareData$json = {
  '1': 'ShareData',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'camera_name', '3': 2, '4': 1, '5': 9, '10': 'cameraName'},
    {
      '1': 'role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.ListSharedCamera.Role',
      '10': 'role'
    },
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.ListSharedCamera.Status',
      '10': 'status'
    },
    {'1': 'time', '3': 5, '4': 1, '5': 4, '10': 'time'},
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_ShareGroupData$json = {
  '1': 'ShareGroupData',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    {
      '1': 'role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.ListSharedCamera.GroupShareRole',
      '10': 'role'
    },
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.ListSharedCamera.Status',
      '10': 'status'
    },
    {'1': 'time', '3': 5, '4': 1, '5': 4, '10': 'time'},
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_SharingRecord$json = {
  '1': 'SharingRecord',
  '2': [
    {
      '1': 'account_a',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Profile',
      '10': 'accountA'
    },
    {
      '1': 'account_b',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.Profile',
      '10': 'accountB'
    },
    {
      '1': 'share_data',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.comm.ListSharedCamera.ShareData',
      '10': 'shareData'
    },
    {'1': 'invite_msg_id', '3': 4, '4': 1, '5': 12, '10': 'inviteMsgId'},
    {
      '1': 'shareType',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.comm.ListSharedCamera.SharingRecord.ShareType',
      '10': 'shareType'
    },
    {
      '1': 'share_group_data',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.comm.ListSharedCamera.ShareGroupData',
      '10': 'shareGroupData'
    },
  ],
  '4': [ListSharedCamera_SharingRecord_ShareType$json],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_SharingRecord_ShareType$json = {
  '1': 'ShareType',
  '2': [
    {'1': 'CAMERA', '2': 0},
    {'1': 'GROUP', '2': 1},
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'loadGroupShare', '3': 1, '4': 1, '5': 8, '10': 'loadGroupShare'},
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'sharing_records',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.ListSharedCamera.SharingRecord',
      '10': 'sharingRecords'
    },
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'FULL', '2': 1},
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': '_NOT_USE', '2': 0},
    {'1': 'GVIEW', '2': 1},
    {'1': 'GMANAGER', '2': 2},
  ],
};

@$core.Deprecated('Use listSharedCameraDescriptor instead')
const ListSharedCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'PENDING', '2': 0},
    {'1': 'ACCEPT', '2': 1},
    {'1': 'DELINE', '2': 2},
  ],
};

/// Descriptor for `ListSharedCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSharedCameraDescriptor = $convert.base64Decode(
    'ChBMaXN0U2hhcmVkQ2FtZXJhEg8KAklEGLUBIAEoDVICSUQaxQEKCVNoYXJlRGF0YRIbCgljYW'
    '1lcmFfaWQYASABKAxSCGNhbWVyYUlkEh8KC2NhbWVyYV9uYW1lGAIgASgJUgpjYW1lcmFOYW1l'
    'Ei8KBHJvbGUYAyABKA4yGy5jb21tLkxpc3RTaGFyZWRDYW1lcmEuUm9sZVIEcm9sZRI1CgZzdG'
    'F0dXMYBCABKA4yHS5jb21tLkxpc3RTaGFyZWRDYW1lcmEuU3RhdHVzUgZzdGF0dXMSEgoEdGlt'
    'ZRgFIAEoBFIEdGltZRrQAQoOU2hhcmVHcm91cERhdGESGQoIZ3JvdXBfaWQYASABKAxSB2dyb3'
    'VwSWQSHQoKZ3JvdXBfbmFtZRgCIAEoCVIJZ3JvdXBOYW1lEjkKBHJvbGUYAyABKA4yJS5jb21t'
    'Lkxpc3RTaGFyZWRDYW1lcmEuR3JvdXBTaGFyZVJvbGVSBHJvbGUSNQoGc3RhdHVzGAQgASgOMh'
    '0uY29tbS5MaXN0U2hhcmVkQ2FtZXJhLlN0YXR1c1IGc3RhdHVzEhIKBHRpbWUYBSABKARSBHRp'
    'bWUajwMKDVNoYXJpbmdSZWNvcmQSKgoJYWNjb3VudF9hGAEgASgLMg0uY29tbS5Qcm9maWxlUg'
    'hhY2NvdW50QRIqCglhY2NvdW50X2IYAiABKAsyDS5jb21tLlByb2ZpbGVSCGFjY291bnRCEj8K'
    'CnNoYXJlX2RhdGEYAyABKAsyIC5jb21tLkxpc3RTaGFyZWRDYW1lcmEuU2hhcmVEYXRhUglzaG'
    'FyZURhdGESIgoNaW52aXRlX21zZ19pZBgEIAEoDFILaW52aXRlTXNnSWQSTAoJc2hhcmVUeXBl'
    'GAUgASgOMi4uY29tbS5MaXN0U2hhcmVkQ2FtZXJhLlNoYXJpbmdSZWNvcmQuU2hhcmVUeXBlUg'
    'lzaGFyZVR5cGUSTwoQc2hhcmVfZ3JvdXBfZGF0YRgGIAEoCzIlLmNvbW0uTGlzdFNoYXJlZENh'
    'bWVyYS5TaGFyZUdyb3VwRGF0YVIOc2hhcmVHcm91cERhdGEiIgoJU2hhcmVUeXBlEgoKBkNBTU'
    'VSQRAAEgkKBUdST1VQEAEaMQoHUmVxdWVzdBImCg5sb2FkR3JvdXBTaGFyZRgBIAEoCFIObG9h'
    'ZEdyb3VwU2hhcmUaVgoFUmVwbHkSTQoPc2hhcmluZ19yZWNvcmRzGAEgAygLMiQuY29tbS5MaX'
    'N0U2hhcmVkQ2FtZXJhLlNoYXJpbmdSZWNvcmRSDnNoYXJpbmdSZWNvcmRzIhoKBFJvbGUSCAoE'
    'VklFVxAAEggKBEZVTEwQASI3Cg5Hcm91cFNoYXJlUm9sZRIMCghfTk9UX1VTRRAAEgkKBUdWSU'
    'VXEAESDAoIR01BTkFHRVIQAiItCgZTdGF0dXMSCwoHUEVORElORxAAEgoKBkFDQ0VQVBABEgoK'
    'BkRFTElORRAC');

@$core.Deprecated('Use getTimeShiftVideoCloudCameraDescriptor instead')
const GetTimeShiftVideoCloudCamera$json = {
  '1': 'GetTimeShiftVideoCloudCamera',
  '2': [
    {'1': 'ID', '3': 182, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    GetTimeShiftVideoCloudCamera_PlaybackVideo$json,
    GetTimeShiftVideoCloudCamera_Request$json,
    GetTimeShiftVideoCloudCamera_Reply$json
  ],
  '4': [GetTimeShiftVideoCloudCamera_Error$json],
};

@$core.Deprecated('Use getTimeShiftVideoCloudCameraDescriptor instead')
const GetTimeShiftVideoCloudCamera_PlaybackVideo$json = {
  '1': 'PlaybackVideo',
  '2': [
    {'1': 'start_time', '3': 1, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'end_time', '3': 2, '4': 1, '5': 4, '10': 'endTime'},
    {'1': 'url_playback', '3': 4, '4': 1, '5': 9, '10': 'urlPlayback'},
    {'1': 'camera_id', '3': 5, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'url_thumbnail', '3': 6, '4': 1, '5': 9, '10': 'urlThumbnail'},
    {'1': 'duration', '3': 7, '4': 1, '5': 13, '10': 'duration'},
    {'1': 'playback_id', '3': 8, '4': 1, '5': 12, '10': 'playbackId'},
  ],
};

@$core.Deprecated('Use getTimeShiftVideoCloudCameraDescriptor instead')
const GetTimeShiftVideoCloudCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'current_time', '3': 2, '4': 1, '5': 4, '10': 'currentTime'},
    {'1': 'time_zone', '3': 3, '4': 1, '5': 13, '10': 'timeZone'},
    {'1': 'camera_id_list', '3': 4, '4': 3, '5': 12, '10': 'cameraIdList'},
  ],
};

@$core.Deprecated('Use getTimeShiftVideoCloudCameraDescriptor instead')
const GetTimeShiftVideoCloudCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'videos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.GetTimeShiftVideoCloudCamera.PlaybackVideo',
      '10': 'videos'
    },
    {
      '1': 'events',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.Event',
      '10': 'events'
    },
  ],
};

@$core.Deprecated('Use getTimeShiftVideoCloudCameraDescriptor instead')
const GetTimeShiftVideoCloudCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `GetTimeShiftVideoCloudCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTimeShiftVideoCloudCameraDescriptor = $convert.base64Decode(
    'ChxHZXRUaW1lU2hpZnRWaWRlb0Nsb3VkQ2FtZXJhEg8KAklEGLYBIAEoDVICSUQa6wEKDVBsYX'
    'liYWNrVmlkZW8SHQoKc3RhcnRfdGltZRgBIAEoBFIJc3RhcnRUaW1lEhkKCGVuZF90aW1lGAIg'
    'ASgEUgdlbmRUaW1lEiEKDHVybF9wbGF5YmFjaxgEIAEoCVILdXJsUGxheWJhY2sSGwoJY2FtZX'
    'JhX2lkGAUgASgMUghjYW1lcmFJZBIjCg11cmxfdGh1bWJuYWlsGAYgASgJUgx1cmxUaHVtYm5h'
    'aWwSGgoIZHVyYXRpb24YByABKA1SCGR1cmF0aW9uEh8KC3BsYXliYWNrX2lkGAggASgMUgpwbG'
    'F5YmFja0lkGowBCgdSZXF1ZXN0EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSIQoMY3Vy'
    'cmVudF90aW1lGAIgASgEUgtjdXJyZW50VGltZRIbCgl0aW1lX3pvbmUYAyABKA1SCHRpbWVab2'
    '5lEiQKDmNhbWVyYV9pZF9saXN0GAQgAygMUgxjYW1lcmFJZExpc3QadgoFUmVwbHkSSAoGdmlk'
    'ZW9zGAEgAygLMjAuY29tbS5HZXRUaW1lU2hpZnRWaWRlb0Nsb3VkQ2FtZXJhLlBsYXliYWNrVm'
    'lkZW9SBnZpZGVvcxIjCgZldmVudHMYAiADKAsyCy5jb21tLkV2ZW50UgZldmVudHMiQgoFRXJy'
    'b3ISCwoHREVGQVVMVBAAEhMKD0NBTUVSQV9JRF9FTVBUWRABEhcKE0NBTUVSQV9JRF9OT1RfRk'
    '9VTkQQAg==');

@$core.Deprecated('Use settingCloudStorageDescriptor instead')
const SettingCloudStorage$json = {
  '1': 'SettingCloudStorage',
  '2': [
    {'1': 'ID', '3': 183, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [SettingCloudStorage_Request$json, SettingCloudStorage_Reply$json],
  '4': [SettingCloudStorage_StorageMode$json, SettingCloudStorage_Error$json],
};

@$core.Deprecated('Use settingCloudStorageDescriptor instead')
const SettingCloudStorage_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'power', '3': 2, '4': 1, '5': 8, '10': 'power'},
    {
      '1': 'storage_mode',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.SettingCloudStorage.StorageMode',
      '10': 'storageMode'
    },
    {'1': 'number_days', '3': 4, '4': 1, '5': 13, '10': 'numberDays'},
    {
      '1': 'use_default_account_setting',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'useDefaultAccountSetting'
    },
  ],
};

@$core.Deprecated('Use settingCloudStorageDescriptor instead')
const SettingCloudStorage_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use settingCloudStorageDescriptor instead')
const SettingCloudStorage_StorageMode$json = {
  '1': 'StorageMode',
  '2': [
    {'1': 'CLOUD', '2': 0},
    {'1': 'CLOUD_AND_SDCARD', '2': 1},
  ],
};

@$core.Deprecated('Use settingCloudStorageDescriptor instead')
const SettingCloudStorage_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_INVLID', '2': 1},
    {'1': 'NUMBER_DAY_RECORD_INVALID', '2': 3},
    {'1': 'STORAGE_MODE_INVALID', '2': 4},
  ],
};

/// Descriptor for `SettingCloudStorage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingCloudStorageDescriptor = $convert.base64Decode(
    'ChNTZXR0aW5nQ2xvdWRTdG9yYWdlEg8KAklEGLcBIAEoDVICSUQa5gEKB1JlcXVlc3QSGwoJY2'
    'FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIUCgVwb3dlchgCIAEoCFIFcG93ZXISSAoMc3RvcmFn'
    'ZV9tb2RlGAMgASgOMiUuY29tbS5TZXR0aW5nQ2xvdWRTdG9yYWdlLlN0b3JhZ2VNb2RlUgtzdG'
    '9yYWdlTW9kZRIfCgtudW1iZXJfZGF5cxgEIAEoDVIKbnVtYmVyRGF5cxI9Cht1c2VfZGVmYXVs'
    'dF9hY2NvdW50X3NldHRpbmcYBSABKAhSGHVzZURlZmF1bHRBY2NvdW50U2V0dGluZxokCgVSZX'
    'BseRIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkIi4KC1N0b3JhZ2VNb2RlEgkKBUNMT1VE'
    'EAASFAoQQ0xPVURfQU5EX1NEQ0FSRBABImkKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIUCh'
    'BDQU1FUkFfSURfSU5WTElEEAESHQoZTlVNQkVSX0RBWV9SRUNPUkRfSU5WQUxJRBADEhgKFFNU'
    'T1JBR0VfTU9ERV9JTlZBTElEEAQ=');

@$core.Deprecated('Use updateCameraPositionDescriptor instead')
const UpdateCameraPosition$json = {
  '1': 'UpdateCameraPosition',
  '2': [
    {'1': 'ID', '3': 185, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    UpdateCameraPosition_CamPosition$json,
    UpdateCameraPosition_Request$json,
    UpdateCameraPosition_Reply$json
  ],
};

@$core.Deprecated('Use updateCameraPositionDescriptor instead')
const UpdateCameraPosition_CamPosition$json = {
  '1': 'CamPosition',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'position', '3': 2, '4': 1, '5': 13, '10': 'position'},
  ],
};

@$core.Deprecated('Use updateCameraPositionDescriptor instead')
const UpdateCameraPosition_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'cam_position',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.UpdateCameraPosition.CamPosition',
      '10': 'camPosition'
    },
  ],
};

@$core.Deprecated('Use updateCameraPositionDescriptor instead')
const UpdateCameraPosition_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'cameras',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'cameras'
    },
  ],
};

/// Descriptor for `UpdateCameraPosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCameraPositionDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDYW1lcmFQb3NpdGlvbhIPCgJJRBi5ASABKA1SAklEGkYKC0NhbVBvc2l0aW9uEh'
    'sKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGgoIcG9zaXRpb24YAiABKA1SCHBvc2l0aW9u'
    'GlQKB1JlcXVlc3QSSQoMY2FtX3Bvc2l0aW9uGAEgAygLMiYuY29tbS5VcGRhdGVDYW1lcmFQb3'
    'NpdGlvbi5DYW1Qb3NpdGlvblILY2FtUG9zaXRpb24aLwoFUmVwbHkSJgoHY2FtZXJhcxgBIAMo'
    'CzIMLmNvbW0uQ2FtZXJhUgdjYW1lcmFz');

@$core.Deprecated('Use addCameraRTSPDescriptor instead')
const AddCameraRTSP$json = {
  '1': 'AddCameraRTSP',
  '2': [
    {'1': 'ID', '3': 192, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCameraRTSP_Request$json, AddCameraRTSP_Reply$json],
  '4': [AddCameraRTSP_Error$json],
};

@$core.Deprecated('Use addCameraRTSPDescriptor instead')
const AddCameraRTSP_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'rtsp_url', '3': 4, '4': 1, '5': 9, '10': 'rtspUrl'},
    {
      '1': 'location',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.comm.MapLocation',
      '10': 'location'
    },
    {'1': 'box_id', '3': 6, '4': 1, '5': 12, '10': 'boxId'},
    {'1': 'group_id', '3': 7, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'sub_stream_urls', '3': 8, '4': 3, '5': 9, '10': 'subStreamUrls'},
  ],
};

@$core.Deprecated('Use addCameraRTSPDescriptor instead')
const AddCameraRTSP_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'camera',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use addCameraRTSPDescriptor instead')
const AddCameraRTSP_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'RTSP_EMPTY', '2': 1},
    {'1': 'USER_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_NAME_EMPTY', '2': 3},
    {'1': 'IP_OR_DOMAIN_NOT_AVAILABLE', '2': 4},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 5},
    {'1': 'CAMERA_PORT_ERROR', '2': 6},
    {'1': 'CAMERA_EXIST', '2': 7},
    {'1': 'LOCATION_INVALID', '2': 8},
    {'1': 'CAMERA_NAME_EXIST', '2': 9},
    {'1': 'BOX_ID_INVALID', '2': 10},
    {'1': 'BOX_OFFLINE', '2': 11},
    {'1': 'OVER_QUOTA', '2': 12},
    {'1': 'GROUP_INVALID', '2': 13},
    {'1': 'PACKAGE_NOT_SUPPORT', '2': 14},
    {'1': 'SUB_STREAM_INVALID', '2': 15},
  ],
};

/// Descriptor for `AddCameraRTSP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraRTSPDescriptor = $convert.base64Decode(
    'Cg1BZGRDYW1lcmFSVFNQEg8KAklEGMABIAEoDVICSUQa+QEKB1JlcXVlc3QSEgoEbmFtZRgBIA'
    'EoCVIEbmFtZRIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAyABKAlS'
    'CHBhc3N3b3JkEhkKCHJ0c3BfdXJsGAQgASgJUgdydHNwVXJsEi0KCGxvY2F0aW9uGAUgASgLMh'
    'EuY29tbS5NYXBMb2NhdGlvblIIbG9jYXRpb24SFQoGYm94X2lkGAYgASgMUgVib3hJZBIZCghn'
    'cm91cF9pZBgHIAEoDFIHZ3JvdXBJZBImCg9zdWJfc3RyZWFtX3VybHMYCCADKAlSDXN1YlN0cm'
    'VhbVVybHMaSgoFUmVwbHkSGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIkCgZjYW1lcmEY'
    'AiABKAsyDC5jb21tLkNhbWVyYVIGY2FtZXJhIuUCCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEA'
    'ASDgoKUlRTUF9FTVBUWRABEhIKDlVTRVJfTk9UX0ZPVU5EEAISFQoRQ0FNRVJBX05BTUVfRU1Q'
    'VFkQAxIeChpJUF9PUl9ET01BSU5fTk9UX0FWQUlMQUJMRRAEEh8KG1VTRVJfTkFNRV9PUl9QQV'
    'NTV09SRF9FUlJPUhAFEhUKEUNBTUVSQV9QT1JUX0VSUk9SEAYSEAoMQ0FNRVJBX0VYSVNUEAcS'
    'FAoQTE9DQVRJT05fSU5WQUxJRBAIEhUKEUNBTUVSQV9OQU1FX0VYSVNUEAkSEgoOQk9YX0lEX0'
    'lOVkFMSUQQChIPCgtCT1hfT0ZGTElORRALEg4KCk9WRVJfUVVPVEEQDBIRCg1HUk9VUF9JTlZB'
    'TElEEA0SFwoTUEFDS0FHRV9OT1RfU1VQUE9SVBAOEhYKElNVQl9TVFJFQU1fSU5WQUxJRBAP');

@$core.Deprecated('Use addCameraOnVifDescriptor instead')
const AddCameraOnVif$json = {
  '1': 'AddCameraOnVif',
  '2': [
    {'1': 'ID', '3': 199, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCameraOnVif_Request$json, AddCameraOnVif_Reply$json],
  '4': [AddCameraOnVif_Error$json],
};

@$core.Deprecated('Use addCameraOnVifDescriptor instead')
const AddCameraOnVif_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'onvif_device_ip', '3': 4, '4': 1, '5': 9, '10': 'onvifDeviceIp'},
    {'1': 'rtsp_url', '3': 5, '4': 1, '5': 9, '10': 'rtspUrl'},
    {'1': 'serialNumber', '3': 6, '4': 1, '5': 9, '10': 'serialNumber'},
    {
      '1': 'location',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.comm.MapLocation',
      '10': 'location'
    },
    {'1': 'box_id', '3': 8, '4': 1, '5': 12, '10': 'boxId'},
    {'1': 'group_id', '3': 9, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'urn', '3': 10, '4': 1, '5': 9, '10': 'urn'},
    {'1': 'sub_stream_urls', '3': 11, '4': 3, '5': 9, '10': 'subStreamUrls'},
  ],
};

@$core.Deprecated('Use addCameraOnVifDescriptor instead')
const AddCameraOnVif_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'camera',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use addCameraOnVifDescriptor instead')
const AddCameraOnVif_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'RTSP_EMPTY', '2': 1},
    {'1': 'USER_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_NAME_EMPTY', '2': 3},
    {'1': 'IP_OR_DOMAIN_NOT_AVAILABLE', '2': 4},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 5},
    {'1': 'SERIAL_NUMBER_EMPTY', '2': 6},
    {'1': 'CAMERA_EXIST', '2': 7},
    {'1': 'RTSP_PORT_ERROR', '2': 8},
    {'1': 'LOCATION_INVALID', '2': 9},
    {'1': 'CAMERA_NAME_EXIST', '2': 10},
    {'1': 'SERIAL_NUMBER_NOT_MATH', '2': 11},
    {'1': 'BOX_ID_INVALID', '2': 12},
    {'1': 'BOX_OFFLINE', '2': 13},
    {'1': 'RTSP_IP_OR_DOMAIN_NOT_AVAILABLE', '2': 14},
    {'1': 'RTSP_USER_NAME_OR_PASSWORD_ERROR', '2': 15},
    {'1': 'OVER_QUOTA', '2': 16},
    {'1': 'GROUP_INVALID', '2': 17},
    {'1': 'PACKAGE_NOT_SUPPORT', '2': 18},
    {'1': 'SUB_STREAM_INVALID', '2': 19},
  ],
};

/// Descriptor for `AddCameraOnVif`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraOnVifDescriptor = $convert.base64Decode(
    'Cg5BZGRDYW1lcmFPblZpZhIPCgJJRBjHASABKA1SAklEGtcCCgdSZXF1ZXN0EhIKBG5hbWUYAS'
    'ABKAlSBG5hbWUSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAMgASgJ'
    'UghwYXNzd29yZBImCg9vbnZpZl9kZXZpY2VfaXAYBCABKAlSDW9udmlmRGV2aWNlSXASGQoIcn'
    'RzcF91cmwYBSABKAlSB3J0c3BVcmwSIgoMc2VyaWFsTnVtYmVyGAYgASgJUgxzZXJpYWxOdW1i'
    'ZXISLQoIbG9jYXRpb24YByABKAsyES5jb21tLk1hcExvY2F0aW9uUghsb2NhdGlvbhIVCgZib3'
    'hfaWQYCCABKAxSBWJveElkEhkKCGdyb3VwX2lkGAkgASgMUgdncm91cElkEhAKA3VybhgKIAEo'
    'CVIDdXJuEiYKD3N1Yl9zdHJlYW1fdXJscxgLIAMoCVINc3ViU3RyZWFtVXJscxpKCgVSZXBseR'
    'IbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEiQKBmNhbWVyYRgCIAEoCzIMLmNvbW0uQ2Ft'
    'ZXJhUgZjYW1lcmEi4wMKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIOCgpSVFNQX0VNUFRZEA'
    'ESEgoOVVNFUl9OT1RfRk9VTkQQAhIVChFDQU1FUkFfTkFNRV9FTVBUWRADEh4KGklQX09SX0RP'
    'TUFJTl9OT1RfQVZBSUxBQkxFEAQSHwobVVNFUl9OQU1FX09SX1BBU1NXT1JEX0VSUk9SEAUSFw'
    'oTU0VSSUFMX05VTUJFUl9FTVBUWRAGEhAKDENBTUVSQV9FWElTVBAHEhMKD1JUU1BfUE9SVF9F'
    'UlJPUhAIEhQKEExPQ0FUSU9OX0lOVkFMSUQQCRIVChFDQU1FUkFfTkFNRV9FWElTVBAKEhoKFl'
    'NFUklBTF9OVU1CRVJfTk9UX01BVEgQCxISCg5CT1hfSURfSU5WQUxJRBAMEg8KC0JPWF9PRkZM'
    'SU5FEA0SIwofUlRTUF9JUF9PUl9ET01BSU5fTk9UX0FWQUlMQUJMRRAOEiQKIFJUU1BfVVNFUl'
    '9OQU1FX09SX1BBU1NXT1JEX0VSUk9SEA8SDgoKT1ZFUl9RVU9UQRAQEhEKDUdST1VQX0lOVkFM'
    'SUQQERIXChNQQUNLQUdFX05PVF9TVVBQT1JUEBISFgoSU1VCX1NUUkVBTV9JTlZBTElEEBM=');

@$core.Deprecated('Use getCloudRecordPlaybackDescriptor instead')
const GetCloudRecordPlayback$json = {
  '1': 'GetCloudRecordPlayback',
  '2': [
    {'1': 'ID', '3': 193, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    GetCloudRecordPlayback_PlaybackVideo$json,
    GetCloudRecordPlayback_Request$json,
    GetCloudRecordPlayback_Reply$json
  ],
  '4': [GetCloudRecordPlayback_Error$json],
};

@$core.Deprecated('Use getCloudRecordPlaybackDescriptor instead')
const GetCloudRecordPlayback_PlaybackVideo$json = {
  '1': 'PlaybackVideo',
  '2': [
    {'1': 'start_time', '3': 1, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'end_time', '3': 2, '4': 1, '5': 4, '10': 'endTime'},
    {'1': 'url_playback', '3': 4, '4': 1, '5': 9, '10': 'urlPlayback'},
    {'1': 'camera_id', '3': 5, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'url_thumbnail', '3': 6, '4': 1, '5': 9, '10': 'urlThumbnail'},
    {'1': 'duration', '3': 7, '4': 1, '5': 13, '10': 'duration'},
    {'1': 'playback_id', '3': 8, '4': 1, '5': 12, '10': 'playbackId'},
  ],
};

@$core.Deprecated('Use getCloudRecordPlaybackDescriptor instead')
const GetCloudRecordPlayback_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 4, '10': 'endTime'},
    {'1': 'count', '3': 4, '4': 1, '5': 13, '10': 'count'},
    {
      '1': 'lastPlaybackVideoID',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'lastPlaybackVideoID'
    },
  ],
};

@$core.Deprecated('Use getCloudRecordPlaybackDescriptor instead')
const GetCloudRecordPlayback_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'number_day_of_record',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'numberDayOfRecord'
    },
    {
      '1': 'videos',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.comm.GetCloudRecordPlayback.PlaybackVideo',
      '10': 'videos'
    },
    {'1': 'isEnd', '3': 4, '4': 1, '5': 8, '10': 'isEnd'},
  ],
};

@$core.Deprecated('Use getCloudRecordPlaybackDescriptor instead')
const GetCloudRecordPlayback_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `GetCloudRecordPlayback`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCloudRecordPlaybackDescriptor = $convert.base64Decode(
    'ChZHZXRDbG91ZFJlY29yZFBsYXliYWNrEg8KAklEGMEBIAEoDVICSUQa6wEKDVBsYXliYWNrVm'
    'lkZW8SHQoKc3RhcnRfdGltZRgBIAEoBFIJc3RhcnRUaW1lEhkKCGVuZF90aW1lGAIgASgEUgdl'
    'bmRUaW1lEiEKDHVybF9wbGF5YmFjaxgEIAEoCVILdXJsUGxheWJhY2sSGwoJY2FtZXJhX2lkGA'
    'UgASgMUghjYW1lcmFJZBIjCg11cmxfdGh1bWJuYWlsGAYgASgJUgx1cmxUaHVtYm5haWwSGgoI'
    'ZHVyYXRpb24YByABKA1SCGR1cmF0aW9uEh8KC3BsYXliYWNrX2lkGAggASgMUgpwbGF5YmFja0'
    'lkGqgBCgdSZXF1ZXN0EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSHQoKc3RhcnRfdGlt'
    'ZRgCIAEoBFIJc3RhcnRUaW1lEhkKCGVuZF90aW1lGAMgASgEUgdlbmRUaW1lEhQKBWNvdW50GA'
    'QgASgNUgVjb3VudBIwChNsYXN0UGxheWJhY2tWaWRlb0lEGAUgASgMUhNsYXN0UGxheWJhY2tW'
    'aWRlb0lEGq8BCgVSZXBseRIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEi8KFG51bWJlcl'
    '9kYXlfb2ZfcmVjb3JkGAIgASgNUhFudW1iZXJEYXlPZlJlY29yZBJCCgZ2aWRlb3MYAyADKAsy'
    'Ki5jb21tLkdldENsb3VkUmVjb3JkUGxheWJhY2suUGxheWJhY2tWaWRlb1IGdmlkZW9zEhQKBW'
    'lzRW5kGAQgASgIUgVpc0VuZCJFCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEwoPQ0FNRVJB'
    'X0lEX0VNUFRZEAESFAoQQ0FNRVJBX05PVF9GT1VORBAC');

@$core.Deprecated('Use getEventCloudDescriptor instead')
const GetEventCloud$json = {
  '1': 'GetEventCloud',
  '2': [
    {'1': 'ID', '3': 194, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetEventCloud_Request$json, GetEventCloud_Reply$json],
  '4': [GetEventCloud_ALPR_Vehicle_Type$json, GetEventCloud_Error$json],
};

@$core.Deprecated('Use getEventCloudDescriptor instead')
const GetEventCloud_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 3, '5': 12, '10': 'cameraId'},
    {
      '1': 'types',
      '3': 2,
      '4': 3,
      '5': 14,
      '6': '.comm.EventType',
      '10': 'types'
    },
    {'1': 'from_date', '3': 3, '4': 1, '5': 4, '10': 'fromDate'},
    {'1': 'to_date', '3': 4, '4': 1, '5': 4, '10': 'toDate'},
    {'1': 'last_id', '3': 5, '4': 1, '5': 12, '10': 'lastId'},
    {'1': 'count', '3': 6, '4': 1, '5': 13, '10': 'count'},
    {
      '1': 'vehicle_Type',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.comm.GetEventCloud.ALPR_Vehicle_Type',
      '10': 'vehicleType'
    },
    {'1': 'vehicle_plate', '3': 8, '4': 1, '5': 9, '10': 'vehiclePlate'},
    {'1': 'isExportExcel', '3': 9, '4': 1, '5': 8, '10': 'isExportExcel'},
  ],
};

@$core.Deprecated('Use getEventCloudDescriptor instead')
const GetEventCloud_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'isEnd', '3': 1, '4': 1, '5': 8, '10': 'isEnd'},
    {
      '1': 'events',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.Event',
      '10': 'events'
    },
    {'1': 'xlsx_url', '3': 3, '4': 1, '5': 9, '10': 'xlsxUrl'},
  ],
};

@$core.Deprecated('Use getEventCloudDescriptor instead')
const GetEventCloud_ALPR_Vehicle_Type$json = {
  '1': 'ALPR_Vehicle_Type',
  '2': [
    {'1': 'ALL', '2': 0},
    {'1': 'CAR', '2': 1},
    {'1': 'TRUCK', '2': 2},
    {'1': 'MOTORBIKE', '2': 3},
  ],
};

@$core.Deprecated('Use getEventCloudDescriptor instead')
const GetEventCloud_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'USER_NOT_FOUND', '2': 1},
    {'1': 'FORM_DATE_TO_DATE_INVALID', '2': 2},
  ],
};

/// Descriptor for `GetEventCloud`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEventCloudDescriptor = $convert.base64Decode(
    'Cg1HZXRFdmVudENsb3VkEg8KAklEGMIBIAEoDVICSUQaxwIKB1JlcXVlc3QSGwoJY2FtZXJhX2'
    'lkGAEgAygMUghjYW1lcmFJZBIlCgV0eXBlcxgCIAMoDjIPLmNvbW0uRXZlbnRUeXBlUgV0eXBl'
    'cxIbCglmcm9tX2RhdGUYAyABKARSCGZyb21EYXRlEhcKB3RvX2RhdGUYBCABKARSBnRvRGF0ZR'
    'IXCgdsYXN0X2lkGAUgASgMUgZsYXN0SWQSFAoFY291bnQYBiABKA1SBWNvdW50EkgKDHZlaGlj'
    'bGVfVHlwZRgHIAEoDjIlLmNvbW0uR2V0RXZlbnRDbG91ZC5BTFBSX1ZlaGljbGVfVHlwZVILdm'
    'VoaWNsZVR5cGUSIwoNdmVoaWNsZV9wbGF0ZRgIIAEoCVIMdmVoaWNsZVBsYXRlEiQKDWlzRXhw'
    'b3J0RXhjZWwYCSABKAhSDWlzRXhwb3J0RXhjZWwaXQoFUmVwbHkSFAoFaXNFbmQYASABKAhSBW'
    'lzRW5kEiMKBmV2ZW50cxgCIAMoCzILLmNvbW0uRXZlbnRSBmV2ZW50cxIZCgh4bHN4X3VybBgD'
    'IAEoCVIHeGxzeFVybCI/ChFBTFBSX1ZlaGljbGVfVHlwZRIHCgNBTEwQABIHCgNDQVIQARIJCg'
    'VUUlVDSxACEg0KCU1PVE9SQklLRRADIk0KBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABISCg5V'
    'U0VSX05PVF9GT1VORBABEh0KGUZPUk1fREFURV9UT19EQVRFX0lOVkFMSUQQAg==');

@$core.Deprecated('Use onvifDiscoveryCameraDescriptor instead')
const OnvifDiscoveryCamera$json = {
  '1': 'OnvifDiscoveryCamera',
  '2': [
    {'1': 'ID', '3': 195, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    OnvifDiscoveryCamera_OnvifDevice$json,
    OnvifDiscoveryCamera_Request$json,
    OnvifDiscoveryCamera_Reply$json
  ],
  '4': [OnvifDiscoveryCamera_Error$json],
};

@$core.Deprecated('Use onvifDiscoveryCameraDescriptor instead')
const OnvifDiscoveryCamera_OnvifDevice$json = {
  '1': 'OnvifDevice',
  '2': [
    {'1': 'urn', '3': 1, '4': 1, '5': 9, '10': 'urn'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'hardware', '3': 3, '4': 1, '5': 9, '10': 'hardware'},
    {'1': 'xaddr', '3': 4, '4': 1, '5': 9, '10': 'xaddr'},
    {'1': 'scopes', '3': 5, '4': 3, '5': 9, '10': 'scopes'},
    {'1': 'ip_address', '3': 6, '4': 1, '5': 9, '10': 'ipAddress'},
  ],
};

@$core.Deprecated('Use onvifDiscoveryCameraDescriptor instead')
const OnvifDiscoveryCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
  ],
};

@$core.Deprecated('Use onvifDiscoveryCameraDescriptor instead')
const OnvifDiscoveryCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.OnvifDiscoveryCamera.OnvifDevice',
      '10': 'devices'
    },
  ],
};

@$core.Deprecated('Use onvifDiscoveryCameraDescriptor instead')
const OnvifDiscoveryCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'BOX_ID_NOT_FOUND', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `OnvifDiscoveryCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvifDiscoveryCameraDescriptor = $convert.base64Decode(
    'ChRPbnZpZkRpc2NvdmVyeUNhbWVyYRIPCgJJRBjDASABKA1SAklEGpwBCgtPbnZpZkRldmljZR'
    'IQCgN1cm4YASABKAlSA3VybhISCgRuYW1lGAIgASgJUgRuYW1lEhoKCGhhcmR3YXJlGAMgASgJ'
    'UghoYXJkd2FyZRIUCgV4YWRkchgEIAEoCVIFeGFkZHISFgoGc2NvcGVzGAUgAygJUgZzY29wZX'
    'MSHQoKaXBfYWRkcmVzcxgGIAEoCVIJaXBBZGRyZXNzGiAKB1JlcXVlc3QSFQoGYm94X2lkGAEg'
    'ASgMUgVib3hJZBpJCgVSZXBseRJACgdkZXZpY2VzGAEgAygLMiYuY29tbS5PbnZpZkRpc2Nvdm'
    'VyeUNhbWVyYS5PbnZpZkRldmljZVIHZGV2aWNlcyJXCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxU'
    'EAASFAoQQ0FNRVJBX05PVF9GT1VORBABEhQKEEJPWF9JRF9OT1RfRk9VTkQQAhIPCgtCT1hfT0'
    'ZGTElORRAD');

@$core.Deprecated('Use onvif_PTZ_PanDescriptor instead')
const Onvif_PTZ_Pan$json = {
  '1': 'Onvif_PTZ_Pan',
  '2': [
    {'1': 'ID', '3': 196, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Onvif_PTZ_Pan_Request$json, Onvif_PTZ_Pan_Reply$json],
  '4': [Onvif_PTZ_Pan_Error$json],
};

@$core.Deprecated('Use onvif_PTZ_PanDescriptor instead')
const Onvif_PTZ_Pan_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'pan', '3': 1, '4': 1, '5': 2, '10': 'pan'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use onvif_PTZ_PanDescriptor instead')
const Onvif_PTZ_Pan_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use onvif_PTZ_PanDescriptor instead')
const Onvif_PTZ_Pan_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `Onvif_PTZ_Pan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvif_PTZ_PanDescriptor = $convert.base64Decode(
    'Cg1PbnZpZl9QVFpfUGFuEg8KAklEGMQBIAEoDVICSUQaOAoHUmVxdWVzdBIQCgNwYW4YASABKA'
    'JSA3BhbhIbCgljYW1lcmFfaWQYAiABKAxSCGNhbWVyYUlkGgcKBVJlcGx5Il4KBUVycm9yEhEK'
    'DUVSUk9SX0RFRkFVTFQQABIUChBDQU1FUkFfTk9UX0ZPVU5EEAESGwoXQ0FNRVJBX05PVF9PTl'
    'ZJRl9ERVZJQ0UQAhIPCgtCT1hfT0ZGTElORRAD');

@$core.Deprecated('Use onvif_PTZ_TiltDescriptor instead')
const Onvif_PTZ_Tilt$json = {
  '1': 'Onvif_PTZ_Tilt',
  '2': [
    {'1': 'ID', '3': 197, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Onvif_PTZ_Tilt_Request$json, Onvif_PTZ_Tilt_Reply$json],
  '4': [Onvif_PTZ_Tilt_Error$json],
};

@$core.Deprecated('Use onvif_PTZ_TiltDescriptor instead')
const Onvif_PTZ_Tilt_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'tilt', '3': 1, '4': 1, '5': 2, '10': 'tilt'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use onvif_PTZ_TiltDescriptor instead')
const Onvif_PTZ_Tilt_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use onvif_PTZ_TiltDescriptor instead')
const Onvif_PTZ_Tilt_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `Onvif_PTZ_Tilt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvif_PTZ_TiltDescriptor = $convert.base64Decode(
    'Cg5PbnZpZl9QVFpfVGlsdBIPCgJJRBjFASABKA1SAklEGjoKB1JlcXVlc3QSEgoEdGlsdBgBIA'
    'EoAlIEdGlsdBIbCgljYW1lcmFfaWQYAiABKAxSCGNhbWVyYUlkGgcKBVJlcGx5Il4KBUVycm9y'
    'EhEKDUVSUk9SX0RFRkFVTFQQABIUChBDQU1FUkFfTk9UX0ZPVU5EEAESGwoXQ0FNRVJBX05PVF'
    '9PTlZJRl9ERVZJQ0UQAhIPCgtCT1hfT0ZGTElORRAD');

@$core.Deprecated('Use onvif_PTZ_ZoomDescriptor instead')
const Onvif_PTZ_Zoom$json = {
  '1': 'Onvif_PTZ_Zoom',
  '2': [
    {'1': 'ID', '3': 198, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Onvif_PTZ_Zoom_Request$json, Onvif_PTZ_Zoom_Reply$json],
  '4': [Onvif_PTZ_Zoom_Error$json],
};

@$core.Deprecated('Use onvif_PTZ_ZoomDescriptor instead')
const Onvif_PTZ_Zoom_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'zoom', '3': 1, '4': 1, '5': 2, '10': 'zoom'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use onvif_PTZ_ZoomDescriptor instead')
const Onvif_PTZ_Zoom_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use onvif_PTZ_ZoomDescriptor instead')
const Onvif_PTZ_Zoom_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `Onvif_PTZ_Zoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvif_PTZ_ZoomDescriptor = $convert.base64Decode(
    'Cg5PbnZpZl9QVFpfWm9vbRIPCgJJRBjGASABKA1SAklEGjoKB1JlcXVlc3QSEgoEem9vbRgBIA'
    'EoAlIEem9vbRIbCgljYW1lcmFfaWQYAiABKAxSCGNhbWVyYUlkGgcKBVJlcGx5Il4KBUVycm9y'
    'EhEKDUVSUk9SX0RFRkFVTFQQABIUChBDQU1FUkFfTk9UX0ZPVU5EEAESGwoXQ0FNRVJBX05PVF'
    '9PTlZJRl9ERVZJQ0UQAhIPCgtCT1hfT0ZGTElORRAD');

@$core.Deprecated('Use onvif_Get_RTSP_URLDescriptor instead')
const Onvif_Get_RTSP_URL$json = {
  '1': 'Onvif_Get_RTSP_URL',
  '2': [
    {'1': 'ID', '3': 200, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Onvif_Get_RTSP_URL_Request$json, Onvif_Get_RTSP_URL_Reply$json],
  '4': [Onvif_Get_RTSP_URL_Error$json],
};

@$core.Deprecated('Use onvif_Get_RTSP_URLDescriptor instead')
const Onvif_Get_RTSP_URL_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'ip_address', '3': 1, '4': 1, '5': 9, '10': 'ipAddress'},
    {'1': 'camera_user_name', '3': 2, '4': 1, '5': 9, '10': 'cameraUserName'},
    {'1': 'camera_password', '3': 3, '4': 1, '5': 9, '10': 'cameraPassword'},
  ],
};

@$core.Deprecated('Use onvif_Get_RTSP_URLDescriptor instead')
const Onvif_Get_RTSP_URL_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'rtsp_url_stream', '3': 1, '4': 1, '5': 9, '10': 'rtspUrlStream'},
  ],
};

@$core.Deprecated('Use onvif_Get_RTSP_URLDescriptor instead')
const Onvif_Get_RTSP_URL_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'STREAM_NOT_FOUND', '2': 1},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 2},
    {'1': 'USER_NAME_OR_PASSWORD_NOT_MATCH', '2': 3},
    {'1': 'BOX_OFFLINE', '2': 4},
  ],
};

/// Descriptor for `Onvif_Get_RTSP_URL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvif_Get_RTSP_URLDescriptor = $convert.base64Decode(
    'ChJPbnZpZl9HZXRfUlRTUF9VUkwSDwoCSUQYyAEgASgNUgJJRBp7CgdSZXF1ZXN0Eh0KCmlwX2'
    'FkZHJlc3MYASABKAlSCWlwQWRkcmVzcxIoChBjYW1lcmFfdXNlcl9uYW1lGAIgASgJUg5jYW1l'
    'cmFVc2VyTmFtZRInCg9jYW1lcmFfcGFzc3dvcmQYAyABKAlSDmNhbWVyYVBhc3N3b3JkGi8KBV'
    'JlcGx5EiYKD3J0c3BfdXJsX3N0cmVhbRgBIAEoCVINcnRzcFVybFN0cmVhbSKDAQoFRXJyb3IS'
    'EQoNRVJST1JfREVGQVVMVBAAEhQKEFNUUkVBTV9OT1RfRk9VTkQQARIbChdDQU1FUkFfTk9UX0'
    '9OVklGX0RFVklDRRACEiMKH1VTRVJfTkFNRV9PUl9QQVNTV09SRF9OT1RfTUFUQ0gQAxIPCgtC'
    'T1hfT0ZGTElORRAE');

@$core.Deprecated('Use onvif_PTZ_Zoom_ResetDescriptor instead')
const Onvif_PTZ_Zoom_Reset$json = {
  '1': 'Onvif_PTZ_Zoom_Reset',
  '2': [
    {'1': 'ID', '3': 201, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Onvif_PTZ_Zoom_Reset_Request$json, Onvif_PTZ_Zoom_Reset_Reply$json],
  '4': [Onvif_PTZ_Zoom_Reset_Error$json],
};

@$core.Deprecated('Use onvif_PTZ_Zoom_ResetDescriptor instead')
const Onvif_PTZ_Zoom_Reset_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use onvif_PTZ_Zoom_ResetDescriptor instead')
const Onvif_PTZ_Zoom_Reset_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use onvif_PTZ_Zoom_ResetDescriptor instead')
const Onvif_PTZ_Zoom_Reset_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `Onvif_PTZ_Zoom_Reset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvif_PTZ_Zoom_ResetDescriptor = $convert.base64Decode(
    'ChRPbnZpZl9QVFpfWm9vbV9SZXNldBIPCgJJRBjJASABKA1SAklEGiYKB1JlcXVlc3QSGwoJY2'
    'FtZXJhX2lkGAIgASgMUghjYW1lcmFJZBoHCgVSZXBseSJeCgVFcnJvchIRCg1FUlJPUl9ERUZB'
    'VUxUEAASFAoQQ0FNRVJBX05PVF9GT1VORBABEhsKF0NBTUVSQV9OT1RfT05WSUZfREVWSUNFEA'
    'ISDwoLQk9YX09GRkxJTkUQAw==');

@$core.Deprecated('Use updateUserAddressDescriptor instead')
const updateUserAddress$json = {
  '1': 'updateUserAddress',
  '2': [
    {'1': 'ID', '3': 202, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [updateUserAddress_Request$json, updateUserAddress_Reply$json],
  '4': [updateUserAddress_Error$json],
};

@$core.Deprecated('Use updateUserAddressDescriptor instead')
const updateUserAddress_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'newAddress', '3': 1, '4': 1, '5': 9, '10': 'newAddress'},
    {'1': 'newDisplayName', '3': 2, '4': 1, '5': 9, '10': 'newDisplayName'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'tel', '3': 4, '4': 1, '5': 9, '10': 'tel'},
  ],
};

@$core.Deprecated('Use updateUserAddressDescriptor instead')
const updateUserAddress_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use updateUserAddressDescriptor instead')
const updateUserAddress_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EMAIL_EMPTY', '2': 1},
    {'1': 'EMAIL_INVALID', '2': 2},
    {'1': 'EMAIL_EXIST', '2': 3},
    {'1': 'TEL_EMPTY', '2': 4},
    {'1': 'TEL_INVALID', '2': 5},
    {'1': 'TEL_EXIST', '2': 6},
  ],
};

/// Descriptor for `updateUserAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserAddressDescriptor = $convert.base64Decode(
    'ChF1cGRhdGVVc2VyQWRkcmVzcxIPCgJJRBjKASABKA1SAklEGnkKB1JlcXVlc3QSHgoKbmV3QW'
    'RkcmVzcxgBIAEoCVIKbmV3QWRkcmVzcxImCg5uZXdEaXNwbGF5TmFtZRgCIAEoCVIObmV3RGlz'
    'cGxheU5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEhAKA3RlbBgEIAEoCVIDdGVsGgcKBVJlcG'
    'x5In4KBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIPCgtFTUFJTF9FTVBUWRABEhEKDUVNQUlM'
    'X0lOVkFMSUQQAhIPCgtFTUFJTF9FWElTVBADEg0KCVRFTF9FTVBUWRAEEg8KC1RFTF9JTlZBTE'
    'lEEAUSDQoJVEVMX0VYSVNUEAY=');

@$core.Deprecated('Use addGroupCameraDescriptor instead')
const AddGroupCamera$json = {
  '1': 'AddGroupCamera',
  '2': [
    {'1': 'ID', '3': 203, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddGroupCamera_Request$json, AddGroupCamera_Reply$json],
  '4': [AddGroupCamera_Error$json],
};

@$core.Deprecated('Use addGroupCameraDescriptor instead')
const AddGroupCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'group_name', '3': 1, '4': 1, '5': 9, '10': 'groupName'},
    {'1': 'parent_group_id', '3': 2, '4': 1, '5': 12, '10': 'parentGroupId'},
  ],
};

@$core.Deprecated('Use addGroupCameraDescriptor instead')
const AddGroupCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
  ],
};

@$core.Deprecated('Use addGroupCameraDescriptor instead')
const AddGroupCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'GROUP_NAME_EMPTY', '2': 1},
    {'1': 'PARENT_GROUP_NOT_FOUND_OR_INVALID', '2': 2},
    {'1': 'PARENT_GROUP_MAX_LEVEL', '2': 3},
  ],
};

/// Descriptor for `AddGroupCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addGroupCameraDescriptor = $convert.base64Decode(
    'Cg5BZGRHcm91cENhbWVyYRIPCgJJRBjLASABKA1SAklEGlAKB1JlcXVlc3QSHQoKZ3JvdXBfbm'
    'FtZRgBIAEoCVIJZ3JvdXBOYW1lEiYKD3BhcmVudF9ncm91cF9pZBgCIAEoDFINcGFyZW50R3Jv'
    'dXBJZBoyCgVSZXBseRIpCgZncm91cHMYASADKAsyES5jb21tLkRldmljZUdyb3VwUgZncm91cH'
    'MicwoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhQKEEdST1VQX05BTUVfRU1QVFkQARIlCiFQ'
    'QVJFTlRfR1JPVVBfTk9UX0ZPVU5EX09SX0lOVkFMSUQQAhIaChZQQVJFTlRfR1JPVVBfTUFYX0'
    'xFVkVMEAM=');

@$core.Deprecated('Use removeGroupCameraDescriptor instead')
const RemoveGroupCamera$json = {
  '1': 'RemoveGroupCamera',
  '2': [
    {'1': 'ID', '3': 204, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RemoveGroupCamera_Request$json, RemoveGroupCamera_Reply$json],
  '4': [RemoveGroupCamera_Error$json],
};

@$core.Deprecated('Use removeGroupCameraDescriptor instead')
const RemoveGroupCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use removeGroupCameraDescriptor instead')
const RemoveGroupCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
  ],
};

@$core.Deprecated('Use removeGroupCameraDescriptor instead')
const RemoveGroupCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'GROUP_ID_EMPTY', '2': 1},
    {'1': 'GROUP_ID_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `RemoveGroupCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeGroupCameraDescriptor = $convert.base64Decode(
    'ChFSZW1vdmVHcm91cENhbWVyYRIPCgJJRBjMASABKA1SAklEGiQKB1JlcXVlc3QSGQoIZ3JvdX'
    'BfaWQYASABKAxSB2dyb3VwSWQaMgoFUmVwbHkSKQoGZ3JvdXBzGAEgAygLMhEuY29tbS5EZXZp'
    'Y2VHcm91cFIGZ3JvdXBzIkYKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABISCg5HUk9VUF9JRF'
    '9FTVBUWRABEhYKEkdST1VQX0lEX05PVF9GT1VORBAC');

@$core.Deprecated('Use addCameraToGroupDescriptor instead')
const AddCameraToGroup$json = {
  '1': 'AddCameraToGroup',
  '2': [
    {'1': 'ID', '3': 205, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCameraToGroup_Request$json, AddCameraToGroup_Reply$json],
  '4': [AddCameraToGroup_Error$json],
};

@$core.Deprecated('Use addCameraToGroupDescriptor instead')
const AddCameraToGroup_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 3, '5': 12, '10': 'cameraId'},
    {'1': 'group_id', '3': 2, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use addCameraToGroupDescriptor instead')
const AddCameraToGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {'1': 'group_id', '3': 2, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use addCameraToGroupDescriptor instead')
const AddCameraToGroup_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'GROUP_ID_EMPTY', '2': 2},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 3},
    {'1': 'GROUP_ID_NOT_FOUND', '2': 4},
    {'1': 'CAMERA_EXIST_GROUP', '2': 5},
  ],
};

/// Descriptor for `AddCameraToGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraToGroupDescriptor = $convert.base64Decode(
    'ChBBZGRDYW1lcmFUb0dyb3VwEg8KAklEGM0BIAEoDVICSUQaQQoHUmVxdWVzdBIbCgljYW1lcm'
    'FfaWQYASADKAxSCGNhbWVyYUlkEhkKCGdyb3VwX2lkGAIgASgMUgdncm91cElkGkgKBVJlcGx5'
    'EiQKBmNhbWVyYRgBIAMoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcmESGQoIZ3JvdXBfaWQYAiABKA'
    'xSB2dyb3VwSWQijAEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABITCg9DQU1FUkFfSURfRU1Q'
    'VFkQARISCg5HUk9VUF9JRF9FTVBUWRACEhcKE0NBTUVSQV9JRF9OT1RfRk9VTkQQAxIWChJHUk'
    '9VUF9JRF9OT1RfRk9VTkQQBBIWChJDQU1FUkFfRVhJU1RfR1JPVVAQBQ==');

@$core.Deprecated('Use receiveAddCameraToGroupDescriptor instead')
const ReceiveAddCameraToGroup$json = {
  '1': 'ReceiveAddCameraToGroup',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {
      '1': 'camera',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_ADD_CAMERA_TO_GROUP',
      '3': 69,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEADDCAMERATOGROUP'
    },
  ],
};

/// Descriptor for `ReceiveAddCameraToGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveAddCameraToGroupDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlQWRkQ2FtZXJhVG9Hcm91cBIZCghncm91cF9pZBgBIAEoDFIHZ3JvdXBJZBIkCg'
    'ZjYW1lcmEYAiADKAsyDC5jb21tLkNhbWVyYVIGY2FtZXJhEjwKG1JFQ0VJVkVfQUREX0NBTUVS'
    'QV9UT19HUk9VUBhFIAEoDVIXUkVDRUlWRUFERENBTUVSQVRPR1JPVVA=');

@$core.Deprecated('Use removeCameraFormGroupDescriptor instead')
const RemoveCameraFormGroup$json = {
  '1': 'RemoveCameraFormGroup',
  '2': [
    {'1': 'ID', '3': 206, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RemoveCameraFormGroup_Request$json, RemoveCameraFormGroup_Reply$json],
  '4': [RemoveCameraFormGroup_Error$json],
};

@$core.Deprecated('Use removeCameraFormGroupDescriptor instead')
const RemoveCameraFormGroup_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'group_id', '3': 2, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use removeCameraFormGroupDescriptor instead')
const RemoveCameraFormGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'group_level', '3': 3, '4': 1, '5': 13, '10': 'groupLevel'},
  ],
};

@$core.Deprecated('Use removeCameraFormGroupDescriptor instead')
const RemoveCameraFormGroup_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'GROUP_ID_EMPTY', '2': 2},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 3},
    {'1': 'GROUP_ID_NOT_FOUND', '2': 4},
  ],
};

/// Descriptor for `RemoveCameraFormGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeCameraFormGroupDescriptor = $convert.base64Decode(
    'ChVSZW1vdmVDYW1lcmFGb3JtR3JvdXASDwoCSUQYzgEgASgNUgJJRBpBCgdSZXF1ZXN0EhsKCW'
    'NhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGQoIZ3JvdXBfaWQYAiABKAxSB2dyb3VwSWQaYAoF'
    'UmVwbHkSGQoIZ3JvdXBfaWQYASABKAxSB2dyb3VwSWQSGwoJY2FtZXJhX2lkGAIgASgMUghjYW'
    '1lcmFJZBIfCgtncm91cF9sZXZlbBgDIAEoDVIKZ3JvdXBMZXZlbCJ0CgVFcnJvchIRCg1FUlJP'
    'Ul9ERUZBVUxUEAASEwoPQ0FNRVJBX0lEX0VNUFRZEAESEgoOR1JPVVBfSURfRU1QVFkQAhIXCh'
    'NDQU1FUkFfSURfTk9UX0ZPVU5EEAMSFgoSR1JPVVBfSURfTk9UX0ZPVU5EEAQ=');

@$core.Deprecated('Use receiveRemoveCameraFormGroupDescriptor instead')
const ReceiveRemoveCameraFormGroup$json = {
  '1': 'ReceiveRemoveCameraFormGroup',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'group_level', '3': 3, '4': 1, '5': 13, '10': 'groupLevel'},
    {
      '1': 'camera',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_REMOVE_CAMERA_FORM_GROUP',
      '3': 70,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEREMOVECAMERAFORMGROUP'
    },
  ],
};

/// Descriptor for `ReceiveRemoveCameraFormGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveRemoveCameraFormGroupDescriptor = $convert.base64Decode(
    'ChxSZWNlaXZlUmVtb3ZlQ2FtZXJhRm9ybUdyb3VwEhkKCGdyb3VwX2lkGAEgASgMUgdncm91cE'
    'lkEhsKCWNhbWVyYV9pZBgCIAEoDFIIY2FtZXJhSWQSHwoLZ3JvdXBfbGV2ZWwYAyABKA1SCmdy'
    'b3VwTGV2ZWwSJAoGY2FtZXJhGAQgASgLMgwuY29tbS5DYW1lcmFSBmNhbWVyYRJGCiBSRUNFSV'
    'ZFX1JFTU9WRV9DQU1FUkFfRk9STV9HUk9VUBhGIAEoDVIcUkVDRUlWRVJFTU9WRUNBTUVSQUZP'
    'Uk1HUk9VUA==');

@$core.Deprecated('Use getCameraInGroupDescriptor instead')
const GetCameraInGroup$json = {
  '1': 'GetCameraInGroup',
  '2': [
    {'1': 'ID', '3': 207, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetCameraInGroup_Request$json, GetCameraInGroup_Reply$json],
  '4': [GetCameraInGroup_Error$json],
};

@$core.Deprecated('Use getCameraInGroupDescriptor instead')
const GetCameraInGroup_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'is_recursive', '3': 2, '4': 1, '5': 8, '10': 'isRecursive'},
  ],
};

@$core.Deprecated('Use getCameraInGroupDescriptor instead')
const GetCameraInGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'cameras',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'cameras'
    },
  ],
};

@$core.Deprecated('Use getCameraInGroupDescriptor instead')
const GetCameraInGroup_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'GROUP_ID_EMPTY', '2': 1},
    {'1': 'GROUP_ID_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `GetCameraInGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCameraInGroupDescriptor = $convert.base64Decode(
    'ChBHZXRDYW1lcmFJbkdyb3VwEg8KAklEGM8BIAEoDVICSUQaRwoHUmVxdWVzdBIZCghncm91cF'
    '9pZBgBIAEoDFIHZ3JvdXBJZBIhCgxpc19yZWN1cnNpdmUYAiABKAhSC2lzUmVjdXJzaXZlGi8K'
    'BVJlcGx5EiYKB2NhbWVyYXMYASADKAsyDC5jb21tLkNhbWVyYVIHY2FtZXJhcyJGCgVFcnJvch'
    'IRCg1FUlJPUl9ERUZBVUxUEAASEgoOR1JPVVBfSURfRU1QVFkQARIWChJHUk9VUF9JRF9OT1Rf'
    'Rk9VTkQQAg==');

@$core.Deprecated('Use updateGroupDeviceDescriptor instead')
const UpdateGroupDevice$json = {
  '1': 'UpdateGroupDevice',
  '2': [
    {'1': 'ID', '3': 208, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateGroupDevice_Request$json, UpdateGroupDevice_Reply$json],
  '4': [UpdateGroupDevice_Error$json],
};

@$core.Deprecated('Use updateGroupDeviceDescriptor instead')
const UpdateGroupDevice_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'parent_group', '3': 2, '4': 1, '5': 12, '10': 'parentGroup'},
    {'1': 'group_name', '3': 3, '4': 1, '5': 9, '10': 'groupName'},
  ],
};

@$core.Deprecated('Use updateGroupDeviceDescriptor instead')
const UpdateGroupDevice_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
  ],
};

@$core.Deprecated('Use updateGroupDeviceDescriptor instead')
const UpdateGroupDevice_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'GROUP_ID_EMPTY', '2': 1},
    {'1': 'GROUP_ID_NOT_FOUND', '2': 2},
    {'1': 'PARENT_GROUP_NOT_FOUND', '2': 3},
    {'1': 'PARENT_LEVEL_INVALID', '2': 4},
    {'1': 'PERMISSION_DENIED', '2': 5},
    {'1': 'PARENT_GROUP_INVALID', '2': 6},
    {'1': 'PARENT_GROUP_LEVEL_INVALID', '2': 7},
  ],
};

/// Descriptor for `UpdateGroupDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGroupDeviceDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVHcm91cERldmljZRIPCgJJRBjQASABKA1SAklEGmYKB1JlcXVlc3QSGQoIZ3JvdX'
    'BfaWQYASABKAxSB2dyb3VwSWQSIQoMcGFyZW50X2dyb3VwGAIgASgMUgtwYXJlbnRHcm91cBId'
    'Cgpncm91cF9uYW1lGAMgASgJUglncm91cE5hbWUaMgoFUmVwbHkSKQoGZ3JvdXBzGAEgAygLMh'
    'EuY29tbS5EZXZpY2VHcm91cFIGZ3JvdXBzIs0BCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAAS'
    'EgoOR1JPVVBfSURfRU1QVFkQARIWChJHUk9VUF9JRF9OT1RfRk9VTkQQAhIaChZQQVJFTlRfR1'
    'JPVVBfTk9UX0ZPVU5EEAMSGAoUUEFSRU5UX0xFVkVMX0lOVkFMSUQQBBIVChFQRVJNSVNTSU9O'
    'X0RFTklFRBAFEhgKFFBBUkVOVF9HUk9VUF9JTlZBTElEEAYSHgoaUEFSRU5UX0dST1VQX0xFVk'
    'VMX0lOVkFMSUQQBw==');

@$core.Deprecated('Use configSendEmailDescriptor instead')
const ConfigSendEmail$json = {
  '1': 'ConfigSendEmail',
  '2': [
    {'1': 'ID', '3': 209, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ConfigSendEmail_Request$json, ConfigSendEmail_Reply$json],
  '4': [ConfigSendEmail_Error$json],
};

@$core.Deprecated('Use configSendEmailDescriptor instead')
const ConfigSendEmail_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'isSendEmail', '3': 2, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'email_receive', '3': 3, '4': 3, '5': 9, '10': 'emailReceive'},
  ],
};

@$core.Deprecated('Use configSendEmailDescriptor instead')
const ConfigSendEmail_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use configSendEmailDescriptor instead')
const ConfigSendEmail_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
  ],
};

/// Descriptor for `ConfigSendEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configSendEmailDescriptor = $convert.base64Decode(
    'Cg9Db25maWdTZW5kRW1haWwSDwoCSUQY0QEgASgNUgJJRBpQCgdSZXF1ZXN0EiAKC2lzU2VuZE'
    'VtYWlsGAIgASgIUgtpc1NlbmRFbWFpbBIjCg1lbWFpbF9yZWNlaXZlGAMgAygJUgxlbWFpbFJl'
    'Y2VpdmUaBwoFUmVwbHkiGgoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAA');

@$core.Deprecated('Use receiveConfigSendEmailDescriptor instead')
const ReceiveConfigSendEmail$json = {
  '1': 'ReceiveConfigSendEmail',
  '2': [
    {'1': 'isSendEmail', '3': 2, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'email_receive', '3': 3, '4': 3, '5': 9, '10': 'emailReceive'},
    {
      '1': 'RECEIVE_CONFIG_SEND_EMAIL',
      '3': 72,
      '4': 1,
      '5': 13,
      '10': 'RECEIVECONFIGSENDEMAIL'
    },
  ],
};

/// Descriptor for `ReceiveConfigSendEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveConfigSendEmailDescriptor = $convert.base64Decode(
    'ChZSZWNlaXZlQ29uZmlnU2VuZEVtYWlsEiAKC2lzU2VuZEVtYWlsGAIgASgIUgtpc1NlbmRFbW'
    'FpbBIjCg1lbWFpbF9yZWNlaXZlGAMgAygJUgxlbWFpbFJlY2VpdmUSOQoZUkVDRUlWRV9DT05G'
    'SUdfU0VORF9FTUFJTBhIIAEoDVIWUkVDRUlWRUNPTkZJR1NFTkRFTUFJTA==');

@$core.Deprecated('Use config_RTSP_ONVIF_Motion_DetectDescriptor instead')
const Config_RTSP_ONVIF_Motion_Detect$json = {
  '1': 'Config_RTSP_ONVIF_Motion_Detect',
  '2': [
    {'1': 'ID', '3': 210, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    Config_RTSP_ONVIF_Motion_Detect_Request$json,
    Config_RTSP_ONVIF_Motion_Detect_Reply$json
  ],
  '4': [
    Config_RTSP_ONVIF_Motion_Detect_Level$json,
    Config_RTSP_ONVIF_Motion_Detect_Error$json
  ],
};

@$core.Deprecated('Use config_RTSP_ONVIF_Motion_DetectDescriptor instead')
const Config_RTSP_ONVIF_Motion_Detect_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'isEnable_md', '3': 2, '4': 1, '5': 8, '10': 'isEnableMd'},
    {
      '1': 'level',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.Config_RTSP_ONVIF_Motion_Detect.Level',
      '10': 'level'
    },
    {'1': 'is_send_email', '3': 4, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'is_record', '3': 5, '4': 1, '5': 8, '10': 'isRecord'},
    {
      '1': 'isPushNotification',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'isPushNotification'
    },
    {'1': 'rois', '3': 7, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
    {'1': 'soundAlarm', '3': 8, '4': 1, '5': 8, '10': 'soundAlarm'},
  ],
};

@$core.Deprecated('Use config_RTSP_ONVIF_Motion_DetectDescriptor instead')
const Config_RTSP_ONVIF_Motion_Detect_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'camera',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use config_RTSP_ONVIF_Motion_DetectDescriptor instead')
const Config_RTSP_ONVIF_Motion_Detect_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

@$core.Deprecated('Use config_RTSP_ONVIF_Motion_DetectDescriptor instead')
const Config_RTSP_ONVIF_Motion_Detect_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_NOT_FOUND', '2': 2},
    {'1': 'IVA_SV_ERROR', '2': 3},
    {'1': 'IVA_NOT_REGISTER', '2': 4},
    {'1': 'IVA_TOO_MANY_REQUEST', '2': 5},
    {'1': 'OVER_QUOTA', '2': 6},
    {'1': 'PERMISSION_DENIED', '2': 7},
    {'1': 'CAMERA_NOT_HOMEVISON', '2': 8},
    {'1': 'CAMERA_OFFLINE', '2': 9},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 10},
    {'1': 'SERVER_P2P_ERROR', '2': 11},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 12},
    {'1': 'UID_INVALID', '2': 13},
  ],
};

/// Descriptor for `Config_RTSP_ONVIF_Motion_Detect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List config_RTSP_ONVIF_Motion_DetectDescriptor = $convert.base64Decode(
    'Ch9Db25maWdfUlRTUF9PTlZJRl9Nb3Rpb25fRGV0ZWN0Eg8KAklEGNIBIAEoDVICSUQaugIKB1'
    'JlcXVlc3QSGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIfCgtpc0VuYWJsZV9tZBgCIAEo'
    'CFIKaXNFbmFibGVNZBJBCgVsZXZlbBgDIAEoDjIrLmNvbW0uQ29uZmlnX1JUU1BfT05WSUZfTW'
    '90aW9uX0RldGVjdC5MZXZlbFIFbGV2ZWwSIgoNaXNfc2VuZF9lbWFpbBgEIAEoCFILaXNTZW5k'
    'RW1haWwSGwoJaXNfcmVjb3JkGAUgASgIUghpc1JlY29yZBIuChJpc1B1c2hOb3RpZmljYXRpb2'
    '4YBiABKAhSEmlzUHVzaE5vdGlmaWNhdGlvbhIdCgRyb2lzGAcgAygLMgkuY29tbS5Sb2lSBHJv'
    'aXMSHgoKc291bmRBbGFybRgIIAEoCFIKc291bmRBbGFybRpKCgVSZXBseRIbCgljYW1lcmFfaW'
    'QYASABKAxSCGNhbWVyYUlkEiQKBmNhbWVyYRgCIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcmEi'
    'JgoFTGV2ZWwSBwoDTE9XEAASCgoGTUVESVVNEAESCAoESElHSBACIsECCgVFcnJvchIRCg1FUl'
    'JPUl9ERUZBVUxUEAASEwoPQ0FNRVJBX0lEX0VNUFRZEAESFAoQQ0FNRVJBX05PVF9GT1VORBAC'
    'EhAKDElWQV9TVl9FUlJPUhADEhQKEElWQV9OT1RfUkVHSVNURVIQBBIYChRJVkFfVE9PX01BTl'
    'lfUkVRVUVTVBAFEg4KCk9WRVJfUVVPVEEQBhIVChFQRVJNSVNTSU9OX0RFTklFRBAHEhgKFENB'
    'TUVSQV9OT1RfSE9NRVZJU09OEAgSEgoOQ0FNRVJBX09GRkxJTkUQCRIfChtVU0VSX05BTUVfT1'
    'JfUEFTU1dPUkRfRVJST1IQChIUChBTRVJWRVJfUDJQX0VSUk9SEAsSGwoXQ0FNRVJBX0NMT1NF'
    'X0NPTk5FQ1RJT04QDBIPCgtVSURfSU5WQUxJRBAN');

@$core
    .Deprecated('Use receiveConfig_RTSP_ONVIF_Motion_DetectDescriptor instead')
const ReceiveConfig_RTSP_ONVIF_Motion_Detect$json = {
  '1': 'ReceiveConfig_RTSP_ONVIF_Motion_Detect',
  '2': [
    {
      '1': 'camera',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_CONFIG_RTSP_ONVIF_MD',
      '3': 73,
      '4': 1,
      '5': 13,
      '10': 'RECEIVECONFIGRTSPONVIFMD'
    },
  ],
};

/// Descriptor for `ReceiveConfig_RTSP_ONVIF_Motion_Detect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveConfig_RTSP_ONVIF_Motion_DetectDescriptor =
    $convert.base64Decode(
        'CiZSZWNlaXZlQ29uZmlnX1JUU1BfT05WSUZfTW90aW9uX0RldGVjdBIkCgZjYW1lcmEYCCABKA'
        'syDC5jb21tLkNhbWVyYVIGY2FtZXJhEj4KHFJFQ0VJVkVfQ09ORklHX1JUU1BfT05WSUZfTUQY'
        'SSABKA1SGFJFQ0VJVkVDT05GSUdSVFNQT05WSUZNRA==');

@$core.Deprecated('Use postEmapDescriptor instead')
const PostEmap$json = {
  '1': 'PostEmap',
  '2': [
    {'1': 'ID', '3': 215, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [PostEmap_Request$json, PostEmap_Reply$json],
  '4': [PostEmap_Error$json],
};

@$core.Deprecated('Use postEmapDescriptor instead')
const PostEmap_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'emap_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.EmapInfo',
      '10': 'emapInfo'
    },
    {'1': 'user_id', '3': 2, '4': 1, '5': 12, '10': 'userId'},
  ],
};

@$core.Deprecated('Use postEmapDescriptor instead')
const PostEmap_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'emap_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.EmapInfo',
      '10': 'emapInfo'
    },
  ],
};

@$core.Deprecated('Use postEmapDescriptor instead')
const PostEmap_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EMAP_ID_NOT_FOUND', '2': 1},
    {'1': 'FILE_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `PostEmap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postEmapDescriptor = $convert.base64Decode(
    'CghQb3N0RW1hcBIPCgJJRBjXASABKA1SAklEGk8KB1JlcXVlc3QSKwoJZW1hcF9pbmZvGAEgAS'
    'gLMg4uY29tbS5FbWFwSW5mb1IIZW1hcEluZm8SFwoHdXNlcl9pZBgCIAEoDFIGdXNlcklkGjQK'
    'BVJlcGx5EisKCWVtYXBfaW5mbxgBIAEoCzIOLmNvbW0uRW1hcEluZm9SCGVtYXBJbmZvIkUKBU'
    'Vycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIVChFFTUFQX0lEX05PVF9GT1VORBABEhIKDkZJTEVf'
    'Tk9UX0ZPVU5EEAI=');

@$core.Deprecated('Use receivePostEmapDescriptor instead')
const ReceivePostEmap$json = {
  '1': 'ReceivePostEmap',
  '2': [
    {
      '1': 'emapInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.EmapInfo',
      '10': 'emapInfo'
    },
    {
      '1': 'RECEIVE_POST_EMAP',
      '3': 75,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEPOSTEMAP'
    },
  ],
};

/// Descriptor for `ReceivePostEmap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receivePostEmapDescriptor = $convert.base64Decode(
    'Cg9SZWNlaXZlUG9zdEVtYXASKgoIZW1hcEluZm8YASABKAsyDi5jb21tLkVtYXBJbmZvUghlbW'
    'FwSW5mbxIqChFSRUNFSVZFX1BPU1RfRU1BUBhLIAEoDVIPUkVDRUlWRVBPU1RFTUFQ');

@$core.Deprecated('Use listEmapDescriptor instead')
const ListEmap$json = {
  '1': 'ListEmap',
  '2': [
    {'1': 'ID', '3': 216, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListEmap_Request$json, ListEmap_Reply$json],
};

@$core.Deprecated('Use listEmapDescriptor instead')
const ListEmap_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use listEmapDescriptor instead')
const ListEmap_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'emap_infos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.EmapInfo',
      '10': 'emapInfos'
    },
  ],
};

/// Descriptor for `ListEmap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEmapDescriptor = $convert.base64Decode(
    'CghMaXN0RW1hcBIPCgJJRBjYASABKA1SAklEGgkKB1JlcXVlc3QaNgoFUmVwbHkSLQoKZW1hcF'
    '9pbmZvcxgBIAMoCzIOLmNvbW0uRW1hcEluZm9SCWVtYXBJbmZvcw==');

@$core.Deprecated('Use removeEmapDescriptor instead')
const RemoveEmap$json = {
  '1': 'RemoveEmap',
  '2': [
    {'1': 'ID', '3': 217, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RemoveEmap_Request$json, RemoveEmap_Reply$json],
  '4': [RemoveEmap_Error$json],
};

@$core.Deprecated('Use removeEmapDescriptor instead')
const RemoveEmap_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
  ],
};

@$core.Deprecated('Use removeEmapDescriptor instead')
const RemoveEmap_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
  ],
};

@$core.Deprecated('Use removeEmapDescriptor instead')
const RemoveEmap_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EMAP_ID_NOT_FOUND', '2': 1},
  ],
};

/// Descriptor for `RemoveEmap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeEmapDescriptor = $convert.base64Decode(
    'CgpSZW1vdmVFbWFwEg8KAklEGNkBIAEoDVICSUQaIgoHUmVxdWVzdBIXCgdlbWFwX2lkGAEgAS'
    'gMUgZlbWFwSWQaIAoFUmVwbHkSFwoHZW1hcF9pZBgBIAEoDFIGZW1hcElkIjEKBUVycm9yEhEK'
    'DUVSUk9SX0RFRkFVTFQQABIVChFFTUFQX0lEX05PVF9GT1VORBAB');

@$core.Deprecated('Use receiveDeleteEmapDescriptor instead')
const ReceiveDeleteEmap$json = {
  '1': 'ReceiveDeleteEmap',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
    {
      '1': 'RECEIVE_DELETE_EMAP',
      '3': 76,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEDELETEEMAP'
    },
  ],
};

/// Descriptor for `ReceiveDeleteEmap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDeleteEmapDescriptor = $convert.base64Decode(
    'ChFSZWNlaXZlRGVsZXRlRW1hcBIXCgdlbWFwX2lkGAEgASgMUgZlbWFwSWQSLgoTUkVDRUlWRV'
    '9ERUxFVEVfRU1BUBhMIAEoDVIRUkVDRUlWRURFTEVURUVNQVA=');

@$core.Deprecated('Use addCameraEmapInfoDescriptor instead')
const AddCameraEmapInfo$json = {
  '1': 'AddCameraEmapInfo',
  '2': [
    {'1': 'ID', '3': 219, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCameraEmapInfo_Request$json, AddCameraEmapInfo_Reply$json],
  '4': [AddCameraEmapInfo_Error$json],
};

@$core.Deprecated('Use addCameraEmapInfoDescriptor instead')
const AddCameraEmapInfo_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
    {
      '1': 'info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.CameraEmapInfo',
      '10': 'info'
    },
  ],
};

@$core.Deprecated('Use addCameraEmapInfoDescriptor instead')
const AddCameraEmapInfo_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CameraEmapInfo',
      '10': 'info'
    },
  ],
};

@$core.Deprecated('Use addCameraEmapInfoDescriptor instead')
const AddCameraEmapInfo_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EMAP_ID_EMPTY', '2': 1},
    {'1': 'EMAP_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_EMAP_NOT_FOUND', '2': 3},
  ],
};

/// Descriptor for `AddCameraEmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraEmapInfoDescriptor = $convert.base64Decode(
    'ChFBZGRDYW1lcmFFbWFwSW5mbxIPCgJJRBjbASABKA1SAklEGkwKB1JlcXVlc3QSFwoHZW1hcF'
    '9pZBgBIAEoDFIGZW1hcElkEigKBGluZm8YAiABKAsyFC5jb21tLkNhbWVyYUVtYXBJbmZvUgRp'
    'bmZvGjEKBVJlcGx5EigKBGluZm8YASABKAsyFC5jb21tLkNhbWVyYUVtYXBJbmZvUgRpbmZvIl'
    'wKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg1FTUFQX0lEX0VNUFRZEAESEgoORU1BUF9O'
    'T1RfRk9VTkQQAhIZChVDQU1FUkFfRU1BUF9OT1RfRk9VTkQQAw==');

@$core.Deprecated('Use receiveAddCameraEmapInfoDescriptor instead')
const ReceiveAddCameraEmapInfo$json = {
  '1': 'ReceiveAddCameraEmapInfo',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CameraEmapInfo',
      '10': 'info'
    },
    {
      '1': 'RECEIVE_ADD_RECEIVE_INFO',
      '3': 78,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEADDRECEIVEINFO'
    },
  ],
};

/// Descriptor for `ReceiveAddCameraEmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveAddCameraEmapInfoDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlQWRkQ2FtZXJhRW1hcEluZm8SKAoEaW5mbxgBIAEoCzIULmNvbW0uQ2FtZXJhRW'
    '1hcEluZm9SBGluZm8SNwoYUkVDRUlWRV9BRERfUkVDRUlWRV9JTkZPGE4gASgNUhVSRUNFSVZF'
    'QUREUkVDRUlWRUlORk8=');

@$core.Deprecated('Use listCameraEmapInfoDescriptor instead')
const ListCameraEmapInfo$json = {
  '1': 'ListCameraEmapInfo',
  '2': [
    {'1': 'ID', '3': 220, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListCameraEmapInfo_Request$json, ListCameraEmapInfo_Reply$json],
  '4': [ListCameraEmapInfo_Error$json],
};

@$core.Deprecated('Use listCameraEmapInfoDescriptor instead')
const ListCameraEmapInfo_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
  ],
};

@$core.Deprecated('Use listCameraEmapInfoDescriptor instead')
const ListCameraEmapInfo_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'emap_infos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.CameraEmapInfo',
      '10': 'emapInfos'
    },
  ],
};

@$core.Deprecated('Use listCameraEmapInfoDescriptor instead')
const ListCameraEmapInfo_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EMAP_ID_EMPTY', '2': 1},
    {'1': 'EMAP_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `ListCameraEmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCameraEmapInfoDescriptor = $convert.base64Decode(
    'ChJMaXN0Q2FtZXJhRW1hcEluZm8SDwoCSUQY3AEgASgNUgJJRBoiCgdSZXF1ZXN0EhcKB2VtYX'
    'BfaWQYASABKAxSBmVtYXBJZBo8CgVSZXBseRIzCgplbWFwX2luZm9zGAEgAygLMhQuY29tbS5D'
    'YW1lcmFFbWFwSW5mb1IJZW1hcEluZm9zIkEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg'
    '1FTUFQX0lEX0VNUFRZEAESEgoORU1BUF9OT1RfRk9VTkQQAg==');

@$core.Deprecated('Use getListCustomLiveViewDescriptor instead')
const GetListCustomLiveView$json = {
  '1': 'GetListCustomLiveView',
  '2': [
    {'1': 'ID', '3': 227, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetListCustomLiveView_Request$json, GetListCustomLiveView_Reply$json],
};

@$core.Deprecated('Use getListCustomLiveViewDescriptor instead')
const GetListCustomLiveView_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use getListCustomLiveViewDescriptor instead')
const GetListCustomLiveView_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'customs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.CustomLiveView',
      '10': 'customs'
    },
  ],
};

/// Descriptor for `GetListCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListCustomLiveViewDescriptor = $convert.base64Decode(
    'ChVHZXRMaXN0Q3VzdG9tTGl2ZVZpZXcSDwoCSUQY4wEgASgNUgJJRBoJCgdSZXF1ZXN0GjcKBV'
    'JlcGx5Ei4KB2N1c3RvbXMYASADKAsyFC5jb21tLkN1c3RvbUxpdmVWaWV3UgdjdXN0b21z');

@$core.Deprecated('Use addCustomLiveViewDescriptor instead')
const AddCustomLiveView$json = {
  '1': 'AddCustomLiveView',
  '2': [
    {'1': 'ID', '3': 228, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCustomLiveView_Request$json, AddCustomLiveView_Reply$json],
  '4': [AddCustomLiveView_Error$json],
};

@$core.Deprecated('Use addCustomLiveViewDescriptor instead')
const AddCustomLiveView_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'baseView',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.comm.Base_View',
      '10': 'baseView'
    },
    {
      '1': 'position',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.LiveViewPosition',
      '10': 'position'
    },
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

@$core.Deprecated('Use addCustomLiveViewDescriptor instead')
const AddCustomLiveView_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'customs',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CustomLiveView',
      '10': 'customs'
    },
  ],
};

@$core.Deprecated('Use addCustomLiveViewDescriptor instead')
const AddCustomLiveView_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'POSITION_INVALID', '2': 1},
    {'1': 'NAME_EMPTY', '2': 2},
  ],
};

/// Descriptor for `AddCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCustomLiveViewDescriptor = $convert.base64Decode(
    'ChFBZGRDdXN0b21MaXZlVmlldxIPCgJJRBjkASABKA1SAklEGn4KB1JlcXVlc3QSKwoIYmFzZV'
    'ZpZXcYASABKA4yDy5jb21tLkJhc2VfVmlld1IIYmFzZVZpZXcSMgoIcG9zaXRpb24YAiADKAsy'
    'Fi5jb21tLkxpdmVWaWV3UG9zaXRpb25SCHBvc2l0aW9uEhIKBG5hbWUYAyABKAlSBG5hbWUaNw'
    'oFUmVwbHkSLgoHY3VzdG9tcxgBIAEoCzIULmNvbW0uQ3VzdG9tTGl2ZVZpZXdSB2N1c3RvbXMi'
    'OgoFRXJyb3ISCwoHREVGQVVMVBAAEhQKEFBPU0lUSU9OX0lOVkFMSUQQARIOCgpOQU1FX0VNUF'
    'RZEAI=');

@$core.Deprecated('Use receiveAddCustomLiveViewDescriptor instead')
const ReceiveAddCustomLiveView$json = {
  '1': 'ReceiveAddCustomLiveView',
  '2': [
    {
      '1': 'customs',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CustomLiveView',
      '10': 'customs'
    },
    {
      '1': 'RECEIVE_ADD_CUSTOM_LIVE_VIEW',
      '3': 86,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEADDCUSTOMLIVEVIEW'
    },
  ],
};

/// Descriptor for `ReceiveAddCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveAddCustomLiveViewDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlQWRkQ3VzdG9tTGl2ZVZpZXcSLgoHY3VzdG9tcxgBIAEoCzIULmNvbW0uQ3VzdG'
    '9tTGl2ZVZpZXdSB2N1c3RvbXMSPgocUkVDRUlWRV9BRERfQ1VTVE9NX0xJVkVfVklFVxhWIAEo'
    'DVIYUkVDRUlWRUFERENVU1RPTUxJVkVWSUVX');

@$core.Deprecated('Use updateCustomLiveViewDescriptor instead')
const UpdateCustomLiveView$json = {
  '1': 'UpdateCustomLiveView',
  '2': [
    {'1': 'ID', '3': 229, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateCustomLiveView_Request$json, UpdateCustomLiveView_Reply$json],
  '4': [UpdateCustomLiveView_Error$json],
};

@$core.Deprecated('Use updateCustomLiveViewDescriptor instead')
const UpdateCustomLiveView_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'customs',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CustomLiveView',
      '10': 'customs'
    },
  ],
};

@$core.Deprecated('Use updateCustomLiveViewDescriptor instead')
const UpdateCustomLiveView_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'customs',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CustomLiveView',
      '10': 'customs'
    },
  ],
};

@$core.Deprecated('Use updateCustomLiveViewDescriptor instead')
const UpdateCustomLiveView_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'POSITION_INVALID', '2': 1},
  ],
};

/// Descriptor for `UpdateCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCustomLiveViewDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDdXN0b21MaXZlVmlldxIPCgJJRBjlASABKA1SAklEGjkKB1JlcXVlc3QSLgoHY3'
    'VzdG9tcxgBIAEoCzIULmNvbW0uQ3VzdG9tTGl2ZVZpZXdSB2N1c3RvbXMaNwoFUmVwbHkSLgoH'
    'Y3VzdG9tcxgBIAEoCzIULmNvbW0uQ3VzdG9tTGl2ZVZpZXdSB2N1c3RvbXMiKgoFRXJyb3ISCw'
    'oHREVGQVVMVBAAEhQKEFBPU0lUSU9OX0lOVkFMSUQQAQ==');

@$core.Deprecated('Use receiveUpdateCustomLiveViewDescriptor instead')
const ReceiveUpdateCustomLiveView$json = {
  '1': 'ReceiveUpdateCustomLiveView',
  '2': [
    {
      '1': 'customs',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.CustomLiveView',
      '10': 'customs'
    },
    {
      '1': 'RECEIVE_UPDATE_CUSTOM_LIVE_VIEW',
      '3': 87,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATECUSTOMLIVEVIEW'
    },
  ],
};

/// Descriptor for `ReceiveUpdateCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateCustomLiveViewDescriptor =
    $convert.base64Decode(
        'ChtSZWNlaXZlVXBkYXRlQ3VzdG9tTGl2ZVZpZXcSLgoHY3VzdG9tcxgBIAEoCzIULmNvbW0uQ3'
        'VzdG9tTGl2ZVZpZXdSB2N1c3RvbXMSRAofUkVDRUlWRV9VUERBVEVfQ1VTVE9NX0xJVkVfVklF'
        'VxhXIAEoDVIbUkVDRUlWRVVQREFURUNVU1RPTUxJVkVWSUVX');

@$core.Deprecated('Use deleteCustomLiveViewDescriptor instead')
const DeleteCustomLiveView$json = {
  '1': 'DeleteCustomLiveView',
  '2': [
    {'1': 'ID', '3': 230, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteCustomLiveView_Request$json, DeleteCustomLiveView_Reply$json],
  '4': [DeleteCustomLiveView_Error$json],
};

@$core.Deprecated('Use deleteCustomLiveViewDescriptor instead')
const DeleteCustomLiveView_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'customs_id', '3': 1, '4': 1, '5': 12, '10': 'customsId'},
  ],
};

@$core.Deprecated('Use deleteCustomLiveViewDescriptor instead')
const DeleteCustomLiveView_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'customs_id', '3': 1, '4': 1, '5': 12, '10': 'customsId'},
  ],
};

@$core.Deprecated('Use deleteCustomLiveViewDescriptor instead')
const DeleteCustomLiveView_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
  ],
};

/// Descriptor for `DeleteCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCustomLiveViewDescriptor = $convert.base64Decode(
    'ChREZWxldGVDdXN0b21MaXZlVmlldxIPCgJJRBjmASABKA1SAklEGigKB1JlcXVlc3QSHQoKY3'
    'VzdG9tc19pZBgBIAEoDFIJY3VzdG9tc0lkGiYKBVJlcGx5Eh0KCmN1c3RvbXNfaWQYASABKAxS'
    'CWN1c3RvbXNJZCIUCgVFcnJvchILCgdERUZBVUxUEAA=');

@$core.Deprecated('Use receiveDeleteCustomLiveViewDescriptor instead')
const ReceiveDeleteCustomLiveView$json = {
  '1': 'ReceiveDeleteCustomLiveView',
  '2': [
    {'1': 'customs_id', '3': 1, '4': 1, '5': 12, '10': 'customsId'},
    {
      '1': 'RECEIVE_DELETE_CUSTOM_LIVE_VIEW',
      '3': 88,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEDELETECUSTOMLIVEVIEW'
    },
  ],
};

/// Descriptor for `ReceiveDeleteCustomLiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDeleteCustomLiveViewDescriptor =
    $convert.base64Decode(
        'ChtSZWNlaXZlRGVsZXRlQ3VzdG9tTGl2ZVZpZXcSHQoKY3VzdG9tc19pZBgBIAEoDFIJY3VzdG'
        '9tc0lkEkQKH1JFQ0VJVkVfREVMRVRFX0NVU1RPTV9MSVZFX1ZJRVcYWCABKA1SG1JFQ0VJVkVE'
        'RUxFVEVDVVNUT01MSVZFVklFVw==');

@$core.Deprecated('Use requestURLDownloadDescriptor instead')
const RequestURLDownload$json = {
  '1': 'RequestURLDownload',
  '2': [
    {'1': 'ID', '3': 231, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RequestURLDownload_Request$json, RequestURLDownload_Reply$json],
  '4': [RequestURLDownload_Error$json],
};

@$core.Deprecated('Use requestURLDownloadDescriptor instead')
const RequestURLDownload_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 4, '10': 'endTime'},
    {'1': 'playback_id', '3': 4, '4': 1, '5': 12, '10': 'playbackId'},
  ],
};

@$core.Deprecated('Use requestURLDownloadDescriptor instead')
const RequestURLDownload_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'url_download', '3': 1, '4': 3, '5': 9, '10': 'urlDownload'},
  ],
};

@$core.Deprecated('Use requestURLDownloadDescriptor instead')
const RequestURLDownload_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
    {'1': 'FILE_HAS_BEEN_DELETED', '2': 3},
    {'1': 'TIME_INVALID', '2': 4},
    {'1': 'PLAYBACK_ID_NOT_FOUND', '2': 5},
  ],
};

/// Descriptor for `RequestURLDownload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestURLDownloadDescriptor = $convert.base64Decode(
    'ChJSZXF1ZXN0VVJMRG93bmxvYWQSDwoCSUQY5wEgASgNUgJJRBqBAQoHUmVxdWVzdBIbCgljYW'
    '1lcmFfaWQYASABKAxSCGNhbWVyYUlkEh0KCnN0YXJ0X3RpbWUYAiABKARSCXN0YXJ0VGltZRIZ'
    'CghlbmRfdGltZRgDIAEoBFIHZW5kVGltZRIfCgtwbGF5YmFja19pZBgEIAEoDFIKcGxheWJhY2'
    'tJZBoqCgVSZXBseRIhCgx1cmxfZG93bmxvYWQYASADKAlSC3VybERvd25sb2FkIooBCgVFcnJv'
    'chILCgdERUZBVUxUEAASEwoPQ0FNRVJBX0lEX0VNUFRZEAESFwoTQ0FNRVJBX0lEX05PVF9GT1'
    'VORBACEhkKFUZJTEVfSEFTX0JFRU5fREVMRVRFRBADEhAKDFRJTUVfSU5WQUxJRBAEEhkKFVBM'
    'QVlCQUNLX0lEX05PVF9GT1VORBAF');

@$core.Deprecated('Use resetOnvifCameraDescriptor instead')
const ResetOnvifCamera$json = {
  '1': 'ResetOnvifCamera',
  '2': [
    {'1': 'ID', '3': 232, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ResetOnvifCamera_Request$json, ResetOnvifCamera_Reply$json],
  '4': [ResetOnvifCamera_Error$json],
};

@$core.Deprecated('Use resetOnvifCameraDescriptor instead')
const ResetOnvifCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use resetOnvifCameraDescriptor instead')
const ResetOnvifCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use resetOnvifCameraDescriptor instead')
const ResetOnvifCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `ResetOnvifCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetOnvifCameraDescriptor = $convert.base64Decode(
    'ChBSZXNldE9udmlmQ2FtZXJhEg8KAklEGOgBIAEoDVICSUQaJgoHUmVxdWVzdBIbCgljYW1lcm'
    'FfaWQYASABKAxSCGNhbWVyYUlkGiQKBVJlcGx5EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJh'
    'SWQiUwoFRXJyb3ISCwoHREVGQVVMVBAAEhMKD0NBTUVSQV9JRF9FTVBUWRABEhcKE0NBTUVSQV'
    '9JRF9OT1RfRk9VTkQQAhIPCgtCT1hfT0ZGTElORRAD');

@$core.Deprecated('Use getListStreamOnvifCameraDescriptor instead')
const GetListStreamOnvifCamera$json = {
  '1': 'GetListStreamOnvifCamera',
  '2': [
    {'1': 'ID', '3': 233, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    GetListStreamOnvifCamera_Request$json,
    GetListStreamOnvifCamera_Reply$json
  ],
  '4': [GetListStreamOnvifCamera_Error$json],
};

@$core.Deprecated('Use getListStreamOnvifCameraDescriptor instead')
const GetListStreamOnvifCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use getListStreamOnvifCameraDescriptor instead')
const GetListStreamOnvifCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'stream',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.CameraStream',
      '10': 'stream'
    },
  ],
};

@$core.Deprecated('Use getListStreamOnvifCameraDescriptor instead')
const GetListStreamOnvifCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 3},
    {'1': 'CAMERA_CAN_T_GET_STREAM', '2': 4},
    {'1': 'BOX_OFFLINE', '2': 5},
  ],
};

/// Descriptor for `GetListStreamOnvifCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListStreamOnvifCameraDescriptor = $convert.base64Decode(
    'ChhHZXRMaXN0U3RyZWFtT252aWZDYW1lcmESDwoCSUQY6QEgASgNUgJJRBomCgdSZXF1ZXN0Eh'
    'sKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQaMwoFUmVwbHkSKgoGc3RyZWFtGAEgAygLMhIu'
    'Y29tbS5DYW1lcmFTdHJlYW1SBnN0cmVhbSKNAQoFRXJyb3ISCwoHREVGQVVMVBAAEhMKD0NBTU'
    'VSQV9JRF9FTVBUWRABEhcKE0NBTUVSQV9JRF9OT1RfRk9VTkQQAhIbChdDQU1FUkFfTk9UX09O'
    'VklGX0RFVklDRRADEhsKF0NBTUVSQV9DQU5fVF9HRVRfU1RSRUFNEAQSDwoLQk9YX09GRkxJTk'
    'UQBQ==');

@$core.Deprecated('Use getNumberNotifyDescriptor instead')
const GetNumberNotify$json = {
  '1': 'GetNumberNotify',
  '2': [
    {'1': 'ID', '3': 249, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetNumberNotify_Request$json, GetNumberNotify_Reply$json],
  '4': [GetNumberNotify_Error$json],
};

@$core.Deprecated('Use getNumberNotifyDescriptor instead')
const GetNumberNotify_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use getNumberNotifyDescriptor instead')
const GetNumberNotify_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'number_notify', '3': 1, '4': 1, '5': 13, '10': 'numberNotify'},
  ],
};

@$core.Deprecated('Use getNumberNotifyDescriptor instead')
const GetNumberNotify_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
  ],
};

/// Descriptor for `GetNumberNotify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNumberNotifyDescriptor = $convert.base64Decode(
    'Cg9HZXROdW1iZXJOb3RpZnkSDwoCSUQY+QEgASgNUgJJRBoJCgdSZXF1ZXN0GiwKBVJlcGx5Ei'
    'MKDW51bWJlcl9ub3RpZnkYASABKA1SDG51bWJlck5vdGlmeSIUCgVFcnJvchILCgdERUZBVUxU'
    'EAA=');

@$core.Deprecated('Use checkQuotaAddCameraDescriptor instead')
const checkQuotaAddCamera$json = {
  '1': 'checkQuotaAddCamera',
  '2': [
    {'1': 'ID', '3': 262, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [checkQuotaAddCamera_Request$json, checkQuotaAddCamera_Reply$json],
  '4': [checkQuotaAddCamera_Error$json],
};

@$core.Deprecated('Use checkQuotaAddCameraDescriptor instead')
const checkQuotaAddCamera_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use checkQuotaAddCameraDescriptor instead')
const checkQuotaAddCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'overQuota', '3': 1, '4': 1, '5': 8, '10': 'overQuota'},
    {
      '1': 'remain_cam_number',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'remainCamNumber'
    },
  ],
};

@$core.Deprecated('Use checkQuotaAddCameraDescriptor instead')
const checkQuotaAddCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'DEFAULT', '2': 0},
  ],
};

/// Descriptor for `checkQuotaAddCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkQuotaAddCameraDescriptor = $convert.base64Decode(
    'ChNjaGVja1F1b3RhQWRkQ2FtZXJhEg8KAklEGIYCIAEoDVICSUQaCQoHUmVxdWVzdBpRCgVSZX'
    'BseRIcCglvdmVyUXVvdGEYASABKAhSCW92ZXJRdW90YRIqChFyZW1haW5fY2FtX251bWJlchgC'
    'IAEoDVIPcmVtYWluQ2FtTnVtYmVyIhQKBUVycm9yEgsKB0RFRkFVTFQQAA==');
