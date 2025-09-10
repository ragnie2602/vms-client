// This is a generated file - do not edit.
//
// Generated from comm.command1.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use receiveAddCameraDescriptor instead')
const ReceiveAddCamera$json = {
  '1': 'ReceiveAddCamera',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveAddCamera.Status',
      '10': 'status'
    },
    {
      '1': 'RECEIVE_ADD_CAMERA',
      '3': 23,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEADDCAMERA'
    },
  ],
  '4': [ReceiveAddCamera_Status$json],
};

@$core.Deprecated('Use receiveAddCameraDescriptor instead')
const ReceiveAddCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'FAILED', '2': 1},
  ],
};

/// Descriptor for `ReceiveAddCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveAddCameraDescriptor = $convert.base64Decode(
    'ChBSZWNlaXZlQWRkQ2FtZXJhEiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcm'
    'ESNQoGc3RhdHVzGAIgASgOMh0uY29tbS5SZWNlaXZlQWRkQ2FtZXJhLlN0YXR1c1IGc3RhdHVz'
    'EiwKElJFQ0VJVkVfQUREX0NBTUVSQRgXIAEoDVIQUkVDRUlWRUFERENBTUVSQSIhCgZTdGF0dX'
    'MSCwoHU1VDQ0VTUxAAEgoKBkZBSUxFRBAB');

@$core.Deprecated('Use receiveNotificationCameraDescriptor instead')
const ReceiveNotificationCamera$json = {
  '1': 'ReceiveNotificationCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'camera_name', '3': 2, '4': 1, '5': 9, '10': 'cameraName'},
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveNotificationCamera.Type',
      '10': 'type'
    },
    {'1': 'alarm', '3': 4, '4': 1, '5': 11, '6': '.comm.Alarm', '10': 'alarm'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveNotificationCamera.Status',
      '10': 'status'
    },
    {
      '1': 'form',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveNotificationCamera.Form',
      '10': 'form'
    },
    {
      '1': 'RECEIVE_NOTIFICATION_CAMERA',
      '3': 25,
      '4': 1,
      '5': 13,
      '10': 'RECEIVENOTIFICATIONCAMERA'
    },
  ],
  '4': [
    ReceiveNotificationCamera_Status$json,
    ReceiveNotificationCamera_Type$json,
    ReceiveNotificationCamera_Form$json
  ],
};

@$core.Deprecated('Use receiveNotificationCameraDescriptor instead')
const ReceiveNotificationCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'FAILED', '2': 1},
  ],
};

@$core.Deprecated('Use receiveNotificationCameraDescriptor instead')
const ReceiveNotificationCamera_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'MOTION_DETECTION', '2': 0},
    {'1': 'CAMERA_OFFLINE', '2': 1},
    {'1': 'STATUS_STORAGE_SDCARD', '2': 2},
    {'1': 'UPDATE_FIRMWARE', '2': 3},
    {'1': 'SOUND_DETECTION', '2': 4},
    {'1': 'LINE_CROSSING', '2': 5},
    {'1': 'INTRUSION_DETECTION', '2': 6},
    {'1': 'CAMERA_ONLINE', '2': 7},
  ],
};

@$core.Deprecated('Use receiveNotificationCameraDescriptor instead')
const ReceiveNotificationCamera_Form$json = {
  '1': 'Form',
  '2': [
    {'1': 'SD_CARD', '2': 0},
    {'1': 'CLOUD', '2': 1},
  ],
};

/// Descriptor for `ReceiveNotificationCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveNotificationCameraDescriptor = $convert.base64Decode(
    'ChlSZWNlaXZlTm90aWZpY2F0aW9uQ2FtZXJhEhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSW'
    'QSHwoLY2FtZXJhX25hbWUYAiABKAlSCmNhbWVyYU5hbWUSOAoEdHlwZRgDIAEoDjIkLmNvbW0u'
    'UmVjZWl2ZU5vdGlmaWNhdGlvbkNhbWVyYS5UeXBlUgR0eXBlEiEKBWFsYXJtGAQgASgLMgsuY2'
    '9tbS5BbGFybVIFYWxhcm0SPgoGc3RhdHVzGAUgASgOMiYuY29tbS5SZWNlaXZlTm90aWZpY2F0'
    'aW9uQ2FtZXJhLlN0YXR1c1IGc3RhdHVzEjgKBGZvcm0YBiABKA4yJC5jb21tLlJlY2VpdmVOb3'
    'RpZmljYXRpb25DYW1lcmEuRm9ybVIEZm9ybRI+ChtSRUNFSVZFX05PVElGSUNBVElPTl9DQU1F'
    'UkEYGSABKA1SGVJFQ0VJVkVOT1RJRklDQVRJT05DQU1FUkEiIQoGU3RhdHVzEgsKB1NVQ0NFU1'
    'MQABIKCgZGQUlMRUQQASK0AQoEVHlwZRIUChBNT1RJT05fREVURUNUSU9OEAASEgoOQ0FNRVJB'
    'X09GRkxJTkUQARIZChVTVEFUVVNfU1RPUkFHRV9TRENBUkQQAhITCg9VUERBVEVfRklSTVdBUk'
    'UQAxITCg9TT1VORF9ERVRFQ1RJT04QBBIRCg1MSU5FX0NST1NTSU5HEAUSFwoTSU5UUlVTSU9O'
    'X0RFVEVDVElPThAGEhEKDUNBTUVSQV9PTkxJTkUQByIeCgRGb3JtEgsKB1NEX0NBUkQQABIJCg'
    'VDTE9VRBAB');

@$core.Deprecated('Use receiveScheduleCameraDescriptor instead')
const ReceiveScheduleCamera$json = {
  '1': 'ReceiveScheduleCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveScheduleCamera.Status',
      '10': 'status'
    },
    {
      '1': 'recording',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.comm.Recording',
      '10': 'recording'
    },
    {
      '1': 'RECEIVE_RESULT_SHEDULE_CAMERA',
      '3': 39,
      '4': 1,
      '5': 13,
      '10': 'RECEIVERESULTSHEDULECAMERA'
    },
  ],
  '4': [ReceiveScheduleCamera_Status$json],
};

@$core.Deprecated('Use receiveScheduleCameraDescriptor instead')
const ReceiveScheduleCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'FAILED', '2': 1},
  ],
};

/// Descriptor for `ReceiveScheduleCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveScheduleCameraDescriptor = $convert.base64Decode(
    'ChVSZWNlaXZlU2NoZWR1bGVDYW1lcmESGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBI6Cg'
    'ZzdGF0dXMYAiABKA4yIi5jb21tLlJlY2VpdmVTY2hlZHVsZUNhbWVyYS5TdGF0dXNSBnN0YXR1'
    'cxItCglyZWNvcmRpbmcYAyABKAsyDy5jb21tLlJlY29yZGluZ1IJcmVjb3JkaW5nEkEKHVJFQ0'
    'VJVkVfUkVTVUxUX1NIRURVTEVfQ0FNRVJBGCcgASgNUhpSRUNFSVZFUkVTVUxUU0hFRFVMRUNB'
    'TUVSQSIhCgZTdGF0dXMSCwoHU1VDQ0VTUxAAEgoKBkZBSUxFRBAB');

@$core.Deprecated('Use receiveTimeShiftCameraDescriptor instead')
const ReceiveTimeShiftCamera$json = {
  '1': 'ReceiveTimeShiftCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'videos',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.ReceiveTimeShiftCamera.Video',
      '10': 'videos'
    },
    {'1': 'end', '3': 3, '4': 1, '5': 8, '10': 'end'},
    {'1': 'has_Sdcard', '3': 4, '4': 1, '5': 8, '10': 'hasSdcard'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveTimeShiftCamera.Status',
      '10': 'status'
    },
    {
      '1': 'RECEIVE_TIMESHIFT_CAMERA',
      '3': 40,
      '4': 1,
      '5': 13,
      '10': 'RECEIVETIMESHIFTCAMERA'
    },
  ],
  '3': [ReceiveTimeShiftCamera_Video$json],
  '4': [ReceiveTimeShiftCamera_Status$json],
};

@$core.Deprecated('Use receiveTimeShiftCameraDescriptor instead')
const ReceiveTimeShiftCamera_Video$json = {
  '1': 'Video',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'event_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.EventType',
      '10': 'eventType'
    },
    {'1': 'duration', '3': 3, '4': 1, '5': 13, '10': 'duration'},
    {'1': 'time', '3': 4, '4': 1, '5': 4, '10': 'time'},
  ],
};

@$core.Deprecated('Use receiveTimeShiftCameraDescriptor instead')
const ReceiveTimeShiftCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'FAILED', '2': 1},
    {'1': 'SD_CARD_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `ReceiveTimeShiftCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveTimeShiftCameraDescriptor = $convert.base64Decode(
    'ChZSZWNlaXZlVGltZVNoaWZ0Q2FtZXJhEhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSOg'
    'oGdmlkZW9zGAIgAygLMiIuY29tbS5SZWNlaXZlVGltZVNoaWZ0Q2FtZXJhLlZpZGVvUgZ2aWRl'
    'b3MSEAoDZW5kGAMgASgIUgNlbmQSHQoKaGFzX1NkY2FyZBgEIAEoCFIJaGFzU2RjYXJkEjsKBn'
    'N0YXR1cxgFIAEoDjIjLmNvbW0uUmVjZWl2ZVRpbWVTaGlmdENhbWVyYS5TdGF0dXNSBnN0YXR1'
    'cxI4ChhSRUNFSVZFX1RJTUVTSElGVF9DQU1FUkEYKCABKA1SFlJFQ0VJVkVUSU1FU0hJRlRDQU'
    '1FUkEaewoFVmlkZW8SEgoEbmFtZRgBIAEoCVIEbmFtZRIuCgpldmVudF90eXBlGAIgASgOMg8u'
    'Y29tbS5FdmVudFR5cGVSCWV2ZW50VHlwZRIaCghkdXJhdGlvbhgDIAEoDVIIZHVyYXRpb24SEg'
    'oEdGltZRgEIAEoBFIEdGltZSI4CgZTdGF0dXMSCwoHU1VDQ0VTUxAAEgoKBkZBSUxFRBABEhUK'
    'EVNEX0NBUkRfTk9UX0ZPVU5EEAI=');

@$core.Deprecated('Use receiveShareCameraDescriptor instead')
const ReceiveShareCamera$json = {
  '1': 'ReceiveShareCamera',
  '2': [
    {
      '1': 'camera_id',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {'3': true},
      '10': 'cameraId',
    },
    {
      '1': 'account_a',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'accountA',
    },
    {
      '1': 'account_b',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'accountB',
    },
    {
      '1': 'camera_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'cameraName',
    },
    {
      '1': 'role',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveShareCamera.Role',
      '8': {'3': true},
      '10': 'role',
    },
    {
      '1': 'time',
      '3': 6,
      '4': 1,
      '5': 4,
      '8': {'3': true},
      '10': 'time',
    },
    {
      '1': 'isOwner',
      '3': 7,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'isOwner',
    },
    {
      '1': 'invite_msg_id',
      '3': 8,
      '4': 1,
      '5': 12,
      '8': {'3': true},
      '10': 'inviteMsgId',
    },
    {
      '1': 'RECEIVE_SHARE_CAMERA',
      '3': 45,
      '4': 1,
      '5': 13,
      '8': {'3': true},
      '10': 'RECEIVESHARECAMERA',
    },
  ],
  '4': [ReceiveShareCamera_Role$json],
};

@$core.Deprecated('Use receiveShareCameraDescriptor instead')
const ReceiveShareCamera_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'FULL', '2': 1},
  ],
};

/// Descriptor for `ReceiveShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveShareCameraDescriptor = $convert.base64Decode(
    'ChJSZWNlaXZlU2hhcmVDYW1lcmESHwoJY2FtZXJhX2lkGAEgASgMQgIYAVIIY2FtZXJhSWQSHw'
    'oJYWNjb3VudF9hGAIgASgJQgIYAVIIYWNjb3VudEESHwoJYWNjb3VudF9iGAMgASgJQgIYAVII'
    'YWNjb3VudEISIwoLY2FtZXJhX25hbWUYBCABKAlCAhgBUgpjYW1lcmFOYW1lEjUKBHJvbGUYBS'
    'ABKA4yHS5jb21tLlJlY2VpdmVTaGFyZUNhbWVyYS5Sb2xlQgIYAVIEcm9sZRIWCgR0aW1lGAYg'
    'ASgEQgIYAVIEdGltZRIcCgdpc093bmVyGAcgASgIQgIYAVIHaXNPd25lchImCg1pbnZpdGVfbX'
    'NnX2lkGAggASgMQgIYAVILaW52aXRlTXNnSWQSNAoUUkVDRUlWRV9TSEFSRV9DQU1FUkEYLSAB'
    'KA1CAhgBUhJSRUNFSVZFU0hBUkVDQU1FUkEiGgoEUm9sZRIICgRWSUVXEAASCAoERlVMTBAB');

@$core.Deprecated('Use receiveResponseShareCameraDescriptor instead')
const ReceiveResponseShareCamera$json = {
  '1': 'ReceiveResponseShareCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'account_a', '3': 2, '4': 1, '5': 9, '10': 'accountA'},
    {'1': 'account_b', '3': 3, '4': 1, '5': 9, '10': 'accountB'},
    {
      '1': 'action',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveResponseShareCamera.Action',
      '10': 'action'
    },
    {
      '1': 'RECEIVE_RESPONSE_SHARE_CAMERA',
      '3': 46,
      '4': 1,
      '5': 13,
      '10': 'RECEIVERESPONSESHARECAMERA'
    },
  ],
  '4': [ReceiveResponseShareCamera_Action$json],
};

@$core.Deprecated('Use receiveResponseShareCameraDescriptor instead')
const ReceiveResponseShareCamera_Action$json = {
  '1': 'Action',
  '2': [
    {'1': 'ACCEPT', '2': 0},
    {'1': 'DECLINE', '2': 1},
  ],
};

/// Descriptor for `ReceiveResponseShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveResponseShareCameraDescriptor = $convert.base64Decode(
    'ChpSZWNlaXZlUmVzcG9uc2VTaGFyZUNhbWVyYRIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYU'
    'lkEhsKCWFjY291bnRfYRgCIAEoCVIIYWNjb3VudEESGwoJYWNjb3VudF9iGAMgASgJUghhY2Nv'
    'dW50QhI/CgZhY3Rpb24YBCABKA4yJy5jb21tLlJlY2VpdmVSZXNwb25zZVNoYXJlQ2FtZXJhLk'
    'FjdGlvblIGYWN0aW9uEkEKHVJFQ0VJVkVfUkVTUE9OU0VfU0hBUkVfQ0FNRVJBGC4gASgNUhpS'
    'RUNFSVZFUkVTUE9OU0VTSEFSRUNBTUVSQSIhCgZBY3Rpb24SCgoGQUNDRVBUEAASCwoHREVDTE'
    'lORRAB');

@$core.Deprecated('Use receiveDeleteShareCameraDescriptor instead')
const ReceiveDeleteShareCamera$json = {
  '1': 'ReceiveDeleteShareCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'account_a', '3': 2, '4': 1, '5': 9, '10': 'accountA'},
    {'1': 'account_b', '3': 3, '4': 1, '5': 9, '10': 'accountB'},
    {
      '1': 'RECEIVE_DELETE_SHARE_CAMERA',
      '3': 47,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEDELETESHARECAMERA'
    },
  ],
};

/// Descriptor for `ReceiveDeleteShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDeleteShareCameraDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlRGVsZXRlU2hhcmVDYW1lcmESGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZB'
    'IbCglhY2NvdW50X2EYAiABKAlSCGFjY291bnRBEhsKCWFjY291bnRfYhgDIAEoCVIIYWNjb3Vu'
    'dEISPQobUkVDRUlWRV9ERUxFVEVfU0hBUkVfQ0FNRVJBGC8gASgNUhhSRUNFSVZFREVMRVRFU0'
    'hBUkVDQU1FUkE=');

@$core.Deprecated('Use receiveDeleteCameraDescriptor instead')
const ReceiveDeleteCamera$json = {
  '1': 'ReceiveDeleteCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'account_a', '3': 2, '4': 1, '5': 9, '10': 'accountA'},
    {'1': 'account_b', '3': 3, '4': 1, '5': 9, '10': 'accountB'},
    {
      '1': 'RECEIVE_DELETE_CAMERA',
      '3': 48,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEDELETECAMERA'
    },
  ],
};

/// Descriptor for `ReceiveDeleteCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDeleteCameraDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZlRGVsZXRlQ2FtZXJhEhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGwoJYW'
    'Njb3VudF9hGAIgASgJUghhY2NvdW50QRIbCglhY2NvdW50X2IYAyABKAlSCGFjY291bnRCEjIK'
    'FVJFQ0VJVkVfREVMRVRFX0NBTUVSQRgwIAEoDVITUkVDRUlWRURFTEVURUNBTUVSQQ==');

@$core.Deprecated('Use receiveOnOffCameraDescriptor instead')
const ReceiveOnOffCamera$json = {
  '1': 'ReceiveOnOffCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'camera_name', '3': 2, '4': 1, '5': 9, '10': 'cameraName'},
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveOnOffCamera.Status',
      '10': 'status'
    },
    {
      '1': 'camera',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_ONOFF_CAMERA',
      '3': 49,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEONOFFCAMERA'
    },
  ],
  '4': [ReceiveOnOffCamera_Status$json],
};

@$core.Deprecated('Use receiveOnOffCameraDescriptor instead')
const ReceiveOnOffCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'OFF', '2': 0},
    {'1': 'ON', '2': 1},
  ],
};

/// Descriptor for `ReceiveOnOffCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveOnOffCameraDescriptor = $convert.base64Decode(
    'ChJSZWNlaXZlT25PZmZDYW1lcmESGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIfCgtjYW'
    '1lcmFfbmFtZRgCIAEoCVIKY2FtZXJhTmFtZRI3CgZzdGF0dXMYAyABKA4yHy5jb21tLlJlY2Vp'
    'dmVPbk9mZkNhbWVyYS5TdGF0dXNSBnN0YXR1cxIkCgZjYW1lcmEYBCABKAsyDC5jb21tLkNhbW'
    'VyYVIGY2FtZXJhEjAKFFJFQ0VJVkVfT05PRkZfQ0FNRVJBGDEgASgNUhJSRUNFSVZFT05PRkZD'
    'QU1FUkEiGQoGU3RhdHVzEgcKA09GRhAAEgYKAk9OEAE=');

@$core.Deprecated('Use receiveSettingCloudDescriptor instead')
const ReceiveSettingCloud$json = {
  '1': 'ReceiveSettingCloud',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_SETTING_CLOUD_CAMERA',
      '3': 51,
      '4': 1,
      '5': 13,
      '10': 'RECEIVESETTINGCLOUDCAMERA'
    },
  ],
};

/// Descriptor for `ReceiveSettingCloud`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveSettingCloudDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZlU2V0dGluZ0Nsb3VkEiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW'
    '1lcmESPwocUkVDRUlWRV9TRVRUSU5HX0NMT1VEX0NBTUVSQRgzIAEoDVIZUkVDRUlWRVNFVFRJ'
    'TkdDTE9VRENBTUVSQQ==');

@$core.Deprecated('Use receiveTimeShiftCloudDescriptor instead')
const ReceiveTimeShiftCloud$json = {
  '1': 'ReceiveTimeShiftCloud',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {
      '1': 'time_datas',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.comm.ReceiveTimeShiftCloud.TimeData',
      '10': 'timeDatas'
    },
    {
      '1': 'RECEIVE_TIMESHIFT_CLOUD',
      '3': 52,
      '4': 1,
      '5': 13,
      '10': 'RECEIVETIMESHIFTCLOUD'
    },
  ],
  '3': [ReceiveTimeShiftCloud_TimeData$json],
};

@$core.Deprecated('Use receiveTimeShiftCloudDescriptor instead')
const ReceiveTimeShiftCloud_TimeData$json = {
  '1': 'TimeData',
  '2': [
    {'1': 't1', '3': 1, '4': 1, '5': 4, '10': 't1'},
    {'1': 't2', '3': 2, '4': 1, '5': 4, '10': 't2'},
  ],
};

/// Descriptor for `ReceiveTimeShiftCloud`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveTimeShiftCloudDescriptor = $convert.base64Decode(
    'ChVSZWNlaXZlVGltZVNoaWZ0Q2xvdWQSGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIQCg'
    'N1cmwYAiABKAlSA3VybBJDCgp0aW1lX2RhdGFzGAMgAygLMiQuY29tbS5SZWNlaXZlVGltZVNo'
    'aWZ0Q2xvdWQuVGltZURhdGFSCXRpbWVEYXRhcxI2ChdSRUNFSVZFX1RJTUVTSElGVF9DTE9VRB'
    'g0IAEoDVIVUkVDRUlWRVRJTUVTSElGVENMT1VEGioKCFRpbWVEYXRhEg4KAnQxGAEgASgEUgJ0'
    'MRIOCgJ0MhgCIAEoBFICdDI=');

@$core.Deprecated('Use receiveUpdatePositionCameraDescriptor instead')
const ReceiveUpdatePositionCamera$json = {
  '1': 'ReceiveUpdatePositionCamera',
  '2': [
    {
      '1': 'cameras',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'cameras'
    },
    {
      '1': 'RECEIVE_UPDATE_POSITION_CAMERA',
      '3': 53,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEPOSITIONCAMERA'
    },
  ],
};

/// Descriptor for `ReceiveUpdatePositionCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdatePositionCameraDescriptor =
    $convert.base64Decode(
        'ChtSZWNlaXZlVXBkYXRlUG9zaXRpb25DYW1lcmESJgoHY2FtZXJhcxgBIAMoCzIMLmNvbW0uQ2'
        'FtZXJhUgdjYW1lcmFzEkMKHlJFQ0VJVkVfVVBEQVRFX1BPU0lUSU9OX0NBTUVSQRg1IAEoDVIb'
        'UkVDRUlWRVVQREFURVBPU0lUSU9OQ0FNRVJB');

@$core.Deprecated('Use receiveUpdateRoleShareDescriptor instead')
const ReceiveUpdateRoleShare$json = {
  '1': 'ReceiveUpdateRoleShare',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveUpdateRoleShare.Role',
      '10': 'role'
    },
    {'1': 'ivt_id', '3': 3, '4': 1, '5': 12, '10': 'ivtId'},
    {
      '1': 'RECEIVE_UPDATE_ROLE_SHARE',
      '3': 60,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEROLESHARE'
    },
  ],
  '4': [ReceiveUpdateRoleShare_Role$json],
};

@$core.Deprecated('Use receiveUpdateRoleShareDescriptor instead')
const ReceiveUpdateRoleShare_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'FULL', '2': 1},
  ],
};

/// Descriptor for `ReceiveUpdateRoleShare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateRoleShareDescriptor = $convert.base64Decode(
    'ChZSZWNlaXZlVXBkYXRlUm9sZVNoYXJlEhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSNQ'
    'oEcm9sZRgCIAEoDjIhLmNvbW0uUmVjZWl2ZVVwZGF0ZVJvbGVTaGFyZS5Sb2xlUgRyb2xlEhUK'
    'Bml2dF9pZBgDIAEoDFIFaXZ0SWQSOQoZUkVDRUlWRV9VUERBVEVfUk9MRV9TSEFSRRg8IAEoDV'
    'IWUkVDRUlWRVVQREFURVJPTEVTSEFSRSIaCgRSb2xlEggKBFZJRVcQABIICgRGVUxMEAE=');

@$core.Deprecated('Use receiveUpdateRoleCameraDescriptor instead')
const ReceiveUpdateRoleCamera$json = {
  '1': 'ReceiveUpdateRoleCamera',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveUpdateRoleCamera.Role',
      '10': 'role'
    },
    {'1': 'ivt_id', '3': 3, '4': 1, '5': 12, '10': 'ivtId'},
    {
      '1': 'RECEIVE_UPDATE_ROLE_CAMERA',
      '3': 61,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEROLECAMERA'
    },
  ],
  '4': [ReceiveUpdateRoleCamera_Role$json],
};

@$core.Deprecated('Use receiveUpdateRoleCameraDescriptor instead')
const ReceiveUpdateRoleCamera_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'FULL', '2': 1},
  ],
};

/// Descriptor for `ReceiveUpdateRoleCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateRoleCameraDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlVXBkYXRlUm9sZUNhbWVyYRIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEj'
    'YKBHJvbGUYAiABKA4yIi5jb21tLlJlY2VpdmVVcGRhdGVSb2xlQ2FtZXJhLlJvbGVSBHJvbGUS'
    'FQoGaXZ0X2lkGAMgASgMUgVpdnRJZBI7ChpSRUNFSVZFX1VQREFURV9ST0xFX0NBTUVSQRg9IA'
    'EoDVIXUkVDRUlWRVVQREFURVJPTEVDQU1FUkEiGgoEUm9sZRIICgRWSUVXEAASCAoERlVMTBAB');

@$core.Deprecated('Use receiveEventNotificationDescriptor instead')
const ReceiveEventNotification$json = {
  '1': 'ReceiveEventNotification',
  '2': [
    {
      '1': 'eventType',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.comm.EventType',
      '10': 'eventType'
    },
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'time', '3': 3, '4': 1, '5': 4, '10': 'time'},
    {'1': 'camera_name', '3': 4, '4': 1, '5': 9, '10': 'cameraName'},
    {
      '1': 'event_metadata',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'eventMetadata'
    },
    {'1': 'capture_image', '3': 6, '4': 1, '5': 9, '10': 'captureImage'},
    {'1': 'video_record_url', '3': 7, '4': 1, '5': 9, '10': 'videoRecordUrl'},
    {
      '1': 'capture_image_thumb',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'captureImageThumb'
    },
    {'1': 'description', '3': 9, '4': 1, '5': 9, '10': 'description'},
    {
      '1': 'events',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.comm.Event',
      '10': 'events'
    },
    {
      '1': 'RECEIVE_EVENT_NOTIFICATION',
      '3': 55,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEEVENTNOTIFICATION'
    },
  ],
};

/// Descriptor for `ReceiveEventNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveEventNotificationDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlRXZlbnROb3RpZmljYXRpb24SLQoJZXZlbnRUeXBlGAEgASgOMg8uY29tbS5Fdm'
    'VudFR5cGVSCWV2ZW50VHlwZRIbCgljYW1lcmFfaWQYAiABKAxSCGNhbWVyYUlkEhIKBHRpbWUY'
    'AyABKARSBHRpbWUSHwoLY2FtZXJhX25hbWUYBCABKAlSCmNhbWVyYU5hbWUSOwoOZXZlbnRfbW'
    'V0YWRhdGEYBSABKAsyFC5nb29nbGUucHJvdG9idWYuQW55Ug1ldmVudE1ldGFkYXRhEiMKDWNh'
    'cHR1cmVfaW1hZ2UYBiABKAlSDGNhcHR1cmVJbWFnZRIoChB2aWRlb19yZWNvcmRfdXJsGAcgAS'
    'gJUg52aWRlb1JlY29yZFVybBIuChNjYXB0dXJlX2ltYWdlX3RodW1iGAggASgJUhFjYXB0dXJl'
    'SW1hZ2VUaHVtYhIgCgtkZXNjcmlwdGlvbhgJIAEoCVILZGVzY3JpcHRpb24SIwoGZXZlbnRzGA'
    'ogASgLMgsuY29tbS5FdmVudFIGZXZlbnRzEjwKGlJFQ0VJVkVfRVZFTlRfTk9USUZJQ0FUSU9O'
    'GDcgASgNUhhSRUNFSVZFRVZFTlROT1RJRklDQVRJT04=');

@$core.Deprecated('Use receiveUpdateUserAddressDescriptor instead')
const ReceiveUpdateUserAddress$json = {
  '1': 'ReceiveUpdateUserAddress',
  '2': [
    {'1': 'newAddress', '3': 1, '4': 1, '5': 9, '10': 'newAddress'},
    {'1': 'newDisplayName', '3': 2, '4': 1, '5': 9, '10': 'newDisplayName'},
    {'1': 'newEmail', '3': 3, '4': 1, '5': 9, '10': 'newEmail'},
    {'1': 'newTel', '3': 4, '4': 1, '5': 9, '10': 'newTel'},
    {
      '1': 'RECEIVE_UPDATE_USER_ADDRESS',
      '3': 56,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEUSERADDRESS'
    },
  ],
};

/// Descriptor for `ReceiveUpdateUserAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateUserAddressDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlVXBkYXRlVXNlckFkZHJlc3MSHgoKbmV3QWRkcmVzcxgBIAEoCVIKbmV3QWRkcm'
    'VzcxImCg5uZXdEaXNwbGF5TmFtZRgCIAEoCVIObmV3RGlzcGxheU5hbWUSGgoIbmV3RW1haWwY'
    'AyABKAlSCG5ld0VtYWlsEhYKBm5ld1RlbBgEIAEoCVIGbmV3VGVsEj0KG1JFQ0VJVkVfVVBEQV'
    'RFX1VTRVJfQUREUkVTUxg4IAEoDVIYUkVDRUlWRVVQREFURVVTRVJBRERSRVNT');

@$core.Deprecated('Use listCameraDescriptor instead')
const ListCamera$json = {
  '1': 'ListCamera',
  '2': [
    {'1': 'ID', '3': 140, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListCamera_Request$json, ListCamera_Reply$json],
};

@$core.Deprecated('Use listCameraDescriptor instead')
const ListCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'last_time', '3': 1, '4': 1, '5': 4, '10': 'lastTime'},
  ],
};

@$core.Deprecated('Use listCameraDescriptor instead')
const ListCamera_Reply$json = {
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
    {
      '1': 'groups',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
  ],
};

/// Descriptor for `ListCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCameraDescriptor = $convert.base64Decode(
    'CgpMaXN0Q2FtZXJhEg8KAklEGIwBIAEoDVICSUQaJgoHUmVxdWVzdBIbCglsYXN0X3RpbWUYAS'
    'ABKARSCGxhc3RUaW1lGloKBVJlcGx5EiYKB2NhbWVyYXMYASADKAsyDC5jb21tLkNhbWVyYVIH'
    'Y2FtZXJhcxIpCgZncm91cHMYAiADKAsyES5jb21tLkRldmljZUdyb3VwUgZncm91cHM=');

@$core.Deprecated('Use addCameraDescriptor instead')
const AddCamera$json = {
  '1': 'AddCamera',
  '2': [
    {'1': 'ID', '3': 141, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCamera_Request$json, AddCamera_Reply$json],
  '4': [AddCamera_Status$json, AddCamera_Error$json],
};

@$core.Deprecated('Use addCameraDescriptor instead')
const AddCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'serial_number', '3': 2, '4': 1, '5': 9, '10': 'serialNumber'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
  ],
};

@$core.Deprecated('Use addCameraDescriptor instead')
const AddCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.AddCamera.Status',
      '10': 'status'
    },
  ],
};

@$core.Deprecated('Use addCameraDescriptor instead')
const AddCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'OFF', '2': 0},
    {'1': 'ON', '2': 1},
  ],
};

@$core.Deprecated('Use addCameraDescriptor instead')
const AddCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_EXIST', '2': 1},
    {'1': 'CAMERA_NOT_CONNECTION', '2': 2},
    {'1': 'USERNAME_INVALID', '2': 3},
    {'1': 'PASSWORD_INVALID', '2': 4},
    {'1': 'SERIAL_NOT_EXIST', '2': 5},
    {'1': 'ACTIVE_CAMERA_ERROR', '2': 6},
    {'1': 'ALREADY_ADDED', '2': 7},
    {'1': 'ALREADY_ADDED_BY_OTHER_ACCOUNT', '2': 8},
  ],
};

/// Descriptor for `AddCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraDescriptor = $convert.base64Decode(
    'CglBZGRDYW1lcmESDwoCSUQYjQEgASgNUgJJRBp6CgdSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG'
    '5hbWUSIwoNc2VyaWFsX251bWJlchgCIAEoCVIMc2VyaWFsTnVtYmVyEhoKCHVzZXJuYW1lGAMg'
    'ASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgEIAEoCVIIcGFzc3dvcmQaXQoFUmVwbHkSJAoGY2'
    'FtZXJhGAEgASgLMgwuY29tbS5DYW1lcmFSBmNhbWVyYRIuCgZzdGF0dXMYAiABKA4yFi5jb21t'
    'LkFkZENhbWVyYS5TdGF0dXNSBnN0YXR1cyIZCgZTdGF0dXMSBwoDT0ZGEAASBgoCT04QASLdAQ'
    'oFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhQKEENBTUVSQV9OT1RfRVhJU1QQARIZChVDQU1F'
    'UkFfTk9UX0NPTk5FQ1RJT04QAhIUChBVU0VSTkFNRV9JTlZBTElEEAMSFAoQUEFTU1dPUkRfSU'
    '5WQUxJRBAEEhQKEFNFUklBTF9OT1RfRVhJU1QQBRIXChNBQ1RJVkVfQ0FNRVJBX0VSUk9SEAYS'
    'EQoNQUxSRUFEWV9BRERFRBAHEiIKHkFMUkVBRFlfQURERURfQllfT1RIRVJfQUNDT1VOVBAI');

@$core.Deprecated('Use updateCameraDescriptor instead')
const UpdateCamera$json = {
  '1': 'UpdateCamera',
  '2': [
    {'1': 'ID', '3': 142, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateCamera_Request$json, UpdateCamera_Reply$json],
  '4': [UpdateCamera_Error$json],
};

@$core.Deprecated('Use updateCameraDescriptor instead')
const UpdateCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'rtsp_url', '3': 3, '4': 1, '5': 9, '10': 'rtspUrl'},
    {'1': 'user_name', '3': 4, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    {'1': 'storage_day', '3': 6, '4': 1, '5': 13, '10': 'storageDay'},
    {'1': 'xaddr', '3': 7, '4': 1, '5': 9, '10': 'xaddr'},
    {
      '1': 'location',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.comm.MapLocation',
      '10': 'location'
    },
    {'1': 'sub_stream_urls', '3': 9, '4': 3, '5': 9, '10': 'subStreamUrls'},
  ],
};

@$core.Deprecated('Use updateCameraDescriptor instead')
const UpdateCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use updateCameraDescriptor instead')
const UpdateCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'RTSP_URL_INVALID', '2': 1},
    {'1': 'NAME_INVALID', '2': 3},
    {'1': 'CAMERA_ID_INVALID', '2': 4},
    {'1': 'IP_OR_DOMAIN_INVALID', '2': 5},
    {'1': 'RTSP_PORT_ERROR', '2': 6},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 7},
    {'1': 'CAMERA_EXIST', '2': 8},
    {'1': 'CAMERA_UUID_INVALID', '2': 9},
    {'1': 'XADDR_EMPTY', '2': 10},
    {'1': 'XADDR_INVALID', '2': 11},
    {'1': 'LOCATION_INVALID', '2': 12},
    {'1': 'CAMERA_NAME_EXIST', '2': 13},
    {'1': 'GET_SERIAL_NUMBER_CAMERA_ERROR', '2': 14},
    {'1': 'SERIAL_NUMBER_NOT_MATH', '2': 15},
    {'1': 'BOX_ID_INVALID', '2': 16},
    {'1': 'BOX_OFFLINE', '2': 17},
    {'1': 'SUB_STREAM_INVALID', '2': 18},
  ],
};

/// Descriptor for `UpdateCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCameraDescriptor = $convert.base64Decode(
    'CgxVcGRhdGVDYW1lcmESDwoCSUQYjgEgASgNUgJJRBqcAgoHUmVxdWVzdBIbCgljYW1lcmFfaW'
    'QYASABKAxSCGNhbWVyYUlkEhIKBG5hbWUYAiABKAlSBG5hbWUSGQoIcnRzcF91cmwYAyABKAlS'
    'B3J0c3BVcmwSGwoJdXNlcl9uYW1lGAQgASgJUgh1c2VyTmFtZRIaCghwYXNzd29yZBgFIAEoCV'
    'IIcGFzc3dvcmQSHwoLc3RvcmFnZV9kYXkYBiABKA1SCnN0b3JhZ2VEYXkSFAoFeGFkZHIYByAB'
    'KAlSBXhhZGRyEi0KCGxvY2F0aW9uGAggASgLMhEuY29tbS5NYXBMb2NhdGlvblIIbG9jYXRpb2'
    '4SJgoPc3ViX3N0cmVhbV91cmxzGAkgAygJUg1zdWJTdHJlYW1VcmxzGi0KBVJlcGx5EiQKBmNh'
    'bWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcmEiogMKBUVycm9yEhEKDUVSUk9SX0RFRk'
    'FVTFQQABIUChBSVFNQX1VSTF9JTlZBTElEEAESEAoMTkFNRV9JTlZBTElEEAMSFQoRQ0FNRVJB'
    'X0lEX0lOVkFMSUQQBBIYChRJUF9PUl9ET01BSU5fSU5WQUxJRBAFEhMKD1JUU1BfUE9SVF9FUl'
    'JPUhAGEh8KG1VTRVJfTkFNRV9PUl9QQVNTV09SRF9FUlJPUhAHEhAKDENBTUVSQV9FWElTVBAI'
    'EhcKE0NBTUVSQV9VVUlEX0lOVkFMSUQQCRIPCgtYQUREUl9FTVBUWRAKEhEKDVhBRERSX0lOVk'
    'FMSUQQCxIUChBMT0NBVElPTl9JTlZBTElEEAwSFQoRQ0FNRVJBX05BTUVfRVhJU1QQDRIiCh5H'
    'RVRfU0VSSUFMX05VTUJFUl9DQU1FUkFfRVJST1IQDhIaChZTRVJJQUxfTlVNQkVSX05PVF9NQV'
    'RIEA8SEgoOQk9YX0lEX0lOVkFMSUQQEBIPCgtCT1hfT0ZGTElORRAREhYKElNVQl9TVFJFQU1f'
    'SU5WQUxJRBAS');

@$core.Deprecated('Use changePasswordCameraDescriptor instead')
const ChangePasswordCamera$json = {
  '1': 'ChangePasswordCamera',
  '2': [
    {'1': 'ID', '3': 143, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ChangePasswordCamera_Request$json, ChangePasswordCamera_Reply$json],
  '4': [ChangePasswordCamera_Error$json],
};

@$core.Deprecated('Use changePasswordCameraDescriptor instead')
const ChangePasswordCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'current', '3': 2, '4': 1, '5': 9, '10': 'current'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

@$core.Deprecated('Use changePasswordCameraDescriptor instead')
const ChangePasswordCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use changePasswordCameraDescriptor instead')
const ChangePasswordCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'PASSWORD_INVALID', '2': 1},
    {'1': 'PASSWORD_WEAKNESS', '2': 2},
    {'1': 'CAMERA_OFFLINE', '2': 3},
    {'1': 'PASSWORD_NOT_SAME', '2': 4},
    {'1': 'OLD_PASSWORD_NOT_MATH', '2': 5},
  ],
};

/// Descriptor for `ChangePasswordCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordCameraDescriptor = $convert.base64Decode(
    'ChRDaGFuZ2VQYXNzd29yZENhbWVyYRIPCgJJRBiPASABKA1SAklEGlwKB1JlcXVlc3QSGwoJY2'
    'FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIYCgdjdXJyZW50GAIgASgJUgdjdXJyZW50EhoKCHBh'
    'c3N3b3JkGAMgASgJUghwYXNzd29yZBokCgVSZXBseRIbCgljYW1lcmFfaWQYASABKAxSCGNhbW'
    'VyYUlkIo0BCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASFAoQUEFTU1dPUkRfSU5WQUxJRBAB'
    'EhUKEVBBU1NXT1JEX1dFQUtORVNTEAISEgoOQ0FNRVJBX09GRkxJTkUQAxIVChFQQVNTV09SRF'
    '9OT1RfU0FNRRAEEhkKFU9MRF9QQVNTV09SRF9OT1RfTUFUSBAF');

@$core.Deprecated('Use scheduleRecordingCameraDescriptor instead')
const ScheduleRecordingCamera$json = {
  '1': 'ScheduleRecordingCamera',
  '2': [
    {'1': 'ID', '3': 146, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    ScheduleRecordingCamera_Request$json,
    ScheduleRecordingCamera_Reply$json
  ],
  '4': [ScheduleRecordingCamera_Error$json],
};

@$core.Deprecated('Use scheduleRecordingCameraDescriptor instead')
const ScheduleRecordingCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'recording',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.Recording',
      '10': 'recording'
    },
  ],
};

@$core.Deprecated('Use scheduleRecordingCameraDescriptor instead')
const ScheduleRecordingCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use scheduleRecordingCameraDescriptor instead')
const ScheduleRecordingCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_OFFLINE', '2': 1},
    {'1': 'RTSP_URL_INVALID_OR_NOT_FOUND', '2': 2},
    {'1': 'RECORD_CLOUD_STORAGE_INVALID_OR_EXPIRED', '2': 3},
    {'1': 'RESOLUTION_INVALID', '2': 4},
  ],
};

/// Descriptor for `ScheduleRecordingCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRecordingCameraDescriptor = $convert.base64Decode(
    'ChdTY2hlZHVsZVJlY29yZGluZ0NhbWVyYRIPCgJJRBiSASABKA1SAklEGlUKB1JlcXVlc3QSGw'
    'oJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBItCglyZWNvcmRpbmcYAiABKAsyDy5jb21tLlJl'
    'Y29yZGluZ1IJcmVjb3JkaW5nGiQKBVJlcGx5EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSW'
    'QilgEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABISCg5DQU1FUkFfT0ZGTElORRABEiEKHVJU'
    'U1BfVVJMX0lOVkFMSURfT1JfTk9UX0ZPVU5EEAISKwonUkVDT1JEX0NMT1VEX1NUT1JBR0VfSU'
    '5WQUxJRF9PUl9FWFBJUkVEEAMSFgoSUkVTT0xVVElPTl9JTlZBTElEEAQ=');

@$core.Deprecated('Use restartCameraDescriptor instead')
const RestartCamera$json = {
  '1': 'RestartCamera',
  '2': [
    {'1': 'ID', '3': 151, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RestartCamera_Request$json, RestartCamera_Reply$json],
  '4': [RestartCamera_Error$json],
};

@$core.Deprecated('Use restartCameraDescriptor instead')
const RestartCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use restartCameraDescriptor instead')
const RestartCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use restartCameraDescriptor instead')
const RestartCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_OFFLINE', '2': 1},
  ],
};

/// Descriptor for `RestartCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restartCameraDescriptor = $convert.base64Decode(
    'Cg1SZXN0YXJ0Q2FtZXJhEg8KAklEGJcBIAEoDVICSUQaJgoHUmVxdWVzdBIbCgljYW1lcmFfaW'
    'QYASABKAxSCGNhbWVyYUlkGiQKBVJlcGx5EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQi'
    'LgoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhIKDkNBTUVSQV9PRkZMSU5FEAE=');

@$core.Deprecated('Use shareCameraDescriptor instead')
const ShareCamera$json = {
  '1': 'ShareCamera',
  '2': [
    {'1': 'ID', '3': 154, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ShareCamera_Request$json, ShareCamera_Reply$json],
  '4': [ShareCamera_Role$json, ShareCamera_Error$json],
};

@$core.Deprecated('Use shareCameraDescriptor instead')
const ShareCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ShareCamera.Role',
      '10': 'role'
    },
    {'1': 'account_invite', '3': 3, '4': 1, '5': 9, '10': 'accountInvite'},
  ],
};

@$core.Deprecated('Use shareCameraDescriptor instead')
const ShareCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use shareCameraDescriptor instead')
const ShareCamera_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'VIEW', '2': 0},
    {'1': 'FULL', '2': 1},
  ],
};

@$core.Deprecated('Use shareCameraDescriptor instead')
const ShareCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'ALREADY_SHARE', '2': 1},
    {'1': 'SHARE_YOURSELF', '2': 2},
    {'1': 'ALREADY_INVITE', '2': 3},
    {'1': 'ACCOUNT_INVALID', '2': 4},
    {'1': 'TEL_INVALID', '2': 5},
    {'1': 'EMAIL_INVALID', '2': 6},
    {'1': 'CAMERA_NOT_FOUND', '2': 7},
  ],
};

/// Descriptor for `ShareCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shareCameraDescriptor = $convert.base64Decode(
    'CgtTaGFyZUNhbWVyYRIPCgJJRBiaASABKA1SAklEGnkKB1JlcXVlc3QSGwoJY2FtZXJhX2lkGA'
    'EgASgMUghjYW1lcmFJZBIqCgRyb2xlGAIgASgOMhYuY29tbS5TaGFyZUNhbWVyYS5Sb2xlUgRy'
    'b2xlEiUKDmFjY291bnRfaW52aXRlGAMgASgJUg1hY2NvdW50SW52aXRlGiQKBVJlcGx5EhsKCW'
    'NhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQiGgoEUm9sZRIICgRWSUVXEAASCAoERlVMTBABIqQB'
    'CgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEQoNQUxSRUFEWV9TSEFSRRABEhIKDlNIQVJFX1'
    'lPVVJTRUxGEAISEgoOQUxSRUFEWV9JTlZJVEUQAxITCg9BQ0NPVU5UX0lOVkFMSUQQBBIPCgtU'
    'RUxfSU5WQUxJRBAFEhEKDUVNQUlMX0lOVkFMSUQQBhIUChBDQU1FUkFfTk9UX0ZPVU5EEAc=');

@$core.Deprecated('Use deleteCameraDescriptor instead')
const DeleteCamera$json = {
  '1': 'DeleteCamera',
  '2': [
    {'1': 'ID', '3': 155, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteCamera_Request$json, DeleteCamera_Reply$json],
};

@$core.Deprecated('Use deleteCameraDescriptor instead')
const DeleteCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use deleteCameraDescriptor instead')
const DeleteCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

/// Descriptor for `DeleteCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCameraDescriptor = $convert.base64Decode(
    'CgxEZWxldGVDYW1lcmESDwoCSUQYmwEgASgNUgJJRBomCgdSZXF1ZXN0EhsKCWNhbWVyYV9pZB'
    'gBIAEoDFIIY2FtZXJhSWQaJAoFUmVwbHkSGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZA==');

@$core.Deprecated('Use checkAccountShareDescriptor instead')
const CheckAccountShare$json = {
  '1': 'CheckAccountShare',
  '2': [
    {'1': 'ID', '3': 502, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [CheckAccountShare_Request$json, CheckAccountShare_Reply$json],
  '4': [CheckAccountShare_ShareType$json, CheckAccountShare_Error$json],
};

@$core.Deprecated('Use checkAccountShareDescriptor instead')
const CheckAccountShare_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'account', '3': 2, '4': 1, '5': 9, '10': 'account'},
    {
      '1': 'shareType',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.CheckAccountShare.ShareType',
      '10': 'shareType'
    },
    {'1': 'group_id', '3': 4, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use checkAccountShareDescriptor instead')
const CheckAccountShare_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'isExists', '3': 1, '4': 1, '5': 8, '10': 'isExists'},
    {
      '1': 'account_invite_id',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'accountInviteId'
    },
  ],
};

@$core.Deprecated('Use checkAccountShareDescriptor instead')
const CheckAccountShare_ShareType$json = {
  '1': 'ShareType',
  '2': [
    {'1': 'CAMERA', '2': 0},
    {'1': 'GROUP_CAMERA', '2': 1},
  ],
};

@$core.Deprecated('Use checkAccountShareDescriptor instead')
const CheckAccountShare_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'TEL_INVALID', '2': 1},
    {'1': 'EMAIL_INVALID', '2': 2},
    {'1': 'TEL_NOT_IN_USE', '2': 3},
    {'1': 'EMAIL_NOT_IN_USE', '2': 4},
    {'1': 'ALREADY_SHARE', '2': 5},
    {'1': 'ALREADY_INVITE', '2': 6},
    {'1': 'SHARE_YOURSELF', '2': 7},
    {'1': 'PERMISSION_DENIED', '2': 8},
    {'1': 'ACCOUNT_IVALID', '2': 9},
    {'1': 'SHARE_TO_ADMIN', '2': 10},
    {'1': 'SHARE_TO_OWNER', '2': 11},
    {'1': 'OVER_SHARED_USER_NUMBER', '2': 12},
  ],
};

/// Descriptor for `CheckAccountShare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkAccountShareDescriptor = $convert.base64Decode(
    'ChFDaGVja0FjY291bnRTaGFyZRIPCgJJRBj2AyABKA1SAklEGpwBCgdSZXF1ZXN0EhsKCWNhbW'
    'VyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGAoHYWNjb3VudBgCIAEoCVIHYWNjb3VudBI/CglzaGFy'
    'ZVR5cGUYAyABKA4yIS5jb21tLkNoZWNrQWNjb3VudFNoYXJlLlNoYXJlVHlwZVIJc2hhcmVUeX'
    'BlEhkKCGdyb3VwX2lkGAQgASgMUgdncm91cElkGk8KBVJlcGx5EhoKCGlzRXhpc3RzGAEgASgI'
    'Ughpc0V4aXN0cxIqChFhY2NvdW50X2ludml0ZV9pZBgCIAEoDFIPYWNjb3VudEludml0ZUlkIi'
    'kKCVNoYXJlVHlwZRIKCgZDQU1FUkEQABIQCgxHUk9VUF9DQU1FUkEQASKTAgoFRXJyb3ISEQoN'
    'RVJST1JfREVGQVVMVBAAEg8KC1RFTF9JTlZBTElEEAESEQoNRU1BSUxfSU5WQUxJRBACEhIKDl'
    'RFTF9OT1RfSU5fVVNFEAMSFAoQRU1BSUxfTk9UX0lOX1VTRRAEEhEKDUFMUkVBRFlfU0hBUkUQ'
    'BRISCg5BTFJFQURZX0lOVklURRAGEhIKDlNIQVJFX1lPVVJTRUxGEAcSFQoRUEVSTUlTU0lPTl'
    '9ERU5JRUQQCBISCg5BQ0NPVU5UX0lWQUxJRBAJEhIKDlNIQVJFX1RPX0FETUlOEAoSEgoOU0hB'
    'UkVfVE9fT1dORVIQCxIbChdPVkVSX1NIQVJFRF9VU0VSX05VTUJFUhAM');

@$core.Deprecated('Use shareGroupCameraDescriptor instead')
const ShareGroupCamera$json = {
  '1': 'ShareGroupCamera',
  '2': [
    {'1': 'ID', '3': 234, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ShareGroupCamera_Request$json, ShareGroupCamera_Reply$json],
  '4': [ShareGroupCamera_GroupShareRole$json, ShareGroupCamera_Error$json],
};

@$core.Deprecated('Use shareGroupCameraDescriptor instead')
const ShareGroupCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ShareGroupCamera.GroupShareRole',
      '10': 'role'
    },
    {
      '1': 'account_invite_id',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'accountInviteId'
    },
  ],
};

@$core.Deprecated('Use shareGroupCameraDescriptor instead')
const ShareGroupCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use shareGroupCameraDescriptor instead')
const ShareGroupCamera_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': '_NOT_USE', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'MANAGER', '2': 2},
  ],
};

@$core.Deprecated('Use shareGroupCameraDescriptor instead')
const ShareGroupCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'ALREADY_SHARE', '2': 1},
    {'1': 'SHARE_YOURSELF', '2': 2},
    {'1': 'ALREADY_INVITE', '2': 3},
    {'1': 'ACCOUNT_INVALID', '2': 4},
    {'1': 'GROUP_ID_EMPTY', '2': 5},
    {'1': 'GROUP_NOT_FOUND', '2': 6},
  ],
};

/// Descriptor for `ShareGroupCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shareGroupCameraDescriptor = $convert.base64Decode(
    'ChBTaGFyZUdyb3VwQ2FtZXJhEg8KAklEGOoBIAEoDVICSUQaiwEKB1JlcXVlc3QSGQoIZ3JvdX'
    'BfaWQYASABKAxSB2dyb3VwSWQSOQoEcm9sZRgCIAEoDjIlLmNvbW0uU2hhcmVHcm91cENhbWVy'
    'YS5Hcm91cFNoYXJlUm9sZVIEcm9sZRIqChFhY2NvdW50X2ludml0ZV9pZBgDIAEoDFIPYWNjb3'
    'VudEludml0ZUlkGiIKBVJlcGx5EhkKCGdyb3VwX2lkGAEgASgMUgdncm91cElkIjUKDkdyb3Vw'
    'U2hhcmVSb2xlEgwKCF9OT1RfVVNFEAASCAoEVklFVxABEgsKB01BTkFHRVIQAiKTAQoFRXJyb3'
    'ISEQoNRVJST1JfREVGQVVMVBAAEhEKDUFMUkVBRFlfU0hBUkUQARISCg5TSEFSRV9ZT1VSU0VM'
    'RhACEhIKDkFMUkVBRFlfSU5WSVRFEAMSEwoPQUNDT1VOVF9JTlZBTElEEAQSEgoOR1JPVVBfSU'
    'RfRU1QVFkQBRITCg9HUk9VUF9OT1RfRk9VTkQQBg==');

@$core.Deprecated('Use receiveShareGroupCameraDescriptor instead')
const ReceiveShareGroupCamera$json = {
  '1': 'ReceiveShareGroupCamera',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'account_a', '3': 2, '4': 1, '5': 9, '10': 'accountA'},
    {'1': 'account_b', '3': 3, '4': 1, '5': 9, '10': 'accountB'},
    {'1': 'group_name', '3': 4, '4': 1, '5': 9, '10': 'groupName'},
    {
      '1': 'role',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveShareGroupCamera.GroupShareRole',
      '10': 'role'
    },
    {'1': 'time', '3': 6, '4': 1, '5': 4, '10': 'time'},
    {'1': 'isOwner', '3': 7, '4': 1, '5': 8, '10': 'isOwner'},
    {'1': 'invite_msg_id', '3': 8, '4': 1, '5': 12, '10': 'inviteMsgId'},
    {
      '1': 'RECEIVE_SHARE_GROUP_CAMERA',
      '3': 89,
      '4': 1,
      '5': 13,
      '10': 'RECEIVESHAREGROUPCAMERA'
    },
  ],
  '4': [ReceiveShareGroupCamera_GroupShareRole$json],
};

@$core.Deprecated('Use receiveShareGroupCameraDescriptor instead')
const ReceiveShareGroupCamera_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': '_NOT_USE', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'MANAGER', '2': 2},
  ],
};

/// Descriptor for `ReceiveShareGroupCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveShareGroupCameraDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlU2hhcmVHcm91cENhbWVyYRIZCghncm91cF9pZBgBIAEoDFIHZ3JvdXBJZBIbCg'
    'lhY2NvdW50X2EYAiABKAlSCGFjY291bnRBEhsKCWFjY291bnRfYhgDIAEoCVIIYWNjb3VudEIS'
    'HQoKZ3JvdXBfbmFtZRgEIAEoCVIJZ3JvdXBOYW1lEkAKBHJvbGUYBSABKA4yLC5jb21tLlJlY2'
    'VpdmVTaGFyZUdyb3VwQ2FtZXJhLkdyb3VwU2hhcmVSb2xlUgRyb2xlEhIKBHRpbWUYBiABKARS'
    'BHRpbWUSGAoHaXNPd25lchgHIAEoCFIHaXNPd25lchIiCg1pbnZpdGVfbXNnX2lkGAggASgMUg'
    'tpbnZpdGVNc2dJZBI7ChpSRUNFSVZFX1NIQVJFX0dST1VQX0NBTUVSQRhZIAEoDVIXUkVDRUlW'
    'RVNIQVJFR1JPVVBDQU1FUkEiNQoOR3JvdXBTaGFyZVJvbGUSDAoIX05PVF9VU0UQABIICgRWSU'
    'VXEAESCwoHTUFOQUdFUhAC');

@$core.Deprecated('Use listShareInviteGroupDescriptor instead')
const ListShareInviteGroup$json = {
  '1': 'ListShareInviteGroup',
  '2': [
    {'1': 'ID', '3': 235, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListShareInviteGroup_Request$json, ListShareInviteGroup_Reply$json],
  '4': [ListShareInviteGroup_Error$json],
};

@$core.Deprecated('Use listShareInviteGroupDescriptor instead')
const ListShareInviteGroup_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use listShareInviteGroupDescriptor instead')
const ListShareInviteGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'invites',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.InviteMessage',
      '10': 'invites'
    },
  ],
};

@$core.Deprecated('Use listShareInviteGroupDescriptor instead')
const ListShareInviteGroup_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'GROUP_ID_EMPTY', '2': 1},
    {'1': 'GROUP_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `ListShareInviteGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listShareInviteGroupDescriptor = $convert.base64Decode(
    'ChRMaXN0U2hhcmVJbnZpdGVHcm91cBIPCgJJRBjrASABKA1SAklEGiQKB1JlcXVlc3QSGQoIZ3'
    'JvdXBfaWQYASABKAxSB2dyb3VwSWQaNgoFUmVwbHkSLQoHaW52aXRlcxgBIAMoCzITLmNvbW0u'
    'SW52aXRlTWVzc2FnZVIHaW52aXRlcyJDCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEgoOR1'
    'JPVVBfSURfRU1QVFkQARITCg9HUk9VUF9OT1RfRk9VTkQQAg==');

@$core.Deprecated('Use responseShareGroupCameraDescriptor instead')
const ResponseShareGroupCamera$json = {
  '1': 'ResponseShareGroupCamera',
  '2': [
    {'1': 'ID', '3': 236, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    ResponseShareGroupCamera_Request$json,
    ResponseShareGroupCamera_Reply$json
  ],
  '4': [
    ResponseShareGroupCamera_Action$json,
    ResponseShareGroupCamera_Error$json
  ],
};

@$core.Deprecated('Use responseShareGroupCameraDescriptor instead')
const ResponseShareGroupCamera_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'action',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.ResponseShareGroupCamera.Action',
      '10': 'action'
    },
    {'1': 'invite_msg_id', '3': 5, '4': 1, '5': 12, '10': 'inviteMsgId'},
  ],
};

@$core.Deprecated('Use responseShareGroupCameraDescriptor instead')
const ResponseShareGroupCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'invite_msg_id', '3': 1, '4': 1, '5': 12, '10': 'inviteMsgId'},
    {
      '1': 'groups',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
  ],
};

@$core.Deprecated('Use responseShareGroupCameraDescriptor instead')
const ResponseShareGroupCamera_Action$json = {
  '1': 'Action',
  '2': [
    {'1': 'ACCEPT', '2': 0},
    {'1': 'DECLINE', '2': 1},
  ],
};

@$core.Deprecated('Use responseShareGroupCameraDescriptor instead')
const ResponseShareGroupCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'INVALID_SHARE', '2': 1},
    {'1': 'INVITE_MSG_EMPTY', '2': 2},
    {'1': 'INVITE_MSG_NOT_FOUND', '2': 3},
    {'1': 'GROUP_SHARE_NOT_FOUND', '2': 4},
  ],
};

/// Descriptor for `ResponseShareGroupCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseShareGroupCameraDescriptor = $convert.base64Decode(
    'ChhSZXNwb25zZVNoYXJlR3JvdXBDYW1lcmESDwoCSUQY7AEgASgNUgJJRBpsCgdSZXF1ZXN0Ej'
    '0KBmFjdGlvbhgEIAEoDjIlLmNvbW0uUmVzcG9uc2VTaGFyZUdyb3VwQ2FtZXJhLkFjdGlvblIG'
    'YWN0aW9uEiIKDWludml0ZV9tc2dfaWQYBSABKAxSC2ludml0ZU1zZ0lkGlYKBVJlcGx5EiIKDW'
    'ludml0ZV9tc2dfaWQYASABKAxSC2ludml0ZU1zZ0lkEikKBmdyb3VwcxgCIAMoCzIRLmNvbW0u'
    'RGV2aWNlR3JvdXBSBmdyb3VwcyIhCgZBY3Rpb24SCgoGQUNDRVBUEAASCwoHREVDTElORRABIn'
    'gKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg1JTlZBTElEX1NIQVJFEAESFAoQSU5WSVRF'
    'X01TR19FTVBUWRACEhgKFElOVklURV9NU0dfTk9UX0ZPVU5EEAMSGQoVR1JPVVBfU0hBUkVfTk'
    '9UX0ZPVU5EEAQ=');

@$core.Deprecated('Use receiveResponseShareGroupCameraDescriptor instead')
const ReceiveResponseShareGroupCamera$json = {
  '1': 'ReceiveResponseShareGroupCamera',
  '2': [
    {
      '1': 'action',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveResponseShareGroupCamera.Action',
      '10': 'action'
    },
    {'1': 'invite_msg_id', '3': 2, '4': 1, '5': 12, '10': 'inviteMsgId'},
    {'1': 'group_id', '3': 3, '4': 1, '5': 12, '10': 'groupId'},
    {
      '1': 'RECEIVE_RESPONSE_SHARE_GROUP_CAMERA',
      '3': 90,
      '4': 1,
      '5': 13,
      '10': 'RECEIVERESPONSESHAREGROUPCAMERA'
    },
  ],
  '4': [ReceiveResponseShareGroupCamera_Action$json],
};

@$core.Deprecated('Use receiveResponseShareGroupCameraDescriptor instead')
const ReceiveResponseShareGroupCamera_Action$json = {
  '1': 'Action',
  '2': [
    {'1': 'ACCEPT', '2': 0},
    {'1': 'DECLINE', '2': 1},
  ],
};

/// Descriptor for `ReceiveResponseShareGroupCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveResponseShareGroupCameraDescriptor = $convert.base64Decode(
    'Ch9SZWNlaXZlUmVzcG9uc2VTaGFyZUdyb3VwQ2FtZXJhEkQKBmFjdGlvbhgBIAEoDjIsLmNvbW'
    '0uUmVjZWl2ZVJlc3BvbnNlU2hhcmVHcm91cENhbWVyYS5BY3Rpb25SBmFjdGlvbhIiCg1pbnZp'
    'dGVfbXNnX2lkGAIgASgMUgtpbnZpdGVNc2dJZBIZCghncm91cF9pZBgDIAEoDFIHZ3JvdXBJZB'
    'JMCiNSRUNFSVZFX1JFU1BPTlNFX1NIQVJFX0dST1VQX0NBTUVSQRhaIAEoDVIfUkVDRUlWRVJF'
    'U1BPTlNFU0hBUkVHUk9VUENBTUVSQSIhCgZBY3Rpb24SCgoGQUNDRVBUEAASCwoHREVDTElORR'
    'AB');

@$core.Deprecated('Use deleteCameraEmapInfoDescriptor instead')
const DeleteCameraEmapInfo$json = {
  '1': 'DeleteCameraEmapInfo',
  '2': [
    {'1': 'ID', '3': 237, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteCameraEmapInfo_Request$json, DeleteCameraEmapInfo_Reply$json],
  '4': [DeleteCameraEmapInfo_Error$json],
};

@$core.Deprecated('Use deleteCameraEmapInfoDescriptor instead')
const DeleteCameraEmapInfo_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
    {
      '1': 'cameraEmapInfo_id',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'cameraEmapInfoId'
    },
  ],
};

@$core.Deprecated('Use deleteCameraEmapInfoDescriptor instead')
const DeleteCameraEmapInfo_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use deleteCameraEmapInfoDescriptor instead')
const DeleteCameraEmapInfo_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EMAP_ID_EMPTY', '2': 1},
    {'1': 'EMAP_ID_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_EMAP_ID_EMPTY', '2': 3},
    {'1': 'CAMERA_EMAP_NOT_FOUND', '2': 4},
  ],
};

/// Descriptor for `DeleteCameraEmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCameraEmapInfoDescriptor = $convert.base64Decode(
    'ChREZWxldGVDYW1lcmFFbWFwSW5mbxIPCgJJRBjtASABKA1SAklEGk8KB1JlcXVlc3QSFwoHZW'
    '1hcF9pZBgBIAEoDFIGZW1hcElkEisKEWNhbWVyYUVtYXBJbmZvX2lkGAIgASgMUhBjYW1lcmFF'
    'bWFwSW5mb0lkGgcKBVJlcGx5InkKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg1FTUFQX0'
    'lEX0VNUFRZEAESFQoRRU1BUF9JRF9OT1RfRk9VTkQQAhIYChRDQU1FUkFfRU1BUF9JRF9FTVBU'
    'WRADEhkKFUNBTUVSQV9FTUFQX05PVF9GT1VORBAE');

@$core.Deprecated('Use receiveDeleteCameraEmapInfoDescriptor instead')
const ReceiveDeleteCameraEmapInfo$json = {
  '1': 'ReceiveDeleteCameraEmapInfo',
  '2': [
    {'1': 'emap_id', '3': 1, '4': 1, '5': 12, '10': 'emapId'},
    {
      '1': 'cameraEmapInfo_id',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'cameraEmapInfoId'
    },
    {
      '1': 'RECEIVE_DELETE_CAMERA_EMAP_INFO',
      '3': 91,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEDELETECAMERAEMAPINFO'
    },
  ],
};

/// Descriptor for `ReceiveDeleteCameraEmapInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDeleteCameraEmapInfoDescriptor = $convert.base64Decode(
    'ChtSZWNlaXZlRGVsZXRlQ2FtZXJhRW1hcEluZm8SFwoHZW1hcF9pZBgBIAEoDFIGZW1hcElkEi'
    'sKEWNhbWVyYUVtYXBJbmZvX2lkGAIgASgMUhBjYW1lcmFFbWFwSW5mb0lkEkQKH1JFQ0VJVkVf'
    'REVMRVRFX0NBTUVSQV9FTUFQX0lORk8YWyABKA1SG1JFQ0VJVkVERUxFVEVDQU1FUkFFTUFQSU'
    '5GTw==');

@$core.Deprecated('Use receiveUpdateCameraDescriptor instead')
const ReceiveUpdateCamera$json = {
  '1': 'ReceiveUpdateCamera',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_UPDATE_CAMERA',
      '3': 92,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATECAMERA'
    },
  ],
};

/// Descriptor for `ReceiveUpdateCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateCameraDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZlVXBkYXRlQ2FtZXJhEiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW'
    '1lcmESMgoVUkVDRUlWRV9VUERBVEVfQ0FNRVJBGFwgASgNUhNSRUNFSVZFVVBEQVRFQ0FNRVJB');

@$core.Deprecated('Use deleteShareGroupDescriptor instead')
const DeleteShareGroup$json = {
  '1': 'DeleteShareGroup',
  '2': [
    {'1': 'ID', '3': 238, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteShareGroup_Request$json, DeleteShareGroup_Reply$json],
  '4': [DeleteShareGroup_Error$json],
};

@$core.Deprecated('Use deleteShareGroupDescriptor instead')
const DeleteShareGroup_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'share_invite_id', '3': 1, '4': 1, '5': 12, '10': 'shareInviteId'},
  ],
};

@$core.Deprecated('Use deleteShareGroupDescriptor instead')
const DeleteShareGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'share_invite_id', '3': 1, '4': 1, '5': 12, '10': 'shareInviteId'},
  ],
};

@$core.Deprecated('Use deleteShareGroupDescriptor instead')
const DeleteShareGroup_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'INVALID_SHARE', '2': 1},
  ],
};

/// Descriptor for `DeleteShareGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteShareGroupDescriptor = $convert.base64Decode(
    'ChBEZWxldGVTaGFyZUdyb3VwEg8KAklEGO4BIAEoDVICSUQaMQoHUmVxdWVzdBImCg9zaGFyZV'
    '9pbnZpdGVfaWQYASABKAxSDXNoYXJlSW52aXRlSWQaLwoFUmVwbHkSJgoPc2hhcmVfaW52aXRl'
    'X2lkGAEgASgMUg1zaGFyZUludml0ZUlkIi0KBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIRCg'
    '1JTlZBTElEX1NIQVJFEAE=');

@$core.Deprecated('Use receiveDeleteShareGroupDescriptor instead')
const ReceiveDeleteShareGroup$json = {
  '1': 'ReceiveDeleteShareGroup',
  '2': [
    {'1': 'share_invite_id', '3': 1, '4': 1, '5': 12, '10': 'shareInviteId'},
    {'1': 'group_id', '3': 2, '4': 1, '5': 12, '10': 'groupId'},
    {
      '1': 'RECEIVE_DELETE_SHARE_GROUP',
      '3': 1001,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEDELETESHAREGROUP'
    },
  ],
};

/// Descriptor for `ReceiveDeleteShareGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDeleteShareGroupDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlRGVsZXRlU2hhcmVHcm91cBImCg9zaGFyZV9pbnZpdGVfaWQYASABKAxSDXNoYX'
    'JlSW52aXRlSWQSGQoIZ3JvdXBfaWQYAiABKAxSB2dyb3VwSWQSPAoaUkVDRUlWRV9ERUxFVEVf'
    'U0hBUkVfR1JPVVAY6QcgASgNUhdSRUNFSVZFREVMRVRFU0hBUkVHUk9VUA==');

@$core.Deprecated('Use onvif_PTZDescriptor instead')
const Onvif_PTZ$json = {
  '1': 'Onvif_PTZ',
  '2': [
    {'1': 'ID', '3': 239, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [Onvif_PTZ_Request$json, Onvif_PTZ_Reply$json],
  '4': [Onvif_PTZ_Error$json],
};

@$core.Deprecated('Use onvif_PTZDescriptor instead')
const Onvif_PTZ_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'pan', '3': 1, '4': 1, '5': 2, '10': 'pan'},
    {'1': 'tit', '3': 2, '4': 1, '5': 2, '10': 'tit'},
    {'1': 'zoom', '3': 3, '4': 1, '5': 2, '10': 'zoom'},
    {'1': 'camera_id', '3': 4, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use onvif_PTZDescriptor instead')
const Onvif_PTZ_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use onvif_PTZDescriptor instead')
const Onvif_PTZ_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'CAMERA_NOT_ONVIF_DEVICE', '2': 2},
    {'1': 'BOX_OFFLINE', '2': 3},
  ],
};

/// Descriptor for `Onvif_PTZ`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onvif_PTZDescriptor = $convert.base64Decode(
    'CglPbnZpZl9QVFoSDwoCSUQY7wEgASgNUgJJRBpeCgdSZXF1ZXN0EhAKA3BhbhgBIAEoAlIDcG'
    'FuEhAKA3RpdBgCIAEoAlIDdGl0EhIKBHpvb20YAyABKAJSBHpvb20SGwoJY2FtZXJhX2lkGAQg'
    'ASgMUghjYW1lcmFJZBoHCgVSZXBseSJeCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASFAoQQ0'
    'FNRVJBX05PVF9GT1VORBABEhsKF0NBTUVSQV9OT1RfT05WSUZfREVWSUNFEAISDwoLQk9YX09G'
    'RkxJTkUQAw==');

@$core.Deprecated('Use receiveNewVideoPlaybackDescriptor instead')
const ReceiveNewVideoPlayback$json = {
  '1': 'ReceiveNewVideoPlayback',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'newVideoPlayback',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.ReceiveNewVideoPlayback.PlaybackVideo',
      '10': 'newVideoPlayback'
    },
    {
      '1': 'RECEIVE_NEW_VIDEO_PLAYBACK',
      '3': 94,
      '4': 1,
      '5': 13,
      '10': 'RECEIVENEWVIDEOPLAYBACK'
    },
  ],
  '3': [ReceiveNewVideoPlayback_PlaybackVideo$json],
};

@$core.Deprecated('Use receiveNewVideoPlaybackDescriptor instead')
const ReceiveNewVideoPlayback_PlaybackVideo$json = {
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

/// Descriptor for `ReceiveNewVideoPlayback`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveNewVideoPlaybackDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlTmV3VmlkZW9QbGF5YmFjaxIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEl'
    'cKEG5ld1ZpZGVvUGxheWJhY2sYAiABKAsyKy5jb21tLlJlY2VpdmVOZXdWaWRlb1BsYXliYWNr'
    'LlBsYXliYWNrVmlkZW9SEG5ld1ZpZGVvUGxheWJhY2sSOwoaUkVDRUlWRV9ORVdfVklERU9fUE'
    'xBWUJBQ0sYXiABKA1SF1JFQ0VJVkVORVdWSURFT1BMQVlCQUNLGusBCg1QbGF5YmFja1ZpZGVv'
    'Eh0KCnN0YXJ0X3RpbWUYASABKARSCXN0YXJ0VGltZRIZCghlbmRfdGltZRgCIAEoBFIHZW5kVG'
    'ltZRIhCgx1cmxfcGxheWJhY2sYBCABKAlSC3VybFBsYXliYWNrEhsKCWNhbWVyYV9pZBgFIAEo'
    'DFIIY2FtZXJhSWQSIwoNdXJsX3RodW1ibmFpbBgGIAEoCVIMdXJsVGh1bWJuYWlsEhoKCGR1cm'
    'F0aW9uGAcgASgNUghkdXJhdGlvbhIfCgtwbGF5YmFja19pZBgIIAEoDFIKcGxheWJhY2tJZA==');

@$core.Deprecated('Use iVALineCrossingDescriptor instead')
const IVALineCrossing$json = {
  '1': 'IVALineCrossing',
  '2': [
    {'1': 'ID', '3': 240, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [IVALineCrossing_Request$json, IVALineCrossing_Reply$json],
  '4': [IVALineCrossing_DirectionType$json, IVALineCrossing_Error$json],
};

@$core.Deprecated('Use iVALineCrossingDescriptor instead')
const IVALineCrossing_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'direction',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.IVALineCrossing.DirectionType',
      '10': 'direction'
    },
    {'1': 'isEnable', '3': 3, '4': 1, '5': 8, '10': 'isEnable'},
    {'1': 'is_send_email', '3': 5, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'is_record', '3': 6, '4': 1, '5': 8, '10': 'isRecord'},
    {
      '1': 'isPushNotification',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'isPushNotification'
    },
    {
      '1': 'roi_start',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.comm.Roi',
      '10': 'roiStart'
    },
    {'1': 'roi_end', '3': 9, '4': 1, '5': 11, '6': '.comm.Roi', '10': 'roiEnd'},
    {
      '1': 'direction_start',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.comm.Roi',
      '10': 'directionStart'
    },
    {
      '1': 'direction_end',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.comm.Roi',
      '10': 'directionEnd'
    },
  ],
};

@$core.Deprecated('Use iVALineCrossingDescriptor instead')
const IVALineCrossing_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use iVALineCrossingDescriptor instead')
const IVALineCrossing_DirectionType$json = {
  '1': 'DirectionType',
  '2': [
    {'1': 'A__B', '2': 0},
    {'1': 'B__A', '2': 1},
    {'1': 'AB', '2': 2},
  ],
};

@$core.Deprecated('Use iVALineCrossingDescriptor instead')
const IVALineCrossing_Error$json = {
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
  ],
};

/// Descriptor for `IVALineCrossing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVALineCrossingDescriptor = $convert.base64Decode(
    'Cg9JVkFMaW5lQ3Jvc3NpbmcSDwoCSUQY8AEgASgNUgJJRBqmAwoHUmVxdWVzdBIbCgljYW1lcm'
    'FfaWQYASABKAxSCGNhbWVyYUlkEkEKCWRpcmVjdGlvbhgCIAEoDjIjLmNvbW0uSVZBTGluZUNy'
    'b3NzaW5nLkRpcmVjdGlvblR5cGVSCWRpcmVjdGlvbhIaCghpc0VuYWJsZRgDIAEoCFIIaXNFbm'
    'FibGUSIgoNaXNfc2VuZF9lbWFpbBgFIAEoCFILaXNTZW5kRW1haWwSGwoJaXNfcmVjb3JkGAYg'
    'ASgIUghpc1JlY29yZBIuChJpc1B1c2hOb3RpZmljYXRpb24YByABKAhSEmlzUHVzaE5vdGlmaW'
    'NhdGlvbhImCglyb2lfc3RhcnQYCCABKAsyCS5jb21tLlJvaVIIcm9pU3RhcnQSIgoHcm9pX2Vu'
    'ZBgJIAEoCzIJLmNvbW0uUm9pUgZyb2lFbmQSMgoPZGlyZWN0aW9uX3N0YXJ0GAogASgLMgkuY2'
    '9tbS5Sb2lSDmRpcmVjdGlvblN0YXJ0Ei4KDWRpcmVjdGlvbl9lbmQYCyABKAsyCS5jb21tLlJv'
    'aVIMZGlyZWN0aW9uRW5kGi0KBVJlcGx5EiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUg'
    'ZjYW1lcmEiKwoNRGlyZWN0aW9uVHlwZRIICgRBX19CEAASCAoEQl9fQRABEgYKAkFCEAIirgEK'
    'BUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABITCg9DQU1FUkFfSURfRU1QVFkQARIUChBDQU1FUk'
    'FfTk9UX0ZPVU5EEAISEAoMSVZBX1NWX0VSUk9SEAMSFAoQSVZBX05PVF9SRUdJU1RFUhAEEhgK'
    'FElWQV9UT09fTUFOWV9SRVFVRVNUEAUSDgoKT1ZFUl9RVU9UQRAGEhUKEVBFUk1JU1NJT05fRE'
    'VOSUVEEAc=');

@$core.Deprecated('Use receiveIVALineCrossingDescriptor instead')
const ReceiveIVALineCrossing$json = {
  '1': 'ReceiveIVALineCrossing',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_IVA_LINE_CROSSING',
      '3': 95,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEIVALINECROSSING'
    },
  ],
};

/// Descriptor for `ReceiveIVALineCrossing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveIVALineCrossingDescriptor = $convert.base64Decode(
    'ChZSZWNlaXZlSVZBTGluZUNyb3NzaW5nEiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUg'
    'ZjYW1lcmESOQoZUkVDRUlWRV9JVkFfTElORV9DUk9TU0lORxhfIAEoDVIWUkVDRUlWRUlWQUxJ'
    'TkVDUk9TU0lORw==');

@$core.Deprecated('Use iVAIntrusionDetectionDescriptor instead')
const IVAIntrusionDetection$json = {
  '1': 'IVAIntrusionDetection',
  '2': [
    {'1': 'ID', '3': 241, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [IVAIntrusionDetection_Request$json, IVAIntrusionDetection_Reply$json],
  '4': [IVAIntrusionDetection_Error$json],
};

@$core.Deprecated('Use iVAIntrusionDetectionDescriptor instead')
const IVAIntrusionDetection_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'isEnable', '3': 2, '4': 1, '5': 8, '10': 'isEnable'},
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
  ],
};

@$core.Deprecated('Use iVAIntrusionDetectionDescriptor instead')
const IVAIntrusionDetection_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use iVAIntrusionDetectionDescriptor instead')
const IVAIntrusionDetection_Error$json = {
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
  ],
};

/// Descriptor for `IVAIntrusionDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVAIntrusionDetectionDescriptor = $convert.base64Decode(
    'ChVJVkFJbnRydXNpb25EZXRlY3Rpb24SDwoCSUQY8QEgASgNUgJJRBrSAQoHUmVxdWVzdBIbCg'
    'ljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEhoKCGlzRW5hYmxlGAIgASgIUghpc0VuYWJsZRIi'
    'Cg1pc19zZW5kX2VtYWlsGAQgASgIUgtpc1NlbmRFbWFpbBIbCglpc19yZWNvcmQYBSABKAhSCG'
    'lzUmVjb3JkEi4KEmlzUHVzaE5vdGlmaWNhdGlvbhgGIAEoCFISaXNQdXNoTm90aWZpY2F0aW9u'
    'Eh0KBHJvaXMYByADKAsyCS5jb21tLlJvaVIEcm9pcxotCgVSZXBseRIkCgZjYW1lcmEYASABKA'
    'syDC5jb21tLkNhbWVyYVIGY2FtZXJhIq4BCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEwoP'
    'Q0FNRVJBX0lEX0VNUFRZEAESFAoQQ0FNRVJBX05PVF9GT1VORBACEhAKDElWQV9TVl9FUlJPUh'
    'ADEhQKEElWQV9OT1RfUkVHSVNURVIQBBIYChRJVkFfVE9PX01BTllfUkVRVUVTVBAFEg4KCk9W'
    'RVJfUVVPVEEQBhIVChFQRVJNSVNTSU9OX0RFTklFRBAH');

@$core.Deprecated('Use receiveIVAIntrusionDetectionDescriptor instead')
const ReceiveIVAIntrusionDetection$json = {
  '1': 'ReceiveIVAIntrusionDetection',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_IVA_INT_DET',
      '3': 96,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEIVAINTDET'
    },
  ],
};

/// Descriptor for `ReceiveIVAIntrusionDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveIVAIntrusionDetectionDescriptor =
    $convert.base64Decode(
        'ChxSZWNlaXZlSVZBSW50cnVzaW9uRGV0ZWN0aW9uEiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2'
        'FtZXJhUgZjYW1lcmESLQoTUkVDRUlWRV9JVkFfSU5UX0RFVBhgIAEoDVIQUkVDRUlWRUlWQUlO'
        'VERFVA==');

@$core.Deprecated('Use updateInviteGroupDescriptor instead')
const UpdateInviteGroup$json = {
  '1': 'UpdateInviteGroup',
  '2': [
    {'1': 'ID', '3': 242, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateInviteGroup_Request$json, UpdateInviteGroup_Reply$json],
  '4': [UpdateInviteGroup_GroupShareRole$json, UpdateInviteGroup_Error$json],
};

@$core.Deprecated('Use updateInviteGroupDescriptor instead')
const UpdateInviteGroup_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'share_invite_id', '3': 1, '4': 1, '5': 12, '10': 'shareInviteId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.UpdateInviteGroup.GroupShareRole',
      '10': 'role'
    },
  ],
};

@$core.Deprecated('Use updateInviteGroupDescriptor instead')
const UpdateInviteGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'share_invite_id', '3': 3, '4': 1, '5': 12, '10': 'shareInviteId'},
  ],
};

@$core.Deprecated('Use updateInviteGroupDescriptor instead')
const UpdateInviteGroup_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': '_NOT_USE', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'MANAGER', '2': 2},
  ],
};

@$core.Deprecated('Use updateInviteGroupDescriptor instead')
const UpdateInviteGroup_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'INVITE_MESSAGE_INVALID', '2': 1},
    {'1': 'PERMISSION_DENIED', '2': 2},
    {'1': 'NOT_CHANGE', '2': 3},
  ],
};

/// Descriptor for `UpdateInviteGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInviteGroupDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVJbnZpdGVHcm91cBIPCgJJRBjyASABKA1SAklEGm0KB1JlcXVlc3QSJgoPc2hhcm'
    'VfaW52aXRlX2lkGAEgASgMUg1zaGFyZUludml0ZUlkEjoKBHJvbGUYAiABKA4yJi5jb21tLlVw'
    'ZGF0ZUludml0ZUdyb3VwLkdyb3VwU2hhcmVSb2xlUgRyb2xlGi8KBVJlcGx5EiYKD3NoYXJlX2'
    'ludml0ZV9pZBgDIAEoDFINc2hhcmVJbnZpdGVJZCI1Cg5Hcm91cFNoYXJlUm9sZRIMCghfTk9U'
    'X1VTRRAAEggKBFZJRVcQARILCgdNQU5BR0VSEAIiXQoFRXJyb3ISEQoNRVJST1JfREVGQVVMVB'
    'AAEhoKFklOVklURV9NRVNTQUdFX0lOVkFMSUQQARIVChFQRVJNSVNTSU9OX0RFTklFRBACEg4K'
    'Ck5PVF9DSEFOR0UQAw==');

@$core.Deprecated('Use receiveUpdateInviteGroupDescriptor instead')
const ReceiveUpdateInviteGroup$json = {
  '1': 'ReceiveUpdateInviteGroup',
  '2': [
    {'1': 'share_invite_id', '3': 1, '4': 1, '5': 12, '10': 'shareInviteId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveUpdateInviteGroup.GroupShareRole',
      '10': 'role'
    },
    {
      '1': 'RECEIVE_UPDATE_INVITE_GROUP',
      '3': 97,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEINVITEGROUP'
    },
  ],
  '4': [ReceiveUpdateInviteGroup_GroupShareRole$json],
};

@$core.Deprecated('Use receiveUpdateInviteGroupDescriptor instead')
const ReceiveUpdateInviteGroup_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': '_NOT_USE', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'MANAGER', '2': 2},
  ],
};

/// Descriptor for `ReceiveUpdateInviteGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateInviteGroupDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlVXBkYXRlSW52aXRlR3JvdXASJgoPc2hhcmVfaW52aXRlX2lkGAEgASgMUg1zaG'
    'FyZUludml0ZUlkEkEKBHJvbGUYAiABKA4yLS5jb21tLlJlY2VpdmVVcGRhdGVJbnZpdGVHcm91'
    'cC5Hcm91cFNoYXJlUm9sZVIEcm9sZRI9ChtSRUNFSVZFX1VQREFURV9JTlZJVEVfR1JPVVAYYS'
    'ABKA1SGFJFQ0VJVkVVUERBVEVJTlZJVEVHUk9VUCI1Cg5Hcm91cFNoYXJlUm9sZRIMCghfTk9U'
    'X1VTRRAAEggKBFZJRVcQARILCgdNQU5BR0VSEAI=');

@$core.Deprecated('Use receiveUpdateGroupRoleDescriptor instead')
const ReceiveUpdateGroupRole$json = {
  '1': 'ReceiveUpdateGroupRole',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 12, '10': 'groupId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceiveUpdateGroupRole.GroupShareRole',
      '10': 'role'
    },
    {
      '1': 'group',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'group'
    },
    {
      '1': 'RECEIVE_UPDATE_GROUP_ROLE',
      '3': 98,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEGROUPROLE'
    },
  ],
  '4': [ReceiveUpdateGroupRole_GroupShareRole$json],
};

@$core.Deprecated('Use receiveUpdateGroupRoleDescriptor instead')
const ReceiveUpdateGroupRole_GroupShareRole$json = {
  '1': 'GroupShareRole',
  '2': [
    {'1': '_NOT_USE', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'MANAGER', '2': 2},
  ],
};

/// Descriptor for `ReceiveUpdateGroupRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateGroupRoleDescriptor = $convert.base64Decode(
    'ChZSZWNlaXZlVXBkYXRlR3JvdXBSb2xlEhkKCGdyb3VwX2lkGAEgASgMUgdncm91cElkEj8KBH'
    'JvbGUYAiABKA4yKy5jb21tLlJlY2VpdmVVcGRhdGVHcm91cFJvbGUuR3JvdXBTaGFyZVJvbGVS'
    'BHJvbGUSJwoFZ3JvdXAYAyABKAsyES5jb21tLkRldmljZUdyb3VwUgVncm91cBI5ChlSRUNFSV'
    'ZFX1VQREFURV9HUk9VUF9ST0xFGGIgASgNUhZSRUNFSVZFVVBEQVRFR1JPVVBST0xFIjUKDkdy'
    'b3VwU2hhcmVSb2xlEgwKCF9OT1RfVVNFEAASCAoEVklFVxABEgsKB01BTkFHRVIQAg==');

@$core.Deprecated('Use getCurrentRecodingDescriptor instead')
const GetCurrentRecoding$json = {
  '1': 'GetCurrentRecoding',
  '2': [
    {'1': 'ID', '3': 244, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetCurrentRecoding_Request$json, GetCurrentRecoding_Reply$json],
  '4': [GetCurrentRecoding_Error$json],
};

@$core.Deprecated('Use getCurrentRecodingDescriptor instead')
const GetCurrentRecoding_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use getCurrentRecodingDescriptor instead')
const GetCurrentRecoding_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'current_record_file_path',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'currentRecordFilePath'
    },
    {'1': 'start_record', '3': 2, '4': 1, '5': 13, '10': 'startRecord'},
  ],
};

@$core.Deprecated('Use getCurrentRecodingDescriptor instead')
const GetCurrentRecoding_Error$json = {
  '1': 'Error',
  '2': [
    {'1': '_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_RECORDING', '2': 1},
  ],
};

/// Descriptor for `GetCurrentRecoding`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentRecodingDescriptor = $convert.base64Decode(
    'ChJHZXRDdXJyZW50UmVjb2RpbmcSDwoCSUQY9AEgASgNUgJJRBomCgdSZXF1ZXN0EhsKCWNhbW'
    'VyYV9pZBgBIAEoDFIIY2FtZXJhSWQaYwoFUmVwbHkSNwoYY3VycmVudF9yZWNvcmRfZmlsZV9w'
    'YXRoGAEgASgJUhVjdXJyZW50UmVjb3JkRmlsZVBhdGgSIQoMc3RhcnRfcmVjb3JkGAIgASgNUg'
    'tzdGFydFJlY29yZCIvCgVFcnJvchIMCghfREVGQVVMVBAAEhgKFENBTUVSQV9OT1RfUkVDT1JE'
    'SU5HEAE=');

@$core.Deprecated('Use getAllCameraDescriptor instead')
const GetAllCamera$json = {
  '1': 'GetAllCamera',
  '2': [
    {'1': 'ID', '3': 245, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetAllCamera_Request$json, GetAllCamera_Reply$json],
  '4': [
    GetAllCamera_Iva_Type$json,
    GetAllCamera_Status$json,
    GetAllCamera_Error$json
  ],
};

@$core.Deprecated('Use getAllCameraDescriptor instead')
const GetAllCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.GetAllCamera.Status',
      '10': 'status'
    },
    {
      '1': 'iva_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.GetAllCamera.Iva_Type',
      '10': 'ivaType'
    },
  ],
};

@$core.Deprecated('Use getAllCameraDescriptor instead')
const GetAllCamera_Reply$json = {
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

@$core.Deprecated('Use getAllCameraDescriptor instead')
const GetAllCamera_Iva_Type$json = {
  '1': 'Iva_Type',
  '2': [
    {'1': 'ALL', '2': 0},
    {'1': 'IVA_MOTION_DETECTION', '2': 1},
    {'1': 'IVA_LINE_CROSSING', '2': 2},
    {'1': 'IVA_INTRUSION_DETECTION', '2': 3},
    {'1': 'IVA_FACE_DETECTION', '2': 4},
    {'1': 'IVA_SMOKE_DETECTION', '2': 5},
    {'1': 'IVA_ALPR_DETECTION', '2': 6},
  ],
};

@$core.Deprecated('Use getAllCameraDescriptor instead')
const GetAllCamera_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'ALL_C', '2': 0},
    {'1': 'RUNNING', '2': 1},
    {'1': 'NOT_RUNNING', '2': 2},
    {'1': 'ALL_ACTIVE', '2': 3},
  ],
};

@$core.Deprecated('Use getAllCameraDescriptor instead')
const GetAllCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': '_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_FOUND', '2': 1},
    {'1': 'USER_NOT_OWNER_CAMERA', '2': 2},
  ],
};

/// Descriptor for `GetAllCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllCameraDescriptor = $convert.base64Decode(
    'CgxHZXRBbGxDYW1lcmESDwoCSUQY9QEgASgNUgJJRBqRAQoHUmVxdWVzdBIbCgljYW1lcmFfaW'
    'QYASABKAxSCGNhbWVyYUlkEjEKBnN0YXR1cxgCIAEoDjIZLmNvbW0uR2V0QWxsQ2FtZXJhLlN0'
    'YXR1c1IGc3RhdHVzEjYKCGl2YV90eXBlGAMgASgOMhsuY29tbS5HZXRBbGxDYW1lcmEuSXZhX1'
    'R5cGVSB2l2YVR5cGUaLwoFUmVwbHkSJgoHY2FtZXJhcxgBIAMoCzIMLmNvbW0uQ2FtZXJhUgdj'
    'YW1lcmFzIqoBCghJdmFfVHlwZRIHCgNBTEwQABIYChRJVkFfTU9USU9OX0RFVEVDVElPThABEh'
    'UKEUlWQV9MSU5FX0NST1NTSU5HEAISGwoXSVZBX0lOVFJVU0lPTl9ERVRFQ1RJT04QAxIWChJJ'
    'VkFfRkFDRV9ERVRFQ1RJT04QBBIXChNJVkFfU01PS0VfREVURUNUSU9OEAUSFgoSSVZBX0FMUF'
    'JfREVURUNUSU9OEAYiQQoGU3RhdHVzEgkKBUFMTF9DEAASCwoHUlVOTklORxABEg8KC05PVF9S'
    'VU5OSU5HEAISDgoKQUxMX0FDVElWRRADIkYKBUVycm9yEgwKCF9ERUZBVUxUEAASFAoQQ0FNRV'
    'JBX05PVF9GT1VORBABEhkKFVVTRVJfTk9UX09XTkVSX0NBTUVSQRAC');

@$core.Deprecated('Use getAllGroupDescriptor instead')
const GetAllGroup$json = {
  '1': 'GetAllGroup',
  '2': [
    {'1': 'ID', '3': 246, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetAllGroup_Request$json, GetAllGroup_Reply$json],
};

@$core.Deprecated('Use getAllGroupDescriptor instead')
const GetAllGroup_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use getAllGroupDescriptor instead')
const GetAllGroup_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'groups',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
  ],
};

/// Descriptor for `GetAllGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllGroupDescriptor = $convert.base64Decode(
    'CgtHZXRBbGxHcm91cBIPCgJJRBj2ASABKA1SAklEGgkKB1JlcXVlc3QaMgoFUmVwbHkSKQoGZ3'
    'JvdXBzGAIgAygLMhEuY29tbS5EZXZpY2VHcm91cFIGZ3JvdXBz');

@$core.Deprecated('Use receiveGroupChangeDescriptor instead')
const ReceiveGroupChange$json = {
  '1': 'ReceiveGroupChange',
  '2': [
    {
      '1': 'groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.DeviceGroup',
      '10': 'groups'
    },
    {
      '1': 'RECEIVE_UPDATE_GROUP_DEVICE',
      '3': 99,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEGROUPDEVICE'
    },
  ],
};

/// Descriptor for `ReceiveGroupChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveGroupChangeDescriptor = $convert.base64Decode(
    'ChJSZWNlaXZlR3JvdXBDaGFuZ2USKQoGZ3JvdXBzGAEgAygLMhEuY29tbS5EZXZpY2VHcm91cF'
    'IGZ3JvdXBzEj0KG1JFQ0VJVkVfVVBEQVRFX0dST1VQX0RFVklDRRhjIAEoDVIYUkVDRUlWRVVQ'
    'REFURUdST1VQREVWSUNF');

@$core.Deprecated('Use checkCameraOnvifDescriptor instead')
const CheckCameraOnvif$json = {
  '1': 'CheckCameraOnvif',
  '2': [
    {'1': 'ID', '3': 247, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [CheckCameraOnvif_Request$json, CheckCameraOnvif_Reply$json],
  '4': [CheckCameraOnvif_Error$json],
};

@$core.Deprecated('Use checkCameraOnvifDescriptor instead')
const CheckCameraOnvif_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'xaddrs', '3': 1, '4': 1, '5': 9, '10': 'xaddrs'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'box_id', '3': 4, '4': 1, '5': 12, '10': 'boxId'},
  ],
};

@$core.Deprecated('Use checkCameraOnvifDescriptor instead')
const CheckCameraOnvif_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'rtsp_url', '3': 1, '4': 1, '5': 9, '10': 'rtspUrl'},
    {'1': 'SerialNumber', '3': 2, '4': 1, '5': 9, '10': 'SerialNumber'},
    {'1': 'sub_stream_url', '3': 3, '4': 3, '5': 9, '10': 'subStreamUrl'},
  ],
};

@$core.Deprecated('Use checkCameraOnvifDescriptor instead')
const CheckCameraOnvif_Error$json = {
  '1': 'Error',
  '2': [
    {'1': '_DEFAULT', '2': 0},
    {'1': 'IP_OR_DOMAIN_ERROR', '2': 1},
    {'1': 'USER_OR_PASSWORD_INVALID', '2': 2},
  ],
};

/// Descriptor for `CheckCameraOnvif`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkCameraOnvifDescriptor = $convert.base64Decode(
    'ChBDaGVja0NhbWVyYU9udmlmEg8KAklEGPcBIAEoDVICSUQacQoHUmVxdWVzdBIWCgZ4YWRkcn'
    'MYASABKAlSBnhhZGRycxIbCgl1c2VyX25hbWUYAiABKAlSCHVzZXJOYW1lEhoKCHBhc3N3b3Jk'
    'GAMgASgJUghwYXNzd29yZBIVCgZib3hfaWQYBCABKAxSBWJveElkGmwKBVJlcGx5EhkKCHJ0c3'
    'BfdXJsGAEgASgJUgdydHNwVXJsEiIKDFNlcmlhbE51bWJlchgCIAEoCVIMU2VyaWFsTnVtYmVy'
    'EiQKDnN1Yl9zdHJlYW1fdXJsGAMgAygJUgxzdWJTdHJlYW1VcmwiSwoFRXJyb3ISDAoIX0RFRk'
    'FVTFQQABIWChJJUF9PUl9ET01BSU5fRVJST1IQARIcChhVU0VSX09SX1BBU1NXT1JEX0lOVkFM'
    'SUQQAg==');

@$core.Deprecated('Use setCameraLocationDescriptor instead')
const SetCameraLocation$json = {
  '1': 'SetCameraLocation',
  '2': [
    {'1': 'ID', '3': 248, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [SetCameraLocation_Request$json, SetCameraLocation_Reply$json],
  '4': [SetCameraLocation_Error$json],
};

@$core.Deprecated('Use setCameraLocationDescriptor instead')
const SetCameraLocation_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'location',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.MapLocation',
      '10': 'location'
    },
    {'1': 'camera_id', '3': 2, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use setCameraLocationDescriptor instead')
const SetCameraLocation_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use setCameraLocationDescriptor instead')
const SetCameraLocation_Error$json = {
  '1': 'Error',
  '2': [
    {'1': '_DEFAULT', '2': 0},
    {'1': 'LOCATION_INVALID', '2': 1},
    {'1': 'CAMERA_ID_INVALID', '2': 2},
    {'1': 'PERMISSION_DENIED', '2': 3},
  ],
};

/// Descriptor for `SetCameraLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCameraLocationDescriptor = $convert.base64Decode(
    'ChFTZXRDYW1lcmFMb2NhdGlvbhIPCgJJRBj4ASABKA1SAklEGlUKB1JlcXVlc3QSLQoIbG9jYX'
    'Rpb24YASABKAsyES5jb21tLk1hcExvY2F0aW9uUghsb2NhdGlvbhIbCgljYW1lcmFfaWQYAiAB'
    'KAxSCGNhbWVyYUlkGi0KBVJlcGx5EiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW'
    '1lcmEiWQoFRXJyb3ISDAoIX0RFRkFVTFQQABIUChBMT0NBVElPTl9JTlZBTElEEAESFQoRQ0FN'
    'RVJBX0lEX0lOVkFMSUQQAhIVChFQRVJNSVNTSU9OX0RFTklFRBAD');

@$core.Deprecated('Use receiveUpdateCameraLocationDescriptor instead')
const ReceiveUpdateCameraLocation$json = {
  '1': 'ReceiveUpdateCameraLocation',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_UPDATE_CAMERA_LOCATION',
      '3': 1002,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATECAMERALOCATION'
    },
  ],
};

/// Descriptor for `ReceiveUpdateCameraLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateCameraLocationDescriptor =
    $convert.base64Decode(
        'ChtSZWNlaXZlVXBkYXRlQ2FtZXJhTG9jYXRpb24SJAoGY2FtZXJhGAEgASgLMgwuY29tbS5DYW'
        '1lcmFSBmNhbWVyYRJECh5SRUNFSVZFX1VQREFURV9DQU1FUkFfTE9DQVRJT04Y6gcgASgNUhtS'
        'RUNFSVZFVVBEQVRFQ0FNRVJBTE9DQVRJT04=');

@$core.Deprecated('Use iVASmokeDetectionDescriptor instead')
const IVASmokeDetection$json = {
  '1': 'IVASmokeDetection',
  '2': [
    {'1': 'ID', '3': 250, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [IVASmokeDetection_Request$json, IVASmokeDetection_Reply$json],
  '4': [IVASmokeDetection_Error$json],
};

@$core.Deprecated('Use iVASmokeDetectionDescriptor instead')
const IVASmokeDetection_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'isEnable', '3': 2, '4': 1, '5': 8, '10': 'isEnable'},
    {'1': 'is_send_email', '3': 3, '4': 1, '5': 8, '10': 'isSendEmail'},
    {'1': 'is_record', '3': 4, '4': 1, '5': 8, '10': 'isRecord'},
    {
      '1': 'isPushNotification',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'isPushNotification'
    },
  ],
};

@$core.Deprecated('Use iVASmokeDetectionDescriptor instead')
const IVASmokeDetection_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use iVASmokeDetectionDescriptor instead')
const IVASmokeDetection_Error$json = {
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
  ],
};

/// Descriptor for `IVASmokeDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVASmokeDetectionDescriptor = $convert.base64Decode(
    'ChFJVkFTbW9rZURldGVjdGlvbhIPCgJJRBj6ASABKA1SAklEGrMBCgdSZXF1ZXN0EhsKCWNhbW'
    'VyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGgoIaXNFbmFibGUYAiABKAhSCGlzRW5hYmxlEiIKDWlz'
    'X3NlbmRfZW1haWwYAyABKAhSC2lzU2VuZEVtYWlsEhsKCWlzX3JlY29yZBgEIAEoCFIIaXNSZW'
    'NvcmQSLgoSaXNQdXNoTm90aWZpY2F0aW9uGAUgASgIUhJpc1B1c2hOb3RpZmljYXRpb24aLQoF'
    'UmVwbHkSJAoGY2FtZXJhGAEgASgLMgwuY29tbS5DYW1lcmFSBmNhbWVyYSKuAQoFRXJyb3ISEQ'
    'oNRVJST1JfREVGQVVMVBAAEhMKD0NBTUVSQV9JRF9FTVBUWRABEhQKEENBTUVSQV9OT1RfRk9V'
    'TkQQAhIQCgxJVkFfU1ZfRVJST1IQAxIUChBJVkFfTk9UX1JFR0lTVEVSEAQSGAoUSVZBX1RPT1'
    '9NQU5ZX1JFUVVFU1QQBRIOCgpPVkVSX1FVT1RBEAYSFQoRUEVSTUlTU0lPTl9ERU5JRUQQBw==');

@$core.Deprecated('Use receiveIVASmokeDetectionDescriptor instead')
const ReceiveIVASmokeDetection$json = {
  '1': 'ReceiveIVASmokeDetection',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_IVA_SMOKE_DETECTION',
      '3': 1003,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEIVASMOKEDETECTION'
    },
  ],
};

/// Descriptor for `ReceiveIVASmokeDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveIVASmokeDetectionDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlSVZBU21va2VEZXRlY3Rpb24SJAoGY2FtZXJhGAEgASgLMgwuY29tbS5DYW1lcm'
    'FSBmNhbWVyYRI+ChtSRUNFSVZFX0lWQV9TTU9LRV9ERVRFQ1RJT04Y6wcgASgNUhhSRUNFSVZF'
    'SVZBU01PS0VERVRFQ1RJT04=');

@$core.Deprecated('Use iVAFaceDetectionDescriptor instead')
const IVAFaceDetection$json = {
  '1': 'IVAFaceDetection',
  '2': [
    {'1': 'ID', '3': 251, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [IVAFaceDetection_Request$json, IVAFaceDetection_Reply$json],
  '4': [IVAFaceDetection_Error$json],
};

@$core.Deprecated('Use iVAFaceDetectionDescriptor instead')
const IVAFaceDetection_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'isEnable', '3': 2, '4': 1, '5': 8, '10': 'isEnable'},
    {
      '1': 'isStrangerDetectNoti',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'isStrangerDetectNoti'
    },
    {
      '1': 'isRelativeDetectNoti',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'isRelativeDetectNoti'
    },
    {'1': 'is_record', '3': 5, '4': 1, '5': 8, '10': 'isRecord'},
    {'1': 'rois', '3': 6, '4': 3, '5': 11, '6': '.comm.Roi', '10': 'rois'},
  ],
};

@$core.Deprecated('Use iVAFaceDetectionDescriptor instead')
const IVAFaceDetection_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use iVAFaceDetectionDescriptor instead')
const IVAFaceDetection_Error$json = {
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
  ],
};

/// Descriptor for `IVAFaceDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVAFaceDetectionDescriptor = $convert.base64Decode(
    'ChBJVkFGYWNlRGV0ZWN0aW9uEg8KAklEGPsBIAEoDVICSUQa5gEKB1JlcXVlc3QSGwoJY2FtZX'
    'JhX2lkGAEgASgMUghjYW1lcmFJZBIaCghpc0VuYWJsZRgCIAEoCFIIaXNFbmFibGUSMgoUaXNT'
    'dHJhbmdlckRldGVjdE5vdGkYAyABKAhSFGlzU3RyYW5nZXJEZXRlY3ROb3RpEjIKFGlzUmVsYX'
    'RpdmVEZXRlY3ROb3RpGAQgASgIUhRpc1JlbGF0aXZlRGV0ZWN0Tm90aRIbCglpc19yZWNvcmQY'
    'BSABKAhSCGlzUmVjb3JkEh0KBHJvaXMYBiADKAsyCS5jb21tLlJvaVIEcm9pcxotCgVSZXBseR'
    'IkCgZjYW1lcmEYASABKAsyDC5jb21tLkNhbWVyYVIGY2FtZXJhIq4BCgVFcnJvchIRCg1FUlJP'
    'Ul9ERUZBVUxUEAASEwoPQ0FNRVJBX0lEX0VNUFRZEAESFAoQQ0FNRVJBX05PVF9GT1VORBACEh'
    'AKDElWQV9TVl9FUlJPUhADEhQKEElWQV9OT1RfUkVHSVNURVIQBBIYChRJVkFfVE9PX01BTllf'
    'UkVRVUVTVBAFEg4KCk9WRVJfUVVPVEEQBhIVChFQRVJNSVNTSU9OX0RFTklFRBAH');

@$core.Deprecated('Use receiveIVAFaceDetectionDescriptor instead')
const ReceiveIVAFaceDetection$json = {
  '1': 'ReceiveIVAFaceDetection',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_IVA_FACE_DETECTION',
      '3': 1004,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEIVAFACEDETECTION'
    },
  ],
};

/// Descriptor for `ReceiveIVAFaceDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveIVAFaceDetectionDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlSVZBRmFjZURldGVjdGlvbhIkCgZjYW1lcmEYASABKAsyDC5jb21tLkNhbWVyYV'
    'IGY2FtZXJhEjwKGlJFQ0VJVkVfSVZBX0ZBQ0VfREVURUNUSU9OGOwHIAEoDVIXUkVDRUlWRUlW'
    'QUZBQ0VERVRFQ1RJT04=');

@$core.Deprecated('Use getEventByLogIdDescriptor instead')
const GetEventByLogId$json = {
  '1': 'GetEventByLogId',
  '2': [
    {'1': 'ID', '3': 252, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetEventByLogId_Request$json, GetEventByLogId_Reply$json],
  '4': [GetEventByLogId_Error$json],
};

@$core.Deprecated('Use getEventByLogIdDescriptor instead')
const GetEventByLogId_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'log_id', '3': 1, '4': 1, '5': 9, '10': 'logId'},
  ],
};

@$core.Deprecated('Use getEventByLogIdDescriptor instead')
const GetEventByLogId_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.comm.Event', '10': 'event'},
  ],
};

@$core.Deprecated('Use getEventByLogIdDescriptor instead')
const GetEventByLogId_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'LOG_ID_EMPTY', '2': 1},
    {'1': 'LOG_ID_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `GetEventByLogId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEventByLogIdDescriptor = $convert.base64Decode(
    'Cg9HZXRFdmVudEJ5TG9nSWQSDwoCSUQY/AEgASgNUgJJRBogCgdSZXF1ZXN0EhUKBmxvZ19pZB'
    'gBIAEoCVIFbG9nSWQaKgoFUmVwbHkSIQoFZXZlbnQYASABKAsyCy5jb21tLkV2ZW50UgVldmVu'
    'dCJCCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEAoMTE9HX0lEX0VNUFRZEAESFAoQTE9HX0'
    'lEX05PVF9GT1VORBAC');

@$core.Deprecated('Use boxGetCamerasDescriptor instead')
const BoxGetCameras$json = {
  '1': 'BoxGetCameras',
  '2': [
    {'1': 'ID', '3': 253, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [BoxGetCameras_Request$json, BoxGetCameras_Reply$json],
  '4': [BoxGetCameras_Error$json],
};

@$core.Deprecated('Use boxGetCamerasDescriptor instead')
const BoxGetCameras_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
  ],
};

@$core.Deprecated('Use boxGetCamerasDescriptor instead')
const BoxGetCameras_Reply$json = {
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
  ],
};

@$core.Deprecated('Use boxGetCamerasDescriptor instead')
const BoxGetCameras_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'BOX_ID_EMPTY', '2': 1},
    {'1': 'BOX_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `BoxGetCameras`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boxGetCamerasDescriptor = $convert.base64Decode(
    'Cg1Cb3hHZXRDYW1lcmFzEg8KAklEGP0BIAEoDVICSUQaIAoHUmVxdWVzdBIVCgZib3hfaWQYAS'
    'ABKAxSBWJveElkGi0KBVJlcGx5EiQKBmNhbWVyYRgBIAMoCzIMLmNvbW0uQ2FtZXJhUgZjYW1l'
    'cmEiPwoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhAKDEJPWF9JRF9FTVBUWRABEhEKDUJPWF'
    '9OT1RfRk9VTkQQAg==');

@$core.Deprecated('Use userAddBoxDescriptor instead')
const UserAddBox$json = {
  '1': 'UserAddBox',
  '2': [
    {'1': 'ID', '3': 254, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UserAddBox_Request$json, UserAddBox_Reply$json],
  '4': [UserAddBox_Error$json],
};

@$core.Deprecated('Use userAddBoxDescriptor instead')
const UserAddBox_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'box_name', '3': 1, '4': 1, '5': 9, '10': 'boxName'},
    {'1': 'box_serial_number', '3': 2, '4': 1, '5': 9, '10': 'boxSerialNumber'},
  ],
};

@$core.Deprecated('Use userAddBoxDescriptor instead')
const UserAddBox_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'boxs', '3': 1, '4': 3, '5': 11, '6': '.comm.Vbox', '10': 'boxs'},
  ],
};

@$core.Deprecated('Use userAddBoxDescriptor instead')
const UserAddBox_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'BOX_NAME_EMPTY', '2': 1},
    {'1': 'BOX_NAME_INVALID', '2': 2},
    {'1': 'SERIAL_NUMBER_EMPTY', '2': 3},
    {'1': 'SERIAL_NUMBER_INVALID', '2': 4},
    {'1': 'SERIAL_NUMBER_NOT_EXIST', '2': 5},
    {'1': 'BOX_NOT_REGISTER', '2': 6},
    {'1': 'BOX_OFFLINE', '2': 7},
    {'1': 'BOX_ADDED_BY_OTHER_ACCOUNT', '2': 8},
    {'1': 'BOX_ADDED_BY_MY_SELF', '2': 9},
    {'1': 'BOX_NAME_EXIST', '2': 10},
  ],
};

/// Descriptor for `UserAddBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAddBoxDescriptor = $convert.base64Decode(
    'CgpVc2VyQWRkQm94Eg8KAklEGP4BIAEoDVICSUQaUAoHUmVxdWVzdBIZCghib3hfbmFtZRgBIA'
    'EoCVIHYm94TmFtZRIqChFib3hfc2VyaWFsX251bWJlchgCIAEoCVIPYm94U2VyaWFsTnVtYmVy'
    'GicKBVJlcGx5Eh4KBGJveHMYASADKAsyCi5jb21tLlZib3hSBGJveHMiigIKBUVycm9yEhEKDU'
    'VSUk9SX0RFRkFVTFQQABISCg5CT1hfTkFNRV9FTVBUWRABEhQKEEJPWF9OQU1FX0lOVkFMSUQQ'
    'AhIXChNTRVJJQUxfTlVNQkVSX0VNUFRZEAMSGQoVU0VSSUFMX05VTUJFUl9JTlZBTElEEAQSGw'
    'oXU0VSSUFMX05VTUJFUl9OT1RfRVhJU1QQBRIUChBCT1hfTk9UX1JFR0lTVEVSEAYSDwoLQk9Y'
    'X09GRkxJTkUQBxIeChpCT1hfQURERURfQllfT1RIRVJfQUNDT1VOVBAIEhgKFEJPWF9BRERFRF'
    '9CWV9NWV9TRUxGEAkSEgoOQk9YX05BTUVfRVhJU1QQCg==');

@$core.Deprecated('Use receiveUserAddBoxDescriptor instead')
const ReceiveUserAddBox$json = {
  '1': 'ReceiveUserAddBox',
  '2': [
    {'1': 'boxs', '3': 1, '4': 3, '5': 11, '6': '.comm.Vbox', '10': 'boxs'},
    {
      '1': 'RECEIVE_ADD_VBOX',
      '3': 1100,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEADDVBOX'
    },
  ],
};

/// Descriptor for `ReceiveUserAddBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUserAddBoxDescriptor = $convert.base64Decode(
    'ChFSZWNlaXZlVXNlckFkZEJveBIeCgRib3hzGAEgAygLMgouY29tbS5WYm94UgRib3hzEikKEF'
    'JFQ0VJVkVfQUREX1ZCT1gYzAggASgNUg5SRUNFSVZFQUREVkJPWA==');

@$core.Deprecated('Use getListBoxDescriptor instead')
const GetListBox$json = {
  '1': 'GetListBox',
  '2': [
    {'1': 'ID', '3': 255, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetListBox_Request$json, GetListBox_Reply$json],
};

@$core.Deprecated('Use getListBoxDescriptor instead')
const GetListBox_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'box_name', '3': 1, '4': 1, '5': 9, '10': 'boxName'},
    {'1': 'box_id', '3': 2, '4': 1, '5': 12, '10': 'boxId'},
  ],
};

@$core.Deprecated('Use getListBoxDescriptor instead')
const GetListBox_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'boxs', '3': 1, '4': 3, '5': 11, '6': '.comm.Vbox', '10': 'boxs'},
  ],
};

/// Descriptor for `GetListBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListBoxDescriptor = $convert.base64Decode(
    'CgpHZXRMaXN0Qm94Eg8KAklEGP8BIAEoDVICSUQaOwoHUmVxdWVzdBIZCghib3hfbmFtZRgBIA'
    'EoCVIHYm94TmFtZRIVCgZib3hfaWQYAiABKAxSBWJveElkGicKBVJlcGx5Eh4KBGJveHMYASAD'
    'KAsyCi5jb21tLlZib3hSBGJveHM=');

@$core.Deprecated('Use userRemoveBoxDescriptor instead')
const UserRemoveBox$json = {
  '1': 'UserRemoveBox',
  '2': [
    {'1': 'ID', '3': 256, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UserRemoveBox_Request$json, UserRemoveBox_Reply$json],
  '4': [UserRemoveBox_Error$json],
};

@$core.Deprecated('Use userRemoveBoxDescriptor instead')
const UserRemoveBox_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
  ],
};

@$core.Deprecated('Use userRemoveBoxDescriptor instead')
const UserRemoveBox_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
  ],
};

@$core.Deprecated('Use userRemoveBoxDescriptor instead')
const UserRemoveBox_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'BOX_ID_EMPTY', '2': 1},
    {'1': 'BOX_ID_INVALID', '2': 2},
  ],
};

/// Descriptor for `UserRemoveBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRemoveBoxDescriptor = $convert.base64Decode(
    'Cg1Vc2VyUmVtb3ZlQm94Eg8KAklEGIACIAEoDVICSUQaIAoHUmVxdWVzdBIVCgZib3hfaWQYAS'
    'ABKAxSBWJveElkGh4KBVJlcGx5EhUKBmJveF9pZBgBIAEoDFIFYm94SWQiQAoFRXJyb3ISEQoN'
    'RVJST1JfREVGQVVMVBAAEhAKDEJPWF9JRF9FTVBUWRABEhIKDkJPWF9JRF9JTlZBTElEEAI=');

@$core.Deprecated('Use receiveUserRemoveBoxDescriptor instead')
const ReceiveUserRemoveBox$json = {
  '1': 'ReceiveUserRemoveBox',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
    {
      '1': 'RECEIVE_REMOVE_VBOX',
      '3': 1101,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEREMOVEVBOX'
    },
  ],
};

/// Descriptor for `ReceiveUserRemoveBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUserRemoveBoxDescriptor = $convert.base64Decode(
    'ChRSZWNlaXZlVXNlclJlbW92ZUJveBIVCgZib3hfaWQYASABKAxSBWJveElkEi8KE1JFQ0VJVk'
    'VfUkVNT1ZFX1ZCT1gYzQggASgNUhFSRUNFSVZFUkVNT1ZFVkJPWA==');

@$core.Deprecated('Use userUpdateNameBoxDescriptor instead')
const UserUpdateNameBox$json = {
  '1': 'UserUpdateNameBox',
  '2': [
    {'1': 'ID', '3': 257, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UserUpdateNameBox_Request$json, UserUpdateNameBox_Reply$json],
  '4': [UserUpdateNameBox_Error$json],
};

@$core.Deprecated('Use userUpdateNameBoxDescriptor instead')
const UserUpdateNameBox_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'box_id', '3': 1, '4': 1, '5': 12, '10': 'boxId'},
    {'1': 'new_name_box', '3': 2, '4': 1, '5': 9, '10': 'newNameBox'},
  ],
};

@$core.Deprecated('Use userUpdateNameBoxDescriptor instead')
const UserUpdateNameBox_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'box', '3': 1, '4': 1, '5': 11, '6': '.comm.Vbox', '10': 'box'},
  ],
};

@$core.Deprecated('Use userUpdateNameBoxDescriptor instead')
const UserUpdateNameBox_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'BOX_ID_EMPTY', '2': 1},
    {'1': 'BOX_ID_INVALID', '2': 2},
    {'1': 'NAME_EMPTY', '2': 3},
    {'1': 'NAME_INVALID', '2': 4},
    {'1': 'NAME_EXIST', '2': 5},
  ],
};

/// Descriptor for `UserUpdateNameBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userUpdateNameBoxDescriptor = $convert.base64Decode(
    'ChFVc2VyVXBkYXRlTmFtZUJveBIPCgJJRBiBAiABKA1SAklEGkIKB1JlcXVlc3QSFQoGYm94X2'
    'lkGAEgASgMUgVib3hJZBIgCgxuZXdfbmFtZV9ib3gYAiABKAlSCm5ld05hbWVCb3gaJQoFUmVw'
    'bHkSHAoDYm94GAEgASgLMgouY29tbS5WYm94UgNib3gicgoFRXJyb3ISEQoNRVJST1JfREVGQV'
    'VMVBAAEhAKDEJPWF9JRF9FTVBUWRABEhIKDkJPWF9JRF9JTlZBTElEEAISDgoKTkFNRV9FTVBU'
    'WRADEhAKDE5BTUVfSU5WQUxJRBAEEg4KCk5BTUVfRVhJU1QQBQ==');

@$core.Deprecated('Use receiveUserUpdateNameBoxDescriptor instead')
const ReceiveUserUpdateNameBox$json = {
  '1': 'ReceiveUserUpdateNameBox',
  '2': [
    {'1': 'box', '3': 1, '4': 1, '5': 11, '6': '.comm.Vbox', '10': 'box'},
    {
      '1': 'RECEIVE_UPDATE_NAME_VBOX',
      '3': 1102,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATENAMEVBOX'
    },
  ],
};

/// Descriptor for `ReceiveUserUpdateNameBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUserUpdateNameBoxDescriptor = $convert.base64Decode(
    'ChhSZWNlaXZlVXNlclVwZGF0ZU5hbWVCb3gSHAoDYm94GAEgASgLMgouY29tbS5WYm94UgNib3'
    'gSOAoYUkVDRUlWRV9VUERBVEVfTkFNRV9WQk9YGM4IIAEoDVIVUkVDRUlWRVVQREFURU5BTUVW'
    'Qk9Y');

@$core.Deprecated('Use receiveBoxOfflineDescriptor instead')
const ReceiveBoxOffline$json = {
  '1': 'ReceiveBoxOffline',
  '2': [
    {'1': 'box', '3': 1, '4': 1, '5': 11, '6': '.comm.Vbox', '10': 'box'},
    {
      '1': 'RECEIVE_BOX_OFFLINE',
      '3': 1103,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEBOXOFFLINE'
    },
  ],
};

/// Descriptor for `ReceiveBoxOffline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveBoxOfflineDescriptor = $convert.base64Decode(
    'ChFSZWNlaXZlQm94T2ZmbGluZRIcCgNib3gYASABKAsyCi5jb21tLlZib3hSA2JveBIvChNSRU'
    'NFSVZFX0JPWF9PRkZMSU5FGM8IIAEoDVIRUkVDRUlWRUJPWE9GRkxJTkU=');

@$core.Deprecated('Use receiveBoxOnlineDescriptor instead')
const ReceiveBoxOnline$json = {
  '1': 'ReceiveBoxOnline',
  '2': [
    {'1': 'box', '3': 1, '4': 1, '5': 11, '6': '.comm.Vbox', '10': 'box'},
    {
      '1': 'RECEIVE_BOX_ONLINE',
      '3': 1104,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEBOXONLINE'
    },
  ],
};

/// Descriptor for `ReceiveBoxOnline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveBoxOnlineDescriptor = $convert.base64Decode(
    'ChBSZWNlaXZlQm94T25saW5lEhwKA2JveBgBIAEoCzIKLmNvbW0uVmJveFIDYm94Ei0KElJFQ0'
    'VJVkVfQk9YX09OTElORRjQCCABKA1SEFJFQ0VJVkVCT1hPTkxJTkU=');

@$core.Deprecated('Use addUserDescriptor instead')
const AddUser$json = {
  '1': 'AddUser',
  '2': [
    {'1': 'ID', '3': 258, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddUser_Request$json, AddUser_Reply$json],
  '4': [AddUser_Error$json],
};

@$core.Deprecated('Use addUserDescriptor instead')
const AddUser_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'tel', '3': 3, '4': 1, '5': 9, '10': 'tel'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'user_name', '3': 5, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'isAdmin', '3': 6, '4': 1, '5': 8, '10': 'isAdmin'},
    {'1': 'desc', '3': 7, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'password', '3': 8, '4': 1, '5': 9, '10': 'password'},
    {'1': 'changePassDenied', '3': 9, '4': 1, '5': 8, '10': 'changePassDenied'},
    {'1': 'addCamDenied', '3': 10, '4': 1, '5': 8, '10': 'addCamDenied'},
  ],
};

@$core.Deprecated('Use addUserDescriptor instead')
const AddUser_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.comm.User', '10': 'user'},
  ],
};

@$core.Deprecated('Use addUserDescriptor instead')
const AddUser_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ACCOUNT_EMPTY', '2': 0},
    {'1': 'ACCOUNT_EXIST', '2': 1},
    {'1': 'ACCOUNT_INVALID', '2': 2},
    {'1': 'PASSWORD_INVALID', '2': 3},
    {'1': 'EMAIL_INVALID', '2': 4},
    {'1': 'EMAIL_EXIST', '2': 5},
    {'1': 'TEL_EXIST', '2': 6},
    {'1': 'TEL_INVALID', '2': 7},
    {'1': 'USER_TYPE_EMPTY', '2': 8},
    {'1': 'PASSWORD_EMPTY', '2': 9},
    {'1': 'SYN_ERROR', '2': 10},
  ],
};

/// Descriptor for `AddUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserDescriptor = $convert.base64Decode(
    'CgdBZGRVc2VyEg8KAklEGIICIAEoDVICSUQanAIKB1JlcXVlc3QSGAoHYWNjb3VudBgBIAEoCV'
    'IHYWNjb3VudBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSEAoDdGVsGAMgASgJUgN0ZWwSGAoHYWRk'
    'cmVzcxgEIAEoCVIHYWRkcmVzcxIbCgl1c2VyX25hbWUYBSABKAlSCHVzZXJOYW1lEhgKB2lzQW'
    'RtaW4YBiABKAhSB2lzQWRtaW4SEgoEZGVzYxgHIAEoCVIEZGVzYxIaCghwYXNzd29yZBgIIAEo'
    'CVIIcGFzc3dvcmQSKgoQY2hhbmdlUGFzc0RlbmllZBgJIAEoCFIQY2hhbmdlUGFzc0RlbmllZB'
    'IiCgxhZGRDYW1EZW5pZWQYCiABKAhSDGFkZENhbURlbmllZBonCgVSZXBseRIeCgR1c2VyGAEg'
    'ASgLMgouY29tbS5Vc2VyUgR1c2VyItQBCgVFcnJvchIRCg1BQ0NPVU5UX0VNUFRZEAASEQoNQU'
    'NDT1VOVF9FWElTVBABEhMKD0FDQ09VTlRfSU5WQUxJRBACEhQKEFBBU1NXT1JEX0lOVkFMSUQQ'
    'AxIRCg1FTUFJTF9JTlZBTElEEAQSDwoLRU1BSUxfRVhJU1QQBRINCglURUxfRVhJU1QQBhIPCg'
    'tURUxfSU5WQUxJRBAHEhMKD1VTRVJfVFlQRV9FTVBUWRAIEhIKDlBBU1NXT1JEX0VNUFRZEAkS'
    'DQoJU1lOX0VSUk9SEAo=');

@$core.Deprecated('Use editUserDescriptor instead')
const EditUser$json = {
  '1': 'EditUser',
  '2': [
    {'1': 'ID', '3': 259, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [EditUser_Request$json, EditUser_Reply$json],
  '4': [EditUser_Error$json],
};

@$core.Deprecated('Use editUserDescriptor instead')
const EditUser_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 12, '10': 'userId'},
    {'1': 'account', '3': 2, '4': 1, '5': 9, '10': 'account'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'tel', '3': 4, '4': 1, '5': 9, '10': 'tel'},
    {'1': 'address', '3': 5, '4': 1, '5': 9, '10': 'address'},
    {'1': 'user_name', '3': 6, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'isAdmin', '3': 7, '4': 1, '5': 8, '10': 'isAdmin'},
    {'1': 'desc', '3': 8, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'password', '3': 9, '4': 1, '5': 9, '10': 'password'},
    {'1': 'uid_str', '3': 10, '4': 1, '5': 9, '10': 'uidStr'},
    {
      '1': 'changePassDenied',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'changePassDenied'
    },
    {'1': 'addCamDenied', '3': 12, '4': 1, '5': 8, '10': 'addCamDenied'},
  ],
};

@$core.Deprecated('Use editUserDescriptor instead')
const EditUser_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.comm.User', '10': 'user'},
  ],
};

@$core.Deprecated('Use editUserDescriptor instead')
const EditUser_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ACCOUNT_EMPTY', '2': 0},
    {'1': 'ACCOUNT_EXIST', '2': 1},
    {'1': 'ACCOUNT_INVALID', '2': 2},
    {'1': 'EMAIL_INVALID', '2': 4},
    {'1': 'EMAIL_EXIST', '2': 5},
    {'1': 'TEL_EXIST', '2': 6},
    {'1': 'TEL_INVALID', '2': 7},
    {'1': 'USER_TYPE_EMPTY', '2': 8},
    {'1': 'USER_NOT_FOUND', '2': 9},
    {'1': 'SYN_ERROR', '2': 10},
  ],
};

/// Descriptor for `EditUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editUserDescriptor = $convert.base64Decode(
    'CghFZGl0VXNlchIPCgJJRBiDAiABKA1SAklEGs4CCgdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKA'
    'xSBnVzZXJJZBIYCgdhY2NvdW50GAIgASgJUgdhY2NvdW50EhQKBWVtYWlsGAMgASgJUgVlbWFp'
    'bBIQCgN0ZWwYBCABKAlSA3RlbBIYCgdhZGRyZXNzGAUgASgJUgdhZGRyZXNzEhsKCXVzZXJfbm'
    'FtZRgGIAEoCVIIdXNlck5hbWUSGAoHaXNBZG1pbhgHIAEoCFIHaXNBZG1pbhISCgRkZXNjGAgg'
    'ASgJUgRkZXNjEhoKCHBhc3N3b3JkGAkgASgJUghwYXNzd29yZBIXCgd1aWRfc3RyGAogASgJUg'
    'Z1aWRTdHISKgoQY2hhbmdlUGFzc0RlbmllZBgLIAEoCFIQY2hhbmdlUGFzc0RlbmllZBIiCgxh'
    'ZGRDYW1EZW5pZWQYDCABKAhSDGFkZENhbURlbmllZBonCgVSZXBseRIeCgR1c2VyGAEgASgLMg'
    'ouY29tbS5Vc2VyUgR1c2VyIr4BCgVFcnJvchIRCg1BQ0NPVU5UX0VNUFRZEAASEQoNQUNDT1VO'
    'VF9FWElTVBABEhMKD0FDQ09VTlRfSU5WQUxJRBACEhEKDUVNQUlMX0lOVkFMSUQQBBIPCgtFTU'
    'FJTF9FWElTVBAFEg0KCVRFTF9FWElTVBAGEg8KC1RFTF9JTlZBTElEEAcSEwoPVVNFUl9UWVBF'
    'X0VNUFRZEAgSEgoOVVNFUl9OT1RfRk9VTkQQCRINCglTWU5fRVJST1IQCg==');

@$core.Deprecated('Use deleteUserDescriptor instead')
const DeleteUser$json = {
  '1': 'DeleteUser',
  '2': [
    {'1': 'ID', '3': 260, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteUser_Request$json, DeleteUser_Reply$json],
  '4': [DeleteUser_Error$json],
};

@$core.Deprecated('Use deleteUserDescriptor instead')
const DeleteUser_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 12, '10': 'userId'},
    {'1': 'uid_str', '3': 2, '4': 1, '5': 9, '10': 'uidStr'},
  ],
};

@$core.Deprecated('Use deleteUserDescriptor instead')
const DeleteUser_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 12, '10': 'userId'},
  ],
};

@$core.Deprecated('Use deleteUserDescriptor instead')
const DeleteUser_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'USER_EMPTY', '2': 0},
    {'1': 'USER_NOT_FOUND', '2': 1},
  ],
};

/// Descriptor for `DeleteUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserDescriptor = $convert.base64Decode(
    'CgpEZWxldGVVc2VyEg8KAklEGIQCIAEoDVICSUQaOwoHUmVxdWVzdBIXCgd1c2VyX2lkGAEgAS'
    'gMUgZ1c2VySWQSFwoHdWlkX3N0chgCIAEoCVIGdWlkU3RyGiAKBVJlcGx5EhcKB3VzZXJfaWQY'
    'ASABKAxSBnVzZXJJZCIrCgVFcnJvchIOCgpVU0VSX0VNUFRZEAASEgoOVVNFUl9OT1RfRk9VTk'
    'QQAQ==');

@$core.Deprecated('Use listUserDescriptor instead')
const ListUser$json = {
  '1': 'ListUser',
  '2': [
    {'1': 'ID', '3': 261, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListUser_Request$json, ListUser_Reply$json],
};

@$core.Deprecated('Use listUserDescriptor instead')
const ListUser_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use listUserDescriptor instead')
const ListUser_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.comm.User', '10': 'users'},
  ],
};

/// Descriptor for `ListUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUserDescriptor = $convert.base64Decode(
    'CghMaXN0VXNlchIPCgJJRBiFAiABKA1SAklEGgkKB1JlcXVlc3QaKQoFUmVwbHkSIAoFdXNlcn'
    'MYASADKAsyCi5jb21tLlVzZXJSBXVzZXJz');

@$core.Deprecated('Use addCameraHomeVisionDescriptor instead')
const AddCameraHomeVision$json = {
  '1': 'AddCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 263, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCameraHomeVision_Request$json, AddCameraHomeVision_Reply$json],
  '4': [AddCameraHomeVision_Error$json],
};

@$core.Deprecated('Use addCameraHomeVisionDescriptor instead')
const AddCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_uid', '3': 1, '4': 1, '5': 9, '10': 'cameraUid'},
    {'1': 'camera_user_name', '3': 2, '4': 1, '5': 9, '10': 'cameraUserName'},
    {'1': 'camera_password', '3': 3, '4': 1, '5': 9, '10': 'cameraPassword'},
    {'1': 'camera_name', '3': 4, '4': 1, '5': 9, '10': 'cameraName'},
    {
      '1': 'location',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.comm.MapLocation',
      '10': 'location'
    },
    {'1': 'group_id', '3': 6, '4': 1, '5': 12, '10': 'groupId'},
    {'1': 'mac_address', '3': 7, '4': 1, '5': 9, '10': 'macAddress'},
  ],
};

@$core.Deprecated('Use addCameraHomeVisionDescriptor instead')
const AddCameraHomeVision_Reply$json = {
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

@$core.Deprecated('Use addCameraHomeVisionDescriptor instead')
const AddCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_UID_EMPTY', '2': 1},
    {'1': 'CAMERA_UID_EMPTY_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_OFFLINE', '2': 3},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 4},
    {'1': 'CAMERA_EXIST', '2': 5},
    {'1': 'LOCATION_INVALID', '2': 6},
    {'1': 'CAMERA_NAME_EMPTY', '2': 7},
    {'1': 'CAMERA_NAME_EXIST', '2': 8},
    {'1': 'OVER_QUOTA', '2': 9},
    {'1': 'GROUP_INVALID', '2': 10},
    {'1': 'UID_INVALID', '2': 11},
    {'1': 'SERVER_P2P_ERROR', '2': 12},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 13},
    {'1': 'MAC_ADDRESS_EMPTY', '2': 14},
    {'1': 'MAC_ADDRESS_EXIST', '2': 15},
  ],
};

/// Descriptor for `AddCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChNBZGRDYW1lcmFIb21lVmlzaW9uEg8KAklEGIcCIAEoDVICSUQahwIKB1JlcXVlc3QSHQoKY2'
    'FtZXJhX3VpZBgBIAEoCVIJY2FtZXJhVWlkEigKEGNhbWVyYV91c2VyX25hbWUYAiABKAlSDmNh'
    'bWVyYVVzZXJOYW1lEicKD2NhbWVyYV9wYXNzd29yZBgDIAEoCVIOY2FtZXJhUGFzc3dvcmQSHw'
    'oLY2FtZXJhX25hbWUYBCABKAlSCmNhbWVyYU5hbWUSLQoIbG9jYXRpb24YBSABKAsyES5jb21t'
    'Lk1hcExvY2F0aW9uUghsb2NhdGlvbhIZCghncm91cF9pZBgGIAEoDFIHZ3JvdXBJZBIfCgttYW'
    'NfYWRkcmVzcxgHIAEoCVIKbWFjQWRkcmVzcxpKCgVSZXBseRIbCgljYW1lcmFfaWQYASABKAxS'
    'CGNhbWVyYUlkEiQKBmNhbWVyYRgCIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcmEi8AIKBUVycm'
    '9yEhEKDUVSUk9SX0RFRkFVTFQQABIUChBDQU1FUkFfVUlEX0VNUFRZEAESHgoaQ0FNRVJBX1VJ'
    'RF9FTVBUWV9OT1RfRk9VTkQQAhISCg5DQU1FUkFfT0ZGTElORRADEh8KG1VTRVJfTkFNRV9PUl'
    '9QQVNTV09SRF9FUlJPUhAEEhAKDENBTUVSQV9FWElTVBAFEhQKEExPQ0FUSU9OX0lOVkFMSUQQ'
    'BhIVChFDQU1FUkFfTkFNRV9FTVBUWRAHEhUKEUNBTUVSQV9OQU1FX0VYSVNUEAgSDgoKT1ZFUl'
    '9RVU9UQRAJEhEKDUdST1VQX0lOVkFMSUQQChIPCgtVSURfSU5WQUxJRBALEhQKEFNFUlZFUl9Q'
    'MlBfRVJST1IQDBIbChdDQU1FUkFfQ0xPU0VfQ09OTkVDVElPThANEhUKEU1BQ19BRERSRVNTX0'
    'VNUFRZEA4SFQoRTUFDX0FERFJFU1NfRVhJU1QQDw==');

@$core.Deprecated('Use pTZCameraHomeVisionDescriptor instead')
const PTZCameraHomeVision$json = {
  '1': 'PTZCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 264, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [PTZCameraHomeVision_Request$json, PTZCameraHomeVision_Reply$json],
  '4': [PTZCameraHomeVision_Error$json],
};

@$core.Deprecated('Use pTZCameraHomeVisionDescriptor instead')
const PTZCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'action',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.PtzAction',
      '10': 'action'
    },
  ],
};

@$core.Deprecated('Use pTZCameraHomeVisionDescriptor instead')
const PTZCameraHomeVision_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use pTZCameraHomeVisionDescriptor instead')
const PTZCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOMEVISON', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 3},
  ],
};

/// Descriptor for `PTZCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pTZCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChNQVFpDYW1lcmFIb21lVmlzaW9uEg8KAklEGIgCIAEoDVICSUQaTwoHUmVxdWVzdBIbCgljYW'
    '1lcmFfaWQYASABKAxSCGNhbWVyYUlkEicKBmFjdGlvbhgCIAEoDjIPLmNvbW0uUHR6QWN0aW9u'
    'UgZhY3Rpb24aBwoFUmVwbHkiYQoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhgKFENBTUVSQV'
    '9OT1RfSE9NRVZJU09OEAESEgoOQ0FNRVJBX09GRkxJTkUQAhIXChNDQU1FUkFfSURfTk9UX0ZP'
    'VU5EEAM=');

@$core.Deprecated('Use resetCameraHomeVisionDescriptor instead')
const ResetCameraHomeVision$json = {
  '1': 'ResetCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 265, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ResetCameraHomeVision_Request$json, ResetCameraHomeVision_Reply$json],
  '4': [ResetCameraHomeVision_Error$json],
};

@$core.Deprecated('Use resetCameraHomeVisionDescriptor instead')
const ResetCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use resetCameraHomeVisionDescriptor instead')
const ResetCameraHomeVision_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use resetCameraHomeVisionDescriptor instead')
const ResetCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOMEVISON', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 3},
  ],
};

/// Descriptor for `ResetCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChVSZXNldENhbWVyYUhvbWVWaXNpb24SDwoCSUQYiQIgASgNUgJJRBomCgdSZXF1ZXN0EhsKCW'
    'NhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQaBwoFUmVwbHkiYQoFRXJyb3ISEQoNRVJST1JfREVG'
    'QVVMVBAAEhgKFENBTUVSQV9OT1RfSE9NRVZJU09OEAESEgoOQ0FNRVJBX09GRkxJTkUQAhIXCh'
    'NDQU1FUkFfSURfTk9UX0ZPVU5EEAM=');

@$core.Deprecated('Use receivePairCameraDescriptor instead')
const ReceivePairCamera$json = {
  '1': 'ReceivePairCamera',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'camera_id', '3': 2, '4': 1, '5': 9, '10': 'cameraId'},
    {'1': 'camera_type', '3': 3, '4': 1, '5': 9, '10': 'cameraType'},
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.comm.ReceivePairCamera.pairStatus',
      '10': 'status'
    },
    {
      '1': 'RECEIVE_PAIR_CAMERA',
      '3': 266,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEPAIRCAMERA'
    },
  ],
  '4': [ReceivePairCamera_pairStatus$json],
};

@$core.Deprecated('Use receivePairCameraDescriptor instead')
const ReceivePairCamera_pairStatus$json = {
  '1': 'pairStatus',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'CAMERA_ADDED_BY_MYSELF', '2': 1},
    {'1': 'CAMERA_ADDED_BY_OTHER_ACCOUNT', '2': 2},
  ],
};

/// Descriptor for `ReceivePairCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receivePairCameraDescriptor = $convert.base64Decode(
    'ChFSZWNlaXZlUGFpckNhbWVyYRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGwoJY2FtZXJhX2'
    'lkGAIgASgJUghjYW1lcmFJZBIfCgtjYW1lcmFfdHlwZRgDIAEoCVIKY2FtZXJhVHlwZRI6CgZz'
    'dGF0dXMYBCABKA4yIi5jb21tLlJlY2VpdmVQYWlyQ2FtZXJhLnBhaXJTdGF0dXNSBnN0YXR1cx'
    'IvChNSRUNFSVZFX1BBSVJfQ0FNRVJBGIoCIAEoDVIRUkVDRUlWRVBBSVJDQU1FUkEiWAoKcGFp'
    'clN0YXR1cxILCgdERUZBVUxUEAASGgoWQ0FNRVJBX0FEREVEX0JZX01ZU0VMRhABEiEKHUNBTU'
    'VSQV9BRERFRF9CWV9PVEhFUl9BQ0NPVU5UEAI=');

@$core.Deprecated('Use generateQRCodeStringDescriptor instead')
const generateQRCodeString$json = {
  '1': 'generateQRCodeString',
  '2': [
    {'1': 'ID', '3': 267, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [generateQRCodeString_Request$json, generateQRCodeString_Reply$json],
  '4': [generateQRCodeString_Error$json],
};

@$core.Deprecated('Use generateQRCodeStringDescriptor instead')
const generateQRCodeString_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'SSID', '3': 1, '4': 1, '5': 9, '10': 'SSID'},
    {'1': 'PASS', '3': 2, '4': 1, '5': 9, '10': 'PASS'},
  ],
};

@$core.Deprecated('Use generateQRCodeStringDescriptor instead')
const generateQRCodeString_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'qrcode', '3': 1, '4': 1, '5': 9, '10': 'qrcode'},
  ],
};

@$core.Deprecated('Use generateQRCodeStringDescriptor instead')
const generateQRCodeString_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'SSID_EMPTY', '2': 1},
    {'1': 'PASS_EMPTY', '2': 2},
  ],
};

/// Descriptor for `generateQRCodeString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateQRCodeStringDescriptor = $convert.base64Decode(
    'ChRnZW5lcmF0ZVFSQ29kZVN0cmluZxIPCgJJRBiLAiABKA1SAklEGjEKB1JlcXVlc3QSEgoEU1'
    'NJRBgBIAEoCVIEU1NJRBISCgRQQVNTGAIgASgJUgRQQVNTGh8KBVJlcGx5EhYKBnFyY29kZRgB'
    'IAEoCVIGcXJjb2RlIjoKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABIOCgpTU0lEX0VNUFRZEA'
    'ESDgoKUEFTU19FTVBUWRAC');

@$core.Deprecated('Use changePasswordCameraHomeVisionDescriptor instead')
const ChangePasswordCameraHomeVision$json = {
  '1': 'ChangePasswordCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 268, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    ChangePasswordCameraHomeVision_Request$json,
    ChangePasswordCameraHomeVision_Reply$json
  ],
  '4': [ChangePasswordCameraHomeVision_Error$json],
};

@$core.Deprecated('Use changePasswordCameraHomeVisionDescriptor instead')
const ChangePasswordCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'old_pass', '3': 2, '4': 1, '5': 9, '10': 'oldPass'},
    {'1': 'new_pass', '3': 3, '4': 1, '5': 9, '10': 'newPass'},
  ],
};

@$core.Deprecated('Use changePasswordCameraHomeVisionDescriptor instead')
const ChangePasswordCameraHomeVision_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use changePasswordCameraHomeVisionDescriptor instead')
const ChangePasswordCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOMEVISON', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 3},
    {'1': 'OLD_PASS_NOT_MATH', '2': 4},
    {'1': 'OLD_PASS_EMPTY', '2': 5},
    {'1': 'NEW_PASS_ENPTY', '2': 6},
    {'1': 'NEW_PASS_INVALID', '2': 7},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 8},
    {'1': 'CAMERA_ID_INVALID', '2': 9},
    {'1': 'SERVER_P2P_ERROR', '2': 10},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 11},
    {'1': 'UID_INVALID', '2': 12},
  ],
};

/// Descriptor for `ChangePasswordCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordCameraHomeVisionDescriptor = $convert.base64Decode(
    'Ch5DaGFuZ2VQYXNzd29yZENhbWVyYUhvbWVWaXNpb24SDwoCSUQYjAIgASgNUgJJRBpcCgdSZX'
    'F1ZXN0EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGQoIb2xkX3Bhc3MYAiABKAlSB29s'
    'ZFBhc3MSGQoIbmV3X3Bhc3MYAyABKAlSB25ld1Bhc3MaBwoFUmVwbHkisgIKBUVycm9yEhEKDU'
    'VSUk9SX0RFRkFVTFQQABIYChRDQU1FUkFfTk9UX0hPTUVWSVNPThABEhIKDkNBTUVSQV9PRkZM'
    'SU5FEAISFwoTQ0FNRVJBX0lEX05PVF9GT1VORBADEhUKEU9MRF9QQVNTX05PVF9NQVRIEAQSEg'
    'oOT0xEX1BBU1NfRU1QVFkQBRISCg5ORVdfUEFTU19FTlBUWRAGEhQKEE5FV19QQVNTX0lOVkFM'
    'SUQQBxIfChtVU0VSX05BTUVfT1JfUEFTU1dPUkRfRVJST1IQCBIVChFDQU1FUkFfSURfSU5WQU'
    'xJRBAJEhQKEFNFUlZFUl9QMlBfRVJST1IQChIbChdDQU1FUkFfQ0xPU0VfQ09OTkVDVElPThAL'
    'Eg8KC1VJRF9JTlZBTElEEAw=');

@$core.Deprecated('Use mDCameraHomeVisionDescriptor instead')
const MDCameraHomeVision$json = {
  '1': 'MDCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 269, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [MDCameraHomeVision_Request$json, MDCameraHomeVision_Reply$json],
  '4': [MDCameraHomeVision_Level$json, MDCameraHomeVision_Error$json],
};

@$core.Deprecated('Use mDCameraHomeVisionDescriptor instead')
const MDCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'is_on', '3': 2, '4': 1, '5': 8, '10': 'isOn'},
    {
      '1': 'level',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.comm.MDCameraHomeVision.Level',
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
    {'1': 'SoundAlarm', '3': 8, '4': 1, '5': 8, '10': 'SoundAlarm'},
  ],
};

@$core.Deprecated('Use mDCameraHomeVisionDescriptor instead')
const MDCameraHomeVision_Reply$json = {
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

@$core.Deprecated('Use mDCameraHomeVisionDescriptor instead')
const MDCameraHomeVision_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'LOW', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HIGH', '2': 2},
  ],
};

@$core.Deprecated('Use mDCameraHomeVisionDescriptor instead')
const MDCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOMEVISON', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 3},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 8},
    {'1': 'CAMERA_ID_INVALID', '2': 9},
    {'1': 'SERVER_P2P_ERROR', '2': 10},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 11},
    {'1': 'UID_INVALID', '2': 12},
  ],
};

/// Descriptor for `MDCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mDCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChJNRENhbWVyYUhvbWVWaXNpb24SDwoCSUQYjQIgASgNUgJJRBqhAgoHUmVxdWVzdBIbCgljYW'
    '1lcmFfaWQYASABKAxSCGNhbWVyYUlkEhMKBWlzX29uGAIgASgIUgRpc09uEjQKBWxldmVsGAMg'
    'ASgOMh4uY29tbS5NRENhbWVyYUhvbWVWaXNpb24uTGV2ZWxSBWxldmVsEiIKDWlzX3NlbmRfZW'
    '1haWwYBCABKAhSC2lzU2VuZEVtYWlsEhsKCWlzX3JlY29yZBgFIAEoCFIIaXNSZWNvcmQSLgoS'
    'aXNQdXNoTm90aWZpY2F0aW9uGAYgASgIUhJpc1B1c2hOb3RpZmljYXRpb24SHQoEcm9pcxgHIA'
    'MoCzIJLmNvbW0uUm9pUgRyb2lzEh4KClNvdW5kQWxhcm0YCCABKAhSClNvdW5kQWxhcm0aSgoF'
    'UmVwbHkSGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBIkCgZjYW1lcmEYAiABKAsyDC5jb2'
    '1tLkNhbWVyYVIGY2FtZXJhIiYKBUxldmVsEgcKA0xPVxAAEgoKBk1FRElVTRABEggKBEhJR0gQ'
    'AiLdAQoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhgKFENBTUVSQV9OT1RfSE9NRVZJU09OEA'
    'ESEgoOQ0FNRVJBX09GRkxJTkUQAhIXChNDQU1FUkFfSURfTk9UX0ZPVU5EEAMSHwobVVNFUl9O'
    'QU1FX09SX1BBU1NXT1JEX0VSUk9SEAgSFQoRQ0FNRVJBX0lEX0lOVkFMSUQQCRIUChBTRVJWRV'
    'JfUDJQX0VSUk9SEAoSGwoXQ0FNRVJBX0NMT1NFX0NPTk5FQ1RJT04QCxIPCgtVSURfSU5WQUxJ'
    'RBAM');

@$core.Deprecated('Use resetPasswordDescriptor instead')
const ResetPassword$json = {
  '1': 'ResetPassword',
  '2': [
    {'1': 'ID', '3': 270, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ResetPassword_Request$json, ResetPassword_Reply$json],
  '4': [ResetPassword_Error$json],
};

@$core.Deprecated('Use resetPasswordDescriptor instead')
const ResetPassword_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 12, '10': 'userId'},
    {'1': 'uid_str', '3': 2, '4': 1, '5': 9, '10': 'uidStr'},
    {'1': 'newPassword', '3': 3, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

@$core.Deprecated('Use resetPasswordDescriptor instead')
const ResetPassword_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use resetPasswordDescriptor instead')
const ResetPassword_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'USER_EMPTY', '2': 1},
    {'1': 'USER_NOT_FOUND', '2': 2},
    {'1': 'PASSWORD_INVALID', '2': 3},
    {'1': 'PERMISSION_DENIED', '2': 4},
  ],
};

/// Descriptor for `ResetPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordDescriptor = $convert.base64Decode(
    'Cg1SZXNldFBhc3N3b3JkEg8KAklEGI4CIAEoDVICSUQaXQoHUmVxdWVzdBIXCgd1c2VyX2lkGA'
    'EgASgMUgZ1c2VySWQSFwoHdWlkX3N0chgCIAEoCVIGdWlkU3RyEiAKC25ld1Bhc3N3b3JkGAMg'
    'ASgJUgtuZXdQYXNzd29yZBoHCgVSZXBseSJrCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASDg'
    'oKVVNFUl9FTVBUWRABEhIKDlVTRVJfTk9UX0ZPVU5EEAISFAoQUEFTU1dPUkRfSU5WQUxJRBAD'
    'EhUKEVBFUk1JU1NJT05fREVOSUVEEAQ=');

@$core.Deprecated('Use checkUpdateCameraHomeVisionDescriptor instead')
const CheckUpdateCameraHomeVision$json = {
  '1': 'CheckUpdateCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 271, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    CheckUpdateCameraHomeVision_Request$json,
    CheckUpdateCameraHomeVision_Reply$json
  ],
  '4': [CheckUpdateCameraHomeVision_Error$json],
};

@$core.Deprecated('Use checkUpdateCameraHomeVisionDescriptor instead')
const CheckUpdateCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use checkUpdateCameraHomeVisionDescriptor instead')
const CheckUpdateCameraHomeVision_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'isUpdate', '3': 1, '4': 1, '5': 8, '10': 'isUpdate'},
    {'1': 'fw_id', '3': 2, '4': 1, '5': 12, '10': 'fwId'},
    {'1': 'newVersion', '3': 3, '4': 1, '5': 13, '10': 'newVersion'},
    {'1': 'des', '3': 4, '4': 1, '5': 9, '10': 'des'},
  ],
};

@$core.Deprecated('Use checkUpdateCameraHomeVisionDescriptor instead')
const CheckUpdateCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
    {'1': 'PERMISSION_DENIED', '2': 3},
    {'1': 'CAMERA_NOT_HOMEVISION_DEVICE', '2': 4},
    {'1': 'CAMERA_OFFLINE', '2': 5},
  ],
};

/// Descriptor for `CheckUpdateCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUpdateCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChtDaGVja1VwZGF0ZUNhbWVyYUhvbWVWaXNpb24SDwoCSUQYjwIgASgNUgJJRBomCgdSZXF1ZX'
    'N0EhsKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQaagoFUmVwbHkSGgoIaXNVcGRhdGUYASAB'
    'KAhSCGlzVXBkYXRlEhMKBWZ3X2lkGAIgASgMUgRmd0lkEh4KCm5ld1ZlcnNpb24YAyABKA1SCm'
    '5ld1ZlcnNpb24SEAoDZGVzGAQgASgJUgNkZXMilQEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQ'
    'ABITCg9DQU1FUkFfSURfRU1QVFkQARIXChNDQU1FUkFfSURfTk9UX0ZPVU5EEAISFQoRUEVSTU'
    'lTU0lPTl9ERU5JRUQQAxIgChxDQU1FUkFfTk9UX0hPTUVWSVNJT05fREVWSUNFEAQSEgoOQ0FN'
    'RVJBX09GRkxJTkUQBQ==');

@$core.Deprecated('Use updateFWCameraHomeVisionDescriptor instead')
const UpdateFWCameraHomeVision$json = {
  '1': 'UpdateFWCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 272, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    UpdateFWCameraHomeVision_Request$json,
    UpdateFWCameraHomeVision_Reply$json
  ],
  '4': [UpdateFWCameraHomeVision_Error$json],
};

@$core.Deprecated('Use updateFWCameraHomeVisionDescriptor instead')
const UpdateFWCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'fw_id', '3': 2, '4': 1, '5': 12, '10': 'fwId'},
  ],
};

@$core.Deprecated('Use updateFWCameraHomeVisionDescriptor instead')
const UpdateFWCameraHomeVision_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use updateFWCameraHomeVisionDescriptor instead')
const UpdateFWCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
    {'1': 'PERMISSION_DENIED', '2': 3},
    {'1': 'CAMERA_NOT_HOMEVISION_DEVICE', '2': 4},
    {'1': 'CAMERA_OFFLINE', '2': 5},
    {'1': 'FW_ID_EMPTY', '2': 6},
    {'1': 'FW_ID_NOT_FOUND', '2': 7},
    {'1': 'FW_ID_INVALID', '2': 8},
    {'1': 'FW_ID_NOT_MATCH_DEVICE', '2': 9},
    {'1': 'CAMERA_UPDATING', '2': 10},
  ],
};

/// Descriptor for `UpdateFWCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFWCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVGV0NhbWVyYUhvbWVWaXNpb24SDwoCSUQYkAIgASgNUgJJRBo7CgdSZXF1ZXN0Eh'
    'sKCWNhbWVyYV9pZBgBIAEoDFIIY2FtZXJhSWQSEwoFZndfaWQYAiABKAxSBGZ3SWQaBwoFUmVw'
    'bHki/wEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABITCg9DQU1FUkFfSURfRU1QVFkQARIXCh'
    'NDQU1FUkFfSURfTk9UX0ZPVU5EEAISFQoRUEVSTUlTU0lPTl9ERU5JRUQQAxIgChxDQU1FUkFf'
    'Tk9UX0hPTUVWSVNJT05fREVWSUNFEAQSEgoOQ0FNRVJBX09GRkxJTkUQBRIPCgtGV19JRF9FTV'
    'BUWRAGEhMKD0ZXX0lEX05PVF9GT1VORBAHEhEKDUZXX0lEX0lOVkFMSUQQCBIaChZGV19JRF9O'
    'T1RfTUFUQ0hfREVWSUNFEAkSEwoPQ0FNRVJBX1VQREFUSU5HEAo=');

@$core.Deprecated('Use homeVisionFlipImageDescriptor instead')
const HomeVisionFlipImage$json = {
  '1': 'HomeVisionFlipImage',
  '2': [
    {'1': 'ID', '3': 273, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [HomeVisionFlipImage_Request$json, HomeVisionFlipImage_Reply$json],
  '4': [HomeVisionFlipImage_Error$json],
};

@$core.Deprecated('Use homeVisionFlipImageDescriptor instead')
const HomeVisionFlipImage_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'flip', '3': 2, '4': 1, '5': 8, '10': 'flip'},
  ],
};

@$core.Deprecated('Use homeVisionFlipImageDescriptor instead')
const HomeVisionFlipImage_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use homeVisionFlipImageDescriptor instead')
const HomeVisionFlipImage_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_ID_NOT_FOUND', '2': 2},
    {'1': 'PERMISSION_DENIED', '2': 3},
    {'1': 'CAMERA_NOT_HOMEVISION_DEVICE', '2': 4},
    {'1': 'CAMERA_OFFLINE', '2': 5},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 6},
    {'1': 'CAMERA_ID_INVALID', '2': 7},
    {'1': 'SERVER_P2P_ERROR', '2': 8},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 9},
    {'1': 'UID_INVALID', '2': 10},
  ],
};

/// Descriptor for `HomeVisionFlipImage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeVisionFlipImageDescriptor = $convert.base64Decode(
    'ChNIb21lVmlzaW9uRmxpcEltYWdlEg8KAklEGJECIAEoDVICSUQaOgoHUmVxdWVzdBIbCgljYW'
    '1lcmFfaWQYASABKAxSCGNhbWVyYUlkEhIKBGZsaXAYAiABKAhSBGZsaXAaBwoFUmVwbHkikQIK'
    'BUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABITCg9DQU1FUkFfSURfRU1QVFkQARIXChNDQU1FUk'
    'FfSURfTk9UX0ZPVU5EEAISFQoRUEVSTUlTU0lPTl9ERU5JRUQQAxIgChxDQU1FUkFfTk9UX0hP'
    'TUVWSVNJT05fREVWSUNFEAQSEgoOQ0FNRVJBX09GRkxJTkUQBRIfChtVU0VSX05BTUVfT1JfUE'
    'FTU1dPUkRfRVJST1IQBhIVChFDQU1FUkFfSURfSU5WQUxJRBAHEhQKEFNFUlZFUl9QMlBfRVJS'
    'T1IQCBIbChdDQU1FUkFfQ0xPU0VfQ09OTkVDVElPThAJEg8KC1VJRF9JTlZBTElEEAo=');

@$core.Deprecated('Use homeVisionFormatSDCardDescriptor instead')
const HomeVisionFormatSDCard$json = {
  '1': 'HomeVisionFormatSDCard',
  '2': [
    {'1': 'ID', '3': 276, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [HomeVisionFormatSDCard_Request$json, HomeVisionFormatSDCard_Reply$json],
  '4': [HomeVisionFormatSDCard_Error$json],
};

@$core.Deprecated('Use homeVisionFormatSDCardDescriptor instead')
const HomeVisionFormatSDCard_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use homeVisionFormatSDCardDescriptor instead')
const HomeVisionFormatSDCard_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use homeVisionFormatSDCardDescriptor instead')
const HomeVisionFormatSDCard_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'FORMAT_ERROR', '2': 1},
    {'1': 'NO_SD_CARD', '2': 2},
    {'1': 'CAMERA_NOT_HOME_VISION_DEVICE', '2': 3},
    {'1': 'CAMERA_OFFLINE', '2': 4},
    {'1': 'CAMERA_ID_EMPTY', '2': 5},
    {'1': 'CAMERA_NOT_FOUND', '2': 6},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 7},
    {'1': 'CAMERA_ID_INVALID', '2': 8},
    {'1': 'SERVER_P2P_ERROR', '2': 9},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 10},
    {'1': 'UID_INVALID', '2': 11},
  ],
};

/// Descriptor for `HomeVisionFormatSDCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeVisionFormatSDCardDescriptor = $convert.base64Decode(
    'ChZIb21lVmlzaW9uRm9ybWF0U0RDYXJkEg8KAklEGJQCIAEoDVICSUQaJgoHUmVxdWVzdBIbCg'
    'ljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkGgcKBVJlcGx5IpoCCgVFcnJvchIRCg1FUlJPUl9E'
    'RUZBVUxUEAASEAoMRk9STUFUX0VSUk9SEAESDgoKTk9fU0RfQ0FSRBACEiEKHUNBTUVSQV9OT1'
    'RfSE9NRV9WSVNJT05fREVWSUNFEAMSEgoOQ0FNRVJBX09GRkxJTkUQBBITCg9DQU1FUkFfSURf'
    'RU1QVFkQBRIUChBDQU1FUkFfTk9UX0ZPVU5EEAYSHwobVVNFUl9OQU1FX09SX1BBU1NXT1JEX0'
    'VSUk9SEAcSFQoRQ0FNRVJBX0lEX0lOVkFMSUQQCBIUChBTRVJWRVJfUDJQX0VSUk9SEAkSGwoX'
    'Q0FNRVJBX0NMT1NFX0NPTk5FQ1RJT04QChIPCgtVSURfSU5WQUxJRBAL');

@$core.Deprecated('Use listNotificationDescriptor instead')
const ListNotification$json = {
  '1': 'ListNotification',
  '2': [
    {'1': 'ID', '3': 274, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListNotification_Request$json, ListNotification_Reply$json],
  '4': [ListNotification_GetType$json],
};

@$core.Deprecated('Use listNotificationDescriptor instead')
const ListNotification_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'getType',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.comm.ListNotification.GetType',
      '10': 'getType'
    },
    {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
    {
      '1': 'lastNotification',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'lastNotification'
    },
  ],
};

@$core.Deprecated('Use listNotificationDescriptor instead')
const ListNotification_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'messages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.NotificationMsg',
      '10': 'messages'
    },
    {'1': 'isEnd', '3': 2, '4': 1, '5': 8, '10': 'isEnd'},
  ],
};

@$core.Deprecated('Use listNotificationDescriptor instead')
const ListNotification_GetType$json = {
  '1': 'GetType',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'ALL_MSG_DAY', '2': 1},
  ],
};

/// Descriptor for `ListNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNotificationDescriptor = $convert.base64Decode(
    'ChBMaXN0Tm90aWZpY2F0aW9uEg8KAklEGJICIAEoDVICSUQahQEKB1JlcXVlc3QSOAoHZ2V0VH'
    'lwZRgBIAEoDjIeLmNvbW0uTGlzdE5vdGlmaWNhdGlvbi5HZXRUeXBlUgdnZXRUeXBlEhQKBWNv'
    'dW50GAIgASgNUgVjb3VudBIqChBsYXN0Tm90aWZpY2F0aW9uGAMgASgMUhBsYXN0Tm90aWZpY2'
    'F0aW9uGlAKBVJlcGx5EjEKCG1lc3NhZ2VzGAEgAygLMhUuY29tbS5Ob3RpZmljYXRpb25Nc2dS'
    'CG1lc3NhZ2VzEhQKBWlzRW5kGAIgASgIUgVpc0VuZCInCgdHZXRUeXBlEgsKB0RFRkFVTFQQAB'
    'IPCgtBTExfTVNHX0RBWRAB');

@$core.Deprecated('Use markReadNotificationDescriptor instead')
const MarkReadNotification$json = {
  '1': 'MarkReadNotification',
  '2': [
    {'1': 'ID', '3': 275, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [MarkReadNotification_Request$json, MarkReadNotification_Reply$json],
  '4': [MarkReadNotification_Error$json],
};

@$core.Deprecated('Use markReadNotificationDescriptor instead')
const MarkReadNotification_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'msg_id', '3': 1, '4': 1, '5': 12, '10': 'msgId'},
  ],
};

@$core.Deprecated('Use markReadNotificationDescriptor instead')
const MarkReadNotification_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use markReadNotificationDescriptor instead')
const MarkReadNotification_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'MSG_ID_EMPTY', '2': 1},
    {'1': 'MSG_ID_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `MarkReadNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markReadNotificationDescriptor = $convert.base64Decode(
    'ChRNYXJrUmVhZE5vdGlmaWNhdGlvbhIPCgJJRBiTAiABKA1SAklEGiAKB1JlcXVlc3QSFQoGbX'
    'NnX2lkGAEgASgMUgVtc2dJZBoHCgVSZXBseSJCCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAAS'
    'EAoMTVNHX0lEX0VNUFRZEAESFAoQTVNHX0lEX05PVF9GT1VORBAC');

@$core.Deprecated('Use receiveNotificationDescriptor instead')
const ReceiveNotification$json = {
  '1': 'ReceiveNotification',
  '2': [
    {
      '1': 'messages',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.NotificationMsg',
      '10': 'messages'
    },
    {'1': 'unread_msg_count', '3': 2, '4': 1, '5': 13, '10': 'unreadMsgCount'},
    {'1': 'RECEIVE_MESSAGE', '3': 277, '4': 1, '5': 13, '10': 'RECEIVEMESSAGE'},
  ],
};

/// Descriptor for `ReceiveNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveNotificationDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZlTm90aWZpY2F0aW9uEjEKCG1lc3NhZ2VzGAEgASgLMhUuY29tbS5Ob3RpZmljYX'
    'Rpb25Nc2dSCG1lc3NhZ2VzEigKEHVucmVhZF9tc2dfY291bnQYAiABKA1SDnVucmVhZE1zZ0Nv'
    'dW50EigKD1JFQ0VJVkVfTUVTU0FHRRiVAiABKA1SDlJFQ0VJVkVNRVNTQUdF');

@$core.Deprecated('Use receiveNotificationUnReadCountDescriptor instead')
const ReceiveNotificationUnReadCount$json = {
  '1': 'ReceiveNotificationUnReadCount',
  '2': [
    {'1': 'unread_msg_count', '3': 1, '4': 1, '5': 13, '10': 'unreadMsgCount'},
    {'1': 'ids_markread', '3': 2, '4': 3, '5': 12, '10': 'idsMarkread'},
    {
      '1': 'RECEIVE_UNREAD_NOTIFICATION_COUNT',
      '3': 278,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUNREADNOTIFICATIONCOUNT'
    },
  ],
};

/// Descriptor for `ReceiveNotificationUnReadCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveNotificationUnReadCountDescriptor =
    $convert.base64Decode(
        'Ch5SZWNlaXZlTm90aWZpY2F0aW9uVW5SZWFkQ291bnQSKAoQdW5yZWFkX21zZ19jb3VudBgBIA'
        'EoDVIOdW5yZWFkTXNnQ291bnQSIQoMaWRzX21hcmtyZWFkGAIgAygMUgtpZHNNYXJrcmVhZBJK'
        'CiFSRUNFSVZFX1VOUkVBRF9OT1RJRklDQVRJT05fQ09VTlQYlgIgASgNUh5SRUNFSVZFVU5SRU'
        'FETk9USUZJQ0FUSU9OQ09VTlQ=');

@$core.Deprecated('Use updateVolumeCameraHomeVisionDescriptor instead')
const UpdateVolumeCameraHomeVision$json = {
  '1': 'UpdateVolumeCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 279, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    UpdateVolumeCameraHomeVision_Request$json,
    UpdateVolumeCameraHomeVision_Reply$json
  ],
  '4': [UpdateVolumeCameraHomeVision_Error$json],
};

@$core.Deprecated('Use updateVolumeCameraHomeVisionDescriptor instead')
const UpdateVolumeCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'volume', '3': 2, '4': 1, '5': 13, '10': 'volume'},
  ],
};

@$core.Deprecated('Use updateVolumeCameraHomeVisionDescriptor instead')
const UpdateVolumeCameraHomeVision_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use updateVolumeCameraHomeVisionDescriptor instead')
const UpdateVolumeCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOME_VISION_DEVICE', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_EMPTY', '2': 3},
    {'1': 'CAMERA_NOT_FOUND', '2': 4},
    {'1': 'VOLUME_INVALID', '2': 5},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 6},
    {'1': 'CAMERA_ID_INVALID', '2': 7},
    {'1': 'SERVER_P2P_ERROR', '2': 8},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 9},
    {'1': 'UID_INVALID', '2': 10},
  ],
};

/// Descriptor for `UpdateVolumeCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateVolumeCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVWb2x1bWVDYW1lcmFIb21lVmlzaW9uEg8KAklEGJcCIAEoDVICSUQaPgoHUmVxdW'
    'VzdBIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEhYKBnZvbHVtZRgCIAEoDVIGdm9sdW1l'
    'GgcKBVJlcGx5IowCCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASIQodQ0FNRVJBX05PVF9IT0'
    '1FX1ZJU0lPTl9ERVZJQ0UQARISCg5DQU1FUkFfT0ZGTElORRACEhMKD0NBTUVSQV9JRF9FTVBU'
    'WRADEhQKEENBTUVSQV9OT1RfRk9VTkQQBBISCg5WT0xVTUVfSU5WQUxJRBAFEh8KG1VTRVJfTk'
    'FNRV9PUl9QQVNTV09SRF9FUlJPUhAGEhUKEUNBTUVSQV9JRF9JTlZBTElEEAcSFAoQU0VSVkVS'
    'X1AyUF9FUlJPUhAIEhsKF0NBTUVSQV9DTE9TRV9DT05ORUNUSU9OEAkSDwoLVUlEX0lOVkFMSU'
    'QQCg==');

@$core.Deprecated('Use receiveBeginUpdateFWCameraDescriptor instead')
const ReceiveBeginUpdateFWCamera$json = {
  '1': 'ReceiveBeginUpdateFWCamera',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_BEGIN_UPDATE_FW_CAMERA',
      '3': 280,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEBEGINUPDATEFWCAMERA'
    },
  ],
};

/// Descriptor for `ReceiveBeginUpdateFWCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveBeginUpdateFWCameraDescriptor =
    $convert.base64Decode(
        'ChpSZWNlaXZlQmVnaW5VcGRhdGVGV0NhbWVyYRIkCgZjYW1lcmEYASABKAsyDC5jb21tLkNhbW'
        'VyYVIGY2FtZXJhEkMKHlJFQ0VJVkVfQkVHSU5fVVBEQVRFX0ZXX0NBTUVSQRiYAiABKA1SGlJF'
        'Q0VJVkVCRUdJTlVQREFURUZXQ0FNRVJB');

@$core.Deprecated('Use sdCardTypeCameraHomeVisionDescriptor instead')
const sdCardTypeCameraHomeVision$json = {
  '1': 'sdCardTypeCameraHomeVision',
  '2': [
    {'1': 'ID', '3': 281, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    sdCardTypeCameraHomeVision_Request$json,
    sdCardTypeCameraHomeVision_Reply$json
  ],
  '4': [
    sdCardTypeCameraHomeVision_RecordType$json,
    sdCardTypeCameraHomeVision_Error$json
  ],
};

@$core.Deprecated('Use sdCardTypeCameraHomeVisionDescriptor instead')
const sdCardTypeCameraHomeVision_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {
      '1': 'record_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.comm.sdCardTypeCameraHomeVision.RecordType',
      '10': 'recordType'
    },
  ],
};

@$core.Deprecated('Use sdCardTypeCameraHomeVisionDescriptor instead')
const sdCardTypeCameraHomeVision_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use sdCardTypeCameraHomeVisionDescriptor instead')
const sdCardTypeCameraHomeVision_RecordType$json = {
  '1': 'RecordType',
  '2': [
    {'1': 'OFF', '2': 0},
    {'1': 'ALWAY', '2': 1},
    {'1': 'SCHEDULE', '2': 2},
    {'1': 'EVENT', '2': 3},
  ],
};

@$core.Deprecated('Use sdCardTypeCameraHomeVisionDescriptor instead')
const sdCardTypeCameraHomeVision_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOME_VISION_DEVICE', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_EMPTY', '2': 3},
    {'1': 'CAMERA_NOT_FOUND', '2': 4},
    {'1': 'CAMERA_NO_SDCARD', '2': 5},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 6},
    {'1': 'CAMERA_ID_INVALID', '2': 7},
    {'1': 'SERVER_P2P_ERROR', '2': 8},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 9},
    {'1': 'UID_INVALID', '2': 10},
  ],
};

/// Descriptor for `sdCardTypeCameraHomeVision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdCardTypeCameraHomeVisionDescriptor = $convert.base64Decode(
    'ChpzZENhcmRUeXBlQ2FtZXJhSG9tZVZpc2lvbhIPCgJJRBiZAiABKA1SAklEGnQKB1JlcXVlc3'
    'QSGwoJY2FtZXJhX2lkGAEgASgMUghjYW1lcmFJZBJMCgtyZWNvcmRfdHlwZRgCIAEoDjIrLmNv'
    'bW0uc2RDYXJkVHlwZUNhbWVyYUhvbWVWaXNpb24uUmVjb3JkVHlwZVIKcmVjb3JkVHlwZRoHCg'
    'VSZXBseSI5CgpSZWNvcmRUeXBlEgcKA09GRhAAEgkKBUFMV0FZEAESDAoIU0NIRURVTEUQAhIJ'
    'CgVFVkVOVBADIo4CCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASIQodQ0FNRVJBX05PVF9IT0'
    '1FX1ZJU0lPTl9ERVZJQ0UQARISCg5DQU1FUkFfT0ZGTElORRACEhMKD0NBTUVSQV9JRF9FTVBU'
    'WRADEhQKEENBTUVSQV9OT1RfRk9VTkQQBBIUChBDQU1FUkFfTk9fU0RDQVJEEAUSHwobVVNFUl'
    '9OQU1FX09SX1BBU1NXT1JEX0VSUk9SEAYSFQoRQ0FNRVJBX0lEX0lOVkFMSUQQBxIUChBTRVJW'
    'RVJfUDJQX0VSUk9SEAgSGwoXQ0FNRVJBX0NMT1NFX0NPTk5FQ1RJT04QCRIPCgtVSURfSU5WQU'
    'xJRBAK');

@$core.Deprecated('Use receiveUpdateFWSuccessCameraDescriptor instead')
const ReceiveUpdateFWSuccessCamera$json = {
  '1': 'ReceiveUpdateFWSuccessCamera',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {'1': 'status', '3': 2, '4': 1, '5': 5, '10': 'status'},
    {
      '1': 'RECEIVE_UPDATE_FW_SUCCESS_CAMERA',
      '3': 282,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEUPDATEFWSUCCESSCAMERA'
    },
  ],
};

/// Descriptor for `ReceiveUpdateFWSuccessCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateFWSuccessCameraDescriptor = $convert.base64Decode(
    'ChxSZWNlaXZlVXBkYXRlRldTdWNjZXNzQ2FtZXJhEiQKBmNhbWVyYRgBIAEoCzIMLmNvbW0uQ2'
    'FtZXJhUgZjYW1lcmESFgoGc3RhdHVzGAIgASgFUgZzdGF0dXMSRwogUkVDRUlWRV9VUERBVEVf'
    'RldfU1VDQ0VTU19DQU1FUkEYmgIgASgNUhxSRUNFSVZFVVBEQVRFRldTVUNDRVNTQ0FNRVJB');

@$core.Deprecated('Use listFileInSDCardDescriptor instead')
const ListFileInSDCard$json = {
  '1': 'ListFileInSDCard',
  '2': [
    {'1': 'ID', '3': 283, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListFileInSDCard_Request$json, ListFileInSDCard_Reply$json],
  '4': [ListFileInSDCard_Error$json],
};

@$core.Deprecated('Use listFileInSDCardDescriptor instead')
const ListFileInSDCard_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'day', '3': 2, '4': 1, '5': 13, '10': 'day'},
  ],
};

@$core.Deprecated('Use listFileInSDCardDescriptor instead')
const ListFileInSDCard_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'sdCardFiles',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.SDCardFiles',
      '10': 'sdCardFiles'
    },
  ],
};

@$core.Deprecated('Use listFileInSDCardDescriptor instead')
const ListFileInSDCard_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_NOT_HOME_VISION_DEVICE', '2': 1},
    {'1': 'CAMERA_OFFLINE', '2': 2},
    {'1': 'CAMERA_ID_EMPTY', '2': 3},
    {'1': 'CAMERA_NOT_FOUND', '2': 4},
    {'1': 'CAMERA_NO_SDCARD', '2': 5},
    {'1': 'USER_NAME_OR_PASSWORD_ERROR', '2': 6},
    {'1': 'CAMERA_ID_INVALID', '2': 7},
    {'1': 'SERVER_P2P_ERROR', '2': 8},
    {'1': 'CAMERA_CLOSE_CONNECTION', '2': 9},
    {'1': 'UID_INVALID', '2': 10},
  ],
};

/// Descriptor for `ListFileInSDCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFileInSDCardDescriptor = $convert.base64Decode(
    'ChBMaXN0RmlsZUluU0RDYXJkEg8KAklEGJsCIAEoDVICSUQaOAoHUmVxdWVzdBIbCgljYW1lcm'
    'FfaWQYASABKAxSCGNhbWVyYUlkEhAKA2RheRgCIAEoDVIDZGF5GjwKBVJlcGx5EjMKC3NkQ2Fy'
    'ZEZpbGVzGAEgASgLMhEuY29tbS5TRENhcmRGaWxlc1ILc2RDYXJkRmlsZXMijgIKBUVycm9yEh'
    'EKDUVSUk9SX0RFRkFVTFQQABIhCh1DQU1FUkFfTk9UX0hPTUVfVklTSU9OX0RFVklDRRABEhIK'
    'DkNBTUVSQV9PRkZMSU5FEAISEwoPQ0FNRVJBX0lEX0VNUFRZEAMSFAoQQ0FNRVJBX05PVF9GT1'
    'VORBAEEhQKEENBTUVSQV9OT19TRENBUkQQBRIfChtVU0VSX05BTUVfT1JfUEFTU1dPUkRfRVJS'
    'T1IQBhIVChFDQU1FUkFfSURfSU5WQUxJRBAHEhQKEFNFUlZFUl9QMlBfRVJST1IQCBIbChdDQU'
    '1FUkFfQ0xPU0VfQ09OTkVDVElPThAJEg8KC1VJRF9JTlZBTElEEAo=');

@$core.Deprecated('Use iVAALPRConfigDescriptor instead')
const IVAALPRConfig$json = {
  '1': 'IVAALPRConfig',
  '2': [
    {'1': 'ID', '3': 284, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [IVAALPRConfig_Request$json, IVAALPRConfig_Reply$json],
  '4': [IVAALPRConfig_Error$json],
};

@$core.Deprecated('Use iVAALPRConfigDescriptor instead')
const IVAALPRConfig_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'isEnable', '3': 2, '4': 1, '5': 8, '10': 'isEnable'},
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
    {'1': 'in', '3': 8, '4': 1, '5': 8, '10': 'in'},
  ],
};

@$core.Deprecated('Use iVAALPRConfigDescriptor instead')
const IVAALPRConfig_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
  ],
};

@$core.Deprecated('Use iVAALPRConfigDescriptor instead')
const IVAALPRConfig_Error$json = {
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
  ],
};

/// Descriptor for `IVAALPRConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iVAALPRConfigDescriptor = $convert.base64Decode(
    'Cg1JVkFBTFBSQ29uZmlnEg8KAklEGJwCIAEoDVICSUQa4gEKB1JlcXVlc3QSGwoJY2FtZXJhX2'
    'lkGAEgASgMUghjYW1lcmFJZBIaCghpc0VuYWJsZRgCIAEoCFIIaXNFbmFibGUSIgoNaXNfc2Vu'
    'ZF9lbWFpbBgEIAEoCFILaXNTZW5kRW1haWwSGwoJaXNfcmVjb3JkGAUgASgIUghpc1JlY29yZB'
    'IuChJpc1B1c2hOb3RpZmljYXRpb24YBiABKAhSEmlzUHVzaE5vdGlmaWNhdGlvbhIdCgRyb2lz'
    'GAcgAygLMgkuY29tbS5Sb2lSBHJvaXMSDgoCaW4YCCABKAhSAmluGi0KBVJlcGx5EiQKBmNhbW'
    'VyYRgBIAEoCzIMLmNvbW0uQ2FtZXJhUgZjYW1lcmEirgEKBUVycm9yEhEKDUVSUk9SX0RFRkFV'
    'TFQQABITCg9DQU1FUkFfSURfRU1QVFkQARIUChBDQU1FUkFfTk9UX0ZPVU5EEAISEAoMSVZBX1'
    'NWX0VSUk9SEAMSFAoQSVZBX05PVF9SRUdJU1RFUhAEEhgKFElWQV9UT09fTUFOWV9SRVFVRVNU'
    'EAUSDgoKT1ZFUl9RVU9UQRAGEhUKEVBFUk1JU1NJT05fREVOSUVEEAc=');

@$core.Deprecated('Use receiveALPRConfigDescriptor instead')
const ReceiveALPRConfig$json = {
  '1': 'ReceiveALPRConfig',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_IVA_ALPR',
      '3': 285,
      '4': 1,
      '5': 13,
      '10': 'RECEIVEIVAALPR'
    },
  ],
};

/// Descriptor for `ReceiveALPRConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveALPRConfigDescriptor = $convert.base64Decode(
    'ChFSZWNlaXZlQUxQUkNvbmZpZxIkCgZjYW1lcmEYASABKAsyDC5jb21tLkNhbWVyYVIGY2FtZX'
    'JhEikKEFJFQ0VJVkVfSVZBX0FMUFIYnQIgASgNUg5SRUNFSVZFSVZBQUxQUg==');

@$core.Deprecated('Use updateVehiclePlateDescriptor instead')
const UpdateVehiclePlate$json = {
  '1': 'UpdateVehiclePlate',
  '2': [
    {'1': 'ID', '3': 286, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateVehiclePlate_Request$json, UpdateVehiclePlate_Reply$json],
  '4': [UpdateVehiclePlate_Error$json],
};

@$core.Deprecated('Use updateVehiclePlateDescriptor instead')
const UpdateVehiclePlate_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'event_id', '3': 1, '4': 1, '5': 12, '10': 'eventId'},
    {'1': 'new_vehicle_plate', '3': 2, '4': 1, '5': 9, '10': 'newVehiclePlate'},
  ],
};

@$core.Deprecated('Use updateVehiclePlateDescriptor instead')
const UpdateVehiclePlate_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use updateVehiclePlateDescriptor instead')
const UpdateVehiclePlate_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'EVENT_ID_EMPTY', '2': 1},
    {'1': 'EVENT_NOT_FOUND', '2': 2},
    {'1': 'EVENT_NOT_ALPR', '2': 3},
    {'1': 'PERMISSION_DENIED', '2': 4},
  ],
};

/// Descriptor for `UpdateVehiclePlate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateVehiclePlateDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVWZWhpY2xlUGxhdGUSDwoCSUQYngIgASgNUgJJRBpQCgdSZXF1ZXN0EhkKCGV2ZW'
    '50X2lkGAEgASgMUgdldmVudElkEioKEW5ld192ZWhpY2xlX3BsYXRlGAIgASgJUg9uZXdWZWhp'
    'Y2xlUGxhdGUaBwoFUmVwbHkibgoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhIKDkVWRU5UX0'
    'lEX0VNUFRZEAESEwoPRVZFTlRfTk9UX0ZPVU5EEAISEgoORVZFTlRfTk9UX0FMUFIQAxIVChFQ'
    'RVJNSVNTSU9OX0RFTklFRBAE');

@$core.Deprecated('Use startRecordStreamDescriptor instead')
const StartRecordStream$json = {
  '1': 'StartRecordStream',
  '2': [
    {'1': 'ID', '3': 287, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [StartRecordStream_Request$json, StartRecordStream_Reply$json],
  '4': [StartRecordStream_Error$json],
};

@$core.Deprecated('Use startRecordStreamDescriptor instead')
const StartRecordStream_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use startRecordStreamDescriptor instead')
const StartRecordStream_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'record_id', '3': 2, '4': 1, '5': 12, '10': 'recordId'},
  ],
};

@$core.Deprecated('Use startRecordStreamDescriptor instead')
const StartRecordStream_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_EMPTY', '2': 1},
    {'1': 'CAMERA_NOT_FOUND', '2': 2},
    {'1': 'SV_RECORD_NOT_AVALIABLE', '2': 3},
    {'1': 'RECORD_ERROR', '2': 4},
    {'1': 'CAMERA_NOT_RECORD_IN_CLOUD', '2': 5},
  ],
};

/// Descriptor for `StartRecordStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startRecordStreamDescriptor = $convert.base64Decode(
    'ChFTdGFydFJlY29yZFN0cmVhbRIPCgJJRBifAiABKA1SAklEGiYKB1JlcXVlc3QSGwoJY2FtZX'
    'JhX2lkGAEgASgMUghjYW1lcmFJZBokCgVSZXBseRIbCglyZWNvcmRfaWQYAiABKAxSCHJlY29y'
    'ZElkIpQBCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEwoPQ0FNRVJBX0lEX0VNUFRZEAESFA'
    'oQQ0FNRVJBX05PVF9GT1VORBACEhsKF1NWX1JFQ09SRF9OT1RfQVZBTElBQkxFEAMSEAoMUkVD'
    'T1JEX0VSUk9SEAQSHgoaQ0FNRVJBX05PVF9SRUNPUkRfSU5fQ0xPVUQQBQ==');

@$core.Deprecated('Use stopRecordStreamDescriptor instead')
const StopRecordStream$json = {
  '1': 'StopRecordStream',
  '2': [
    {'1': 'ID', '3': 288, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [StopRecordStream_Request$json, StopRecordStream_Reply$json],
  '4': [StopRecordStream_Error$json],
};

@$core.Deprecated('Use stopRecordStreamDescriptor instead')
const StopRecordStream_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 12, '10': 'recordId'},
  ],
};

@$core.Deprecated('Use stopRecordStreamDescriptor instead')
const StopRecordStream_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'url_download', '3': 1, '4': 1, '5': 9, '10': 'urlDownload'},
    {'1': 'duration', '3': 2, '4': 1, '5': 13, '10': 'duration'},
  ],
};

@$core.Deprecated('Use stopRecordStreamDescriptor instead')
const StopRecordStream_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'RECORD_ID_EMPTY', '2': 1},
    {'1': 'RECORD_NOT_FOUND', '2': 2},
    {'1': 'SV_RECORD_NOT_AVALIABLE', '2': 3},
    {'1': 'RECORD_ERROR', '2': 4},
    {'1': 'CAMERA_NOT_RECORD_IN_CLOUD', '2': 5},
  ],
};

/// Descriptor for `StopRecordStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopRecordStreamDescriptor = $convert.base64Decode(
    'ChBTdG9wUmVjb3JkU3RyZWFtEg8KAklEGKACIAEoDVICSUQaJgoHUmVxdWVzdBIbCglyZWNvcm'
    'RfaWQYASABKAxSCHJlY29yZElkGkYKBVJlcGx5EiEKDHVybF9kb3dubG9hZBgBIAEoCVILdXJs'
    'RG93bmxvYWQSGgoIZHVyYXRpb24YAiABKA1SCGR1cmF0aW9uIpQBCgVFcnJvchIRCg1FUlJPUl'
    '9ERUZBVUxUEAASEwoPUkVDT1JEX0lEX0VNUFRZEAESFAoQUkVDT1JEX05PVF9GT1VORBACEhsK'
    'F1NWX1JFQ09SRF9OT1RfQVZBTElBQkxFEAMSEAoMUkVDT1JEX0VSUk9SEAQSHgoaQ0FNRVJBX0'
    '5PVF9SRUNPUkRfSU5fQ0xPVUQQBQ==');

@$core.Deprecated('Use receiveRecordStreamDoneDescriptor instead')
const ReceiveRecordStreamDone$json = {
  '1': 'ReceiveRecordStreamDone',
  '2': [
    {'1': 'url_download', '3': 1, '4': 1, '5': 9, '10': 'urlDownload'},
    {'1': 'duration', '3': 2, '4': 1, '5': 13, '10': 'duration'},
    {
      '1': 'RECEIVE_RECORD_STREAM_DONE',
      '3': 289,
      '4': 1,
      '5': 13,
      '10': 'RECEIVERECORDSTREAMDONE'
    },
  ],
};

/// Descriptor for `ReceiveRecordStreamDone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveRecordStreamDoneDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlUmVjb3JkU3RyZWFtRG9uZRIhCgx1cmxfZG93bmxvYWQYASABKAlSC3VybERvd2'
    '5sb2FkEhoKCGR1cmF0aW9uGAIgASgNUghkdXJhdGlvbhI8ChpSRUNFSVZFX1JFQ09SRF9TVFJF'
    'QU1fRE9ORRihAiABKA1SF1JFQ0VJVkVSRUNPUkRTVFJFQU1ET05F');

@$core.Deprecated('Use markReadAllNotificationDescriptor instead')
const MarkReadAllNotification$json = {
  '1': 'MarkReadAllNotification',
  '2': [
    {'1': 'ID', '3': 290, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [
    MarkReadAllNotification_Request$json,
    MarkReadAllNotification_Reply$json
  ],
};

@$core.Deprecated('Use markReadAllNotificationDescriptor instead')
const MarkReadAllNotification_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use markReadAllNotificationDescriptor instead')
const MarkReadAllNotification_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `MarkReadAllNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markReadAllNotificationDescriptor =
    $convert.base64Decode(
        'ChdNYXJrUmVhZEFsbE5vdGlmaWNhdGlvbhIPCgJJRBiiAiABKA1SAklEGgkKB1JlcXVlc3QaBw'
        'oFUmVwbHk=');

@$core.Deprecated('Use configOnOffBarrierDescriptor instead')
const ConfigOnOffBarrier$json = {
  '1': 'ConfigOnOffBarrier',
  '2': [
    {'1': 'ID', '3': 291, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ConfigOnOffBarrier_Request$json, ConfigOnOffBarrier_Reply$json],
  '4': [ConfigOnOffBarrier_Error$json],
};

@$core.Deprecated('Use configOnOffBarrierDescriptor instead')
const ConfigOnOffBarrier_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 9, '10': 'endTime'},
  ],
};

@$core.Deprecated('Use configOnOffBarrierDescriptor instead')
const ConfigOnOffBarrier_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 9, '10': 'endTime'},
  ],
};

@$core.Deprecated('Use configOnOffBarrierDescriptor instead')
const ConfigOnOffBarrier_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'START_TIME_INVALID', '2': 1},
    {'1': 'END_TIME_INVALID', '2': 2},
    {'1': 'END_TIME_BEFORE_START_TIME', '2': 3},
  ],
};

/// Descriptor for `ConfigOnOffBarrier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configOnOffBarrierDescriptor = $convert.base64Decode(
    'ChJDb25maWdPbk9mZkJhcnJpZXISDwoCSUQYowIgASgNUgJJRBpTCgdSZXF1ZXN0Eg4KAm9uGA'
    'EgASgIUgJvbhIdCgpzdGFydF90aW1lGAIgASgJUglzdGFydFRpbWUSGQoIZW5kX3RpbWUYAyAB'
    'KAlSB2VuZFRpbWUaUQoFUmVwbHkSDgoCb24YASABKAhSAm9uEh0KCnN0YXJ0X3RpbWUYAiABKA'
    'lSCXN0YXJ0VGltZRIZCghlbmRfdGltZRgDIAEoCVIHZW5kVGltZSJoCgVFcnJvchIRCg1FUlJP'
    'Ul9ERUZBVUxUEAASFgoSU1RBUlRfVElNRV9JTlZBTElEEAESFAoQRU5EX1RJTUVfSU5WQUxJRB'
    'ACEh4KGkVORF9USU1FX0JFRk9SRV9TVEFSVF9USU1FEAM=');

@$core.Deprecated('Use receiveConfigOnOffBarrierDescriptor instead')
const ReceiveConfigOnOffBarrier$json = {
  '1': 'ReceiveConfigOnOffBarrier',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 9, '10': 'endTime'},
    {
      '1': 'RECEIVE_CONFIG_ON_OFF_BARRIER',
      '3': 62,
      '4': 1,
      '5': 13,
      '10': 'RECEIVECONFIGONOFFBARRIER'
    },
  ],
};

/// Descriptor for `ReceiveConfigOnOffBarrier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveConfigOnOffBarrierDescriptor = $convert.base64Decode(
    'ChlSZWNlaXZlQ29uZmlnT25PZmZCYXJyaWVyEg4KAm9uGAEgASgIUgJvbhIdCgpzdGFydF90aW'
    '1lGAIgASgJUglzdGFydFRpbWUSGQoIZW5kX3RpbWUYAyABKAlSB2VuZFRpbWUSQAodUkVDRUlW'
    'RV9DT05GSUdfT05fT0ZGX0JBUlJJRVIYPiABKA1SGVJFQ0VJVkVDT05GSUdPTk9GRkJBUlJJRV'
    'I=');

@$core.Deprecated('Use listVehicleDescriptor instead')
const ListVehicle$json = {
  '1': 'ListVehicle',
  '2': [
    {'1': 'ID', '3': 292, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListVehicle_Request$json, ListVehicle_Reply$json],
};

@$core.Deprecated('Use listVehicleDescriptor instead')
const ListVehicle_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'keyword', '3': 1, '4': 1, '5': 9, '10': 'keyword'},
  ],
};

@$core.Deprecated('Use listVehicleDescriptor instead')
const ListVehicle_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'vehicles',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Vehicle',
      '10': 'vehicles'
    },
  ],
};

/// Descriptor for `ListVehicle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVehicleDescriptor = $convert.base64Decode(
    'CgtMaXN0VmVoaWNsZRIPCgJJRBikAiABKA1SAklEGiMKB1JlcXVlc3QSGAoHa2V5d29yZBgBIA'
    'EoCVIHa2V5d29yZBoyCgVSZXBseRIpCgh2ZWhpY2xlcxgBIAMoCzINLmNvbW0uVmVoaWNsZVII'
    'dmVoaWNsZXM=');

@$core.Deprecated('Use updateInfoVehicleDescriptor instead')
const UpdateInfoVehicle$json = {
  '1': 'UpdateInfoVehicle',
  '2': [
    {'1': 'ID', '3': 293, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateInfoVehicle_Request$json, UpdateInfoVehicle_Reply$json],
  '4': [UpdateInfoVehicle_Error$json],
};

@$core.Deprecated('Use updateInfoVehicleDescriptor instead')
const UpdateInfoVehicle_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'vehicle',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Vehicle',
      '10': 'vehicle'
    },
  ],
};

@$core.Deprecated('Use updateInfoVehicleDescriptor instead')
const UpdateInfoVehicle_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'vehicle',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.Vehicle',
      '10': 'vehicle'
    },
  ],
};

@$core.Deprecated('Use updateInfoVehicleDescriptor instead')
const UpdateInfoVehicle_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'VEHICLE_ID_EMPTY', '2': 1},
    {'1': 'VEHICLE_NOT_FOUND', '2': 2},
    {'1': 'VEHICLE_PLATE_EMPTY', '2': 3},
    {'1': 'VEHICLE_OWNER_EMPTY', '2': 4},
    {'1': 'VEHICLE_PLATE_EXIST', '2': 5},
    {'1': 'PERMISSION_DENIED', '2': 6},
  ],
};

/// Descriptor for `UpdateInfoVehicle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInfoVehicleDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVJbmZvVmVoaWNsZRIPCgJJRBilAiABKA1SAklEGjIKB1JlcXVlc3QSJwoHdmVoaW'
    'NsZRgBIAEoCzINLmNvbW0uVmVoaWNsZVIHdmVoaWNsZRowCgVSZXBseRInCgd2ZWhpY2xlGAEg'
    'ASgLMg0uY29tbS5WZWhpY2xlUgd2ZWhpY2xlIqkBCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEA'
    'ASFAoQVkVISUNMRV9JRF9FTVBUWRABEhUKEVZFSElDTEVfTk9UX0ZPVU5EEAISFwoTVkVISUNM'
    'RV9QTEFURV9FTVBUWRADEhcKE1ZFSElDTEVfT1dORVJfRU1QVFkQBBIXChNWRUhJQ0xFX1BMQV'
    'RFX0VYSVNUEAUSFQoRUEVSTUlTU0lPTl9ERU5JRUQQBg==');

@$core.Deprecated('Use addVehicleDescriptor instead')
const AddVehicle$json = {
  '1': 'AddVehicle',
  '2': [
    {'1': 'ID', '3': 294, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddVehicle_Request$json, AddVehicle_Reply$json],
  '4': [AddVehicle_Error$json],
};

@$core.Deprecated('Use addVehicleDescriptor instead')
const AddVehicle_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'vehicles',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Vehicle',
      '10': 'vehicles'
    },
  ],
};

@$core.Deprecated('Use addVehicleDescriptor instead')
const AddVehicle_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'vehicles',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Vehicle',
      '10': 'vehicles'
    },
  ],
};

@$core.Deprecated('Use addVehicleDescriptor instead')
const AddVehicle_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'VEHICLE_PLATE_EMPTY', '2': 1},
    {'1': 'VEHICLE_TYPE_INVALID', '2': 2},
    {'1': 'VEHICLE_OWNER_EMPTY', '2': 3},
    {'1': 'VEHICLE_PLATE_EXIST', '2': 4},
    {'1': 'PERMISSION_DENIED', '2': 5},
  ],
};

/// Descriptor for `AddVehicle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addVehicleDescriptor = $convert.base64Decode(
    'CgpBZGRWZWhpY2xlEg8KAklEGKYCIAEoDVICSUQaNAoHUmVxdWVzdBIpCgh2ZWhpY2xlcxgBIA'
    'MoCzINLmNvbW0uVmVoaWNsZVIIdmVoaWNsZXMaMgoFUmVwbHkSKQoIdmVoaWNsZXMYASADKAsy'
    'DS5jb21tLlZlaGljbGVSCHZlaGljbGVzIpYBCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASFw'
    'oTVkVISUNMRV9QTEFURV9FTVBUWRABEhgKFFZFSElDTEVfVFlQRV9JTlZBTElEEAISFwoTVkVI'
    'SUNMRV9PV05FUl9FTVBUWRADEhcKE1ZFSElDTEVfUExBVEVfRVhJU1QQBBIVChFQRVJNSVNTSU'
    '9OX0RFTklFRBAF');

@$core.Deprecated('Use deleteVehicleDescriptor instead')
const DeleteVehicle$json = {
  '1': 'DeleteVehicle',
  '2': [
    {'1': 'ID', '3': 295, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteVehicle_Request$json, DeleteVehicle_Reply$json],
  '4': [DeleteVehicle_Error$json],
};

@$core.Deprecated('Use deleteVehicleDescriptor instead')
const DeleteVehicle_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'vehicle_id', '3': 1, '4': 1, '5': 12, '10': 'vehicleId'},
  ],
};

@$core.Deprecated('Use deleteVehicleDescriptor instead')
const DeleteVehicle_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use deleteVehicleDescriptor instead')
const DeleteVehicle_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'VEHICLE_NOT_FOUND', '2': 1},
    {'1': 'PERMISSION_DENIED', '2': 2},
  ],
};

/// Descriptor for `DeleteVehicle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteVehicleDescriptor = $convert.base64Decode(
    'Cg1EZWxldGVWZWhpY2xlEg8KAklEGKcCIAEoDVICSUQaKAoHUmVxdWVzdBIdCgp2ZWhpY2xlX2'
    'lkGAEgASgMUgl2ZWhpY2xlSWQaBwoFUmVwbHkiSAoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAA'
    'EhUKEVZFSElDTEVfTk9UX0ZPVU5EEAESFQoRUEVSTUlTU0lPTl9ERU5JRUQQAg==');

@$core.Deprecated('Use getConfigBarrierDescriptor instead')
const GetConfigBarrier$json = {
  '1': 'GetConfigBarrier',
  '2': [
    {'1': 'ID', '3': 296, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetConfigBarrier_Request$json, GetConfigBarrier_Reply$json],
};

@$core.Deprecated('Use getConfigBarrierDescriptor instead')
const GetConfigBarrier_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use getConfigBarrierDescriptor instead')
const GetConfigBarrier_Reply$json = {
  '1': 'Reply',
  '2': [
    {
      '1': 'config',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.ConfigBarrier',
      '10': 'config'
    },
    {'1': 'car_in', '3': 2, '4': 1, '5': 13, '10': 'carIn'},
    {'1': 'car_out', '3': 3, '4': 1, '5': 13, '10': 'carOut'},
  ],
};

/// Descriptor for `GetConfigBarrier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getConfigBarrierDescriptor = $convert.base64Decode(
    'ChBHZXRDb25maWdCYXJyaWVyEg8KAklEGKgCIAEoDVICSUQaCQoHUmVxdWVzdBpkCgVSZXBseR'
    'IrCgZjb25maWcYASABKAsyEy5jb21tLkNvbmZpZ0JhcnJpZXJSBmNvbmZpZxIVCgZjYXJfaW4Y'
    'AiABKA1SBWNhckluEhcKB2Nhcl9vdXQYAyABKA1SBmNhck91dA==');

@$core.Deprecated('Use configInOutCamDescriptor instead')
const ConfigInOutCam$json = {
  '1': 'ConfigInOutCam',
  '2': [
    {'1': 'ID', '3': 297, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ConfigInOutCam_Request$json, ConfigInOutCam_Reply$json],
  '4': [ConfigInOutCam_Error$json],
};

@$core.Deprecated('Use configInOutCamDescriptor instead')
const ConfigInOutCam_Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'in_out_car',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comm.InOutCam',
      '10': 'inOutCar'
    },
    {
      '1': 'in_out_bike',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.comm.InOutCam',
      '10': 'inOutBike'
    },
  ],
};

@$core.Deprecated('Use configInOutCamDescriptor instead')
const ConfigInOutCam_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use configInOutCamDescriptor instead')
const ConfigInOutCam_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAM_EMPTY', '2': 1},
    {'1': 'CAM_NOT_FOUND', '2': 2},
  ],
};

/// Descriptor for `ConfigInOutCam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configInOutCamDescriptor = $convert.base64Decode(
    'Cg5Db25maWdJbk91dENhbRIPCgJJRBipAiABKA1SAklEGmcKB1JlcXVlc3QSLAoKaW5fb3V0X2'
    'NhchgBIAEoCzIOLmNvbW0uSW5PdXRDYW1SCGluT3V0Q2FyEi4KC2luX291dF9iaWtlGAIgASgL'
    'Mg4uY29tbS5Jbk91dENhbVIJaW5PdXRCaWtlGgcKBVJlcGx5IjwKBUVycm9yEhEKDUVSUk9SX0'
    'RFRkFVTFQQABINCglDQU1fRU1QVFkQARIRCg1DQU1fTk9UX0ZPVU5EEAI=');

@$core.Deprecated('Use configParkingLotDescriptor instead')
const ConfigParkingLot$json = {
  '1': 'ConfigParkingLot',
  '2': [
    {'1': 'ID', '3': 298, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ConfigParkingLot_Request$json, ConfigParkingLot_Reply$json],
};

@$core.Deprecated('Use configParkingLotDescriptor instead')
const ConfigParkingLot_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'parking_lots', '3': 1, '4': 1, '5': 13, '10': 'parkingLots'},
    {'1': 'used_lots', '3': 2, '4': 1, '5': 13, '10': 'usedLots'},
  ],
};

@$core.Deprecated('Use configParkingLotDescriptor instead')
const ConfigParkingLot_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'parking_lots', '3': 1, '4': 1, '5': 13, '10': 'parkingLots'},
    {'1': 'used_lots', '3': 2, '4': 1, '5': 13, '10': 'usedLots'},
    {'1': 'available_lots', '3': 3, '4': 1, '5': 13, '10': 'availableLots'},
    {'1': 'car_in', '3': 4, '4': 1, '5': 13, '10': 'carIn'},
    {'1': 'car_out', '3': 5, '4': 1, '5': 13, '10': 'carOut'},
  ],
};

/// Descriptor for `ConfigParkingLot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configParkingLotDescriptor = $convert.base64Decode(
    'ChBDb25maWdQYXJraW5nTG90Eg8KAklEGKoCIAEoDVICSUQaSQoHUmVxdWVzdBIhCgxwYXJraW'
    '5nX2xvdHMYASABKA1SC3BhcmtpbmdMb3RzEhsKCXVzZWRfbG90cxgCIAEoDVIIdXNlZExvdHMa'
    'ngEKBVJlcGx5EiEKDHBhcmtpbmdfbG90cxgBIAEoDVILcGFya2luZ0xvdHMSGwoJdXNlZF9sb3'
    'RzGAIgASgNUgh1c2VkTG90cxIlCg5hdmFpbGFibGVfbG90cxgDIAEoDVINYXZhaWxhYmxlTG90'
    'cxIVCgZjYXJfaW4YBCABKA1SBWNhckluEhcKB2Nhcl9vdXQYBSABKA1SBmNhck91dA==');

@$core.Deprecated('Use receiveUpdateParkingLotDescriptor instead')
const ReceiveUpdateParkingLot$json = {
  '1': 'ReceiveUpdateParkingLot',
  '2': [
    {'1': 'parking_lots', '3': 1, '4': 1, '5': 13, '10': 'parkingLots'},
    {'1': 'used_lots', '3': 2, '4': 1, '5': 13, '10': 'usedLots'},
    {'1': 'available_lots', '3': 3, '4': 1, '5': 13, '10': 'availableLots'},
    {'1': 'car_in', '3': 4, '4': 1, '5': 13, '10': 'carIn'},
    {'1': 'car_out', '3': 5, '4': 1, '5': 13, '10': 'carOut'},
    {
      '1': 'RECEIVE_CONFIG_ON_OFF_BARRIER',
      '3': 63,
      '4': 1,
      '5': 13,
      '10': 'RECEIVECONFIGONOFFBARRIER'
    },
  ],
};

/// Descriptor for `ReceiveUpdateParkingLot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveUpdateParkingLotDescriptor = $convert.base64Decode(
    'ChdSZWNlaXZlVXBkYXRlUGFya2luZ0xvdBIhCgxwYXJraW5nX2xvdHMYASABKA1SC3Bhcmtpbm'
    'dMb3RzEhsKCXVzZWRfbG90cxgCIAEoDVIIdXNlZExvdHMSJQoOYXZhaWxhYmxlX2xvdHMYAyAB'
    'KA1SDWF2YWlsYWJsZUxvdHMSFQoGY2FyX2luGAQgASgNUgVjYXJJbhIXCgdjYXJfb3V0GAUgAS'
    'gNUgZjYXJPdXQSQAodUkVDRUlWRV9DT05GSUdfT05fT0ZGX0JBUlJJRVIYPyABKA1SGVJFQ0VJ'
    'VkVDT05GSUdPTk9GRkJBUlJJRVI=');

@$core.Deprecated('Use addCameraRTMPDescriptor instead')
const AddCameraRTMP$json = {
  '1': 'AddCameraRTMP',
  '2': [
    {'1': 'ID', '3': 299, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddCameraRTMP_Request$json, AddCameraRTMP_Reply$json],
  '4': [AddCameraRTMP_Error$json],
};

@$core.Deprecated('Use addCameraRTMPDescriptor instead')
const AddCameraRTMP_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'encoder', '3': 2, '4': 1, '5': 9, '10': 'encoder'},
    {'1': 'bitrate', '3': 3, '4': 1, '5': 13, '10': 'bitrate'},
    {'1': 'framerate', '3': 4, '4': 1, '5': 13, '10': 'framerate'},
    {
      '1': 'location',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.comm.MapLocation',
      '10': 'location'
    },
    {'1': 'group_id', '3': 7, '4': 1, '5': 12, '10': 'groupId'},
  ],
};

@$core.Deprecated('Use addCameraRTMPDescriptor instead')
const AddCameraRTMP_Reply$json = {
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

@$core.Deprecated('Use addCameraRTMPDescriptor instead')
const AddCameraRTMP_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'USER_NOT_FOUND', '2': 2},
    {'1': 'CAMERA_NAME_EMPTY', '2': 3},
    {'1': 'ENCODER_NOT_FOUND', '2': 4},
    {'1': 'ENCODER_INVALID', '2': 5},
    {'1': 'LOCATION_INVALID', '2': 8},
    {'1': 'CAMERA_NAME_EXIST', '2': 9},
    {'1': 'OVER_QUOTA', '2': 12},
    {'1': 'GROUP_INVALID', '2': 13},
  ],
};

/// Descriptor for `AddCameraRTMP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCameraRTMPDescriptor = $convert.base64Decode(
    'Cg1BZGRDYW1lcmFSVE1QEg8KAklEGKsCIAEoDVICSUQauQEKB1JlcXVlc3QSEgoEbmFtZRgBIA'
    'EoCVIEbmFtZRIYCgdlbmNvZGVyGAIgASgJUgdlbmNvZGVyEhgKB2JpdHJhdGUYAyABKA1SB2Jp'
    'dHJhdGUSHAoJZnJhbWVyYXRlGAQgASgNUglmcmFtZXJhdGUSLQoIbG9jYXRpb24YBSABKAsyES'
    '5jb21tLk1hcExvY2F0aW9uUghsb2NhdGlvbhIZCghncm91cF9pZBgHIAEoDFIHZ3JvdXBJZBpK'
    'CgVSZXBseRIbCgljYW1lcmFfaWQYASABKAxSCGNhbWVyYUlkEiQKBmNhbWVyYRgCIAEoCzIMLm'
    'NvbW0uQ2FtZXJhUgZjYW1lcmEiwQEKBUVycm9yEhEKDUVSUk9SX0RFRkFVTFQQABISCg5VU0VS'
    'X05PVF9GT1VORBACEhUKEUNBTUVSQV9OQU1FX0VNUFRZEAMSFQoRRU5DT0RFUl9OT1RfRk9VTk'
    'QQBBITCg9FTkNPREVSX0lOVkFMSUQQBRIUChBMT0NBVElPTl9JTlZBTElEEAgSFQoRQ0FNRVJB'
    'X05BTUVfRVhJU1QQCRIOCgpPVkVSX1FVT1RBEAwSEQoNR1JPVVBfSU5WQUxJRBAN');

@$core.Deprecated('Use receiveStatusCameraDescriptor instead')
const ReceiveStatusCamera$json = {
  '1': 'ReceiveStatusCamera',
  '2': [
    {
      '1': 'camera',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comm.Camera',
      '10': 'camera'
    },
    {
      '1': 'RECEIVE_STATUS_CAMERA',
      '3': 1300,
      '4': 1,
      '5': 13,
      '10': 'RECEIVESTATUSCAMERA'
    },
  ],
};

/// Descriptor for `ReceiveStatusCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveStatusCameraDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZlU3RhdHVzQ2FtZXJhEiQKBmNhbWVyYRgBIAMoCzIMLmNvbW0uQ2FtZXJhUgZjYW'
    '1lcmESMwoVUkVDRUlWRV9TVEFUVVNfQ0FNRVJBGJQKIAEoDVITUkVDRUlWRVNUQVRVU0NBTUVS'
    'QQ==');
