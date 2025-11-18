//
//  Generated code. Do not modify.
//  source: comm.vsv.1.2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listTagDescriptor instead')
const ListTag$json = {
  '1': 'ListTag',
  '2': [
    {'1': 'ID', '3': 2000, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ListTag_Request$json, ListTag_Reply$json],
};

@$core.Deprecated('Use listTagDescriptor instead')
const ListTag_Request$json = {
  '1': 'Request',
};

@$core.Deprecated('Use listTagDescriptor instead')
const ListTag_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.comm.CamTag', '10': 'tags'},
  ],
};

/// Descriptor for `ListTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTagDescriptor = $convert.base64Decode(
    'CgdMaXN0VGFnEg8KAklEGNAPIAEoDVICSUQaCQoHUmVxdWVzdBopCgVSZXBseRIgCgR0YWdzGA'
    'EgAygLMgwuY29tbS5DYW1UYWdSBHRhZ3M=');

@$core.Deprecated('Use addTagDescriptor instead')
const AddTag$json = {
  '1': 'AddTag',
  '2': [
    {'1': 'ID', '3': 2001, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [AddTag_Request$json, AddTag_Reply$json],
  '4': [AddTag_Error$json],
};

@$core.Deprecated('Use addTagDescriptor instead')
const AddTag_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.comm.CamTag', '10': 'tag'},
  ],
};

@$core.Deprecated('Use addTagDescriptor instead')
const AddTag_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.comm.CamTag', '10': 'tag'},
  ],
};

@$core.Deprecated('Use addTagDescriptor instead')
const AddTag_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'TAG_NAME_EMPTY', '2': 1},
    {'1': 'TAG_NAME_INVALID', '2': 2},
    {'1': 'TAG_NAME_EXIST', '2': 3},
    {'1': 'PERMISSION_DENIED', '2': 5},
  ],
};

/// Descriptor for `AddTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTagDescriptor = $convert.base64Decode(
    'CgZBZGRUYWcSDwoCSUQY0Q8gASgNUgJJRBopCgdSZXF1ZXN0Eh4KA3RhZxgBIAEoCzIMLmNvbW'
    '0uQ2FtVGFnUgN0YWcaJwoFUmVwbHkSHgoDdGFnGAEgASgLMgwuY29tbS5DYW1UYWdSA3RhZyJv'
    'CgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASEgoOVEFHX05BTUVfRU1QVFkQARIUChBUQUdfTk'
    'FNRV9JTlZBTElEEAISEgoOVEFHX05BTUVfRVhJU1QQAxIVChFQRVJNSVNTSU9OX0RFTklFRBAF');

@$core.Deprecated('Use delTagDescriptor instead')
const DelTag$json = {
  '1': 'DelTag',
  '2': [
    {'1': 'ID', '3': 2002, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [DelTag_Request$json, DelTag_Reply$json],
  '4': [DelTag_Error$json],
};

@$core.Deprecated('Use delTagDescriptor instead')
const DelTag_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 12, '10': 'tagId'},
  ],
};

@$core.Deprecated('Use delTagDescriptor instead')
const DelTag_Reply$json = {
  '1': 'Reply',
};

@$core.Deprecated('Use delTagDescriptor instead')
const DelTag_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'PERMISSION_DENIED', '2': 1},
    {'1': 'TAG_ID_INVALID', '2': 2},
  ],
};

/// Descriptor for `DelTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delTagDescriptor = $convert.base64Decode(
    'CgZEZWxUYWcSDwoCSUQY0g8gASgNUgJJRBogCgdSZXF1ZXN0EhUKBnRhZ19pZBgBIAEoDFIFdG'
    'FnSWQaBwoFUmVwbHkiRQoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhUKEVBFUk1JU1NJT05f'
    'REVOSUVEEAESEgoOVEFHX0lEX0lOVkFMSUQQAg==');

@$core.Deprecated('Use updateTagDescriptor instead')
const UpdateTag$json = {
  '1': 'UpdateTag',
  '2': [
    {'1': 'ID', '3': 2003, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [UpdateTag_Request$json, UpdateTag_Reply$json],
  '4': [UpdateTag_Error$json],
};

@$core.Deprecated('Use updateTagDescriptor instead')
const UpdateTag_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.comm.CamTag', '10': 'tag'},
  ],
};

@$core.Deprecated('Use updateTagDescriptor instead')
const UpdateTag_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.comm.CamTag', '10': 'tag'},
  ],
};

@$core.Deprecated('Use updateTagDescriptor instead')
const UpdateTag_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'TAG_NAME_EMPTY', '2': 1},
    {'1': 'TAG_NAME_INVALID', '2': 2},
    {'1': 'TAG_NAME_EXIST', '2': 3},
    {'1': 'PERMISSION_DENIED', '2': 5},
    {'1': 'TAG_ID_INVALID', '2': 6},
  ],
};

/// Descriptor for `UpdateTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTagDescriptor = $convert.base64Decode(
    'CglVcGRhdGVUYWcSDwoCSUQY0w8gASgNUgJJRBopCgdSZXF1ZXN0Eh4KA3RhZxgBIAEoCzIMLm'
    'NvbW0uQ2FtVGFnUgN0YWcaJwoFUmVwbHkSHgoDdGFnGAEgASgLMgwuY29tbS5DYW1UYWdSA3Rh'
    'ZyKDAQoFRXJyb3ISEQoNRVJST1JfREVGQVVMVBAAEhIKDlRBR19OQU1FX0VNUFRZEAESFAoQVE'
    'FHX05BTUVfSU5WQUxJRBACEhIKDlRBR19OQU1FX0VYSVNUEAMSFQoRUEVSTUlTU0lPTl9ERU5J'
    'RUQQBRISCg5UQUdfSURfSU5WQUxJRBAG');

@$core.Deprecated('Use importCameraDescriptor instead')
const ImportCamera$json = {
  '1': 'ImportCamera',
  '2': [
    {'1': 'ID', '3': 2005, '4': 1, '5': 13, '10': 'ID'},
  ],
  '3': [ImportCamera_ImportCell$json, ImportCamera_Request$json, ImportCamera_Reply$json],
  '4': [ImportCamera_Error$json],
};

@$core.Deprecated('Use importCameraDescriptor instead')
const ImportCamera_ImportCell$json = {
  '1': 'ImportCell',
  '2': [
    {'1': 'index_numer', '3': 1, '4': 1, '5': 13, '10': 'indexNumer'},
    {'1': 'camera_type', '3': 2, '4': 1, '5': 14, '6': '.comm.CameraType', '10': 'cameraType'},
    {'1': 'camera_name', '3': 3, '4': 1, '5': 9, '10': 'cameraName'},
    {'1': 'onvif_xaadr', '3': 4, '4': 1, '5': 9, '10': 'onvifXaadr'},
    {'1': 'user_name', '3': 5, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
    {'1': 'main_stream', '3': 7, '4': 1, '5': 9, '10': 'mainStream'},
    {'1': 'sub_stream', '3': 8, '4': 1, '5': 9, '10': 'subStream'},
    {'1': 'error', '3': 9, '4': 1, '5': 13, '10': 'error'},
  ],
};

@$core.Deprecated('Use importCameraDescriptor instead')
const ImportCamera_Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'cameras', '3': 1, '4': 3, '5': 11, '6': '.comm.ImportCamera.ImportCell', '10': 'cameras'},
  ],
};

@$core.Deprecated('Use importCameraDescriptor instead')
const ImportCamera_Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'caneras', '3': 1, '4': 3, '5': 11, '6': '.comm.Camera', '10': 'caneras'},
    {'1': 'camera_error', '3': 2, '4': 3, '5': 11, '6': '.comm.ImportCamera.ImportCell', '10': 'cameraError'},
  ],
};

@$core.Deprecated('Use importCameraDescriptor instead')
const ImportCamera_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'ERROR_DEFAULT', '2': 0},
    {'1': 'MAIN_STREAM_INVALID', '2': 1},
    {'1': 'ONVIF_XADR_INVALID', '2': 2},
    {'1': 'CAMERA_NAME_INVALID', '2': 3},
    {'1': 'CAMERA_NAME_EXIST', '2': 4},
    {'1': 'MAIN_STREAM_EXIST', '2': 5},
    {'1': 'INVALID_CAMERA_TYPE', '2': 6},
  ],
};

/// Descriptor for `ImportCamera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List importCameraDescriptor = $convert.base64Decode(
    'CgxJbXBvcnRDYW1lcmESDwoCSUQY1Q8gASgNUgJJRBqxAgoKSW1wb3J0Q2VsbBIfCgtpbmRleF'
    '9udW1lchgBIAEoDVIKaW5kZXhOdW1lchIxCgtjYW1lcmFfdHlwZRgCIAEoDjIQLmNvbW0uQ2Ft'
    'ZXJhVHlwZVIKY2FtZXJhVHlwZRIfCgtjYW1lcmFfbmFtZRgDIAEoCVIKY2FtZXJhTmFtZRIfCg'
    'tvbnZpZl94YWFkchgEIAEoCVIKb252aWZYYWFkchIbCgl1c2VyX25hbWUYBSABKAlSCHVzZXJO'
    'YW1lEhoKCHBhc3N3b3JkGAYgASgJUghwYXNzd29yZBIfCgttYWluX3N0cmVhbRgHIAEoCVIKbW'
    'FpblN0cmVhbRIdCgpzdWJfc3RyZWFtGAggASgJUglzdWJTdHJlYW0SFAoFZXJyb3IYCSABKA1S'
    'BWVycm9yGkIKB1JlcXVlc3QSNwoHY2FtZXJhcxgBIAMoCzIdLmNvbW0uSW1wb3J0Q2FtZXJhLk'
    'ltcG9ydENlbGxSB2NhbWVyYXMacQoFUmVwbHkSJgoHY2FuZXJhcxgBIAMoCzIMLmNvbW0uQ2Ft'
    'ZXJhUgdjYW5lcmFzEkAKDGNhbWVyYV9lcnJvchgCIAMoCzIdLmNvbW0uSW1wb3J0Q2FtZXJhLk'
    'ltcG9ydENlbGxSC2NhbWVyYUVycm9yIqsBCgVFcnJvchIRCg1FUlJPUl9ERUZBVUxUEAASFwoT'
    'TUFJTl9TVFJFQU1fSU5WQUxJRBABEhYKEk9OVklGX1hBRFJfSU5WQUxJRBACEhcKE0NBTUVSQV'
    '9OQU1FX0lOVkFMSUQQAxIVChFDQU1FUkFfTkFNRV9FWElTVBAEEhUKEU1BSU5fU1RSRUFNX0VY'
    'SVNUEAUSFwoTSU5WQUxJRF9DQU1FUkFfVFlQRRAG');

