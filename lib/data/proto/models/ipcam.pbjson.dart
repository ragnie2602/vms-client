//
//  Generated code. Do not modify.
//  source: ipcam.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'google/protobuf/any.pbjson.dart' as $0;

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

@$core.Deprecated('Use requestDescriptor instead')
const Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'id', '3': 2, '4': 1, '5': 4, '10': 'id'},
    {'1': 'sid', '3': 3, '4': 1, '5': 12, '10': 'sid'},
    {'1': 'uid', '3': 4, '4': 1, '5': 12, '10': 'uid'},
    {'1': 'request', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'request'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0EhIKBHR5cGUYASABKA1SBHR5cGUSDgoCaWQYAiABKARSAmlkEhAKA3NpZBgDIA'
    'EoDFIDc2lkEhAKA3VpZBgEIAEoDFIDdWlkEi4KB3JlcXVlc3QYBSABKAsyFC5nb29nbGUucHJv'
    'dG9idWYuQW55UgdyZXF1ZXN0');

@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 13, '10': 'type'},
    {'1': 'id', '3': 2, '4': 1, '5': 4, '10': 'id'},
    {'1': 'server_time', '3': 3, '4': 1, '5': 4, '10': 'serverTime'},
    {'1': 'reply', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'reply'},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode(
    'CgVSZXBseRISCgR0eXBlGAEgASgNUgR0eXBlEg4KAmlkGAIgASgEUgJpZBIfCgtzZXJ2ZXJfdG'
    'ltZRgDIAEoBFIKc2VydmVyVGltZRIqCgVyZXBseRgEIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5B'
    'bnlSBXJlcGx5');

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive$json = {
  '1': 'KeepAlive',
  '2': [
    {'1': 'ID', '3': 100, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [KeepAlive_Request$json, KeepAlive_Reply$json],
  '4': [KeepAlive_AppType$json],
};

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'node_uuid', '3': 1, '4': 1, '5': 9, '10': 'nodeUuid'},
    {'1': 'current_task_running', '3': 2, '4': 1, '5': 13, '10': 'currentTaskRunning'},
    {'1': 'grpc_host', '3': 3, '4': 1, '5': 9, '10': 'grpcHost'},
    {'1': 'grpc_port', '3': 4, '4': 1, '5': 13, '10': 'grpcPort'},
    {'1': 'apptype', '3': 5, '4': 1, '5': 14, '6': '.VIVAS.KeepAlive.AppType', '10': 'apptype'},
  ],
};

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use keepAliveDescriptor instead')
const KeepAlive_AppType$json = {
  '1': 'AppType',
  '2': [
    {'1': 'VMS', '2': 0},
    {'1': 'RECORD', '2': 1},
    {'1': 'HOMEVISON_CLIENT', '2': 2},
  ],
};

/// Descriptor for `KeepAlive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keepAliveDescriptor = $convert.base64Decode(
    'CglLZWVwQWxpdmUSDgoCSUQYZCABKA1SAklEGsYBCgdSZXF1ZXN0EhsKCW5vZGVfdXVpZBgBIA'
    'EoCVIIbm9kZVV1aWQSMAoUY3VycmVudF90YXNrX3J1bm5pbmcYAiABKA1SEmN1cnJlbnRUYXNr'
    'UnVubmluZxIbCglncnBjX2hvc3QYAyABKAlSCGdycGNIb3N0EhsKCWdycGNfcG9ydBgEIAEoDV'
    'IIZ3JwY1BvcnQSMgoHYXBwdHlwZRgFIAEoDjIYLlZJVkFTLktlZXBBbGl2ZS5BcHBUeXBlUgdh'
    'cHB0eXBlGgcKBVJlcGx5IjQKB0FwcFR5cGUSBwoDVk1TEAASCgoGUkVDT1JEEAESFAoQSE9NRV'
    'ZJU09OX0NMSUVOVBAC');

@$core.Deprecated('Use startRecordDescriptor instead')
const StartRecord$json = {
  '1': 'StartRecord',
  '2': [
    {'1': 'ID', '3': 606, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [StartRecord_Request$json, StartRecord_Reply$json],
};

@$core.Deprecated('Use startRecordDescriptor instead')
const StartRecord_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'ws_server', '3': 2, '4': 1, '5': 9, '10': 'wsServer'},
  ],
};

@$core.Deprecated('Use startRecordDescriptor instead')
const StartRecord_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `StartRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startRecordDescriptor = $convert.base64Decode(
    'CgtTdGFydFJlY29yZBIPCgJJRBjeBCABKA1SAklEGkMKB1JlcXVlc3QSGwoJY2FtZXJhX2lkGA'
    'EgASgMUghjYW1lcmFJZBIbCgl3c19zZXJ2ZXIYAiABKAlSCHdzU2VydmVyGgcKBVJlcGx5');

@$core.Deprecated('Use stopRecordDescriptor instead')
const StopRecord$json = {
  '1': 'StopRecord',
  '2': [
    {'1': 'ID', '3': 607, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [StopRecord_Request$json, StopRecord_Reply$json],
};

@$core.Deprecated('Use stopRecordDescriptor instead')
const StopRecord_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use stopRecordDescriptor instead')
const StopRecord_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `StopRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopRecordDescriptor = $convert.base64Decode(
    'CgpTdG9wUmVjb3JkEg8KAklEGN8EIAEoDVICSUQaJgoHUmVxdWVzdBIbCgljYW1lcmFfaWQYAS'
    'ABKAxSCGNhbWVyYUlkGgcKBVJlcGx5');

@$core.Deprecated('Use makeMp4FileDescriptor instead')
const MakeMp4File$json = {
  '1': 'MakeMp4File',
  '2': [
    {'1': 'ID', '3': 613, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [MakeMp4File_m3u82mp4$json, MakeMp4File_Request$json, MakeMp4File_Reply$json],
};

@$core.Deprecated('Use makeMp4FileDescriptor instead')
const MakeMp4File_m3u82mp4$json = {
  '1': 'm3u82mp4',
  '2': [
    {'1': 'path_m3u8', '3': 1, '4': 1, '5': 9, '10': 'pathM3u8'},
    {'1': 'path_mp4', '3': 2, '4': 1, '5': 9, '10': 'pathMp4'},
    {'1': 'isDone', '3': 3, '4': 1, '5': 8, '10': 'isDone'},
  ],
};

@$core.Deprecated('Use makeMp4FileDescriptor instead')
const MakeMp4File_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.VIVAS.MakeMp4File.m3u82mp4', '10': 'files'},
  ],
};

@$core.Deprecated('Use makeMp4FileDescriptor instead')
const MakeMp4File_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.VIVAS.MakeMp4File.m3u82mp4', '10': 'files'},
  ],
};

/// Descriptor for `MakeMp4File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List makeMp4FileDescriptor = $convert.base64Decode(
    'CgtNYWtlTXA0RmlsZRIPCgJJRBjlBCABKA1SAklEGloKCG0zdTgybXA0EhsKCXBhdGhfbTN1OB'
    'gBIAEoCVIIcGF0aE0zdTgSGQoIcGF0aF9tcDQYAiABKAlSB3BhdGhNcDQSFgoGaXNEb25lGAMg'
    'ASgIUgZpc0RvbmUaPAoHUmVxdWVzdBIxCgVmaWxlcxgBIAMoCzIbLlZJVkFTLk1ha2VNcDRGaW'
    'xlLm0zdTgybXA0UgVmaWxlcxo6CgVSZXBseRIxCgVmaWxlcxgBIAMoCzIbLlZJVkFTLk1ha2VN'
    'cDRGaWxlLm0zdTgybXA0UgVmaWxlcw==');

@$core.Deprecated('Use deleteRecordFileDescriptor instead')
const DeleteRecordFile$json = {
  '1': 'DeleteRecordFile',
  '2': [
    {'1': 'ID', '3': 614, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DeleteRecordFile_Request$json, DeleteRecordFile_Reply$json],
};

@$core.Deprecated('Use deleteRecordFileDescriptor instead')
const DeleteRecordFile_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'file_path', '3': 1, '4': 1, '5': 12, '10': 'filePath'},
  ],
};

@$core.Deprecated('Use deleteRecordFileDescriptor instead')
const DeleteRecordFile_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `DeleteRecordFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRecordFileDescriptor = $convert.base64Decode(
    'ChBEZWxldGVSZWNvcmRGaWxlEg8KAklEGOYEIAEoDVICSUQaJgoHUmVxdWVzdBIbCglmaWxlX3'
    'BhdGgYASABKAxSCGZpbGVQYXRoGgcKBVJlcGx5');

@$core.Deprecated('Use captureVideoEventDescriptor instead')
const CaptureVideoEvent$json = {
  '1': 'CaptureVideoEvent',
  '2': [
    {'1': 'ID', '3': 612, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [CaptureVideoEvent_Request$json, CaptureVideoEvent_Reply$json],
};

@$core.Deprecated('Use captureVideoEventDescriptor instead')
const CaptureVideoEvent_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'event_id', '3': 2, '4': 1, '5': 12, '10': 'eventId'},
  ],
};

@$core.Deprecated('Use captureVideoEventDescriptor instead')
const CaptureVideoEvent_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `CaptureVideoEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List captureVideoEventDescriptor = $convert.base64Decode(
    'ChFDYXB0dXJlVmlkZW9FdmVudBIPCgJJRBjkBCABKA1SAklEGkEKB1JlcXVlc3QSGwoJY2FtZX'
    'JhX2lkGAEgASgMUghjYW1lcmFJZBIZCghldmVudF9pZBgCIAEoDFIHZXZlbnRJZBoHCgVSZXBs'
    'eQ==');

@$core.Deprecated('Use sendReceiveToSessionDescriptor instead')
const sendReceiveToSession$json = {
  '1': 'sendReceiveToSession',
  '2': [
    {'1': 'ID', '3': 602, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [sendReceiveToSession_Request$json, sendReceiveToSession_Reply$json],
};

@$core.Deprecated('Use sendReceiveToSessionDescriptor instead')
const sendReceiveToSession_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'msg_data', '3': 1, '4': 1, '5': 12, '10': 'msgData'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 12, '10': 'userId'},
    {'1': 'session_id', '3': 3, '4': 1, '5': 12, '10': 'sessionId'},
    {'1': 'send_push_when_session_offline', '3': 4, '4': 1, '5': 8, '10': 'sendPushWhenSessionOffline'},
    {'1': 'box_id', '3': 5, '4': 1, '5': 12, '10': 'boxId'},
    {'1': 'connection_id', '3': 6, '4': 1, '5': 12, '10': 'connectionId'},
    {'1': 'msg_type', '3': 7, '4': 1, '5': 13, '10': 'msgType'},
  ],
};

@$core.Deprecated('Use sendReceiveToSessionDescriptor instead')
const sendReceiveToSession_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `sendReceiveToSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendReceiveToSessionDescriptor = $convert.base64Decode(
    'ChRzZW5kUmVjZWl2ZVRvU2Vzc2lvbhIPCgJJRBjaBCABKA1SAklEGvcBCgdSZXF1ZXN0EhkKCG'
    '1zZ19kYXRhGAEgASgMUgdtc2dEYXRhEhcKB3VzZXJfaWQYAiABKAxSBnVzZXJJZBIdCgpzZXNz'
    'aW9uX2lkGAMgASgMUglzZXNzaW9uSWQSQgoec2VuZF9wdXNoX3doZW5fc2Vzc2lvbl9vZmZsaW'
    '5lGAQgASgIUhpzZW5kUHVzaFdoZW5TZXNzaW9uT2ZmbGluZRIVCgZib3hfaWQYBSABKAxSBWJv'
    'eElkEiMKDWNvbm5lY3Rpb25faWQYBiABKAxSDGNvbm5lY3Rpb25JZBIZCghtc2dfdHlwZRgHIA'
    'EoDVIHbXNnVHlwZRoHCgVSZXBseQ==');

@$core.Deprecated('Use whoIsHostDescriptor instead')
const WhoIsHost$json = {
  '1': 'WhoIsHost',
  '2': [
    {'1': 'ID', '3': 604, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [WhoIsHost_Request$json, WhoIsHost_Reply$json],
};

@$core.Deprecated('Use whoIsHostDescriptor instead')
const WhoIsHost_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use whoIsHostDescriptor instead')
const WhoIsHost_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'master_node_uuid', '3': 1, '4': 1, '5': 9, '10': 'masterNodeUuid'},
    {'1': 'master_grpc_host', '3': 2, '4': 1, '5': 9, '10': 'masterGrpcHost'},
    {'1': 'master_grpc_port', '3': 3, '4': 1, '5': 13, '10': 'masterGrpcPort'},
  ],
};

/// Descriptor for `WhoIsHost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whoIsHostDescriptor = $convert.base64Decode(
    'CglXaG9Jc0hvc3QSDwoCSUQY3AQgASgNUgJJRBoJCgdSZXF1ZXN0GoUBCgVSZXBseRIoChBtYX'
    'N0ZXJfbm9kZV91dWlkGAEgASgJUg5tYXN0ZXJOb2RlVXVpZBIoChBtYXN0ZXJfZ3JwY19ob3N0'
    'GAIgASgJUg5tYXN0ZXJHcnBjSG9zdBIoChBtYXN0ZXJfZ3JwY19wb3J0GAMgASgNUg5tYXN0ZX'
    'JHcnBjUG9ydA==');

@$core.Deprecated('Use registerNodeDescriptor instead')
const RegisterNode$json = {
  '1': 'RegisterNode',
  '2': [
    {'1': 'ID', '3': 605, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RegisterNode_Request$json, RegisterNode_Reply$json],
};

@$core.Deprecated('Use registerNodeDescriptor instead')
const RegisterNode_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'node_uuid', '3': 1, '4': 1, '5': 9, '10': 'nodeUuid'},
    {'1': 'current_task', '3': 2, '4': 1, '5': 13, '10': 'currentTask'},
    {'1': 'max_task', '3': 4, '4': 1, '5': 13, '10': 'maxTask'},
  ],
};

@$core.Deprecated('Use registerNodeDescriptor instead')
const RegisterNode_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'isBackUpHost', '3': 1, '4': 1, '5': 8, '10': 'isBackUpHost'},
  ],
};

/// Descriptor for `RegisterNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerNodeDescriptor = $convert.base64Decode(
    'CgxSZWdpc3Rlck5vZGUSDwoCSUQY3QQgASgNUgJJRBpkCgdSZXF1ZXN0EhsKCW5vZGVfdXVpZB'
    'gBIAEoCVIIbm9kZVV1aWQSIQoMY3VycmVudF90YXNrGAIgASgNUgtjdXJyZW50VGFzaxIZCght'
    'YXhfdGFzaxgEIAEoDVIHbWF4VGFzaxorCgVSZXBseRIiCgxpc0JhY2tVcEhvc3QYASABKAhSDG'
    'lzQmFja1VwSG9zdA==');

@$core.Deprecated('Use getNodeAvaliableDescriptor instead')
const GetNodeAvaliable$json = {
  '1': 'GetNodeAvaliable',
  '2': [
    {'1': 'ID', '3': 615, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetNodeAvaliable_Request$json, GetNodeAvaliable_Reply$json],
};

@$core.Deprecated('Use getNodeAvaliableDescriptor instead')
const GetNodeAvaliable_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'isRecordNode', '3': 1, '4': 1, '5': 8, '10': 'isRecordNode'},
    {'1': 'node_id', '3': 2, '4': 1, '5': 9, '10': 'nodeId'},
  ],
};

@$core.Deprecated('Use getNodeAvaliableDescriptor instead')
const GetNodeAvaliable_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'host_avaliable', '3': 1, '4': 1, '5': 8, '10': 'hostAvaliable'},
    {'1': 'node_uuid', '3': 2, '4': 1, '5': 9, '10': 'nodeUuid'},
    {'1': 'grpc_host', '3': 3, '4': 1, '5': 9, '10': 'grpcHost'},
    {'1': 'grpc_port', '3': 4, '4': 1, '5': 13, '10': 'grpcPort'},
  ],
};

/// Descriptor for `GetNodeAvaliable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeAvaliableDescriptor = $convert.base64Decode(
    'ChBHZXROb2RlQXZhbGlhYmxlEg8KAklEGOcEIAEoDVICSUQaRgoHUmVxdWVzdBIiCgxpc1JlY2'
    '9yZE5vZGUYASABKAhSDGlzUmVjb3JkTm9kZRIXCgdub2RlX2lkGAIgASgJUgZub2RlSWQahQEK'
    'BVJlcGx5EiUKDmhvc3RfYXZhbGlhYmxlGAEgASgIUg1ob3N0QXZhbGlhYmxlEhsKCW5vZGVfdX'
    'VpZBgCIAEoCVIIbm9kZVV1aWQSGwoJZ3JwY19ob3N0GAMgASgJUghncnBjSG9zdBIbCglncnBj'
    'X3BvcnQYBCABKA1SCGdycGNQb3J0');

@$core.Deprecated('Use cameraOnlineOfflineDescriptor instead')
const CameraOnlineOffline$json = {
  '1': 'CameraOnlineOffline',
  '2': [
    {'1': 'ID', '3': 616, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [CameraOnlineOffline_Request$json, CameraOnlineOffline_Reply$json],
};

@$core.Deprecated('Use cameraOnlineOfflineDescriptor instead')
const CameraOnlineOffline_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
  ],
};

@$core.Deprecated('Use cameraOnlineOfflineDescriptor instead')
const CameraOnlineOffline_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `CameraOnlineOffline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraOnlineOfflineDescriptor = $convert.base64Decode(
    'ChNDYW1lcmFPbmxpbmVPZmZsaW5lEg8KAklEGOgEIAEoDVICSUQaJgoHUmVxdWVzdBIbCgljYW'
    '1lcmFfaWQYASABKAxSCGNhbWVyYUlkGgcKBVJlcGx5');

@$core.Deprecated('Use newRecordVideoDescriptor instead')
const NewRecordVideo$json = {
  '1': 'NewRecordVideo',
  '2': [
    {'1': 'ID', '3': 617, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [NewRecordVideo_Request$json, NewRecordVideo_Reply$json],
};

@$core.Deprecated('Use newRecordVideoDescriptor instead')
const NewRecordVideo_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'playback_id', '3': 2, '4': 1, '5': 12, '10': 'playbackId'},
  ],
};

@$core.Deprecated('Use newRecordVideoDescriptor instead')
const NewRecordVideo_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `NewRecordVideo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newRecordVideoDescriptor = $convert.base64Decode(
    'Cg5OZXdSZWNvcmRWaWRlbxIPCgJJRBjpBCABKA1SAklEGkcKB1JlcXVlc3QSGwoJY2FtZXJhX2'
    'lkGAEgASgMUghjYW1lcmFJZBIfCgtwbGF5YmFja19pZBgCIAEoDFIKcGxheWJhY2tJZBoHCgVS'
    'ZXBseQ==');

@$core.Deprecated('Use getAllNodeAvaliableDescriptor instead')
const GetAllNodeAvaliable$json = {
  '1': 'GetAllNodeAvaliable',
  '2': [
    {'1': 'ID', '3': 618, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [GetAllNodeAvaliable_Node$json, GetAllNodeAvaliable_Request$json, GetAllNodeAvaliable_Reply$json],
};

@$core.Deprecated('Use getAllNodeAvaliableDescriptor instead')
const GetAllNodeAvaliable_Node$json = {
  '1': 'Node',
  '2': [
    {'1': 'node_uuid', '3': 1, '4': 1, '5': 9, '10': 'nodeUuid'},
    {'1': 'grpc_host', '3': 2, '4': 1, '5': 9, '10': 'grpcHost'},
    {'1': 'grpc_port', '3': 3, '4': 1, '5': 13, '10': 'grpcPort'},
  ],
};

@$core.Deprecated('Use getAllNodeAvaliableDescriptor instead')
const GetAllNodeAvaliable_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'isRecordNode', '3': 1, '4': 1, '5': 8, '10': 'isRecordNode'},
  ],
};

@$core.Deprecated('Use getAllNodeAvaliableDescriptor instead')
const GetAllNodeAvaliable_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'nodes', '3': 1, '4': 3, '5': 11, '6': '.VIVAS.GetAllNodeAvaliable.Node', '10': 'nodes'},
  ],
};

/// Descriptor for `GetAllNodeAvaliable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllNodeAvaliableDescriptor = $convert.base64Decode(
    'ChNHZXRBbGxOb2RlQXZhbGlhYmxlEg8KAklEGOoEIAEoDVICSUQaXQoETm9kZRIbCglub2RlX3'
    'V1aWQYASABKAlSCG5vZGVVdWlkEhsKCWdycGNfaG9zdBgCIAEoCVIIZ3JwY0hvc3QSGwoJZ3Jw'
    'Y19wb3J0GAMgASgNUghncnBjUG9ydBotCgdSZXF1ZXN0EiIKDGlzUmVjb3JkTm9kZRgBIAEoCF'
    'IMaXNSZWNvcmROb2RlGj4KBVJlcGx5EjUKBW5vZGVzGAEgAygLMh8uVklWQVMuR2V0QWxsTm9k'
    'ZUF2YWxpYWJsZS5Ob2RlUgVub2Rlcw==');

@$core.Deprecated('Use startRecordWithTTLDescriptor instead')
const startRecordWithTTL$json = {
  '1': 'startRecordWithTTL',
  '2': [
    {'1': 'ID', '3': 619, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [startRecordWithTTL_Request$json, startRecordWithTTL_Reply$json],
};

@$core.Deprecated('Use startRecordWithTTLDescriptor instead')
const startRecordWithTTL_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'record_id', '3': 2, '4': 1, '5': 12, '10': 'recordId'},
    {'1': 'ttl', '3': 3, '4': 1, '5': 13, '10': 'ttl'},
  ],
};

@$core.Deprecated('Use startRecordWithTTLDescriptor instead')
const startRecordWithTTL_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `startRecordWithTTL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startRecordWithTTLDescriptor = $convert.base64Decode(
    'ChJzdGFydFJlY29yZFdpdGhUVEwSDwoCSUQY6wQgASgNUgJJRBpVCgdSZXF1ZXN0EhsKCWNhbW'
    'VyYV9pZBgBIAEoDFIIY2FtZXJhSWQSGwoJcmVjb3JkX2lkGAIgASgMUghyZWNvcmRJZBIQCgN0'
    'dGwYAyABKA1SA3R0bBoHCgVSZXBseQ==');

@$core.Deprecated('Use stopRecordWithTTLDescriptor instead')
const StopRecordWithTTL$json = {
  '1': 'StopRecordWithTTL',
  '2': [
    {'1': 'ID', '3': 620, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [StopRecordWithTTL_Request$json, StopRecordWithTTL_Reply$json],
};

@$core.Deprecated('Use stopRecordWithTTLDescriptor instead')
const StopRecordWithTTL_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'record_id', '3': 2, '4': 1, '5': 12, '10': 'recordId'},
  ],
};

@$core.Deprecated('Use stopRecordWithTTLDescriptor instead')
const StopRecordWithTTL_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'duration', '3': 2, '4': 1, '5': 13, '10': 'duration'},
  ],
};

/// Descriptor for `StopRecordWithTTL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopRecordWithTTLDescriptor = $convert.base64Decode(
    'ChFTdG9wUmVjb3JkV2l0aFRUTBIPCgJJRBjsBCABKA1SAklEGkMKB1JlcXVlc3QSGwoJY2FtZX'
    'JhX2lkGAEgASgMUghjYW1lcmFJZBIbCglyZWNvcmRfaWQYAiABKAxSCHJlY29yZElkGjcKBVJl'
    'cGx5EhIKBHBhdGgYASABKAlSBHBhdGgSGgoIZHVyYXRpb24YAiABKA1SCGR1cmF0aW9u');

@$core.Deprecated('Use recordTTLDoneDescriptor instead')
const RecordTTLDone$json = {
  '1': 'RecordTTLDone',
  '2': [
    {'1': 'ID', '3': 621, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [RecordTTLDone_Request$json, RecordTTLDone_Reply$json],
};

@$core.Deprecated('Use recordTTLDoneDescriptor instead')
const RecordTTLDone_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'camera_id', '3': 1, '4': 1, '5': 12, '10': 'cameraId'},
    {'1': 'record_id', '3': 2, '4': 1, '5': 12, '10': 'recordId'},
    {'1': 'path', '3': 3, '4': 1, '5': 9, '10': 'path'},
    {'1': 'duration', '3': 4, '4': 1, '5': 13, '10': 'duration'},
  ],
};

@$core.Deprecated('Use recordTTLDoneDescriptor instead')
const RecordTTLDone_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `RecordTTLDone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordTTLDoneDescriptor = $convert.base64Decode(
    'Cg1SZWNvcmRUVExEb25lEg8KAklEGO0EIAEoDVICSUQacwoHUmVxdWVzdBIbCgljYW1lcmFfaW'
    'QYASABKAxSCGNhbWVyYUlkEhsKCXJlY29yZF9pZBgCIAEoDFIIcmVjb3JkSWQSEgoEcGF0aBgD'
    'IAEoCVIEcGF0aBIaCghkdXJhdGlvbhgEIAEoDVIIZHVyYXRpb24aBwoFUmVwbHk=');

@$core.Deprecated('Use pushReplyToSessionDescriptor instead')
const PushReplyToSession$json = {
  '1': 'PushReplyToSession',
  '2': [
    {'1': 'ID', '3': 622, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [PushReplyToSession_Request$json, PushReplyToSession_Reply$json],
};

@$core.Deprecated('Use pushReplyToSessionDescriptor instead')
const PushReplyToSession_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'msg_data', '3': 1, '4': 1, '5': 12, '10': 'msgData'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 12, '10': 'userId'},
    {'1': 'session_id', '3': 3, '4': 1, '5': 12, '10': 'sessionId'},
    {'1': 'box_id', '3': 5, '4': 1, '5': 12, '10': 'boxId'},
    {'1': 'connection_id', '3': 6, '4': 1, '5': 12, '10': 'connectionId'},
    {'1': 'msg_type', '3': 7, '4': 1, '5': 13, '10': 'msgType'},
    {'1': 'msg_id', '3': 8, '4': 1, '5': 4, '10': 'msgId'},
  ],
};

@$core.Deprecated('Use pushReplyToSessionDescriptor instead')
const PushReplyToSession_Reply$json = {
  '1': 'Reply',
};

/// Descriptor for `PushReplyToSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushReplyToSessionDescriptor = $convert.base64Decode(
    'ChJQdXNoUmVwbHlUb1Nlc3Npb24SDwoCSUQY7gQgASgNUgJJRBrKAQoHUmVxdWVzdBIZCghtc2'
    'dfZGF0YRgBIAEoDFIHbXNnRGF0YRIXCgd1c2VyX2lkGAIgASgMUgZ1c2VySWQSHQoKc2Vzc2lv'
    'bl9pZBgDIAEoDFIJc2Vzc2lvbklkEhUKBmJveF9pZBgFIAEoDFIFYm94SWQSIwoNY29ubmVjdG'
    'lvbl9pZBgGIAEoDFIMY29ubmVjdGlvbklkEhkKCG1zZ190eXBlGAcgASgNUgdtc2dUeXBlEhUK'
    'Bm1zZ19pZBgIIAEoBFIFbXNnSWQaBwoFUmVwbHk=');

const $core.Map<$core.String, $core.dynamic> IPCAMServiceBase$json = {
  '1': 'IPCAM',
  '2': [
    {'1': 'SendRequest', '2': '.VIVAS.Request', '3': '.VIVAS.Reply', '4': {}},
  ],
};

@$core.Deprecated('Use iPCAMServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> IPCAMServiceBase$messageJson = {
  '.VIVAS.Request': Request$json,
  '.google.protobuf.Any': $0.Any$json,
  '.VIVAS.Reply': Reply$json,
};

/// Descriptor for `IPCAM`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List iPCAMServiceDescriptor = $convert.base64Decode(
    'CgVJUENBTRItCgtTZW5kUmVxdWVzdBIOLlZJVkFTLlJlcXVlc3QaDC5WSVZBUy5SZXBseSIA');

