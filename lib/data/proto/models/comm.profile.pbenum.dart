//
//  Generated code. Do not modify.
//  source: comm.profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReceiveProfile_Type extends $pb.ProtobufEnum {
  static const ReceiveProfile_Type UPDATE = ReceiveProfile_Type._(0, _omitEnumNames ? '' : 'UPDATE');
  static const ReceiveProfile_Type KICK = ReceiveProfile_Type._(1, _omitEnumNames ? '' : 'KICK');

  static const $core.List<ReceiveProfile_Type> values = <ReceiveProfile_Type> [
    UPDATE,
    KICK,
  ];

  static final $core.Map<$core.int, ReceiveProfile_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReceiveProfile_Type? valueOf($core.int value) => _byValue[value];

  const ReceiveProfile_Type._($core.int v, $core.String n) : super(v, n);
}

class Authenticate_Error extends $pb.ProtobufEnum {
  static const Authenticate_Error ERROR_DEFAULT = Authenticate_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Authenticate_Error ACCOUNT_INVALID = Authenticate_Error._(1, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const Authenticate_Error PASSWORD_INVALID = Authenticate_Error._(2, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const Authenticate_Error PLATFORM_INVALID = Authenticate_Error._(3, _omitEnumNames ? '' : 'PLATFORM_INVALID');
  static const Authenticate_Error TOKEN_INVALID = Authenticate_Error._(4, _omitEnumNames ? '' : 'TOKEN_INVALID');
  static const Authenticate_Error ACCOUNT_NOT_ACTIVE = Authenticate_Error._(5, _omitEnumNames ? '' : 'ACCOUNT_NOT_ACTIVE');
  static const Authenticate_Error LICENSE_EXPIRED = Authenticate_Error._(6, _omitEnumNames ? '' : 'LICENSE_EXPIRED');

  static const $core.List<Authenticate_Error> values = <Authenticate_Error> [
    ERROR_DEFAULT,
    ACCOUNT_INVALID,
    PASSWORD_INVALID,
    PLATFORM_INVALID,
    TOKEN_INVALID,
    ACCOUNT_NOT_ACTIVE,
    LICENSE_EXPIRED,
  ];

  static final $core.Map<$core.int, Authenticate_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Authenticate_Error? valueOf($core.int value) => _byValue[value];

  const Authenticate_Error._($core.int v, $core.String n) : super(v, n);
}

class Login_Error extends $pb.ProtobufEnum {
  static const Login_Error ERROR_DEFAULT = Login_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Login_Error SESSION_EXPIRED = Login_Error._(1, _omitEnumNames ? '' : 'SESSION_EXPIRED');
  static const Login_Error USER_INVALID = Login_Error._(2, _omitEnumNames ? '' : 'USER_INVALID');
  static const Login_Error VERST_IION_API_DEPRECATED = Login_Error._(3, _omitEnumNames ? '' : 'VERST_IION_API_DEPRECATED');
  static const Login_Error PROJECT_TARGENVALID = Login_Error._(4, _omitEnumNames ? '' : 'PROJECT_TARGENVALID');
  static const Login_Error LICENSE_EXPIRED = Login_Error._(6, _omitEnumNames ? '' : 'LICENSE_EXPIRED');

  static const $core.List<Login_Error> values = <Login_Error> [
    ERROR_DEFAULT,
    SESSION_EXPIRED,
    USER_INVALID,
    VERST_IION_API_DEPRECATED,
    PROJECT_TARGENVALID,
    LICENSE_EXPIRED,
  ];

  static final $core.Map<$core.int, Login_Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Login_Error? valueOf($core.int value) => _byValue[value];

  const Login_Error._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
