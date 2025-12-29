//
//  Generated code. Do not modify.
//  source: comm.vsv.1.3.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetSettingAvaliable_Error extends $pb.ProtobufEnum {
  static const GetSettingAvaliable_Error ERROR_DEFAULT = GetSettingAvaliable_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const GetSettingAvaliable_Error CAMERA_ID_INVALID = GetSettingAvaliable_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const GetSettingAvaliable_Error CAMERA_NOT_EXIST = GetSettingAvaliable_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_EXIST');
  static const GetSettingAvaliable_Error CAMERA_NOT_SUPPORT = GetSettingAvaliable_Error._(3, _omitEnumNames ? '' : 'CAMERA_NOT_SUPPORT');

  static const $core.List<GetSettingAvaliable_Error> values = <GetSettingAvaliable_Error> [
    ERROR_DEFAULT,
    CAMERA_ID_INVALID,
    CAMERA_NOT_EXIST,
    CAMERA_NOT_SUPPORT,
  ];

  static final $core.Map<$core.int, GetSettingAvaliable_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetSettingAvaliable_Error? valueOf($core.int value) => _byValue[value];

  const GetSettingAvaliable_Error._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
