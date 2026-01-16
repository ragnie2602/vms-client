//
//  Generated code. Do not modify.
//  source: ipcam.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResultType extends $pb.ProtobufEnum {
  static const ResultType OK = ResultType._(0, _omitEnumNames ? '' : 'OK');
  static const ResultType REQUEST_INVALID = ResultType._(1000, _omitEnumNames ? '' : 'REQUEST_INVALID');
  static const ResultType SESSION_INVALID = ResultType._(1001, _omitEnumNames ? '' : 'SESSION_INVALID');
  static const ResultType SESSION_EXPIRE = ResultType._(1002, _omitEnumNames ? '' : 'SESSION_EXPIRE');
  static const ResultType SIZE_LIMITED = ResultType._(1003, _omitEnumNames ? '' : 'SIZE_LIMITED');
  static const ResultType DB_ERROR = ResultType._(1004, _omitEnumNames ? '' : 'DB_ERROR');
  static const ResultType NO_CHANGED = ResultType._(1005, _omitEnumNames ? '' : 'NO_CHANGED');
  static const ResultType NETWORK_ERROR = ResultType._(1006, _omitEnumNames ? '' : 'NETWORK_ERROR');
  static const ResultType DATA_ERROR = ResultType._(1007, _omitEnumNames ? '' : 'DATA_ERROR');
  static const ResultType INTERNAL_ERROR_500 = ResultType._(1008, _omitEnumNames ? '' : 'INTERNAL_ERROR_500');
  static const ResultType PERMISSION_DENIED_401 = ResultType._(1009, _omitEnumNames ? '' : 'PERMISSION_DENIED_401');

  static const $core.List<ResultType> values = <ResultType> [
    OK,
    REQUEST_INVALID,
    SESSION_INVALID,
    SESSION_EXPIRE,
    SIZE_LIMITED,
    DB_ERROR,
    NO_CHANGED,
    NETWORK_ERROR,
    DATA_ERROR,
    INTERNAL_ERROR_500,
    PERMISSION_DENIED_401,
  ];

  static final $core.Map<$core.int, ResultType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResultType? valueOf($core.int value) => _byValue[value];

  const ResultType._($core.int v, $core.String n) : super(v, n);
}

class KeepAlive_AppType extends $pb.ProtobufEnum {
  static const KeepAlive_AppType VMS = KeepAlive_AppType._(0, _omitEnumNames ? '' : 'VMS');
  static const KeepAlive_AppType RECORD = KeepAlive_AppType._(1, _omitEnumNames ? '' : 'RECORD');
  static const KeepAlive_AppType HOMEVISON_CLIENT = KeepAlive_AppType._(2, _omitEnumNames ? '' : 'HOMEVISON_CLIENT');

  static const $core.List<KeepAlive_AppType> values = <KeepAlive_AppType> [
    VMS,
    RECORD,
    HOMEVISON_CLIENT,
  ];

  static final $core.Map<$core.int, KeepAlive_AppType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static KeepAlive_AppType? valueOf($core.int value) => _byValue[value];

  const KeepAlive_AppType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
