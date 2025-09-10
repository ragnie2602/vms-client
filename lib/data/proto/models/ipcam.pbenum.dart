// This is a generated file - do not edit.
//
// Generated from ipcam.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResultType extends $pb.ProtobufEnum {
  static const ResultType OK = ResultType._(0, _omitEnumNames ? '' : 'OK');
  static const ResultType REQUEST_INVALID =
      ResultType._(1000, _omitEnumNames ? '' : 'REQUEST_INVALID');
  static const ResultType SESSION_INVALID =
      ResultType._(1001, _omitEnumNames ? '' : 'SESSION_INVALID');
  static const ResultType SESSION_EXPIRE =
      ResultType._(1002, _omitEnumNames ? '' : 'SESSION_EXPIRE');
  static const ResultType SIZE_LIMITED =
      ResultType._(1003, _omitEnumNames ? '' : 'SIZE_LIMITED');
  static const ResultType DB_ERROR =
      ResultType._(1004, _omitEnumNames ? '' : 'DB_ERROR');
  static const ResultType NO_CHANGED =
      ResultType._(1005, _omitEnumNames ? '' : 'NO_CHANGED');
  static const ResultType NETWORK_ERROR =
      ResultType._(1006, _omitEnumNames ? '' : 'NETWORK_ERROR');
  static const ResultType DATA_ERROR =
      ResultType._(1007, _omitEnumNames ? '' : 'DATA_ERROR');

  static const $core.List<ResultType> values = <ResultType>[
    OK,
    REQUEST_INVALID,
    SESSION_INVALID,
    SESSION_EXPIRE,
    SIZE_LIMITED,
    DB_ERROR,
    NO_CHANGED,
    NETWORK_ERROR,
    DATA_ERROR,
  ];

  static final $core.Map<$core.int, ResultType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResultType? valueOf($core.int value) => _byValue[value];

  const ResultType._(super.value, super.name);
}

class KeepAlive_AppType extends $pb.ProtobufEnum {
  static const KeepAlive_AppType VMS =
      KeepAlive_AppType._(0, _omitEnumNames ? '' : 'VMS');
  static const KeepAlive_AppType RECORD =
      KeepAlive_AppType._(1, _omitEnumNames ? '' : 'RECORD');
  static const KeepAlive_AppType HOMEVISON_CLIENT =
      KeepAlive_AppType._(2, _omitEnumNames ? '' : 'HOMEVISON_CLIENT');

  static const $core.List<KeepAlive_AppType> values = <KeepAlive_AppType>[
    VMS,
    RECORD,
    HOMEVISON_CLIENT,
  ];

  static final $core.List<KeepAlive_AppType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static KeepAlive_AppType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KeepAlive_AppType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
