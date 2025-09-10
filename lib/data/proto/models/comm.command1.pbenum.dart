// This is a generated file - do not edit.
//
// Generated from comm.command1.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReceiveAddCamera_Status extends $pb.ProtobufEnum {
  static const ReceiveAddCamera_Status SUCCESS =
      ReceiveAddCamera_Status._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const ReceiveAddCamera_Status FAILED =
      ReceiveAddCamera_Status._(1, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<ReceiveAddCamera_Status> values =
      <ReceiveAddCamera_Status>[
    SUCCESS,
    FAILED,
  ];

  static final $core.List<ReceiveAddCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveAddCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveAddCamera_Status._(super.value, super.name);
}

class ReceiveNotificationCamera_Status extends $pb.ProtobufEnum {
  static const ReceiveNotificationCamera_Status SUCCESS =
      ReceiveNotificationCamera_Status._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const ReceiveNotificationCamera_Status FAILED =
      ReceiveNotificationCamera_Status._(1, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<ReceiveNotificationCamera_Status> values =
      <ReceiveNotificationCamera_Status>[
    SUCCESS,
    FAILED,
  ];

  static final $core.List<ReceiveNotificationCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveNotificationCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveNotificationCamera_Status._(super.value, super.name);
}

class ReceiveNotificationCamera_Type extends $pb.ProtobufEnum {
  static const ReceiveNotificationCamera_Type MOTION_DETECTION =
      ReceiveNotificationCamera_Type._(
          0, _omitEnumNames ? '' : 'MOTION_DETECTION');
  static const ReceiveNotificationCamera_Type CAMERA_OFFLINE =
      ReceiveNotificationCamera_Type._(
          1, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const ReceiveNotificationCamera_Type STATUS_STORAGE_SDCARD =
      ReceiveNotificationCamera_Type._(
          2, _omitEnumNames ? '' : 'STATUS_STORAGE_SDCARD');
  static const ReceiveNotificationCamera_Type UPDATE_FIRMWARE =
      ReceiveNotificationCamera_Type._(
          3, _omitEnumNames ? '' : 'UPDATE_FIRMWARE');
  static const ReceiveNotificationCamera_Type SOUND_DETECTION =
      ReceiveNotificationCamera_Type._(
          4, _omitEnumNames ? '' : 'SOUND_DETECTION');
  static const ReceiveNotificationCamera_Type LINE_CROSSING =
      ReceiveNotificationCamera_Type._(
          5, _omitEnumNames ? '' : 'LINE_CROSSING');
  static const ReceiveNotificationCamera_Type INTRUSION_DETECTION =
      ReceiveNotificationCamera_Type._(
          6, _omitEnumNames ? '' : 'INTRUSION_DETECTION');
  static const ReceiveNotificationCamera_Type CAMERA_ONLINE =
      ReceiveNotificationCamera_Type._(
          7, _omitEnumNames ? '' : 'CAMERA_ONLINE');

  static const $core.List<ReceiveNotificationCamera_Type> values =
      <ReceiveNotificationCamera_Type>[
    MOTION_DETECTION,
    CAMERA_OFFLINE,
    STATUS_STORAGE_SDCARD,
    UPDATE_FIRMWARE,
    SOUND_DETECTION,
    LINE_CROSSING,
    INTRUSION_DETECTION,
    CAMERA_ONLINE,
  ];

  static final $core.List<ReceiveNotificationCamera_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static ReceiveNotificationCamera_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveNotificationCamera_Type._(super.value, super.name);
}

class ReceiveNotificationCamera_Form extends $pb.ProtobufEnum {
  static const ReceiveNotificationCamera_Form SD_CARD =
      ReceiveNotificationCamera_Form._(0, _omitEnumNames ? '' : 'SD_CARD');
  static const ReceiveNotificationCamera_Form CLOUD =
      ReceiveNotificationCamera_Form._(1, _omitEnumNames ? '' : 'CLOUD');

  static const $core.List<ReceiveNotificationCamera_Form> values =
      <ReceiveNotificationCamera_Form>[
    SD_CARD,
    CLOUD,
  ];

  static final $core.List<ReceiveNotificationCamera_Form?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveNotificationCamera_Form? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveNotificationCamera_Form._(super.value, super.name);
}

class ReceiveScheduleCamera_Status extends $pb.ProtobufEnum {
  static const ReceiveScheduleCamera_Status SUCCESS =
      ReceiveScheduleCamera_Status._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const ReceiveScheduleCamera_Status FAILED =
      ReceiveScheduleCamera_Status._(1, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<ReceiveScheduleCamera_Status> values =
      <ReceiveScheduleCamera_Status>[
    SUCCESS,
    FAILED,
  ];

  static final $core.List<ReceiveScheduleCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveScheduleCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveScheduleCamera_Status._(super.value, super.name);
}

class ReceiveTimeShiftCamera_Status extends $pb.ProtobufEnum {
  static const ReceiveTimeShiftCamera_Status SUCCESS =
      ReceiveTimeShiftCamera_Status._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const ReceiveTimeShiftCamera_Status FAILED =
      ReceiveTimeShiftCamera_Status._(1, _omitEnumNames ? '' : 'FAILED');
  static const ReceiveTimeShiftCamera_Status SD_CARD_NOT_FOUND =
      ReceiveTimeShiftCamera_Status._(
          2, _omitEnumNames ? '' : 'SD_CARD_NOT_FOUND');

  static const $core.List<ReceiveTimeShiftCamera_Status> values =
      <ReceiveTimeShiftCamera_Status>[
    SUCCESS,
    FAILED,
    SD_CARD_NOT_FOUND,
  ];

  static final $core.List<ReceiveTimeShiftCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ReceiveTimeShiftCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveTimeShiftCamera_Status._(super.value, super.name);
}

class ReceiveShareCamera_Role extends $pb.ProtobufEnum {
  static const ReceiveShareCamera_Role VIEW =
      ReceiveShareCamera_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const ReceiveShareCamera_Role FULL =
      ReceiveShareCamera_Role._(1, _omitEnumNames ? '' : 'FULL');

  static const $core.List<ReceiveShareCamera_Role> values =
      <ReceiveShareCamera_Role>[
    VIEW,
    FULL,
  ];

  static final $core.List<ReceiveShareCamera_Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveShareCamera_Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveShareCamera_Role._(super.value, super.name);
}

class ReceiveResponseShareCamera_Action extends $pb.ProtobufEnum {
  static const ReceiveResponseShareCamera_Action ACCEPT =
      ReceiveResponseShareCamera_Action._(0, _omitEnumNames ? '' : 'ACCEPT');
  static const ReceiveResponseShareCamera_Action DECLINE =
      ReceiveResponseShareCamera_Action._(1, _omitEnumNames ? '' : 'DECLINE');

  static const $core.List<ReceiveResponseShareCamera_Action> values =
      <ReceiveResponseShareCamera_Action>[
    ACCEPT,
    DECLINE,
  ];

  static final $core.List<ReceiveResponseShareCamera_Action?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveResponseShareCamera_Action? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveResponseShareCamera_Action._(super.value, super.name);
}

class ReceiveOnOffCamera_Status extends $pb.ProtobufEnum {
  static const ReceiveOnOffCamera_Status OFF =
      ReceiveOnOffCamera_Status._(0, _omitEnumNames ? '' : 'OFF');
  static const ReceiveOnOffCamera_Status ON =
      ReceiveOnOffCamera_Status._(1, _omitEnumNames ? '' : 'ON');

  static const $core.List<ReceiveOnOffCamera_Status> values =
      <ReceiveOnOffCamera_Status>[
    OFF,
    ON,
  ];

  static final $core.List<ReceiveOnOffCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveOnOffCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveOnOffCamera_Status._(super.value, super.name);
}

class ReceiveUpdateRoleShare_Role extends $pb.ProtobufEnum {
  static const ReceiveUpdateRoleShare_Role VIEW =
      ReceiveUpdateRoleShare_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const ReceiveUpdateRoleShare_Role FULL =
      ReceiveUpdateRoleShare_Role._(1, _omitEnumNames ? '' : 'FULL');

  static const $core.List<ReceiveUpdateRoleShare_Role> values =
      <ReceiveUpdateRoleShare_Role>[
    VIEW,
    FULL,
  ];

  static final $core.List<ReceiveUpdateRoleShare_Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveUpdateRoleShare_Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveUpdateRoleShare_Role._(super.value, super.name);
}

class ReceiveUpdateRoleCamera_Role extends $pb.ProtobufEnum {
  static const ReceiveUpdateRoleCamera_Role VIEW =
      ReceiveUpdateRoleCamera_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const ReceiveUpdateRoleCamera_Role FULL =
      ReceiveUpdateRoleCamera_Role._(1, _omitEnumNames ? '' : 'FULL');

  static const $core.List<ReceiveUpdateRoleCamera_Role> values =
      <ReceiveUpdateRoleCamera_Role>[
    VIEW,
    FULL,
  ];

  static final $core.List<ReceiveUpdateRoleCamera_Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveUpdateRoleCamera_Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveUpdateRoleCamera_Role._(super.value, super.name);
}

class AddCamera_Status extends $pb.ProtobufEnum {
  static const AddCamera_Status OFF =
      AddCamera_Status._(0, _omitEnumNames ? '' : 'OFF');
  static const AddCamera_Status ON =
      AddCamera_Status._(1, _omitEnumNames ? '' : 'ON');

  static const $core.List<AddCamera_Status> values = <AddCamera_Status>[
    OFF,
    ON,
  ];

  static final $core.List<AddCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static AddCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCamera_Status._(super.value, super.name);
}

class AddCamera_Error extends $pb.ProtobufEnum {
  static const AddCamera_Error ERROR_DEFAULT =
      AddCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCamera_Error CAMERA_NOT_EXIST =
      AddCamera_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_EXIST');
  static const AddCamera_Error CAMERA_NOT_CONNECTION =
      AddCamera_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_CONNECTION');
  static const AddCamera_Error USERNAME_INVALID =
      AddCamera_Error._(3, _omitEnumNames ? '' : 'USERNAME_INVALID');
  static const AddCamera_Error PASSWORD_INVALID =
      AddCamera_Error._(4, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const AddCamera_Error SERIAL_NOT_EXIST =
      AddCamera_Error._(5, _omitEnumNames ? '' : 'SERIAL_NOT_EXIST');
  static const AddCamera_Error ACTIVE_CAMERA_ERROR =
      AddCamera_Error._(6, _omitEnumNames ? '' : 'ACTIVE_CAMERA_ERROR');
  static const AddCamera_Error ALREADY_ADDED =
      AddCamera_Error._(7, _omitEnumNames ? '' : 'ALREADY_ADDED');
  static const AddCamera_Error ALREADY_ADDED_BY_OTHER_ACCOUNT =
      AddCamera_Error._(
          8, _omitEnumNames ? '' : 'ALREADY_ADDED_BY_OTHER_ACCOUNT');

  static const $core.List<AddCamera_Error> values = <AddCamera_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_EXIST,
    CAMERA_NOT_CONNECTION,
    USERNAME_INVALID,
    PASSWORD_INVALID,
    SERIAL_NOT_EXIST,
    ACTIVE_CAMERA_ERROR,
    ALREADY_ADDED,
    ALREADY_ADDED_BY_OTHER_ACCOUNT,
  ];

  static final $core.List<AddCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static AddCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCamera_Error._(super.value, super.name);
}

class UpdateCamera_Error extends $pb.ProtobufEnum {
  static const UpdateCamera_Error ERROR_DEFAULT =
      UpdateCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateCamera_Error RTSP_URL_INVALID =
      UpdateCamera_Error._(1, _omitEnumNames ? '' : 'RTSP_URL_INVALID');
  static const UpdateCamera_Error NAME_INVALID =
      UpdateCamera_Error._(3, _omitEnumNames ? '' : 'NAME_INVALID');
  static const UpdateCamera_Error CAMERA_ID_INVALID =
      UpdateCamera_Error._(4, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const UpdateCamera_Error IP_OR_DOMAIN_INVALID =
      UpdateCamera_Error._(5, _omitEnumNames ? '' : 'IP_OR_DOMAIN_INVALID');
  static const UpdateCamera_Error RTSP_PORT_ERROR =
      UpdateCamera_Error._(6, _omitEnumNames ? '' : 'RTSP_PORT_ERROR');
  static const UpdateCamera_Error USER_NAME_OR_PASSWORD_ERROR =
      UpdateCamera_Error._(
          7, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const UpdateCamera_Error CAMERA_EXIST =
      UpdateCamera_Error._(8, _omitEnumNames ? '' : 'CAMERA_EXIST');
  static const UpdateCamera_Error CAMERA_UUID_INVALID =
      UpdateCamera_Error._(9, _omitEnumNames ? '' : 'CAMERA_UUID_INVALID');
  static const UpdateCamera_Error XADDR_EMPTY =
      UpdateCamera_Error._(10, _omitEnumNames ? '' : 'XADDR_EMPTY');
  static const UpdateCamera_Error XADDR_INVALID =
      UpdateCamera_Error._(11, _omitEnumNames ? '' : 'XADDR_INVALID');
  static const UpdateCamera_Error LOCATION_INVALID =
      UpdateCamera_Error._(12, _omitEnumNames ? '' : 'LOCATION_INVALID');
  static const UpdateCamera_Error CAMERA_NAME_EXIST =
      UpdateCamera_Error._(13, _omitEnumNames ? '' : 'CAMERA_NAME_EXIST');
  static const UpdateCamera_Error GET_SERIAL_NUMBER_CAMERA_ERROR =
      UpdateCamera_Error._(
          14, _omitEnumNames ? '' : 'GET_SERIAL_NUMBER_CAMERA_ERROR');
  static const UpdateCamera_Error SERIAL_NUMBER_NOT_MATH =
      UpdateCamera_Error._(15, _omitEnumNames ? '' : 'SERIAL_NUMBER_NOT_MATH');
  static const UpdateCamera_Error BOX_ID_INVALID =
      UpdateCamera_Error._(16, _omitEnumNames ? '' : 'BOX_ID_INVALID');
  static const UpdateCamera_Error BOX_OFFLINE =
      UpdateCamera_Error._(17, _omitEnumNames ? '' : 'BOX_OFFLINE');
  static const UpdateCamera_Error SUB_STREAM_INVALID =
      UpdateCamera_Error._(18, _omitEnumNames ? '' : 'SUB_STREAM_INVALID');

  static const $core.List<UpdateCamera_Error> values = <UpdateCamera_Error>[
    ERROR_DEFAULT,
    RTSP_URL_INVALID,
    NAME_INVALID,
    CAMERA_ID_INVALID,
    IP_OR_DOMAIN_INVALID,
    RTSP_PORT_ERROR,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_EXIST,
    CAMERA_UUID_INVALID,
    XADDR_EMPTY,
    XADDR_INVALID,
    LOCATION_INVALID,
    CAMERA_NAME_EXIST,
    GET_SERIAL_NUMBER_CAMERA_ERROR,
    SERIAL_NUMBER_NOT_MATH,
    BOX_ID_INVALID,
    BOX_OFFLINE,
    SUB_STREAM_INVALID,
  ];

  static final $core.List<UpdateCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 18);
  static UpdateCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateCamera_Error._(super.value, super.name);
}

class ChangePasswordCamera_Error extends $pb.ProtobufEnum {
  static const ChangePasswordCamera_Error ERROR_DEFAULT =
      ChangePasswordCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ChangePasswordCamera_Error PASSWORD_INVALID =
      ChangePasswordCamera_Error._(1, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const ChangePasswordCamera_Error PASSWORD_WEAKNESS =
      ChangePasswordCamera_Error._(
          2, _omitEnumNames ? '' : 'PASSWORD_WEAKNESS');
  static const ChangePasswordCamera_Error CAMERA_OFFLINE =
      ChangePasswordCamera_Error._(3, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const ChangePasswordCamera_Error PASSWORD_NOT_SAME =
      ChangePasswordCamera_Error._(
          4, _omitEnumNames ? '' : 'PASSWORD_NOT_SAME');
  static const ChangePasswordCamera_Error OLD_PASSWORD_NOT_MATH =
      ChangePasswordCamera_Error._(
          5, _omitEnumNames ? '' : 'OLD_PASSWORD_NOT_MATH');

  static const $core.List<ChangePasswordCamera_Error> values =
      <ChangePasswordCamera_Error>[
    ERROR_DEFAULT,
    PASSWORD_INVALID,
    PASSWORD_WEAKNESS,
    CAMERA_OFFLINE,
    PASSWORD_NOT_SAME,
    OLD_PASSWORD_NOT_MATH,
  ];

  static final $core.List<ChangePasswordCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ChangePasswordCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChangePasswordCamera_Error._(super.value, super.name);
}

class ScheduleRecordingCamera_Error extends $pb.ProtobufEnum {
  static const ScheduleRecordingCamera_Error ERROR_DEFAULT =
      ScheduleRecordingCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ScheduleRecordingCamera_Error CAMERA_OFFLINE =
      ScheduleRecordingCamera_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const ScheduleRecordingCamera_Error RTSP_URL_INVALID_OR_NOT_FOUND =
      ScheduleRecordingCamera_Error._(
          2, _omitEnumNames ? '' : 'RTSP_URL_INVALID_OR_NOT_FOUND');
  static const ScheduleRecordingCamera_Error
      RECORD_CLOUD_STORAGE_INVALID_OR_EXPIRED = ScheduleRecordingCamera_Error._(
          3, _omitEnumNames ? '' : 'RECORD_CLOUD_STORAGE_INVALID_OR_EXPIRED');
  static const ScheduleRecordingCamera_Error RESOLUTION_INVALID =
      ScheduleRecordingCamera_Error._(
          4, _omitEnumNames ? '' : 'RESOLUTION_INVALID');

  static const $core.List<ScheduleRecordingCamera_Error> values =
      <ScheduleRecordingCamera_Error>[
    ERROR_DEFAULT,
    CAMERA_OFFLINE,
    RTSP_URL_INVALID_OR_NOT_FOUND,
    RECORD_CLOUD_STORAGE_INVALID_OR_EXPIRED,
    RESOLUTION_INVALID,
  ];

  static final $core.List<ScheduleRecordingCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ScheduleRecordingCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ScheduleRecordingCamera_Error._(super.value, super.name);
}

class RestartCamera_Error extends $pb.ProtobufEnum {
  static const RestartCamera_Error ERROR_DEFAULT =
      RestartCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RestartCamera_Error CAMERA_OFFLINE =
      RestartCamera_Error._(1, _omitEnumNames ? '' : 'CAMERA_OFFLINE');

  static const $core.List<RestartCamera_Error> values = <RestartCamera_Error>[
    ERROR_DEFAULT,
    CAMERA_OFFLINE,
  ];

  static final $core.List<RestartCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static RestartCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RestartCamera_Error._(super.value, super.name);
}

class ShareCamera_Role extends $pb.ProtobufEnum {
  static const ShareCamera_Role VIEW =
      ShareCamera_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const ShareCamera_Role FULL =
      ShareCamera_Role._(1, _omitEnumNames ? '' : 'FULL');

  static const $core.List<ShareCamera_Role> values = <ShareCamera_Role>[
    VIEW,
    FULL,
  ];

  static final $core.List<ShareCamera_Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ShareCamera_Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShareCamera_Role._(super.value, super.name);
}

class ShareCamera_Error extends $pb.ProtobufEnum {
  static const ShareCamera_Error ERROR_DEFAULT =
      ShareCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ShareCamera_Error ALREADY_SHARE =
      ShareCamera_Error._(1, _omitEnumNames ? '' : 'ALREADY_SHARE');
  static const ShareCamera_Error SHARE_YOURSELF =
      ShareCamera_Error._(2, _omitEnumNames ? '' : 'SHARE_YOURSELF');
  static const ShareCamera_Error ALREADY_INVITE =
      ShareCamera_Error._(3, _omitEnumNames ? '' : 'ALREADY_INVITE');
  static const ShareCamera_Error ACCOUNT_INVALID =
      ShareCamera_Error._(4, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const ShareCamera_Error TEL_INVALID =
      ShareCamera_Error._(5, _omitEnumNames ? '' : 'TEL_INVALID');
  static const ShareCamera_Error EMAIL_INVALID =
      ShareCamera_Error._(6, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const ShareCamera_Error CAMERA_NOT_FOUND =
      ShareCamera_Error._(7, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');

  static const $core.List<ShareCamera_Error> values = <ShareCamera_Error>[
    ERROR_DEFAULT,
    ALREADY_SHARE,
    SHARE_YOURSELF,
    ALREADY_INVITE,
    ACCOUNT_INVALID,
    TEL_INVALID,
    EMAIL_INVALID,
    CAMERA_NOT_FOUND,
  ];

  static final $core.List<ShareCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static ShareCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShareCamera_Error._(super.value, super.name);
}

class CheckAccountShare_ShareType extends $pb.ProtobufEnum {
  static const CheckAccountShare_ShareType CAMERA =
      CheckAccountShare_ShareType._(0, _omitEnumNames ? '' : 'CAMERA');
  static const CheckAccountShare_ShareType GROUP_CAMERA =
      CheckAccountShare_ShareType._(1, _omitEnumNames ? '' : 'GROUP_CAMERA');

  static const $core.List<CheckAccountShare_ShareType> values =
      <CheckAccountShare_ShareType>[
    CAMERA,
    GROUP_CAMERA,
  ];

  static final $core.List<CheckAccountShare_ShareType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static CheckAccountShare_ShareType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckAccountShare_ShareType._(super.value, super.name);
}

class CheckAccountShare_Error extends $pb.ProtobufEnum {
  static const CheckAccountShare_Error ERROR_DEFAULT =
      CheckAccountShare_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const CheckAccountShare_Error TEL_INVALID =
      CheckAccountShare_Error._(1, _omitEnumNames ? '' : 'TEL_INVALID');
  static const CheckAccountShare_Error EMAIL_INVALID =
      CheckAccountShare_Error._(2, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const CheckAccountShare_Error TEL_NOT_IN_USE =
      CheckAccountShare_Error._(3, _omitEnumNames ? '' : 'TEL_NOT_IN_USE');
  static const CheckAccountShare_Error EMAIL_NOT_IN_USE =
      CheckAccountShare_Error._(4, _omitEnumNames ? '' : 'EMAIL_NOT_IN_USE');
  static const CheckAccountShare_Error ALREADY_SHARE =
      CheckAccountShare_Error._(5, _omitEnumNames ? '' : 'ALREADY_SHARE');
  static const CheckAccountShare_Error ALREADY_INVITE =
      CheckAccountShare_Error._(6, _omitEnumNames ? '' : 'ALREADY_INVITE');
  static const CheckAccountShare_Error SHARE_YOURSELF =
      CheckAccountShare_Error._(7, _omitEnumNames ? '' : 'SHARE_YOURSELF');
  static const CheckAccountShare_Error PERMISSION_DENIED =
      CheckAccountShare_Error._(8, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const CheckAccountShare_Error ACCOUNT_IVALID =
      CheckAccountShare_Error._(9, _omitEnumNames ? '' : 'ACCOUNT_IVALID');
  static const CheckAccountShare_Error SHARE_TO_ADMIN =
      CheckAccountShare_Error._(10, _omitEnumNames ? '' : 'SHARE_TO_ADMIN');
  static const CheckAccountShare_Error SHARE_TO_OWNER =
      CheckAccountShare_Error._(11, _omitEnumNames ? '' : 'SHARE_TO_OWNER');
  static const CheckAccountShare_Error OVER_SHARED_USER_NUMBER =
      CheckAccountShare_Error._(
          12, _omitEnumNames ? '' : 'OVER_SHARED_USER_NUMBER');

  static const $core.List<CheckAccountShare_Error> values =
      <CheckAccountShare_Error>[
    ERROR_DEFAULT,
    TEL_INVALID,
    EMAIL_INVALID,
    TEL_NOT_IN_USE,
    EMAIL_NOT_IN_USE,
    ALREADY_SHARE,
    ALREADY_INVITE,
    SHARE_YOURSELF,
    PERMISSION_DENIED,
    ACCOUNT_IVALID,
    SHARE_TO_ADMIN,
    SHARE_TO_OWNER,
    OVER_SHARED_USER_NUMBER,
  ];

  static final $core.List<CheckAccountShare_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 12);
  static CheckAccountShare_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckAccountShare_Error._(super.value, super.name);
}

class ShareGroupCamera_GroupShareRole extends $pb.ProtobufEnum {
  static const ShareGroupCamera_GroupShareRole NOT_USE_ =
      ShareGroupCamera_GroupShareRole._(0, _omitEnumNames ? '' : '_NOT_USE');
  static const ShareGroupCamera_GroupShareRole VIEW =
      ShareGroupCamera_GroupShareRole._(1, _omitEnumNames ? '' : 'VIEW');
  static const ShareGroupCamera_GroupShareRole MANAGER =
      ShareGroupCamera_GroupShareRole._(2, _omitEnumNames ? '' : 'MANAGER');

  static const $core.List<ShareGroupCamera_GroupShareRole> values =
      <ShareGroupCamera_GroupShareRole>[
    NOT_USE_,
    VIEW,
    MANAGER,
  ];

  static final $core.List<ShareGroupCamera_GroupShareRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ShareGroupCamera_GroupShareRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShareGroupCamera_GroupShareRole._(super.value, super.name);
}

class ShareGroupCamera_Error extends $pb.ProtobufEnum {
  static const ShareGroupCamera_Error ERROR_DEFAULT =
      ShareGroupCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ShareGroupCamera_Error ALREADY_SHARE =
      ShareGroupCamera_Error._(1, _omitEnumNames ? '' : 'ALREADY_SHARE');
  static const ShareGroupCamera_Error SHARE_YOURSELF =
      ShareGroupCamera_Error._(2, _omitEnumNames ? '' : 'SHARE_YOURSELF');
  static const ShareGroupCamera_Error ALREADY_INVITE =
      ShareGroupCamera_Error._(3, _omitEnumNames ? '' : 'ALREADY_INVITE');
  static const ShareGroupCamera_Error ACCOUNT_INVALID =
      ShareGroupCamera_Error._(4, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const ShareGroupCamera_Error GROUP_ID_EMPTY =
      ShareGroupCamera_Error._(5, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const ShareGroupCamera_Error GROUP_NOT_FOUND =
      ShareGroupCamera_Error._(6, _omitEnumNames ? '' : 'GROUP_NOT_FOUND');

  static const $core.List<ShareGroupCamera_Error> values =
      <ShareGroupCamera_Error>[
    ERROR_DEFAULT,
    ALREADY_SHARE,
    SHARE_YOURSELF,
    ALREADY_INVITE,
    ACCOUNT_INVALID,
    GROUP_ID_EMPTY,
    GROUP_NOT_FOUND,
  ];

  static final $core.List<ShareGroupCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static ShareGroupCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShareGroupCamera_Error._(super.value, super.name);
}

class ReceiveShareGroupCamera_GroupShareRole extends $pb.ProtobufEnum {
  static const ReceiveShareGroupCamera_GroupShareRole NOT_USE_ =
      ReceiveShareGroupCamera_GroupShareRole._(
          0, _omitEnumNames ? '' : '_NOT_USE');
  static const ReceiveShareGroupCamera_GroupShareRole VIEW =
      ReceiveShareGroupCamera_GroupShareRole._(1, _omitEnumNames ? '' : 'VIEW');
  static const ReceiveShareGroupCamera_GroupShareRole MANAGER =
      ReceiveShareGroupCamera_GroupShareRole._(
          2, _omitEnumNames ? '' : 'MANAGER');

  static const $core.List<ReceiveShareGroupCamera_GroupShareRole> values =
      <ReceiveShareGroupCamera_GroupShareRole>[
    NOT_USE_,
    VIEW,
    MANAGER,
  ];

  static final $core.List<ReceiveShareGroupCamera_GroupShareRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ReceiveShareGroupCamera_GroupShareRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveShareGroupCamera_GroupShareRole._(super.value, super.name);
}

class ListShareInviteGroup_Error extends $pb.ProtobufEnum {
  static const ListShareInviteGroup_Error ERROR_DEFAULT =
      ListShareInviteGroup_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ListShareInviteGroup_Error GROUP_ID_EMPTY =
      ListShareInviteGroup_Error._(1, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const ListShareInviteGroup_Error GROUP_NOT_FOUND =
      ListShareInviteGroup_Error._(2, _omitEnumNames ? '' : 'GROUP_NOT_FOUND');

  static const $core.List<ListShareInviteGroup_Error> values =
      <ListShareInviteGroup_Error>[
    ERROR_DEFAULT,
    GROUP_ID_EMPTY,
    GROUP_NOT_FOUND,
  ];

  static final $core.List<ListShareInviteGroup_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ListShareInviteGroup_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListShareInviteGroup_Error._(super.value, super.name);
}

class ResponseShareGroupCamera_Action extends $pb.ProtobufEnum {
  static const ResponseShareGroupCamera_Action ACCEPT =
      ResponseShareGroupCamera_Action._(0, _omitEnumNames ? '' : 'ACCEPT');
  static const ResponseShareGroupCamera_Action DECLINE =
      ResponseShareGroupCamera_Action._(1, _omitEnumNames ? '' : 'DECLINE');

  static const $core.List<ResponseShareGroupCamera_Action> values =
      <ResponseShareGroupCamera_Action>[
    ACCEPT,
    DECLINE,
  ];

  static final $core.List<ResponseShareGroupCamera_Action?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ResponseShareGroupCamera_Action? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResponseShareGroupCamera_Action._(super.value, super.name);
}

class ResponseShareGroupCamera_Error extends $pb.ProtobufEnum {
  static const ResponseShareGroupCamera_Error ERROR_DEFAULT =
      ResponseShareGroupCamera_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ResponseShareGroupCamera_Error INVALID_SHARE =
      ResponseShareGroupCamera_Error._(
          1, _omitEnumNames ? '' : 'INVALID_SHARE');
  static const ResponseShareGroupCamera_Error INVITE_MSG_EMPTY =
      ResponseShareGroupCamera_Error._(
          2, _omitEnumNames ? '' : 'INVITE_MSG_EMPTY');
  static const ResponseShareGroupCamera_Error INVITE_MSG_NOT_FOUND =
      ResponseShareGroupCamera_Error._(
          3, _omitEnumNames ? '' : 'INVITE_MSG_NOT_FOUND');
  static const ResponseShareGroupCamera_Error GROUP_SHARE_NOT_FOUND =
      ResponseShareGroupCamera_Error._(
          4, _omitEnumNames ? '' : 'GROUP_SHARE_NOT_FOUND');

  static const $core.List<ResponseShareGroupCamera_Error> values =
      <ResponseShareGroupCamera_Error>[
    ERROR_DEFAULT,
    INVALID_SHARE,
    INVITE_MSG_EMPTY,
    INVITE_MSG_NOT_FOUND,
    GROUP_SHARE_NOT_FOUND,
  ];

  static final $core.List<ResponseShareGroupCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ResponseShareGroupCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResponseShareGroupCamera_Error._(super.value, super.name);
}

class ReceiveResponseShareGroupCamera_Action extends $pb.ProtobufEnum {
  static const ReceiveResponseShareGroupCamera_Action ACCEPT =
      ReceiveResponseShareGroupCamera_Action._(
          0, _omitEnumNames ? '' : 'ACCEPT');
  static const ReceiveResponseShareGroupCamera_Action DECLINE =
      ReceiveResponseShareGroupCamera_Action._(
          1, _omitEnumNames ? '' : 'DECLINE');

  static const $core.List<ReceiveResponseShareGroupCamera_Action> values =
      <ReceiveResponseShareGroupCamera_Action>[
    ACCEPT,
    DECLINE,
  ];

  static final $core.List<ReceiveResponseShareGroupCamera_Action?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReceiveResponseShareGroupCamera_Action? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveResponseShareGroupCamera_Action._(super.value, super.name);
}

class DeleteCameraEmapInfo_Error extends $pb.ProtobufEnum {
  static const DeleteCameraEmapInfo_Error ERROR_DEFAULT =
      DeleteCameraEmapInfo_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const DeleteCameraEmapInfo_Error EMAP_ID_EMPTY =
      DeleteCameraEmapInfo_Error._(1, _omitEnumNames ? '' : 'EMAP_ID_EMPTY');
  static const DeleteCameraEmapInfo_Error EMAP_ID_NOT_FOUND =
      DeleteCameraEmapInfo_Error._(
          2, _omitEnumNames ? '' : 'EMAP_ID_NOT_FOUND');
  static const DeleteCameraEmapInfo_Error CAMERA_EMAP_ID_EMPTY =
      DeleteCameraEmapInfo_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_EMAP_ID_EMPTY');
  static const DeleteCameraEmapInfo_Error CAMERA_EMAP_NOT_FOUND =
      DeleteCameraEmapInfo_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_EMAP_NOT_FOUND');

  static const $core.List<DeleteCameraEmapInfo_Error> values =
      <DeleteCameraEmapInfo_Error>[
    ERROR_DEFAULT,
    EMAP_ID_EMPTY,
    EMAP_ID_NOT_FOUND,
    CAMERA_EMAP_ID_EMPTY,
    CAMERA_EMAP_NOT_FOUND,
  ];

  static final $core.List<DeleteCameraEmapInfo_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static DeleteCameraEmapInfo_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeleteCameraEmapInfo_Error._(super.value, super.name);
}

class DeleteShareGroup_Error extends $pb.ProtobufEnum {
  static const DeleteShareGroup_Error ERROR_DEFAULT =
      DeleteShareGroup_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const DeleteShareGroup_Error INVALID_SHARE =
      DeleteShareGroup_Error._(1, _omitEnumNames ? '' : 'INVALID_SHARE');

  static const $core.List<DeleteShareGroup_Error> values =
      <DeleteShareGroup_Error>[
    ERROR_DEFAULT,
    INVALID_SHARE,
  ];

  static final $core.List<DeleteShareGroup_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static DeleteShareGroup_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeleteShareGroup_Error._(super.value, super.name);
}

class Onvif_PTZ_Error extends $pb.ProtobufEnum {
  static const Onvif_PTZ_Error ERROR_DEFAULT =
      Onvif_PTZ_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Onvif_PTZ_Error CAMERA_NOT_FOUND =
      Onvif_PTZ_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const Onvif_PTZ_Error CAMERA_NOT_ONVIF_DEVICE =
      Onvif_PTZ_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const Onvif_PTZ_Error BOX_OFFLINE =
      Onvif_PTZ_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<Onvif_PTZ_Error> values = <Onvif_PTZ_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    BOX_OFFLINE,
  ];

  static final $core.List<Onvif_PTZ_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Onvif_PTZ_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Onvif_PTZ_Error._(super.value, super.name);
}

class IVALineCrossing_DirectionType extends $pb.ProtobufEnum {
  static const IVALineCrossing_DirectionType A__B =
      IVALineCrossing_DirectionType._(0, _omitEnumNames ? '' : 'A__B');
  static const IVALineCrossing_DirectionType B__A =
      IVALineCrossing_DirectionType._(1, _omitEnumNames ? '' : 'B__A');
  static const IVALineCrossing_DirectionType AB =
      IVALineCrossing_DirectionType._(2, _omitEnumNames ? '' : 'AB');

  static const $core.List<IVALineCrossing_DirectionType> values =
      <IVALineCrossing_DirectionType>[
    A__B,
    B__A,
    AB,
  ];

  static final $core.List<IVALineCrossing_DirectionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static IVALineCrossing_DirectionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IVALineCrossing_DirectionType._(super.value, super.name);
}

class IVALineCrossing_Error extends $pb.ProtobufEnum {
  static const IVALineCrossing_Error ERROR_DEFAULT =
      IVALineCrossing_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const IVALineCrossing_Error CAMERA_ID_EMPTY =
      IVALineCrossing_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const IVALineCrossing_Error CAMERA_NOT_FOUND =
      IVALineCrossing_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const IVALineCrossing_Error IVA_SV_ERROR =
      IVALineCrossing_Error._(3, _omitEnumNames ? '' : 'IVA_SV_ERROR');
  static const IVALineCrossing_Error IVA_NOT_REGISTER =
      IVALineCrossing_Error._(4, _omitEnumNames ? '' : 'IVA_NOT_REGISTER');
  static const IVALineCrossing_Error IVA_TOO_MANY_REQUEST =
      IVALineCrossing_Error._(5, _omitEnumNames ? '' : 'IVA_TOO_MANY_REQUEST');
  static const IVALineCrossing_Error OVER_QUOTA =
      IVALineCrossing_Error._(6, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const IVALineCrossing_Error PERMISSION_DENIED =
      IVALineCrossing_Error._(7, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<IVALineCrossing_Error> values =
      <IVALineCrossing_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    IVA_SV_ERROR,
    IVA_NOT_REGISTER,
    IVA_TOO_MANY_REQUEST,
    OVER_QUOTA,
    PERMISSION_DENIED,
  ];

  static final $core.List<IVALineCrossing_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static IVALineCrossing_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IVALineCrossing_Error._(super.value, super.name);
}

class IVAIntrusionDetection_Error extends $pb.ProtobufEnum {
  static const IVAIntrusionDetection_Error ERROR_DEFAULT =
      IVAIntrusionDetection_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const IVAIntrusionDetection_Error CAMERA_ID_EMPTY =
      IVAIntrusionDetection_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const IVAIntrusionDetection_Error CAMERA_NOT_FOUND =
      IVAIntrusionDetection_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const IVAIntrusionDetection_Error IVA_SV_ERROR =
      IVAIntrusionDetection_Error._(3, _omitEnumNames ? '' : 'IVA_SV_ERROR');
  static const IVAIntrusionDetection_Error IVA_NOT_REGISTER =
      IVAIntrusionDetection_Error._(
          4, _omitEnumNames ? '' : 'IVA_NOT_REGISTER');
  static const IVAIntrusionDetection_Error IVA_TOO_MANY_REQUEST =
      IVAIntrusionDetection_Error._(
          5, _omitEnumNames ? '' : 'IVA_TOO_MANY_REQUEST');
  static const IVAIntrusionDetection_Error OVER_QUOTA =
      IVAIntrusionDetection_Error._(6, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const IVAIntrusionDetection_Error PERMISSION_DENIED =
      IVAIntrusionDetection_Error._(
          7, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<IVAIntrusionDetection_Error> values =
      <IVAIntrusionDetection_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    IVA_SV_ERROR,
    IVA_NOT_REGISTER,
    IVA_TOO_MANY_REQUEST,
    OVER_QUOTA,
    PERMISSION_DENIED,
  ];

  static final $core.List<IVAIntrusionDetection_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static IVAIntrusionDetection_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IVAIntrusionDetection_Error._(super.value, super.name);
}

class UpdateInviteGroup_GroupShareRole extends $pb.ProtobufEnum {
  static const UpdateInviteGroup_GroupShareRole NOT_USE_ =
      UpdateInviteGroup_GroupShareRole._(0, _omitEnumNames ? '' : '_NOT_USE');
  static const UpdateInviteGroup_GroupShareRole VIEW =
      UpdateInviteGroup_GroupShareRole._(1, _omitEnumNames ? '' : 'VIEW');
  static const UpdateInviteGroup_GroupShareRole MANAGER =
      UpdateInviteGroup_GroupShareRole._(2, _omitEnumNames ? '' : 'MANAGER');

  static const $core.List<UpdateInviteGroup_GroupShareRole> values =
      <UpdateInviteGroup_GroupShareRole>[
    NOT_USE_,
    VIEW,
    MANAGER,
  ];

  static final $core.List<UpdateInviteGroup_GroupShareRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static UpdateInviteGroup_GroupShareRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateInviteGroup_GroupShareRole._(super.value, super.name);
}

class UpdateInviteGroup_Error extends $pb.ProtobufEnum {
  static const UpdateInviteGroup_Error ERROR_DEFAULT =
      UpdateInviteGroup_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateInviteGroup_Error INVITE_MESSAGE_INVALID =
      UpdateInviteGroup_Error._(
          1, _omitEnumNames ? '' : 'INVITE_MESSAGE_INVALID');
  static const UpdateInviteGroup_Error PERMISSION_DENIED =
      UpdateInviteGroup_Error._(2, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const UpdateInviteGroup_Error NOT_CHANGE =
      UpdateInviteGroup_Error._(3, _omitEnumNames ? '' : 'NOT_CHANGE');

  static const $core.List<UpdateInviteGroup_Error> values =
      <UpdateInviteGroup_Error>[
    ERROR_DEFAULT,
    INVITE_MESSAGE_INVALID,
    PERMISSION_DENIED,
    NOT_CHANGE,
  ];

  static final $core.List<UpdateInviteGroup_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static UpdateInviteGroup_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateInviteGroup_Error._(super.value, super.name);
}

class ReceiveUpdateInviteGroup_GroupShareRole extends $pb.ProtobufEnum {
  static const ReceiveUpdateInviteGroup_GroupShareRole NOT_USE_ =
      ReceiveUpdateInviteGroup_GroupShareRole._(
          0, _omitEnumNames ? '' : '_NOT_USE');
  static const ReceiveUpdateInviteGroup_GroupShareRole VIEW =
      ReceiveUpdateInviteGroup_GroupShareRole._(
          1, _omitEnumNames ? '' : 'VIEW');
  static const ReceiveUpdateInviteGroup_GroupShareRole MANAGER =
      ReceiveUpdateInviteGroup_GroupShareRole._(
          2, _omitEnumNames ? '' : 'MANAGER');

  static const $core.List<ReceiveUpdateInviteGroup_GroupShareRole> values =
      <ReceiveUpdateInviteGroup_GroupShareRole>[
    NOT_USE_,
    VIEW,
    MANAGER,
  ];

  static final $core.List<ReceiveUpdateInviteGroup_GroupShareRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ReceiveUpdateInviteGroup_GroupShareRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveUpdateInviteGroup_GroupShareRole._(super.value, super.name);
}

class ReceiveUpdateGroupRole_GroupShareRole extends $pb.ProtobufEnum {
  static const ReceiveUpdateGroupRole_GroupShareRole NOT_USE_ =
      ReceiveUpdateGroupRole_GroupShareRole._(
          0, _omitEnumNames ? '' : '_NOT_USE');
  static const ReceiveUpdateGroupRole_GroupShareRole VIEW =
      ReceiveUpdateGroupRole_GroupShareRole._(1, _omitEnumNames ? '' : 'VIEW');
  static const ReceiveUpdateGroupRole_GroupShareRole MANAGER =
      ReceiveUpdateGroupRole_GroupShareRole._(
          2, _omitEnumNames ? '' : 'MANAGER');

  static const $core.List<ReceiveUpdateGroupRole_GroupShareRole> values =
      <ReceiveUpdateGroupRole_GroupShareRole>[
    NOT_USE_,
    VIEW,
    MANAGER,
  ];

  static final $core.List<ReceiveUpdateGroupRole_GroupShareRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ReceiveUpdateGroupRole_GroupShareRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceiveUpdateGroupRole_GroupShareRole._(super.value, super.name);
}

class GetCurrentRecoding_Error extends $pb.ProtobufEnum {
  static const GetCurrentRecoding_Error DEFAULT_ =
      GetCurrentRecoding_Error._(0, _omitEnumNames ? '' : '_DEFAULT');
  static const GetCurrentRecoding_Error CAMERA_NOT_RECORDING =
      GetCurrentRecoding_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_RECORDING');

  static const $core.List<GetCurrentRecoding_Error> values =
      <GetCurrentRecoding_Error>[
    DEFAULT_,
    CAMERA_NOT_RECORDING,
  ];

  static final $core.List<GetCurrentRecoding_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static GetCurrentRecoding_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetCurrentRecoding_Error._(super.value, super.name);
}

class GetAllCamera_Iva_Type extends $pb.ProtobufEnum {
  static const GetAllCamera_Iva_Type ALL =
      GetAllCamera_Iva_Type._(0, _omitEnumNames ? '' : 'ALL');
  static const GetAllCamera_Iva_Type IVA_MOTION_DETECTION =
      GetAllCamera_Iva_Type._(1, _omitEnumNames ? '' : 'IVA_MOTION_DETECTION');
  static const GetAllCamera_Iva_Type IVA_LINE_CROSSING =
      GetAllCamera_Iva_Type._(2, _omitEnumNames ? '' : 'IVA_LINE_CROSSING');
  static const GetAllCamera_Iva_Type IVA_INTRUSION_DETECTION =
      GetAllCamera_Iva_Type._(
          3, _omitEnumNames ? '' : 'IVA_INTRUSION_DETECTION');
  static const GetAllCamera_Iva_Type IVA_FACE_DETECTION =
      GetAllCamera_Iva_Type._(4, _omitEnumNames ? '' : 'IVA_FACE_DETECTION');
  static const GetAllCamera_Iva_Type IVA_SMOKE_DETECTION =
      GetAllCamera_Iva_Type._(5, _omitEnumNames ? '' : 'IVA_SMOKE_DETECTION');
  static const GetAllCamera_Iva_Type IVA_ALPR_DETECTION =
      GetAllCamera_Iva_Type._(6, _omitEnumNames ? '' : 'IVA_ALPR_DETECTION');

  static const $core.List<GetAllCamera_Iva_Type> values =
      <GetAllCamera_Iva_Type>[
    ALL,
    IVA_MOTION_DETECTION,
    IVA_LINE_CROSSING,
    IVA_INTRUSION_DETECTION,
    IVA_FACE_DETECTION,
    IVA_SMOKE_DETECTION,
    IVA_ALPR_DETECTION,
  ];

  static final $core.List<GetAllCamera_Iva_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static GetAllCamera_Iva_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetAllCamera_Iva_Type._(super.value, super.name);
}

class GetAllCamera_Status extends $pb.ProtobufEnum {
  static const GetAllCamera_Status ALL_C =
      GetAllCamera_Status._(0, _omitEnumNames ? '' : 'ALL_C');
  static const GetAllCamera_Status RUNNING =
      GetAllCamera_Status._(1, _omitEnumNames ? '' : 'RUNNING');
  static const GetAllCamera_Status NOT_RUNNING =
      GetAllCamera_Status._(2, _omitEnumNames ? '' : 'NOT_RUNNING');
  static const GetAllCamera_Status ALL_ACTIVE =
      GetAllCamera_Status._(3, _omitEnumNames ? '' : 'ALL_ACTIVE');

  static const $core.List<GetAllCamera_Status> values = <GetAllCamera_Status>[
    ALL_C,
    RUNNING,
    NOT_RUNNING,
    ALL_ACTIVE,
  ];

  static final $core.List<GetAllCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static GetAllCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetAllCamera_Status._(super.value, super.name);
}

class GetAllCamera_Error extends $pb.ProtobufEnum {
  static const GetAllCamera_Error DEFAULT_ =
      GetAllCamera_Error._(0, _omitEnumNames ? '' : '_DEFAULT');
  static const GetAllCamera_Error CAMERA_NOT_FOUND =
      GetAllCamera_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const GetAllCamera_Error USER_NOT_OWNER_CAMERA =
      GetAllCamera_Error._(2, _omitEnumNames ? '' : 'USER_NOT_OWNER_CAMERA');

  static const $core.List<GetAllCamera_Error> values = <GetAllCamera_Error>[
    DEFAULT_,
    CAMERA_NOT_FOUND,
    USER_NOT_OWNER_CAMERA,
  ];

  static final $core.List<GetAllCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GetAllCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetAllCamera_Error._(super.value, super.name);
}

class CheckCameraOnvif_Error extends $pb.ProtobufEnum {
  static const CheckCameraOnvif_Error DEFAULT_ =
      CheckCameraOnvif_Error._(0, _omitEnumNames ? '' : '_DEFAULT');
  static const CheckCameraOnvif_Error IP_OR_DOMAIN_ERROR =
      CheckCameraOnvif_Error._(1, _omitEnumNames ? '' : 'IP_OR_DOMAIN_ERROR');
  static const CheckCameraOnvif_Error USER_OR_PASSWORD_INVALID =
      CheckCameraOnvif_Error._(
          2, _omitEnumNames ? '' : 'USER_OR_PASSWORD_INVALID');

  static const $core.List<CheckCameraOnvif_Error> values =
      <CheckCameraOnvif_Error>[
    DEFAULT_,
    IP_OR_DOMAIN_ERROR,
    USER_OR_PASSWORD_INVALID,
  ];

  static final $core.List<CheckCameraOnvif_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CheckCameraOnvif_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckCameraOnvif_Error._(super.value, super.name);
}

class SetCameraLocation_Error extends $pb.ProtobufEnum {
  static const SetCameraLocation_Error DEFAULT_ =
      SetCameraLocation_Error._(0, _omitEnumNames ? '' : '_DEFAULT');
  static const SetCameraLocation_Error LOCATION_INVALID =
      SetCameraLocation_Error._(1, _omitEnumNames ? '' : 'LOCATION_INVALID');
  static const SetCameraLocation_Error CAMERA_ID_INVALID =
      SetCameraLocation_Error._(2, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const SetCameraLocation_Error PERMISSION_DENIED =
      SetCameraLocation_Error._(3, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<SetCameraLocation_Error> values =
      <SetCameraLocation_Error>[
    DEFAULT_,
    LOCATION_INVALID,
    CAMERA_ID_INVALID,
    PERMISSION_DENIED,
  ];

  static final $core.List<SetCameraLocation_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SetCameraLocation_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetCameraLocation_Error._(super.value, super.name);
}

class IVASmokeDetection_Error extends $pb.ProtobufEnum {
  static const IVASmokeDetection_Error ERROR_DEFAULT =
      IVASmokeDetection_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const IVASmokeDetection_Error CAMERA_ID_EMPTY =
      IVASmokeDetection_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const IVASmokeDetection_Error CAMERA_NOT_FOUND =
      IVASmokeDetection_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const IVASmokeDetection_Error IVA_SV_ERROR =
      IVASmokeDetection_Error._(3, _omitEnumNames ? '' : 'IVA_SV_ERROR');
  static const IVASmokeDetection_Error IVA_NOT_REGISTER =
      IVASmokeDetection_Error._(4, _omitEnumNames ? '' : 'IVA_NOT_REGISTER');
  static const IVASmokeDetection_Error IVA_TOO_MANY_REQUEST =
      IVASmokeDetection_Error._(
          5, _omitEnumNames ? '' : 'IVA_TOO_MANY_REQUEST');
  static const IVASmokeDetection_Error OVER_QUOTA =
      IVASmokeDetection_Error._(6, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const IVASmokeDetection_Error PERMISSION_DENIED =
      IVASmokeDetection_Error._(7, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<IVASmokeDetection_Error> values =
      <IVASmokeDetection_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    IVA_SV_ERROR,
    IVA_NOT_REGISTER,
    IVA_TOO_MANY_REQUEST,
    OVER_QUOTA,
    PERMISSION_DENIED,
  ];

  static final $core.List<IVASmokeDetection_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static IVASmokeDetection_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IVASmokeDetection_Error._(super.value, super.name);
}

class IVAFaceDetection_Error extends $pb.ProtobufEnum {
  static const IVAFaceDetection_Error ERROR_DEFAULT =
      IVAFaceDetection_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const IVAFaceDetection_Error CAMERA_ID_EMPTY =
      IVAFaceDetection_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const IVAFaceDetection_Error CAMERA_NOT_FOUND =
      IVAFaceDetection_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const IVAFaceDetection_Error IVA_SV_ERROR =
      IVAFaceDetection_Error._(3, _omitEnumNames ? '' : 'IVA_SV_ERROR');
  static const IVAFaceDetection_Error IVA_NOT_REGISTER =
      IVAFaceDetection_Error._(4, _omitEnumNames ? '' : 'IVA_NOT_REGISTER');
  static const IVAFaceDetection_Error IVA_TOO_MANY_REQUEST =
      IVAFaceDetection_Error._(5, _omitEnumNames ? '' : 'IVA_TOO_MANY_REQUEST');
  static const IVAFaceDetection_Error OVER_QUOTA =
      IVAFaceDetection_Error._(6, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const IVAFaceDetection_Error PERMISSION_DENIED =
      IVAFaceDetection_Error._(7, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<IVAFaceDetection_Error> values =
      <IVAFaceDetection_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    IVA_SV_ERROR,
    IVA_NOT_REGISTER,
    IVA_TOO_MANY_REQUEST,
    OVER_QUOTA,
    PERMISSION_DENIED,
  ];

  static final $core.List<IVAFaceDetection_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static IVAFaceDetection_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IVAFaceDetection_Error._(super.value, super.name);
}

class GetEventByLogId_Error extends $pb.ProtobufEnum {
  static const GetEventByLogId_Error ERROR_DEFAULT =
      GetEventByLogId_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const GetEventByLogId_Error LOG_ID_EMPTY =
      GetEventByLogId_Error._(1, _omitEnumNames ? '' : 'LOG_ID_EMPTY');
  static const GetEventByLogId_Error LOG_ID_NOT_FOUND =
      GetEventByLogId_Error._(2, _omitEnumNames ? '' : 'LOG_ID_NOT_FOUND');

  static const $core.List<GetEventByLogId_Error> values =
      <GetEventByLogId_Error>[
    ERROR_DEFAULT,
    LOG_ID_EMPTY,
    LOG_ID_NOT_FOUND,
  ];

  static final $core.List<GetEventByLogId_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GetEventByLogId_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetEventByLogId_Error._(super.value, super.name);
}

class BoxGetCameras_Error extends $pb.ProtobufEnum {
  static const BoxGetCameras_Error ERROR_DEFAULT =
      BoxGetCameras_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const BoxGetCameras_Error BOX_ID_EMPTY =
      BoxGetCameras_Error._(1, _omitEnumNames ? '' : 'BOX_ID_EMPTY');
  static const BoxGetCameras_Error BOX_NOT_FOUND =
      BoxGetCameras_Error._(2, _omitEnumNames ? '' : 'BOX_NOT_FOUND');

  static const $core.List<BoxGetCameras_Error> values = <BoxGetCameras_Error>[
    ERROR_DEFAULT,
    BOX_ID_EMPTY,
    BOX_NOT_FOUND,
  ];

  static final $core.List<BoxGetCameras_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BoxGetCameras_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BoxGetCameras_Error._(super.value, super.name);
}

class UserAddBox_Error extends $pb.ProtobufEnum {
  static const UserAddBox_Error ERROR_DEFAULT =
      UserAddBox_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UserAddBox_Error BOX_NAME_EMPTY =
      UserAddBox_Error._(1, _omitEnumNames ? '' : 'BOX_NAME_EMPTY');
  static const UserAddBox_Error BOX_NAME_INVALID =
      UserAddBox_Error._(2, _omitEnumNames ? '' : 'BOX_NAME_INVALID');
  static const UserAddBox_Error SERIAL_NUMBER_EMPTY =
      UserAddBox_Error._(3, _omitEnumNames ? '' : 'SERIAL_NUMBER_EMPTY');
  static const UserAddBox_Error SERIAL_NUMBER_INVALID =
      UserAddBox_Error._(4, _omitEnumNames ? '' : 'SERIAL_NUMBER_INVALID');
  static const UserAddBox_Error SERIAL_NUMBER_NOT_EXIST =
      UserAddBox_Error._(5, _omitEnumNames ? '' : 'SERIAL_NUMBER_NOT_EXIST');
  static const UserAddBox_Error BOX_NOT_REGISTER =
      UserAddBox_Error._(6, _omitEnumNames ? '' : 'BOX_NOT_REGISTER');
  static const UserAddBox_Error BOX_OFFLINE =
      UserAddBox_Error._(7, _omitEnumNames ? '' : 'BOX_OFFLINE');
  static const UserAddBox_Error BOX_ADDED_BY_OTHER_ACCOUNT =
      UserAddBox_Error._(8, _omitEnumNames ? '' : 'BOX_ADDED_BY_OTHER_ACCOUNT');
  static const UserAddBox_Error BOX_ADDED_BY_MY_SELF =
      UserAddBox_Error._(9, _omitEnumNames ? '' : 'BOX_ADDED_BY_MY_SELF');
  static const UserAddBox_Error BOX_NAME_EXIST =
      UserAddBox_Error._(10, _omitEnumNames ? '' : 'BOX_NAME_EXIST');

  static const $core.List<UserAddBox_Error> values = <UserAddBox_Error>[
    ERROR_DEFAULT,
    BOX_NAME_EMPTY,
    BOX_NAME_INVALID,
    SERIAL_NUMBER_EMPTY,
    SERIAL_NUMBER_INVALID,
    SERIAL_NUMBER_NOT_EXIST,
    BOX_NOT_REGISTER,
    BOX_OFFLINE,
    BOX_ADDED_BY_OTHER_ACCOUNT,
    BOX_ADDED_BY_MY_SELF,
    BOX_NAME_EXIST,
  ];

  static final $core.List<UserAddBox_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static UserAddBox_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserAddBox_Error._(super.value, super.name);
}

class UserRemoveBox_Error extends $pb.ProtobufEnum {
  static const UserRemoveBox_Error ERROR_DEFAULT =
      UserRemoveBox_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UserRemoveBox_Error BOX_ID_EMPTY =
      UserRemoveBox_Error._(1, _omitEnumNames ? '' : 'BOX_ID_EMPTY');
  static const UserRemoveBox_Error BOX_ID_INVALID =
      UserRemoveBox_Error._(2, _omitEnumNames ? '' : 'BOX_ID_INVALID');

  static const $core.List<UserRemoveBox_Error> values = <UserRemoveBox_Error>[
    ERROR_DEFAULT,
    BOX_ID_EMPTY,
    BOX_ID_INVALID,
  ];

  static final $core.List<UserRemoveBox_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static UserRemoveBox_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserRemoveBox_Error._(super.value, super.name);
}

class UserUpdateNameBox_Error extends $pb.ProtobufEnum {
  static const UserUpdateNameBox_Error ERROR_DEFAULT =
      UserUpdateNameBox_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UserUpdateNameBox_Error BOX_ID_EMPTY =
      UserUpdateNameBox_Error._(1, _omitEnumNames ? '' : 'BOX_ID_EMPTY');
  static const UserUpdateNameBox_Error BOX_ID_INVALID =
      UserUpdateNameBox_Error._(2, _omitEnumNames ? '' : 'BOX_ID_INVALID');
  static const UserUpdateNameBox_Error NAME_EMPTY =
      UserUpdateNameBox_Error._(3, _omitEnumNames ? '' : 'NAME_EMPTY');
  static const UserUpdateNameBox_Error NAME_INVALID =
      UserUpdateNameBox_Error._(4, _omitEnumNames ? '' : 'NAME_INVALID');
  static const UserUpdateNameBox_Error NAME_EXIST =
      UserUpdateNameBox_Error._(5, _omitEnumNames ? '' : 'NAME_EXIST');

  static const $core.List<UserUpdateNameBox_Error> values =
      <UserUpdateNameBox_Error>[
    ERROR_DEFAULT,
    BOX_ID_EMPTY,
    BOX_ID_INVALID,
    NAME_EMPTY,
    NAME_INVALID,
    NAME_EXIST,
  ];

  static final $core.List<UserUpdateNameBox_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static UserUpdateNameBox_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserUpdateNameBox_Error._(super.value, super.name);
}

class AddUser_Error extends $pb.ProtobufEnum {
  static const AddUser_Error ACCOUNT_EMPTY =
      AddUser_Error._(0, _omitEnumNames ? '' : 'ACCOUNT_EMPTY');
  static const AddUser_Error ACCOUNT_EXIST =
      AddUser_Error._(1, _omitEnumNames ? '' : 'ACCOUNT_EXIST');
  static const AddUser_Error ACCOUNT_INVALID =
      AddUser_Error._(2, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const AddUser_Error PASSWORD_INVALID =
      AddUser_Error._(3, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const AddUser_Error EMAIL_INVALID =
      AddUser_Error._(4, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const AddUser_Error EMAIL_EXIST =
      AddUser_Error._(5, _omitEnumNames ? '' : 'EMAIL_EXIST');
  static const AddUser_Error TEL_EXIST =
      AddUser_Error._(6, _omitEnumNames ? '' : 'TEL_EXIST');
  static const AddUser_Error TEL_INVALID =
      AddUser_Error._(7, _omitEnumNames ? '' : 'TEL_INVALID');
  static const AddUser_Error USER_TYPE_EMPTY =
      AddUser_Error._(8, _omitEnumNames ? '' : 'USER_TYPE_EMPTY');
  static const AddUser_Error PASSWORD_EMPTY =
      AddUser_Error._(9, _omitEnumNames ? '' : 'PASSWORD_EMPTY');
  static const AddUser_Error SYN_ERROR =
      AddUser_Error._(10, _omitEnumNames ? '' : 'SYN_ERROR');

  static const $core.List<AddUser_Error> values = <AddUser_Error>[
    ACCOUNT_EMPTY,
    ACCOUNT_EXIST,
    ACCOUNT_INVALID,
    PASSWORD_INVALID,
    EMAIL_INVALID,
    EMAIL_EXIST,
    TEL_EXIST,
    TEL_INVALID,
    USER_TYPE_EMPTY,
    PASSWORD_EMPTY,
    SYN_ERROR,
  ];

  static final $core.List<AddUser_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static AddUser_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddUser_Error._(super.value, super.name);
}

class EditUser_Error extends $pb.ProtobufEnum {
  static const EditUser_Error ACCOUNT_EMPTY =
      EditUser_Error._(0, _omitEnumNames ? '' : 'ACCOUNT_EMPTY');
  static const EditUser_Error ACCOUNT_EXIST =
      EditUser_Error._(1, _omitEnumNames ? '' : 'ACCOUNT_EXIST');
  static const EditUser_Error ACCOUNT_INVALID =
      EditUser_Error._(2, _omitEnumNames ? '' : 'ACCOUNT_INVALID');
  static const EditUser_Error EMAIL_INVALID =
      EditUser_Error._(4, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const EditUser_Error EMAIL_EXIST =
      EditUser_Error._(5, _omitEnumNames ? '' : 'EMAIL_EXIST');
  static const EditUser_Error TEL_EXIST =
      EditUser_Error._(6, _omitEnumNames ? '' : 'TEL_EXIST');
  static const EditUser_Error TEL_INVALID =
      EditUser_Error._(7, _omitEnumNames ? '' : 'TEL_INVALID');
  static const EditUser_Error USER_TYPE_EMPTY =
      EditUser_Error._(8, _omitEnumNames ? '' : 'USER_TYPE_EMPTY');
  static const EditUser_Error USER_NOT_FOUND =
      EditUser_Error._(9, _omitEnumNames ? '' : 'USER_NOT_FOUND');
  static const EditUser_Error SYN_ERROR =
      EditUser_Error._(10, _omitEnumNames ? '' : 'SYN_ERROR');

  static const $core.List<EditUser_Error> values = <EditUser_Error>[
    ACCOUNT_EMPTY,
    ACCOUNT_EXIST,
    ACCOUNT_INVALID,
    EMAIL_INVALID,
    EMAIL_EXIST,
    TEL_EXIST,
    TEL_INVALID,
    USER_TYPE_EMPTY,
    USER_NOT_FOUND,
    SYN_ERROR,
  ];

  static final $core.List<EditUser_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static EditUser_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EditUser_Error._(super.value, super.name);
}

class DeleteUser_Error extends $pb.ProtobufEnum {
  static const DeleteUser_Error USER_EMPTY =
      DeleteUser_Error._(0, _omitEnumNames ? '' : 'USER_EMPTY');
  static const DeleteUser_Error USER_NOT_FOUND =
      DeleteUser_Error._(1, _omitEnumNames ? '' : 'USER_NOT_FOUND');

  static const $core.List<DeleteUser_Error> values = <DeleteUser_Error>[
    USER_EMPTY,
    USER_NOT_FOUND,
  ];

  static final $core.List<DeleteUser_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static DeleteUser_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeleteUser_Error._(super.value, super.name);
}

class AddCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const AddCameraHomeVision_Error ERROR_DEFAULT =
      AddCameraHomeVision_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCameraHomeVision_Error CAMERA_UID_EMPTY =
      AddCameraHomeVision_Error._(1, _omitEnumNames ? '' : 'CAMERA_UID_EMPTY');
  static const AddCameraHomeVision_Error CAMERA_UID_EMPTY_NOT_FOUND =
      AddCameraHomeVision_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_UID_EMPTY_NOT_FOUND');
  static const AddCameraHomeVision_Error CAMERA_OFFLINE =
      AddCameraHomeVision_Error._(3, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const AddCameraHomeVision_Error USER_NAME_OR_PASSWORD_ERROR =
      AddCameraHomeVision_Error._(
          4, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const AddCameraHomeVision_Error CAMERA_EXIST =
      AddCameraHomeVision_Error._(5, _omitEnumNames ? '' : 'CAMERA_EXIST');
  static const AddCameraHomeVision_Error LOCATION_INVALID =
      AddCameraHomeVision_Error._(6, _omitEnumNames ? '' : 'LOCATION_INVALID');
  static const AddCameraHomeVision_Error CAMERA_NAME_EMPTY =
      AddCameraHomeVision_Error._(7, _omitEnumNames ? '' : 'CAMERA_NAME_EMPTY');
  static const AddCameraHomeVision_Error CAMERA_NAME_EXIST =
      AddCameraHomeVision_Error._(8, _omitEnumNames ? '' : 'CAMERA_NAME_EXIST');
  static const AddCameraHomeVision_Error OVER_QUOTA =
      AddCameraHomeVision_Error._(9, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const AddCameraHomeVision_Error GROUP_INVALID =
      AddCameraHomeVision_Error._(10, _omitEnumNames ? '' : 'GROUP_INVALID');
  static const AddCameraHomeVision_Error UID_INVALID =
      AddCameraHomeVision_Error._(11, _omitEnumNames ? '' : 'UID_INVALID');
  static const AddCameraHomeVision_Error SERVER_P2P_ERROR =
      AddCameraHomeVision_Error._(12, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const AddCameraHomeVision_Error CAMERA_CLOSE_CONNECTION =
      AddCameraHomeVision_Error._(
          13, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const AddCameraHomeVision_Error MAC_ADDRESS_EMPTY =
      AddCameraHomeVision_Error._(
          14, _omitEnumNames ? '' : 'MAC_ADDRESS_EMPTY');
  static const AddCameraHomeVision_Error MAC_ADDRESS_EXIST =
      AddCameraHomeVision_Error._(
          15, _omitEnumNames ? '' : 'MAC_ADDRESS_EXIST');

  static const $core.List<AddCameraHomeVision_Error> values =
      <AddCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_UID_EMPTY,
    CAMERA_UID_EMPTY_NOT_FOUND,
    CAMERA_OFFLINE,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_EXIST,
    LOCATION_INVALID,
    CAMERA_NAME_EMPTY,
    CAMERA_NAME_EXIST,
    OVER_QUOTA,
    GROUP_INVALID,
    UID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    MAC_ADDRESS_EMPTY,
    MAC_ADDRESS_EXIST,
  ];

  static final $core.List<AddCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 15);
  static AddCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCameraHomeVision_Error._(super.value, super.name);
}

class PTZCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const PTZCameraHomeVision_Error ERROR_DEFAULT =
      PTZCameraHomeVision_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const PTZCameraHomeVision_Error CAMERA_NOT_HOMEVISON =
      PTZCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISON');
  static const PTZCameraHomeVision_Error CAMERA_OFFLINE =
      PTZCameraHomeVision_Error._(2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const PTZCameraHomeVision_Error CAMERA_ID_NOT_FOUND =
      PTZCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');

  static const $core.List<PTZCameraHomeVision_Error> values =
      <PTZCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOMEVISON,
    CAMERA_OFFLINE,
    CAMERA_ID_NOT_FOUND,
  ];

  static final $core.List<PTZCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PTZCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PTZCameraHomeVision_Error._(super.value, super.name);
}

class ResetCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const ResetCameraHomeVision_Error ERROR_DEFAULT =
      ResetCameraHomeVision_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ResetCameraHomeVision_Error CAMERA_NOT_HOMEVISON =
      ResetCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISON');
  static const ResetCameraHomeVision_Error CAMERA_OFFLINE =
      ResetCameraHomeVision_Error._(2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const ResetCameraHomeVision_Error CAMERA_ID_NOT_FOUND =
      ResetCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');

  static const $core.List<ResetCameraHomeVision_Error> values =
      <ResetCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOMEVISON,
    CAMERA_OFFLINE,
    CAMERA_ID_NOT_FOUND,
  ];

  static final $core.List<ResetCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ResetCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResetCameraHomeVision_Error._(super.value, super.name);
}

class ReceivePairCamera_pairStatus extends $pb.ProtobufEnum {
  static const ReceivePairCamera_pairStatus DEFAULT =
      ReceivePairCamera_pairStatus._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const ReceivePairCamera_pairStatus CAMERA_ADDED_BY_MYSELF =
      ReceivePairCamera_pairStatus._(
          1, _omitEnumNames ? '' : 'CAMERA_ADDED_BY_MYSELF');
  static const ReceivePairCamera_pairStatus CAMERA_ADDED_BY_OTHER_ACCOUNT =
      ReceivePairCamera_pairStatus._(
          2, _omitEnumNames ? '' : 'CAMERA_ADDED_BY_OTHER_ACCOUNT');

  static const $core.List<ReceivePairCamera_pairStatus> values =
      <ReceivePairCamera_pairStatus>[
    DEFAULT,
    CAMERA_ADDED_BY_MYSELF,
    CAMERA_ADDED_BY_OTHER_ACCOUNT,
  ];

  static final $core.List<ReceivePairCamera_pairStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ReceivePairCamera_pairStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceivePairCamera_pairStatus._(super.value, super.name);
}

class generateQRCodeString_Error extends $pb.ProtobufEnum {
  static const generateQRCodeString_Error ERROR_DEFAULT =
      generateQRCodeString_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const generateQRCodeString_Error SSID_EMPTY =
      generateQRCodeString_Error._(1, _omitEnumNames ? '' : 'SSID_EMPTY');
  static const generateQRCodeString_Error PASS_EMPTY =
      generateQRCodeString_Error._(2, _omitEnumNames ? '' : 'PASS_EMPTY');

  static const $core.List<generateQRCodeString_Error> values =
      <generateQRCodeString_Error>[
    ERROR_DEFAULT,
    SSID_EMPTY,
    PASS_EMPTY,
  ];

  static final $core.List<generateQRCodeString_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static generateQRCodeString_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const generateQRCodeString_Error._(super.value, super.name);
}

class ChangePasswordCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const ChangePasswordCameraHomeVision_Error ERROR_DEFAULT =
      ChangePasswordCameraHomeVision_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ChangePasswordCameraHomeVision_Error CAMERA_NOT_HOMEVISON =
      ChangePasswordCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISON');
  static const ChangePasswordCameraHomeVision_Error CAMERA_OFFLINE =
      ChangePasswordCameraHomeVision_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const ChangePasswordCameraHomeVision_Error CAMERA_ID_NOT_FOUND =
      ChangePasswordCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const ChangePasswordCameraHomeVision_Error OLD_PASS_NOT_MATH =
      ChangePasswordCameraHomeVision_Error._(
          4, _omitEnumNames ? '' : 'OLD_PASS_NOT_MATH');
  static const ChangePasswordCameraHomeVision_Error OLD_PASS_EMPTY =
      ChangePasswordCameraHomeVision_Error._(
          5, _omitEnumNames ? '' : 'OLD_PASS_EMPTY');
  static const ChangePasswordCameraHomeVision_Error NEW_PASS_ENPTY =
      ChangePasswordCameraHomeVision_Error._(
          6, _omitEnumNames ? '' : 'NEW_PASS_ENPTY');
  static const ChangePasswordCameraHomeVision_Error NEW_PASS_INVALID =
      ChangePasswordCameraHomeVision_Error._(
          7, _omitEnumNames ? '' : 'NEW_PASS_INVALID');
  static const ChangePasswordCameraHomeVision_Error
      USER_NAME_OR_PASSWORD_ERROR = ChangePasswordCameraHomeVision_Error._(
          8, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const ChangePasswordCameraHomeVision_Error CAMERA_ID_INVALID =
      ChangePasswordCameraHomeVision_Error._(
          9, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const ChangePasswordCameraHomeVision_Error SERVER_P2P_ERROR =
      ChangePasswordCameraHomeVision_Error._(
          10, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const ChangePasswordCameraHomeVision_Error CAMERA_CLOSE_CONNECTION =
      ChangePasswordCameraHomeVision_Error._(
          11, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const ChangePasswordCameraHomeVision_Error UID_INVALID =
      ChangePasswordCameraHomeVision_Error._(
          12, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<ChangePasswordCameraHomeVision_Error> values =
      <ChangePasswordCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOMEVISON,
    CAMERA_OFFLINE,
    CAMERA_ID_NOT_FOUND,
    OLD_PASS_NOT_MATH,
    OLD_PASS_EMPTY,
    NEW_PASS_ENPTY,
    NEW_PASS_INVALID,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<ChangePasswordCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 12);
  static ChangePasswordCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChangePasswordCameraHomeVision_Error._(super.value, super.name);
}

class MDCameraHomeVision_Level extends $pb.ProtobufEnum {
  static const MDCameraHomeVision_Level LOW =
      MDCameraHomeVision_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const MDCameraHomeVision_Level MEDIUM =
      MDCameraHomeVision_Level._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const MDCameraHomeVision_Level HIGH =
      MDCameraHomeVision_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<MDCameraHomeVision_Level> values =
      <MDCameraHomeVision_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.List<MDCameraHomeVision_Level?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MDCameraHomeVision_Level? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MDCameraHomeVision_Level._(super.value, super.name);
}

class MDCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const MDCameraHomeVision_Error ERROR_DEFAULT =
      MDCameraHomeVision_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const MDCameraHomeVision_Error CAMERA_NOT_HOMEVISON =
      MDCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISON');
  static const MDCameraHomeVision_Error CAMERA_OFFLINE =
      MDCameraHomeVision_Error._(2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const MDCameraHomeVision_Error CAMERA_ID_NOT_FOUND =
      MDCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const MDCameraHomeVision_Error USER_NAME_OR_PASSWORD_ERROR =
      MDCameraHomeVision_Error._(
          8, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const MDCameraHomeVision_Error CAMERA_ID_INVALID =
      MDCameraHomeVision_Error._(9, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const MDCameraHomeVision_Error SERVER_P2P_ERROR =
      MDCameraHomeVision_Error._(10, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const MDCameraHomeVision_Error CAMERA_CLOSE_CONNECTION =
      MDCameraHomeVision_Error._(
          11, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const MDCameraHomeVision_Error UID_INVALID =
      MDCameraHomeVision_Error._(12, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<MDCameraHomeVision_Error> values =
      <MDCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOMEVISON,
    CAMERA_OFFLINE,
    CAMERA_ID_NOT_FOUND,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.Map<$core.int, MDCameraHomeVision_Error> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static MDCameraHomeVision_Error? valueOf($core.int value) => _byValue[value];

  const MDCameraHomeVision_Error._(super.value, super.name);
}

class ResetPassword_Error extends $pb.ProtobufEnum {
  static const ResetPassword_Error ERROR_DEFAULT =
      ResetPassword_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ResetPassword_Error USER_EMPTY =
      ResetPassword_Error._(1, _omitEnumNames ? '' : 'USER_EMPTY');
  static const ResetPassword_Error USER_NOT_FOUND =
      ResetPassword_Error._(2, _omitEnumNames ? '' : 'USER_NOT_FOUND');
  static const ResetPassword_Error PASSWORD_INVALID =
      ResetPassword_Error._(3, _omitEnumNames ? '' : 'PASSWORD_INVALID');
  static const ResetPassword_Error PERMISSION_DENIED =
      ResetPassword_Error._(4, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<ResetPassword_Error> values = <ResetPassword_Error>[
    ERROR_DEFAULT,
    USER_EMPTY,
    USER_NOT_FOUND,
    PASSWORD_INVALID,
    PERMISSION_DENIED,
  ];

  static final $core.List<ResetPassword_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ResetPassword_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResetPassword_Error._(super.value, super.name);
}

class CheckUpdateCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const CheckUpdateCameraHomeVision_Error ERROR_DEFAULT =
      CheckUpdateCameraHomeVision_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const CheckUpdateCameraHomeVision_Error CAMERA_ID_EMPTY =
      CheckUpdateCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const CheckUpdateCameraHomeVision_Error CAMERA_ID_NOT_FOUND =
      CheckUpdateCameraHomeVision_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const CheckUpdateCameraHomeVision_Error PERMISSION_DENIED =
      CheckUpdateCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const CheckUpdateCameraHomeVision_Error CAMERA_NOT_HOMEVISION_DEVICE =
      CheckUpdateCameraHomeVision_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISION_DEVICE');
  static const CheckUpdateCameraHomeVision_Error CAMERA_OFFLINE =
      CheckUpdateCameraHomeVision_Error._(
          5, _omitEnumNames ? '' : 'CAMERA_OFFLINE');

  static const $core.List<CheckUpdateCameraHomeVision_Error> values =
      <CheckUpdateCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    PERMISSION_DENIED,
    CAMERA_NOT_HOMEVISION_DEVICE,
    CAMERA_OFFLINE,
  ];

  static final $core.List<CheckUpdateCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static CheckUpdateCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckUpdateCameraHomeVision_Error._(super.value, super.name);
}

class UpdateFWCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const UpdateFWCameraHomeVision_Error ERROR_DEFAULT =
      UpdateFWCameraHomeVision_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateFWCameraHomeVision_Error CAMERA_ID_EMPTY =
      UpdateFWCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const UpdateFWCameraHomeVision_Error CAMERA_ID_NOT_FOUND =
      UpdateFWCameraHomeVision_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const UpdateFWCameraHomeVision_Error PERMISSION_DENIED =
      UpdateFWCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const UpdateFWCameraHomeVision_Error CAMERA_NOT_HOMEVISION_DEVICE =
      UpdateFWCameraHomeVision_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISION_DEVICE');
  static const UpdateFWCameraHomeVision_Error CAMERA_OFFLINE =
      UpdateFWCameraHomeVision_Error._(
          5, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const UpdateFWCameraHomeVision_Error FW_ID_EMPTY =
      UpdateFWCameraHomeVision_Error._(6, _omitEnumNames ? '' : 'FW_ID_EMPTY');
  static const UpdateFWCameraHomeVision_Error FW_ID_NOT_FOUND =
      UpdateFWCameraHomeVision_Error._(
          7, _omitEnumNames ? '' : 'FW_ID_NOT_FOUND');
  static const UpdateFWCameraHomeVision_Error FW_ID_INVALID =
      UpdateFWCameraHomeVision_Error._(
          8, _omitEnumNames ? '' : 'FW_ID_INVALID');
  static const UpdateFWCameraHomeVision_Error FW_ID_NOT_MATCH_DEVICE =
      UpdateFWCameraHomeVision_Error._(
          9, _omitEnumNames ? '' : 'FW_ID_NOT_MATCH_DEVICE');
  static const UpdateFWCameraHomeVision_Error CAMERA_UPDATING =
      UpdateFWCameraHomeVision_Error._(
          10, _omitEnumNames ? '' : 'CAMERA_UPDATING');

  static const $core.List<UpdateFWCameraHomeVision_Error> values =
      <UpdateFWCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    PERMISSION_DENIED,
    CAMERA_NOT_HOMEVISION_DEVICE,
    CAMERA_OFFLINE,
    FW_ID_EMPTY,
    FW_ID_NOT_FOUND,
    FW_ID_INVALID,
    FW_ID_NOT_MATCH_DEVICE,
    CAMERA_UPDATING,
  ];

  static final $core.List<UpdateFWCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static UpdateFWCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateFWCameraHomeVision_Error._(super.value, super.name);
}

class HomeVisionFlipImage_Error extends $pb.ProtobufEnum {
  static const HomeVisionFlipImage_Error ERROR_DEFAULT =
      HomeVisionFlipImage_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const HomeVisionFlipImage_Error CAMERA_ID_EMPTY =
      HomeVisionFlipImage_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const HomeVisionFlipImage_Error CAMERA_ID_NOT_FOUND =
      HomeVisionFlipImage_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const HomeVisionFlipImage_Error PERMISSION_DENIED =
      HomeVisionFlipImage_Error._(3, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const HomeVisionFlipImage_Error CAMERA_NOT_HOMEVISION_DEVICE =
      HomeVisionFlipImage_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISION_DEVICE');
  static const HomeVisionFlipImage_Error CAMERA_OFFLINE =
      HomeVisionFlipImage_Error._(5, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const HomeVisionFlipImage_Error USER_NAME_OR_PASSWORD_ERROR =
      HomeVisionFlipImage_Error._(
          6, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const HomeVisionFlipImage_Error CAMERA_ID_INVALID =
      HomeVisionFlipImage_Error._(7, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const HomeVisionFlipImage_Error SERVER_P2P_ERROR =
      HomeVisionFlipImage_Error._(8, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const HomeVisionFlipImage_Error CAMERA_CLOSE_CONNECTION =
      HomeVisionFlipImage_Error._(
          9, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const HomeVisionFlipImage_Error UID_INVALID =
      HomeVisionFlipImage_Error._(10, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<HomeVisionFlipImage_Error> values =
      <HomeVisionFlipImage_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    PERMISSION_DENIED,
    CAMERA_NOT_HOMEVISION_DEVICE,
    CAMERA_OFFLINE,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<HomeVisionFlipImage_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static HomeVisionFlipImage_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HomeVisionFlipImage_Error._(super.value, super.name);
}

class HomeVisionFormatSDCard_Error extends $pb.ProtobufEnum {
  static const HomeVisionFormatSDCard_Error ERROR_DEFAULT =
      HomeVisionFormatSDCard_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const HomeVisionFormatSDCard_Error FORMAT_ERROR =
      HomeVisionFormatSDCard_Error._(1, _omitEnumNames ? '' : 'FORMAT_ERROR');
  static const HomeVisionFormatSDCard_Error NO_SD_CARD =
      HomeVisionFormatSDCard_Error._(2, _omitEnumNames ? '' : 'NO_SD_CARD');
  static const HomeVisionFormatSDCard_Error CAMERA_NOT_HOME_VISION_DEVICE =
      HomeVisionFormatSDCard_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_NOT_HOME_VISION_DEVICE');
  static const HomeVisionFormatSDCard_Error CAMERA_OFFLINE =
      HomeVisionFormatSDCard_Error._(4, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const HomeVisionFormatSDCard_Error CAMERA_ID_EMPTY =
      HomeVisionFormatSDCard_Error._(
          5, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const HomeVisionFormatSDCard_Error CAMERA_NOT_FOUND =
      HomeVisionFormatSDCard_Error._(
          6, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const HomeVisionFormatSDCard_Error USER_NAME_OR_PASSWORD_ERROR =
      HomeVisionFormatSDCard_Error._(
          7, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const HomeVisionFormatSDCard_Error CAMERA_ID_INVALID =
      HomeVisionFormatSDCard_Error._(
          8, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const HomeVisionFormatSDCard_Error SERVER_P2P_ERROR =
      HomeVisionFormatSDCard_Error._(
          9, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const HomeVisionFormatSDCard_Error CAMERA_CLOSE_CONNECTION =
      HomeVisionFormatSDCard_Error._(
          10, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const HomeVisionFormatSDCard_Error UID_INVALID =
      HomeVisionFormatSDCard_Error._(11, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<HomeVisionFormatSDCard_Error> values =
      <HomeVisionFormatSDCard_Error>[
    ERROR_DEFAULT,
    FORMAT_ERROR,
    NO_SD_CARD,
    CAMERA_NOT_HOME_VISION_DEVICE,
    CAMERA_OFFLINE,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<HomeVisionFormatSDCard_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 11);
  static HomeVisionFormatSDCard_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HomeVisionFormatSDCard_Error._(super.value, super.name);
}

class ListNotification_GetType extends $pb.ProtobufEnum {
  static const ListNotification_GetType DEFAULT =
      ListNotification_GetType._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const ListNotification_GetType ALL_MSG_DAY =
      ListNotification_GetType._(1, _omitEnumNames ? '' : 'ALL_MSG_DAY');

  static const $core.List<ListNotification_GetType> values =
      <ListNotification_GetType>[
    DEFAULT,
    ALL_MSG_DAY,
  ];

  static final $core.List<ListNotification_GetType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ListNotification_GetType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListNotification_GetType._(super.value, super.name);
}

class MarkReadNotification_Error extends $pb.ProtobufEnum {
  static const MarkReadNotification_Error ERROR_DEFAULT =
      MarkReadNotification_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const MarkReadNotification_Error MSG_ID_EMPTY =
      MarkReadNotification_Error._(1, _omitEnumNames ? '' : 'MSG_ID_EMPTY');
  static const MarkReadNotification_Error MSG_ID_NOT_FOUND =
      MarkReadNotification_Error._(2, _omitEnumNames ? '' : 'MSG_ID_NOT_FOUND');

  static const $core.List<MarkReadNotification_Error> values =
      <MarkReadNotification_Error>[
    ERROR_DEFAULT,
    MSG_ID_EMPTY,
    MSG_ID_NOT_FOUND,
  ];

  static final $core.List<MarkReadNotification_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MarkReadNotification_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MarkReadNotification_Error._(super.value, super.name);
}

class UpdateVolumeCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const UpdateVolumeCameraHomeVision_Error ERROR_DEFAULT =
      UpdateVolumeCameraHomeVision_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateVolumeCameraHomeVision_Error
      CAMERA_NOT_HOME_VISION_DEVICE = UpdateVolumeCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOME_VISION_DEVICE');
  static const UpdateVolumeCameraHomeVision_Error CAMERA_OFFLINE =
      UpdateVolumeCameraHomeVision_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const UpdateVolumeCameraHomeVision_Error CAMERA_ID_EMPTY =
      UpdateVolumeCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const UpdateVolumeCameraHomeVision_Error CAMERA_NOT_FOUND =
      UpdateVolumeCameraHomeVision_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const UpdateVolumeCameraHomeVision_Error VOLUME_INVALID =
      UpdateVolumeCameraHomeVision_Error._(
          5, _omitEnumNames ? '' : 'VOLUME_INVALID');
  static const UpdateVolumeCameraHomeVision_Error USER_NAME_OR_PASSWORD_ERROR =
      UpdateVolumeCameraHomeVision_Error._(
          6, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const UpdateVolumeCameraHomeVision_Error CAMERA_ID_INVALID =
      UpdateVolumeCameraHomeVision_Error._(
          7, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const UpdateVolumeCameraHomeVision_Error SERVER_P2P_ERROR =
      UpdateVolumeCameraHomeVision_Error._(
          8, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const UpdateVolumeCameraHomeVision_Error CAMERA_CLOSE_CONNECTION =
      UpdateVolumeCameraHomeVision_Error._(
          9, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const UpdateVolumeCameraHomeVision_Error UID_INVALID =
      UpdateVolumeCameraHomeVision_Error._(
          10, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<UpdateVolumeCameraHomeVision_Error> values =
      <UpdateVolumeCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOME_VISION_DEVICE,
    CAMERA_OFFLINE,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    VOLUME_INVALID,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<UpdateVolumeCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static UpdateVolumeCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateVolumeCameraHomeVision_Error._(super.value, super.name);
}

class sdCardTypeCameraHomeVision_RecordType extends $pb.ProtobufEnum {
  static const sdCardTypeCameraHomeVision_RecordType OFF =
      sdCardTypeCameraHomeVision_RecordType._(0, _omitEnumNames ? '' : 'OFF');
  static const sdCardTypeCameraHomeVision_RecordType ALWAY =
      sdCardTypeCameraHomeVision_RecordType._(1, _omitEnumNames ? '' : 'ALWAY');
  static const sdCardTypeCameraHomeVision_RecordType SCHEDULE =
      sdCardTypeCameraHomeVision_RecordType._(
          2, _omitEnumNames ? '' : 'SCHEDULE');
  static const sdCardTypeCameraHomeVision_RecordType EVENT =
      sdCardTypeCameraHomeVision_RecordType._(3, _omitEnumNames ? '' : 'EVENT');

  static const $core.List<sdCardTypeCameraHomeVision_RecordType> values =
      <sdCardTypeCameraHomeVision_RecordType>[
    OFF,
    ALWAY,
    SCHEDULE,
    EVENT,
  ];

  static final $core.List<sdCardTypeCameraHomeVision_RecordType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static sdCardTypeCameraHomeVision_RecordType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const sdCardTypeCameraHomeVision_RecordType._(super.value, super.name);
}

class sdCardTypeCameraHomeVision_Error extends $pb.ProtobufEnum {
  static const sdCardTypeCameraHomeVision_Error ERROR_DEFAULT =
      sdCardTypeCameraHomeVision_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const sdCardTypeCameraHomeVision_Error CAMERA_NOT_HOME_VISION_DEVICE =
      sdCardTypeCameraHomeVision_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOME_VISION_DEVICE');
  static const sdCardTypeCameraHomeVision_Error CAMERA_OFFLINE =
      sdCardTypeCameraHomeVision_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const sdCardTypeCameraHomeVision_Error CAMERA_ID_EMPTY =
      sdCardTypeCameraHomeVision_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const sdCardTypeCameraHomeVision_Error CAMERA_NOT_FOUND =
      sdCardTypeCameraHomeVision_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const sdCardTypeCameraHomeVision_Error CAMERA_NO_SDCARD =
      sdCardTypeCameraHomeVision_Error._(
          5, _omitEnumNames ? '' : 'CAMERA_NO_SDCARD');
  static const sdCardTypeCameraHomeVision_Error USER_NAME_OR_PASSWORD_ERROR =
      sdCardTypeCameraHomeVision_Error._(
          6, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const sdCardTypeCameraHomeVision_Error CAMERA_ID_INVALID =
      sdCardTypeCameraHomeVision_Error._(
          7, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const sdCardTypeCameraHomeVision_Error SERVER_P2P_ERROR =
      sdCardTypeCameraHomeVision_Error._(
          8, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const sdCardTypeCameraHomeVision_Error CAMERA_CLOSE_CONNECTION =
      sdCardTypeCameraHomeVision_Error._(
          9, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const sdCardTypeCameraHomeVision_Error UID_INVALID =
      sdCardTypeCameraHomeVision_Error._(
          10, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<sdCardTypeCameraHomeVision_Error> values =
      <sdCardTypeCameraHomeVision_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOME_VISION_DEVICE,
    CAMERA_OFFLINE,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    CAMERA_NO_SDCARD,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<sdCardTypeCameraHomeVision_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static sdCardTypeCameraHomeVision_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const sdCardTypeCameraHomeVision_Error._(super.value, super.name);
}

class ListFileInSDCard_Error extends $pb.ProtobufEnum {
  static const ListFileInSDCard_Error ERROR_DEFAULT =
      ListFileInSDCard_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ListFileInSDCard_Error CAMERA_NOT_HOME_VISION_DEVICE =
      ListFileInSDCard_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_NOT_HOME_VISION_DEVICE');
  static const ListFileInSDCard_Error CAMERA_OFFLINE =
      ListFileInSDCard_Error._(2, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const ListFileInSDCard_Error CAMERA_ID_EMPTY =
      ListFileInSDCard_Error._(3, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const ListFileInSDCard_Error CAMERA_NOT_FOUND =
      ListFileInSDCard_Error._(4, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const ListFileInSDCard_Error CAMERA_NO_SDCARD =
      ListFileInSDCard_Error._(5, _omitEnumNames ? '' : 'CAMERA_NO_SDCARD');
  static const ListFileInSDCard_Error USER_NAME_OR_PASSWORD_ERROR =
      ListFileInSDCard_Error._(
          6, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const ListFileInSDCard_Error CAMERA_ID_INVALID =
      ListFileInSDCard_Error._(7, _omitEnumNames ? '' : 'CAMERA_ID_INVALID');
  static const ListFileInSDCard_Error SERVER_P2P_ERROR =
      ListFileInSDCard_Error._(8, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const ListFileInSDCard_Error CAMERA_CLOSE_CONNECTION =
      ListFileInSDCard_Error._(
          9, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const ListFileInSDCard_Error UID_INVALID =
      ListFileInSDCard_Error._(10, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<ListFileInSDCard_Error> values =
      <ListFileInSDCard_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_HOME_VISION_DEVICE,
    CAMERA_OFFLINE,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    CAMERA_NO_SDCARD,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_ID_INVALID,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<ListFileInSDCard_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static ListFileInSDCard_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListFileInSDCard_Error._(super.value, super.name);
}

class IVAALPRConfig_Error extends $pb.ProtobufEnum {
  static const IVAALPRConfig_Error ERROR_DEFAULT =
      IVAALPRConfig_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const IVAALPRConfig_Error CAMERA_ID_EMPTY =
      IVAALPRConfig_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const IVAALPRConfig_Error CAMERA_NOT_FOUND =
      IVAALPRConfig_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const IVAALPRConfig_Error IVA_SV_ERROR =
      IVAALPRConfig_Error._(3, _omitEnumNames ? '' : 'IVA_SV_ERROR');
  static const IVAALPRConfig_Error IVA_NOT_REGISTER =
      IVAALPRConfig_Error._(4, _omitEnumNames ? '' : 'IVA_NOT_REGISTER');
  static const IVAALPRConfig_Error IVA_TOO_MANY_REQUEST =
      IVAALPRConfig_Error._(5, _omitEnumNames ? '' : 'IVA_TOO_MANY_REQUEST');
  static const IVAALPRConfig_Error OVER_QUOTA =
      IVAALPRConfig_Error._(6, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const IVAALPRConfig_Error PERMISSION_DENIED =
      IVAALPRConfig_Error._(7, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<IVAALPRConfig_Error> values = <IVAALPRConfig_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    IVA_SV_ERROR,
    IVA_NOT_REGISTER,
    IVA_TOO_MANY_REQUEST,
    OVER_QUOTA,
    PERMISSION_DENIED,
  ];

  static final $core.List<IVAALPRConfig_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static IVAALPRConfig_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IVAALPRConfig_Error._(super.value, super.name);
}

class UpdateVehiclePlate_Error extends $pb.ProtobufEnum {
  static const UpdateVehiclePlate_Error ERROR_DEFAULT =
      UpdateVehiclePlate_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateVehiclePlate_Error EVENT_ID_EMPTY =
      UpdateVehiclePlate_Error._(1, _omitEnumNames ? '' : 'EVENT_ID_EMPTY');
  static const UpdateVehiclePlate_Error EVENT_NOT_FOUND =
      UpdateVehiclePlate_Error._(2, _omitEnumNames ? '' : 'EVENT_NOT_FOUND');
  static const UpdateVehiclePlate_Error EVENT_NOT_ALPR =
      UpdateVehiclePlate_Error._(3, _omitEnumNames ? '' : 'EVENT_NOT_ALPR');
  static const UpdateVehiclePlate_Error PERMISSION_DENIED =
      UpdateVehiclePlate_Error._(4, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<UpdateVehiclePlate_Error> values =
      <UpdateVehiclePlate_Error>[
    ERROR_DEFAULT,
    EVENT_ID_EMPTY,
    EVENT_NOT_FOUND,
    EVENT_NOT_ALPR,
    PERMISSION_DENIED,
  ];

  static final $core.List<UpdateVehiclePlate_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static UpdateVehiclePlate_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateVehiclePlate_Error._(super.value, super.name);
}

class StartRecordStream_Error extends $pb.ProtobufEnum {
  static const StartRecordStream_Error ERROR_DEFAULT =
      StartRecordStream_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const StartRecordStream_Error CAMERA_ID_EMPTY =
      StartRecordStream_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const StartRecordStream_Error CAMERA_NOT_FOUND =
      StartRecordStream_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const StartRecordStream_Error SV_RECORD_NOT_AVALIABLE =
      StartRecordStream_Error._(
          3, _omitEnumNames ? '' : 'SV_RECORD_NOT_AVALIABLE');
  static const StartRecordStream_Error RECORD_ERROR =
      StartRecordStream_Error._(4, _omitEnumNames ? '' : 'RECORD_ERROR');
  static const StartRecordStream_Error CAMERA_NOT_RECORD_IN_CLOUD =
      StartRecordStream_Error._(
          5, _omitEnumNames ? '' : 'CAMERA_NOT_RECORD_IN_CLOUD');

  static const $core.List<StartRecordStream_Error> values =
      <StartRecordStream_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    SV_RECORD_NOT_AVALIABLE,
    RECORD_ERROR,
    CAMERA_NOT_RECORD_IN_CLOUD,
  ];

  static final $core.List<StartRecordStream_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static StartRecordStream_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StartRecordStream_Error._(super.value, super.name);
}

class StopRecordStream_Error extends $pb.ProtobufEnum {
  static const StopRecordStream_Error ERROR_DEFAULT =
      StopRecordStream_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const StopRecordStream_Error RECORD_ID_EMPTY =
      StopRecordStream_Error._(1, _omitEnumNames ? '' : 'RECORD_ID_EMPTY');
  static const StopRecordStream_Error RECORD_NOT_FOUND =
      StopRecordStream_Error._(2, _omitEnumNames ? '' : 'RECORD_NOT_FOUND');
  static const StopRecordStream_Error SV_RECORD_NOT_AVALIABLE =
      StopRecordStream_Error._(
          3, _omitEnumNames ? '' : 'SV_RECORD_NOT_AVALIABLE');
  static const StopRecordStream_Error RECORD_ERROR =
      StopRecordStream_Error._(4, _omitEnumNames ? '' : 'RECORD_ERROR');
  static const StopRecordStream_Error CAMERA_NOT_RECORD_IN_CLOUD =
      StopRecordStream_Error._(
          5, _omitEnumNames ? '' : 'CAMERA_NOT_RECORD_IN_CLOUD');

  static const $core.List<StopRecordStream_Error> values =
      <StopRecordStream_Error>[
    ERROR_DEFAULT,
    RECORD_ID_EMPTY,
    RECORD_NOT_FOUND,
    SV_RECORD_NOT_AVALIABLE,
    RECORD_ERROR,
    CAMERA_NOT_RECORD_IN_CLOUD,
  ];

  static final $core.List<StopRecordStream_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static StopRecordStream_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StopRecordStream_Error._(super.value, super.name);
}

class ConfigOnOffBarrier_Error extends $pb.ProtobufEnum {
  static const ConfigOnOffBarrier_Error ERROR_DEFAULT =
      ConfigOnOffBarrier_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ConfigOnOffBarrier_Error START_TIME_INVALID =
      ConfigOnOffBarrier_Error._(1, _omitEnumNames ? '' : 'START_TIME_INVALID');
  static const ConfigOnOffBarrier_Error END_TIME_INVALID =
      ConfigOnOffBarrier_Error._(2, _omitEnumNames ? '' : 'END_TIME_INVALID');
  static const ConfigOnOffBarrier_Error END_TIME_BEFORE_START_TIME =
      ConfigOnOffBarrier_Error._(
          3, _omitEnumNames ? '' : 'END_TIME_BEFORE_START_TIME');

  static const $core.List<ConfigOnOffBarrier_Error> values =
      <ConfigOnOffBarrier_Error>[
    ERROR_DEFAULT,
    START_TIME_INVALID,
    END_TIME_INVALID,
    END_TIME_BEFORE_START_TIME,
  ];

  static final $core.List<ConfigOnOffBarrier_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ConfigOnOffBarrier_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConfigOnOffBarrier_Error._(super.value, super.name);
}

class UpdateInfoVehicle_Error extends $pb.ProtobufEnum {
  static const UpdateInfoVehicle_Error ERROR_DEFAULT =
      UpdateInfoVehicle_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateInfoVehicle_Error VEHICLE_ID_EMPTY =
      UpdateInfoVehicle_Error._(1, _omitEnumNames ? '' : 'VEHICLE_ID_EMPTY');
  static const UpdateInfoVehicle_Error VEHICLE_NOT_FOUND =
      UpdateInfoVehicle_Error._(2, _omitEnumNames ? '' : 'VEHICLE_NOT_FOUND');
  static const UpdateInfoVehicle_Error VEHICLE_PLATE_EMPTY =
      UpdateInfoVehicle_Error._(3, _omitEnumNames ? '' : 'VEHICLE_PLATE_EMPTY');
  static const UpdateInfoVehicle_Error VEHICLE_OWNER_EMPTY =
      UpdateInfoVehicle_Error._(4, _omitEnumNames ? '' : 'VEHICLE_OWNER_EMPTY');
  static const UpdateInfoVehicle_Error VEHICLE_PLATE_EXIST =
      UpdateInfoVehicle_Error._(5, _omitEnumNames ? '' : 'VEHICLE_PLATE_EXIST');
  static const UpdateInfoVehicle_Error PERMISSION_DENIED =
      UpdateInfoVehicle_Error._(6, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<UpdateInfoVehicle_Error> values =
      <UpdateInfoVehicle_Error>[
    ERROR_DEFAULT,
    VEHICLE_ID_EMPTY,
    VEHICLE_NOT_FOUND,
    VEHICLE_PLATE_EMPTY,
    VEHICLE_OWNER_EMPTY,
    VEHICLE_PLATE_EXIST,
    PERMISSION_DENIED,
  ];

  static final $core.List<UpdateInfoVehicle_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static UpdateInfoVehicle_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateInfoVehicle_Error._(super.value, super.name);
}

class AddVehicle_Error extends $pb.ProtobufEnum {
  static const AddVehicle_Error ERROR_DEFAULT =
      AddVehicle_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddVehicle_Error VEHICLE_PLATE_EMPTY =
      AddVehicle_Error._(1, _omitEnumNames ? '' : 'VEHICLE_PLATE_EMPTY');
  static const AddVehicle_Error VEHICLE_TYPE_INVALID =
      AddVehicle_Error._(2, _omitEnumNames ? '' : 'VEHICLE_TYPE_INVALID');
  static const AddVehicle_Error VEHICLE_OWNER_EMPTY =
      AddVehicle_Error._(3, _omitEnumNames ? '' : 'VEHICLE_OWNER_EMPTY');
  static const AddVehicle_Error VEHICLE_PLATE_EXIST =
      AddVehicle_Error._(4, _omitEnumNames ? '' : 'VEHICLE_PLATE_EXIST');
  static const AddVehicle_Error PERMISSION_DENIED =
      AddVehicle_Error._(5, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<AddVehicle_Error> values = <AddVehicle_Error>[
    ERROR_DEFAULT,
    VEHICLE_PLATE_EMPTY,
    VEHICLE_TYPE_INVALID,
    VEHICLE_OWNER_EMPTY,
    VEHICLE_PLATE_EXIST,
    PERMISSION_DENIED,
  ];

  static final $core.List<AddVehicle_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static AddVehicle_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddVehicle_Error._(super.value, super.name);
}

class DeleteVehicle_Error extends $pb.ProtobufEnum {
  static const DeleteVehicle_Error ERROR_DEFAULT =
      DeleteVehicle_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const DeleteVehicle_Error VEHICLE_NOT_FOUND =
      DeleteVehicle_Error._(1, _omitEnumNames ? '' : 'VEHICLE_NOT_FOUND');
  static const DeleteVehicle_Error PERMISSION_DENIED =
      DeleteVehicle_Error._(2, _omitEnumNames ? '' : 'PERMISSION_DENIED');

  static const $core.List<DeleteVehicle_Error> values = <DeleteVehicle_Error>[
    ERROR_DEFAULT,
    VEHICLE_NOT_FOUND,
    PERMISSION_DENIED,
  ];

  static final $core.List<DeleteVehicle_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static DeleteVehicle_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeleteVehicle_Error._(super.value, super.name);
}

class ConfigInOutCam_Error extends $pb.ProtobufEnum {
  static const ConfigInOutCam_Error ERROR_DEFAULT =
      ConfigInOutCam_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ConfigInOutCam_Error CAM_EMPTY =
      ConfigInOutCam_Error._(1, _omitEnumNames ? '' : 'CAM_EMPTY');
  static const ConfigInOutCam_Error CAM_NOT_FOUND =
      ConfigInOutCam_Error._(2, _omitEnumNames ? '' : 'CAM_NOT_FOUND');

  static const $core.List<ConfigInOutCam_Error> values = <ConfigInOutCam_Error>[
    ERROR_DEFAULT,
    CAM_EMPTY,
    CAM_NOT_FOUND,
  ];

  static final $core.List<ConfigInOutCam_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ConfigInOutCam_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConfigInOutCam_Error._(super.value, super.name);
}

class AddCameraRTMP_Error extends $pb.ProtobufEnum {
  static const AddCameraRTMP_Error ERROR_DEFAULT =
      AddCameraRTMP_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCameraRTMP_Error USER_NOT_FOUND =
      AddCameraRTMP_Error._(2, _omitEnumNames ? '' : 'USER_NOT_FOUND');
  static const AddCameraRTMP_Error CAMERA_NAME_EMPTY =
      AddCameraRTMP_Error._(3, _omitEnumNames ? '' : 'CAMERA_NAME_EMPTY');
  static const AddCameraRTMP_Error ENCODER_NOT_FOUND =
      AddCameraRTMP_Error._(4, _omitEnumNames ? '' : 'ENCODER_NOT_FOUND');
  static const AddCameraRTMP_Error ENCODER_INVALID =
      AddCameraRTMP_Error._(5, _omitEnumNames ? '' : 'ENCODER_INVALID');
  static const AddCameraRTMP_Error LOCATION_INVALID =
      AddCameraRTMP_Error._(8, _omitEnumNames ? '' : 'LOCATION_INVALID');
  static const AddCameraRTMP_Error CAMERA_NAME_EXIST =
      AddCameraRTMP_Error._(9, _omitEnumNames ? '' : 'CAMERA_NAME_EXIST');
  static const AddCameraRTMP_Error OVER_QUOTA =
      AddCameraRTMP_Error._(12, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const AddCameraRTMP_Error GROUP_INVALID =
      AddCameraRTMP_Error._(13, _omitEnumNames ? '' : 'GROUP_INVALID');

  static const $core.List<AddCameraRTMP_Error> values = <AddCameraRTMP_Error>[
    ERROR_DEFAULT,
    USER_NOT_FOUND,
    CAMERA_NAME_EMPTY,
    ENCODER_NOT_FOUND,
    ENCODER_INVALID,
    LOCATION_INVALID,
    CAMERA_NAME_EXIST,
    OVER_QUOTA,
    GROUP_INVALID,
  ];

  static final $core.Map<$core.int, AddCameraRTMP_Error> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AddCameraRTMP_Error? valueOf($core.int value) => _byValue[value];

  const AddCameraRTMP_Error._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
