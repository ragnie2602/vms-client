// This is a generated file - do not edit.
//
// Generated from comm.profile.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReceiveProfile_Type extends $pb.ProtobufEnum {
  static const ReceiveProfile_Type UPDATE =
      ReceiveProfile_Type._(0, _omitEnumNames ? '' : 'UPDATE');
  static const ReceiveProfile_Type KICK =
      ReceiveProfile_Type._(1, _omitEnumNames ? '' : 'KICK');

  static const $core.List<ReceiveProfile_Type> values = <ReceiveProfile_Type>[
    UPDATE,
    KICK,
  ];

  static final $core.List<ReceiveProfile_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveProfile_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveProfile_Type._(super.value, super.name);
}

class Authenticate_Error extends $pb.ProtobufEnum {
  static const Authenticate_Error ERROR_DEFAULT =
      Authenticate_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Authenticate_Error ACCOUNT_INVALID =
      Authenticate_Error._(1, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const Authenticate_Error PASSWORD_INVALID =
      Authenticate_Error._(2, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const Authenticate_Error PLATFORM_INVALID =
      Authenticate_Error._(3, _omitEnumNames ? '' : 'PLATFORM_INVALID');
  static const Authenticate_Error TOKEN_INVALID =
      Authenticate_Error._(4, _omitEnumNames ? '' : 'TOKEN_INVALID');
  static const Authenticate_Error ACCOUNT_NOT_ACTIVE =
      Authenticate_Error._(5, _omitEnumNames ? '' : 'ACCOUNT_NOT_ACTIVE');
  static const Authenticate_Error LICENSE_EXPIRED =
      Authenticate_Error._(6, _omitEnumNames ? '' : 'LICENSE_EXPIRED');

  static const $core.List<Authenticate_Error> values = <Authenticate_Error>[
    ERROR_DEFAULT,
    ACCOUNT_INVALID,
    PASSWORD_INVALID,
    PLATFORM_INVALID,
    TOKEN_INVALID,
    ACCOUNT_NOT_ACTIVE,
    LICENSE_EXPIRED,
  ];

  static final $core.List<Authenticate_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static Authenticate_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Authenticate_Error._(super.value, super.name);
}

class Login_Error extends $pb.ProtobufEnum {
  static const Login_Error ERROR_DEFAULT =
      Login_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Login_Error SESSION_EXPIRED =
      Login_Error._(1, _omitEnumNames ? '' : 'SESSION_EXPIRED');
  static const Login_Error USER_INVALID =
      Login_Error._(2, _omitEnumNames ? '' : 'USER_INVALID');
  static const Login_Error VERST_IION_API_DEPRECATED =
      Login_Error._(3, _omitEnumNames ? '' : 'VERST_IION_API_DEPRECATED');
  static const Login_Error PROJECT_TARGENVALID =
      Login_Error._(4, _omitEnumNames ? '' : 'PROJECT_TARGENVALID');
  static const Login_Error LICENSE_EXPIRED =
      Login_Error._(6, _omitEnumNames ? '' : 'LICENSE_EXPIRED');

  static const $core.List<Login_Error> values = <Login_Error>[
    ERROR_DEFAULT,
    SESSION_EXPIRED,
    USER_INVALID,
    VERST_IION_API_DEPRECATED,
    PROJECT_TARGENVALID,
    LICENSE_EXPIRED,
  ];

  static final $core.List<Login_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static Login_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Login_Error._(super.value, super.name);
}

class Register_Error extends $pb.ProtobufEnum {
  static const Register_Error ERROR_DEFAULT =
      Register_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Register_Error ACCOUNT_EXIST =
      Register_Error._(1, _omitEnumNames ? '' : 'ACCOUNT_EXIST');
  static const Register_Error OTP_NOT_MATCH =
      Register_Error._(2, _omitEnumNames ? '' : 'OTP_NOT_MATCH');
  static const Register_Error OTP_EXPIRED =
      Register_Error._(3, _omitEnumNames ? '' : 'OTP_EXPIRED');
  static const Register_Error EMAIL_INVALID =
      Register_Error._(4, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const Register_Error TEL_INVALID =
      Register_Error._(5, _omitEnumNames ? '' : 'TEL_INVALID');
  static const Register_Error PASSWORD_INVALID =
      Register_Error._(6, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const Register_Error ACCOUNT_INVALID =
      Register_Error._(7, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const Register_Error PASSWORD_CONTAINING_SPECIAL_CHARACTERS =
      Register_Error._(
          8, _omitEnumNames ? '' : 'PASSWORD_CONTAINING_SPECIAL_CHARACTERS');
  static const Register_Error PASSWORD_WEAKNESS =
      Register_Error._(9, _omitEnumNames ? '' : 'PASSWORD_WEAKNESS');

  static const $core.List<Register_Error> values = <Register_Error>[
    ERROR_DEFAULT,
    ACCOUNT_EXIST,
    OTP_NOT_MATCH,
    OTP_EXPIRED,
    EMAIL_INVALID,
    TEL_INVALID,
    PASSWORD_INVALID,
    ACCOUNT_INVALID,
    PASSWORD_CONTAINING_SPECIAL_CHARACTERS,
    PASSWORD_WEAKNESS,
  ];

  static final $core.List<Register_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static Register_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Register_Error._(super.value, super.name);
}

class ChangePassword_Error extends $pb.ProtobufEnum {
  static const ChangePassword_Error ERROR_DEFAULT =
      ChangePassword_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ChangePassword_Error PASSWORD_INVALID =
      ChangePassword_Error._(1, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const ChangePassword_Error PASSWORD_WEAKNESS =
      ChangePassword_Error._(2, _omitEnumNames ? '' : 'PASSWORD_WEAKNESS');
  static const ChangePassword_Error PASSWORD_NOT_SAME =
      ChangePassword_Error._(3, _omitEnumNames ? '' : 'PASSWORD_NOT_SAME');

  static const $core.List<ChangePassword_Error> values = <ChangePassword_Error>[
    ERROR_DEFAULT,
    PASSWORD_INVALID,
    PASSWORD_WEAKNESS,
    PASSWORD_NOT_SAME,
  ];

  static final $core.List<ChangePassword_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ChangePassword_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChangePassword_Error._(super.value, super.name);
}

class ForgotPassword_Error extends $pb.ProtobufEnum {
  static const ForgotPassword_Error ERROR_DEFAULT =
      ForgotPassword_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ForgotPassword_Error PASSWORD_INVALID =
      ForgotPassword_Error._(1, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const ForgotPassword_Error OTP_NOT_MATCH =
      ForgotPassword_Error._(2, _omitEnumNames ? '' : 'OTP_NOT_MATCH');
  static const ForgotPassword_Error OTP_EXPIRED =
      ForgotPassword_Error._(3, _omitEnumNames ? '' : 'OTP_EXPIRED');
  static const ForgotPassword_Error TEL_INVALID =
      ForgotPassword_Error._(4, _omitEnumNames ? '' : 'TEL_INVALID');
  static const ForgotPassword_Error EMAIL_INVALID =
      ForgotPassword_Error._(5, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const ForgotPassword_Error PASSWORD_OTP_INVALID =
      ForgotPassword_Error._(6, _omitEnumNames ? '' : 'PASSWORD_OTP_INVALID');
  static const ForgotPassword_Error ACCOUNT_INVALID =
      ForgotPassword_Error._(7, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const ForgotPassword_Error PASSWORD_CONTAINING_SPECIAL_CHARACTERS =
      ForgotPassword_Error._(
          8, _omitEnumNames ? '' : 'PASSWORD_CONTAINING_SPECIAL_CHARACTERS');
  static const ForgotPassword_Error PASSWORD_WEAKNESS =
      ForgotPassword_Error._(9, _omitEnumNames ? '' : 'PASSWORD_WEAKNESS');

  static const $core.List<ForgotPassword_Error> values = <ForgotPassword_Error>[
    ERROR_DEFAULT,
    PASSWORD_INVALID,
    OTP_NOT_MATCH,
    OTP_EXPIRED,
    TEL_INVALID,
    EMAIL_INVALID,
    PASSWORD_OTP_INVALID,
    ACCOUNT_INVALID,
    PASSWORD_CONTAINING_SPECIAL_CHARACTERS,
    PASSWORD_WEAKNESS,
  ];

  static final $core.List<ForgotPassword_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static ForgotPassword_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ForgotPassword_Error._(super.value, super.name);
}

class RequestOTP_Error extends $pb.ProtobufEnum {
  static const RequestOTP_Error ERROR_DEFAULT =
      RequestOTP_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RequestOTP_Error TEL_INVALID =
      RequestOTP_Error._(1, _omitEnumNames ? '' : 'TEL_INVALID');
  static const RequestOTP_Error EMAIL_INVALID =
      RequestOTP_Error._(2, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const RequestOTP_Error ALREADY_GET_OTP =
      RequestOTP_Error._(3, _omitEnumNames ? '' : 'ALREADY_GET_OTP');
  static const RequestOTP_Error EXCEEDED_TIMES_GET_OTP =
      RequestOTP_Error._(4, _omitEnumNames ? '' : 'EXCEEDED_TIMES_GET_OTP');
  static const RequestOTP_Error ACCOUNT_INVALID =
      RequestOTP_Error._(5, _omitEnumNames ? '' : 'ACCOUNT_INVALID');

  static const $core.List<RequestOTP_Error> values = <RequestOTP_Error>[
    ERROR_DEFAULT,
    TEL_INVALID,
    EMAIL_INVALID,
    ALREADY_GET_OTP,
    EXCEEDED_TIMES_GET_OTP,
    ACCOUNT_INVALID,
  ];

  static final $core.List<RequestOTP_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static RequestOTP_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RequestOTP_Error._(super.value, super.name);
}

class CheckAccount_State extends $pb.ProtobufEnum {
  static const CheckAccount_State NOT_EXISTED =
      CheckAccount_State._(0, _omitEnumNames ? '' : 'NOT_EXISTED');
  static const CheckAccount_State TEL_EXISTS =
      CheckAccount_State._(1, _omitEnumNames ? '' : 'TEL_EXISTS');
  static const CheckAccount_State EMAIL_EXISTS =
      CheckAccount_State._(2, _omitEnumNames ? '' : 'EMAIL_EXISTS');

  static const $core.List<CheckAccount_State> values = <CheckAccount_State>[
    NOT_EXISTED,
    TEL_EXISTS,
    EMAIL_EXISTS,
  ];

  static final $core.List<CheckAccount_State?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CheckAccount_State? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckAccount_State._(super.value, super.name);
}

class CheckAccount_Error extends $pb.ProtobufEnum {
  static const CheckAccount_Error ERROR_DEFAULT =
      CheckAccount_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const CheckAccount_Error TEL_INVALID =
      CheckAccount_Error._(1, _omitEnumNames ? '' : 'TEL_INVALID');
  static const CheckAccount_Error EMAIL_INVALID =
      CheckAccount_Error._(2, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const CheckAccount_Error TEL_ALREADY_IN_USE =
      CheckAccount_Error._(3, _omitEnumNames ? '' : 'TEL_ALREADY_IN_USE');
  static const CheckAccount_Error EMAIL_ALREADY_IN_USE =
      CheckAccount_Error._(4, _omitEnumNames ? '' : 'EMAIL_ALREADY_IN_USE');
  static const CheckAccount_Error ACCOUNT_INVALID =
      CheckAccount_Error._(5, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const CheckAccount_Error PASSWORD_INVALID =
      CheckAccount_Error._(6, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const CheckAccount_Error PASSWORD_EMPTY =
      CheckAccount_Error._(7, _omitEnumNames ? '' : 'PASSWORD_EMPTY');
  static const CheckAccount_Error PASSWORD_CONTAINING_SPECIAL_CHARACTERS =
      CheckAccount_Error._(
          8, _omitEnumNames ? '' : 'PASSWORD_CONTAINING_SPECIAL_CHARACTERS');
  static const CheckAccount_Error PASSWORD_WEAKNESS =
      CheckAccount_Error._(9, _omitEnumNames ? '' : 'PASSWORD_WEAKNESS');

  static const $core.List<CheckAccount_Error> values = <CheckAccount_Error>[
    ERROR_DEFAULT,
    TEL_INVALID,
    EMAIL_INVALID,
    TEL_ALREADY_IN_USE,
    EMAIL_ALREADY_IN_USE,
    ACCOUNT_INVALID,
    PASSWORD_INVALID,
    PASSWORD_EMPTY,
    PASSWORD_CONTAINING_SPECIAL_CHARACTERS,
    PASSWORD_WEAKNESS,
  ];

  static final $core.List<CheckAccount_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static CheckAccount_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckAccount_Error._(super.value, super.name);
}

class FeedbackUser_Error extends $pb.ProtobufEnum {
  static const FeedbackUser_Error ERROR_DEFAULT =
      FeedbackUser_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const FeedbackUser_Error FEEDBACK_EMPTY =
      FeedbackUser_Error._(1, _omitEnumNames ? '' : 'FEEDBACK_EMPTY');

  static const $core.List<FeedbackUser_Error> values = <FeedbackUser_Error>[
    ERROR_DEFAULT,
    FEEDBACK_EMPTY,
  ];

  static final $core.List<FeedbackUser_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static FeedbackUser_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FeedbackUser_Error._(super.value, super.name);
}

class CheckAccountExists_Error extends $pb.ProtobufEnum {
  static const CheckAccountExists_Error ERROR_DEFAULT =
      CheckAccountExists_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const CheckAccountExists_Error TEL_INVALID =
      CheckAccountExists_Error._(1, _omitEnumNames ? '' : 'TEL_INVALID');
  static const CheckAccountExists_Error EMAIL_INVALID =
      CheckAccountExists_Error._(2, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const CheckAccountExists_Error TEL_NOT_IN_USE =
      CheckAccountExists_Error._(3, _omitEnumNames ? '' : 'TEL_NOT_IN_USE');
  static const CheckAccountExists_Error EMAIL_NOT_IN_USE =
      CheckAccountExists_Error._(4, _omitEnumNames ? '' : 'EMAIL_NOT_IN_USE');
  static const CheckAccountExists_Error ACCOUNT_INVALID =
      CheckAccountExists_Error._(5, _omitEnumNames ? '' : 'ACCOUNT_INVALID');

  static const $core.List<CheckAccountExists_Error> values =
      <CheckAccountExists_Error>[
    ERROR_DEFAULT,
    TEL_INVALID,
    EMAIL_INVALID,
    TEL_NOT_IN_USE,
    EMAIL_NOT_IN_USE,
    ACCOUNT_INVALID,
  ];

  static final $core.List<CheckAccountExists_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static CheckAccountExists_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckAccountExists_Error._(super.value, super.name);
}

class RequestUpdateTelProfile_Error extends $pb.ProtobufEnum {
  static const RequestUpdateTelProfile_Error ERROR_DEFAULT =
      RequestUpdateTelProfile_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RequestUpdateTelProfile_Error PASSWORD_NOT_MATCH =
      RequestUpdateTelProfile_Error._(
          1, _omitEnumNames ? '' : 'PASSWORD_NOT_MATCH');
  static const RequestUpdateTelProfile_Error TEL_INVALID =
      RequestUpdateTelProfile_Error._(2, _omitEnumNames ? '' : 'TEL_INVALID');
  static const RequestUpdateTelProfile_Error TEL_EXIST =
      RequestUpdateTelProfile_Error._(3, _omitEnumNames ? '' : 'TEL_EXIST');
  static const RequestUpdateTelProfile_Error SYN_ERROR =
      RequestUpdateTelProfile_Error._(4, _omitEnumNames ? '' : 'SYN_ERROR');

  static const $core.List<RequestUpdateTelProfile_Error> values =
      <RequestUpdateTelProfile_Error>[
    ERROR_DEFAULT,
    PASSWORD_NOT_MATCH,
    TEL_INVALID,
    TEL_EXIST,
    SYN_ERROR,
  ];

  static final $core.List<RequestUpdateTelProfile_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RequestUpdateTelProfile_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RequestUpdateTelProfile_Error._(super.value, super.name);
}

class UpdateTelProfile_Error extends $pb.ProtobufEnum {
  static const UpdateTelProfile_Error ERROR_DEFAULT =
      UpdateTelProfile_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateTelProfile_Error OTP_EMPTY =
      UpdateTelProfile_Error._(1, _omitEnumNames ? '' : 'OTP_EMPTY');
  static const UpdateTelProfile_Error OTP_NOT_MATCH =
      UpdateTelProfile_Error._(2, _omitEnumNames ? '' : 'OTP_NOT_MATCH');
  static const UpdateTelProfile_Error OPT_EXPIRED =
      UpdateTelProfile_Error._(3, _omitEnumNames ? '' : 'OPT_EXPIRED');
  static const UpdateTelProfile_Error OPT_NOT_FOUND =
      UpdateTelProfile_Error._(4, _omitEnumNames ? '' : 'OPT_NOT_FOUND');
  static const UpdateTelProfile_Error TEL_EXIST =
      UpdateTelProfile_Error._(5, _omitEnumNames ? '' : 'TEL_EXIST');
  static const UpdateTelProfile_Error SYN_ERROR =
      UpdateTelProfile_Error._(6, _omitEnumNames ? '' : 'SYN_ERROR');

  static const $core.List<UpdateTelProfile_Error> values =
      <UpdateTelProfile_Error>[
    ERROR_DEFAULT,
    OTP_EMPTY,
    OTP_NOT_MATCH,
    OPT_EXPIRED,
    OPT_NOT_FOUND,
    TEL_EXIST,
    SYN_ERROR,
  ];

  static final $core.List<UpdateTelProfile_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static UpdateTelProfile_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateTelProfile_Error._(super.value, super.name);
}

class RequestUpdateEmailProfile_Error extends $pb.ProtobufEnum {
  static const RequestUpdateEmailProfile_Error ERROR_DEFAULT =
      RequestUpdateEmailProfile_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RequestUpdateEmailProfile_Error PASSWORD_NOT_MATCH =
      RequestUpdateEmailProfile_Error._(
          1, _omitEnumNames ? '' : 'PASSWORD_NOT_MATCH');
  static const RequestUpdateEmailProfile_Error EMAIL_INVALID =
      RequestUpdateEmailProfile_Error._(
          2, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const RequestUpdateEmailProfile_Error EMAIL_EXIST =
      RequestUpdateEmailProfile_Error._(3, _omitEnumNames ? '' : 'EMAIL_EXIST');
  static const RequestUpdateEmailProfile_Error SYN_ERROR =
      RequestUpdateEmailProfile_Error._(4, _omitEnumNames ? '' : 'SYN_ERROR');

  static const $core.List<RequestUpdateEmailProfile_Error> values =
      <RequestUpdateEmailProfile_Error>[
    ERROR_DEFAULT,
    PASSWORD_NOT_MATCH,
    EMAIL_INVALID,
    EMAIL_EXIST,
    SYN_ERROR,
  ];

  static final $core.List<RequestUpdateEmailProfile_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RequestUpdateEmailProfile_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RequestUpdateEmailProfile_Error._(super.value, super.name);
}

class UpdateEmailProfile_Error extends $pb.ProtobufEnum {
  static const UpdateEmailProfile_Error ERROR_DEFAULT =
      UpdateEmailProfile_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateEmailProfile_Error OTP_EMPTY =
      UpdateEmailProfile_Error._(1, _omitEnumNames ? '' : 'OTP_EMPTY');
  static const UpdateEmailProfile_Error OTP_NOT_MATCH =
      UpdateEmailProfile_Error._(2, _omitEnumNames ? '' : 'OTP_NOT_MATCH');
  static const UpdateEmailProfile_Error OPT_EXPIRED =
      UpdateEmailProfile_Error._(3, _omitEnumNames ? '' : 'OPT_EXPIRED');
  static const UpdateEmailProfile_Error OPT_NOT_FOUND =
      UpdateEmailProfile_Error._(4, _omitEnumNames ? '' : 'OPT_NOT_FOUND');
  static const UpdateEmailProfile_Error EMAIL_EXIST =
      UpdateEmailProfile_Error._(5, _omitEnumNames ? '' : 'EMAIL_EXIST');
  static const UpdateEmailProfile_Error SYN_ERROR =
      UpdateEmailProfile_Error._(6, _omitEnumNames ? '' : 'SYN_ERROR');

  static const $core.List<UpdateEmailProfile_Error> values =
      <UpdateEmailProfile_Error>[
    ERROR_DEFAULT,
    OTP_EMPTY,
    OTP_NOT_MATCH,
    OPT_EXPIRED,
    OPT_NOT_FOUND,
    EMAIL_EXIST,
    SYN_ERROR,
  ];

  static final $core.List<UpdateEmailProfile_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static UpdateEmailProfile_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateEmailProfile_Error._(super.value, super.name);
}

class CloudDefaultSetting_Error extends $pb.ProtobufEnum {
  static const CloudDefaultSetting_Error ERROR_DEFAULT =
      CloudDefaultSetting_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');

  static const $core.List<CloudDefaultSetting_Error> values =
      <CloudDefaultSetting_Error>[
    ERROR_DEFAULT,
  ];

  static final $core.List<CloudDefaultSetting_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static CloudDefaultSetting_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CloudDefaultSetting_Error._(super.value, super.name);
}

class VerifyURL_Error extends $pb.ProtobufEnum {
  static const VerifyURL_Error ERROR_DEFAULT =
      VerifyURL_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const VerifyURL_Error URL_INVALID =
      VerifyURL_Error._(1, _omitEnumNames ? '' : 'URL_INVALID');

  static const $core.List<VerifyURL_Error> values = <VerifyURL_Error>[
    ERROR_DEFAULT,
    URL_INVALID,
  ];

  static final $core.List<VerifyURL_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static VerifyURL_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VerifyURL_Error._(super.value, super.name);
}

class VconnexLogin_Error extends $pb.ProtobufEnum {
  static const VconnexLogin_Error ERROR_DEFAULT =
      VconnexLogin_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const VconnexLogin_Error SESSION_EXPIRED =
      VconnexLogin_Error._(1, _omitEnumNames ? '' : 'SESSION_EXPIRED');
  static const VconnexLogin_Error USER_INVALID =
      VconnexLogin_Error._(2, _omitEnumNames ? '' : 'USER_INVALID');
  static const VconnexLogin_Error VERST_IION_API_DEPRECATED =
      VconnexLogin_Error._(
          3, _omitEnumNames ? '' : 'VERST_IION_API_DEPRECATED');
  static const VconnexLogin_Error PROJECT_TARGENVALID =
      VconnexLogin_Error._(4, _omitEnumNames ? '' : 'PROJECT_TARGENVALID');
  static const VconnexLogin_Error LICENSE_EXPIRED =
      VconnexLogin_Error._(6, _omitEnumNames ? '' : 'LICENSE_EXPIRED');

  static const $core.List<VconnexLogin_Error> values = <VconnexLogin_Error>[
    ERROR_DEFAULT,
    SESSION_EXPIRED,
    USER_INVALID,
    VERST_IION_API_DEPRECATED,
    PROJECT_TARGENVALID,
    LICENSE_EXPIRED,
  ];

  static final $core.List<VconnexLogin_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static VconnexLogin_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VconnexLogin_Error._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
