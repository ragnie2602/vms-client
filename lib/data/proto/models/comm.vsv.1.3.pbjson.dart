//
//  Generated code. Do not modify.
//  source: comm.vsv.1.3.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use receiveEventDescriptor instead')
const ReceiveEvent$json = {
  '1': 'ReceiveEvent',
  '2': [
    {'1': 'event_type', '3': 1, '4': 1, '5': 9, '10': 'eventType'},
    {'1': 'event_data', '3': 2, '4': 1, '5': 9, '10': 'eventData'},
    {'1': 'camera_id', '3': 3, '4': 1, '5': 9, '10': 'cameraId'},
    {'1': 'RECEIVE_EVENT', '3': 2007, '4': 1, '5': 13, '10': 'RECEIVEEVENT'},
  ],
};

/// Descriptor for `ReceiveEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveEventDescriptor = $convert.base64Decode(
    'CgxSZWNlaXZlRXZlbnQSHQoKZXZlbnRfdHlwZRgBIAEoCVIJZXZlbnRUeXBlEh0KCmV2ZW50X2'
    'RhdGEYAiABKAlSCWV2ZW50RGF0YRIbCgljYW1lcmFfaWQYAyABKAlSCGNhbWVyYUlkEiQKDVJF'
    'Q0VJVkVfRVZFTlQY1w8gASgNUgxSRUNFSVZFRVZFTlQ=');

@$core.Deprecated('Use receiveKickDescriptor instead')
const ReceiveKick$json = {
  '1': 'ReceiveKick',
  '2': [
    {'1': 'RECEIVE_KICK_EVENT', '3': 2008, '4': 1, '5': 13, '10': 'RECEIVEKICKEVENT'},
  ],
};

/// Descriptor for `ReceiveKick`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveKickDescriptor = $convert.base64Decode(
    'CgtSZWNlaXZlS2ljaxItChJSRUNFSVZFX0tJQ0tfRVZFTlQY2A8gASgNUhBSRUNFSVZFS0lDS0'
    'VWRU5U');

@$core.Deprecated('Use getSettingAvaliableDescriptor instead')
const GetSettingAvaliable$json = {
  '1': 'GetSettingAvaliable',
  '2': [
    {'1': 'ID', '3': 2009, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetSettingAvaliable_Request$json, GetSettingAvaliable_Reply$json],
  '4': [GetSettingAvaliable_Error$json],
};

@$core.Deprecated('Use getSettingAvaliableDescriptor instead')
const GetSettingAvaliable_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'cameras_id', '3': 1, '4': 1, '5': 12, '10': 'camerasId'},
  ],
};

@$core.Deprecated('Use getSettingAvaliableDescriptor instead')
const GetSettingAvaliable_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'json_data', '3': 1, '4': 1, '5': 9, '10': 'jsonData'},
  ],
};

@$core.Deprecated('Use getSettingAvaliableDescriptor instead')
const GetSettingAvaliable_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'CAMERA_ID_INVALID', '2': 1},
    {'1': 'CAMERA_NOT_EXIST', '2': 2},
    {'1': 'CAMERA_NOT_SUPPORT', '2': 3},
  ],
};

/// Descriptor for `GetSettingAvaliable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSettingAvaliableDescriptor = $convert.base64Decode(
    'ChNHZXRTZXR0aW5nQXZhbGlhYmxlEg8KAklEGNkPIAEoDVICSUQaKAoHUmVxdWVzdBIdCgpjYW'
    '1lcmFzX2lkGAEgASgMUgljYW1lcmFzSWQaJAoFUmVwbHkSGwoJanNvbl9kYXRhGAEgASgJUghq'
    'c29uRGF0YSJfCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASFQoRQ0FNRVJBX0lEX0lOVkFMSU'
    'QQARIUChBDQU1FUkFfTk9UX0VYSVNUEAISFgoSQ0FNRVJBX05PVF9TVVBQT1JUEAM=');

