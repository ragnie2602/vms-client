//
//  Generated code. Do not modify.
//  source: comm.vsv.1.2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AddTag_Error extends $pb.ProtobufEnum {
  static const AddTag_Error ERROR_DEFAULT = AddTag_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddTag_Error TAG_NAME_EMPTY = AddTag_Error._(1, _omitEnumNames ? '' : 'TAG_NAME_EMPTY');
  static const AddTag_Error TAG_NAME_INVALID = AddTag_Error._(2, _omitEnumNames ? '' : 'TAG_NAME_INVALID');
  static const AddTag_Error TAG_NAME_EXIST = AddTag_Error._(3, _omitEnumNames ? '' : 'TAG_NAME_EXIST');
  static const AddTag_Error PERMISSION_DENIED = AddTag_Error._(5, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<AddTag_Error> values = <AddTag_Error> [
    ERROR_DEFAULT,
    TAG_NAME_EMPTY,
    TAG_NAME_INVALID,
    TAG_NAME_EXIST,
    PERMISSION_DENIED,
  ];

  static final $core.Map<$core.int, AddTag_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AddTag_Error? valueOf($core.int value) => _byValue[value];

  const AddTag_Error._($core.int v, $core.String n) : super(v, n);
}

class DelTag_Error extends $pb.ProtobufEnum {
  static const DelTag_Error ERROR_DEFAULT = DelTag_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const DelTag_Error PERMISSION_DENIED = DelTag_Error._(1, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const DelTag_Error TAG_ID_INVALID = DelTag_Error._(2, _omitEnumNames ? '' : 'TAG_ID_INVALID');

  static const $core.List<DelTag_Error> values = <DelTag_Error> [
    ERROR_DEFAULT,
    PERMISSION_DENIED,
    TAG_ID_INVALID,
  ];

  static final $core.Map<$core.int, DelTag_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DelTag_Error? valueOf($core.int value) => _byValue[value];

  const DelTag_Error._($core.int v, $core.String n) : super(v, n);
}

class UpdateTag_Error extends $pb.ProtobufEnum {
  static const UpdateTag_Error ERROR_DEFAULT = UpdateTag_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateTag_Error TAG_NAME_EMPTY = UpdateTag_Error._(1, _omitEnumNames ? '' : 'TAG_NAME_EMPTY');
  static const UpdateTag_Error TAG_NAME_INVALID = UpdateTag_Error._(2, _omitEnumNames ? '' : 'TAG_NAME_INVALID');
  static const UpdateTag_Error TAG_NAME_EXIST = UpdateTag_Error._(3, _omitEnumNames ? '' : 'TAG_NAME_EXIST');
  static const UpdateTag_Error PERMISSION_DENIED = UpdateTag_Error._(5, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const UpdateTag_Error TAG_ID_INVALID = UpdateTag_Error._(6, _omitEnumNames ? '' : 'TAG_ID_INVALID');

  static const $core.List<UpdateTag_Error> values = <UpdateTag_Error> [
    ERROR_DEFAULT,
    TAG_NAME_EMPTY,
    TAG_NAME_INVALID,
    TAG_NAME_EXIST,
    PERMISSION_DENIED,
    TAG_ID_INVALID,
  ];

  static final $core.Map<$core.int, UpdateTag_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UpdateTag_Error? valueOf($core.int value) => _byValue[value];

  const UpdateTag_Error._($core.int v, $core.String n) : super(v, n);
}

class ImportCamera_Error extends $pb.ProtobufEnum {
  static const ImportCamera_Error ERROR_DEFAULT = ImportCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ImportCamera_Error MAIN_STREAM_INVALID = ImportCamera_Error._(1, _omitEnumNames ? '' : 'MAIN_STREAM_INVALID');
  static const ImportCamera_Error ONVIF_XADR_INVALID = ImportCamera_Error._(2, _omitEnumNames ? '' : 'ONVIF_XADR_INVALID');
  static const ImportCamera_Error CAMERA_NAME_INVALID = ImportCamera_Error._(3, _omitEnumNames ? '' : 'CAMERA_NAME_INVALID');
  static const ImportCamera_Error CAMERA_NAME_EXIST = ImportCamera_Error._(4, _omitEnumNames ? '' : 'CAMERA_NAME_EXIST');
  static const ImportCamera_Error MAIN_STREAM_EXIST = ImportCamera_Error._(5, _omitEnumNames ? '' : 'MAIN_STREAM_EXIST');
  static const ImportCamera_Error INVALID_CAMERA_TYPE = ImportCamera_Error._(6, _omitEnumNames ? '' : 'INVALID_CAMERA_TYPE');

  static const $core.List<ImportCamera_Error> values = <ImportCamera_Error> [
    ERROR_DEFAULT,
    MAIN_STREAM_INVALID,
    ONVIF_XADR_INVALID,
    CAMERA_NAME_INVALID,
    CAMERA_NAME_EXIST,
    MAIN_STREAM_EXIST,
    INVALID_CAMERA_TYPE,
  ];

  static final $core.Map<$core.int, ImportCamera_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ImportCamera_Error? valueOf($core.int value) => _byValue[value];

  const ImportCamera_Error._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
