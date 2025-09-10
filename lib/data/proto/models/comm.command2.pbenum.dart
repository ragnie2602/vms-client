// This is a generated file - do not edit.
//
// Generated from comm.command2.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FilterAlarmCamera_Type extends $pb.ProtobufEnum {
  static const FilterAlarmCamera_Type DETECT_MOTION =
      FilterAlarmCamera_Type._(0, _omitEnumNames ? '' : 'DETECT_MOTION');
  static const FilterAlarmCamera_Type DETECT_SOUND =
      FilterAlarmCamera_Type._(1, _omitEnumNames ? '' : 'DETECT_SOUND');
  static const FilterAlarmCamera_Type ALL =
      FilterAlarmCamera_Type._(2, _omitEnumNames ? '' : 'ALL');
  static const FilterAlarmCamera_Type LINE_CROSSING =
      FilterAlarmCamera_Type._(3, _omitEnumNames ? '' : 'LINE_CROSSING');
  static const FilterAlarmCamera_Type INTRUSION_DETECTION =
      FilterAlarmCamera_Type._(4, _omitEnumNames ? '' : 'INTRUSION_DETECTION');

  static const $core.List<FilterAlarmCamera_Type> values =
      <FilterAlarmCamera_Type>[
    DETECT_MOTION,
    DETECT_SOUND,
    ALL,
    LINE_CROSSING,
    INTRUSION_DETECTION,
  ];

  static final $core.List<FilterAlarmCamera_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static FilterAlarmCamera_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FilterAlarmCamera_Type._(super.value, super.name);
}

class FilterVideoImageCamera_Storage extends $pb.ProtobufEnum {
  static const FilterVideoImageCamera_Storage CLOUD_STORAGE =
      FilterVideoImageCamera_Storage._(
          0, _omitEnumNames ? '' : 'CLOUD_STORAGE');
  static const FilterVideoImageCamera_Storage SD_CARD =
      FilterVideoImageCamera_Storage._(1, _omitEnumNames ? '' : 'SD_CARD');

  static const $core.List<FilterVideoImageCamera_Storage> values =
      <FilterVideoImageCamera_Storage>[
    CLOUD_STORAGE,
    SD_CARD,
  ];

  static final $core.List<FilterVideoImageCamera_Storage?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static FilterVideoImageCamera_Storage? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FilterVideoImageCamera_Storage._(super.value, super.name);
}

class FilterVideoImageCamera_Type extends $pb.ProtobufEnum {
  static const FilterVideoImageCamera_Type VIDEO =
      FilterVideoImageCamera_Type._(0, _omitEnumNames ? '' : 'VIDEO');
  static const FilterVideoImageCamera_Type IMAGE =
      FilterVideoImageCamera_Type._(1, _omitEnumNames ? '' : 'IMAGE');

  static const $core.List<FilterVideoImageCamera_Type> values =
      <FilterVideoImageCamera_Type>[
    VIDEO,
    IMAGE,
  ];

  static final $core.List<FilterVideoImageCamera_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static FilterVideoImageCamera_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FilterVideoImageCamera_Type._(super.value, super.name);
}

class FilterVideoImageCamera_Error extends $pb.ProtobufEnum {
  static const FilterVideoImageCamera_Error ERROR_DEFAULT =
      FilterVideoImageCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const FilterVideoImageCamera_Error CAMERA_OFFLINE =
      FilterVideoImageCamera_Error._(1, _omitEnumNames ? '' : 'CAMERA_OFFLINE');

  static const $core.List<FilterVideoImageCamera_Error> values =
      <FilterVideoImageCamera_Error>[
    ERROR_DEFAULT,
    CAMERA_OFFLINE,
  ];

  static final $core.List<FilterVideoImageCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static FilterVideoImageCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FilterVideoImageCamera_Error._(super.value, super.name);
}

class ResponseShareCamera_Action extends $pb.ProtobufEnum {
  static const ResponseShareCamera_Action ACCEPT =
      ResponseShareCamera_Action._(0, _omitEnumNames ? '' : 'ACCEPT');
  static const ResponseShareCamera_Action DECLINE =
      ResponseShareCamera_Action._(1, _omitEnumNames ? '' : 'DECLINE');

  static const $core.List<ResponseShareCamera_Action> values =
      <ResponseShareCamera_Action>[
    ACCEPT,
    DECLINE,
  ];

  static final $core.List<ResponseShareCamera_Action?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ResponseShareCamera_Action? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResponseShareCamera_Action._(super.value, super.name);
}

class ResponseShareCamera_Error extends $pb.ProtobufEnum {
  static const ResponseShareCamera_Error ERROR_DEFAULT =
      ResponseShareCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ResponseShareCamera_Error INVALID_SHARE =
      ResponseShareCamera_Error._(1, _omitEnumNames ? '' : 'INVALID_SHARE');

  static const $core.List<ResponseShareCamera_Error> values =
      <ResponseShareCamera_Error>[
    ERROR_DEFAULT,
    INVALID_SHARE,
  ];

  static final $core.List<ResponseShareCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ResponseShareCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResponseShareCamera_Error._(super.value, super.name);
}

class UpdateShareCamera_Role extends $pb.ProtobufEnum {
  static const UpdateShareCamera_Role VIEW =
      UpdateShareCamera_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const UpdateShareCamera_Role FULL =
      UpdateShareCamera_Role._(1, _omitEnumNames ? '' : 'FULL');

  static const $core.List<UpdateShareCamera_Role> values =
      <UpdateShareCamera_Role>[
    VIEW,
    FULL,
  ];

  static final $core.List<UpdateShareCamera_Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static UpdateShareCamera_Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateShareCamera_Role._(super.value, super.name);
}

class UpdateShareCamera_Error extends $pb.ProtobufEnum {
  static const UpdateShareCamera_Error ERROR_DEFAULT =
      UpdateShareCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateShareCamera_Error ROLE_NOT_CHANGE =
      UpdateShareCamera_Error._(1, _omitEnumNames ? '' : 'ROLE_NOT_CHANGE');
  static const UpdateShareCamera_Error ACCOUNT_SHARED_NOT_EXIST =
      UpdateShareCamera_Error._(
          2, _omitEnumNames ? '' : 'ACCOUNT_SHARED_NOT_EXIST');

  static const $core.List<UpdateShareCamera_Error> values =
      <UpdateShareCamera_Error>[
    ERROR_DEFAULT,
    ROLE_NOT_CHANGE,
    ACCOUNT_SHARED_NOT_EXIST,
  ];

  static final $core.List<UpdateShareCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static UpdateShareCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateShareCamera_Error._(super.value, super.name);
}

class DeleteShareCamera_Error extends $pb.ProtobufEnum {
  static const DeleteShareCamera_Error ERROR_DEFAULT =
      DeleteShareCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const DeleteShareCamera_Error INVALID_SHARE =
      DeleteShareCamera_Error._(1, _omitEnumNames ? '' : 'INVALID_SHARE');

  static const $core.List<DeleteShareCamera_Error> values =
      <DeleteShareCamera_Error>[
    ERROR_DEFAULT,
    INVALID_SHARE,
  ];

  static final $core.List<DeleteShareCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static DeleteShareCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeleteShareCamera_Error._(super.value, super.name);
}

class ListSharedCamera_Role extends $pb.ProtobufEnum {
  static const ListSharedCamera_Role VIEW =
      ListSharedCamera_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const ListSharedCamera_Role FULL =
      ListSharedCamera_Role._(1, _omitEnumNames ? '' : 'FULL');

  static const $core.List<ListSharedCamera_Role> values =
      <ListSharedCamera_Role>[
    VIEW,
    FULL,
  ];

  static final $core.List<ListSharedCamera_Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ListSharedCamera_Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListSharedCamera_Role._(super.value, super.name);
}

class ListSharedCamera_GroupShareRole extends $pb.ProtobufEnum {
  static const ListSharedCamera_GroupShareRole NOT_USE_ =
      ListSharedCamera_GroupShareRole._(0, _omitEnumNames ? '' : '_NOT_USE');
  static const ListSharedCamera_GroupShareRole GVIEW =
      ListSharedCamera_GroupShareRole._(1, _omitEnumNames ? '' : 'GVIEW');
  static const ListSharedCamera_GroupShareRole GMANAGER =
      ListSharedCamera_GroupShareRole._(2, _omitEnumNames ? '' : 'GMANAGER');

  static const $core.List<ListSharedCamera_GroupShareRole> values =
      <ListSharedCamera_GroupShareRole>[
    NOT_USE_,
    GVIEW,
    GMANAGER,
  ];

  static final $core.List<ListSharedCamera_GroupShareRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ListSharedCamera_GroupShareRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListSharedCamera_GroupShareRole._(super.value, super.name);
}

class ListSharedCamera_Status extends $pb.ProtobufEnum {
  static const ListSharedCamera_Status PENDING =
      ListSharedCamera_Status._(0, _omitEnumNames ? '' : 'PENDING');
  static const ListSharedCamera_Status ACCEPT =
      ListSharedCamera_Status._(1, _omitEnumNames ? '' : 'ACCEPT');
  static const ListSharedCamera_Status DELINE =
      ListSharedCamera_Status._(2, _omitEnumNames ? '' : 'DELINE');

  static const $core.List<ListSharedCamera_Status> values =
      <ListSharedCamera_Status>[
    PENDING,
    ACCEPT,
    DELINE,
  ];

  static final $core.List<ListSharedCamera_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ListSharedCamera_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListSharedCamera_Status._(super.value, super.name);
}

class ListSharedCamera_SharingRecord_ShareType extends $pb.ProtobufEnum {
  static const ListSharedCamera_SharingRecord_ShareType CAMERA =
      ListSharedCamera_SharingRecord_ShareType._(
          0, _omitEnumNames ? '' : 'CAMERA');
  static const ListSharedCamera_SharingRecord_ShareType GROUP =
      ListSharedCamera_SharingRecord_ShareType._(
          1, _omitEnumNames ? '' : 'GROUP');

  static const $core.List<ListSharedCamera_SharingRecord_ShareType> values =
      <ListSharedCamera_SharingRecord_ShareType>[
    CAMERA,
    GROUP,
  ];

  static final $core.List<ListSharedCamera_SharingRecord_ShareType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ListSharedCamera_SharingRecord_ShareType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListSharedCamera_SharingRecord_ShareType._(super.value, super.name);
}

class GetTimeShiftVideoCloudCamera_Error extends $pb.ProtobufEnum {
  static const GetTimeShiftVideoCloudCamera_Error DEFAULT =
      GetTimeShiftVideoCloudCamera_Error._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const GetTimeShiftVideoCloudCamera_Error CAMERA_ID_EMPTY =
      GetTimeShiftVideoCloudCamera_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const GetTimeShiftVideoCloudCamera_Error CAMERA_ID_NOT_FOUND =
      GetTimeShiftVideoCloudCamera_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');

  static const $core.List<GetTimeShiftVideoCloudCamera_Error> values =
      <GetTimeShiftVideoCloudCamera_Error>[
    DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
  ];

  static final $core.List<GetTimeShiftVideoCloudCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GetTimeShiftVideoCloudCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetTimeShiftVideoCloudCamera_Error._(super.value, super.name);
}

class SettingCloudStorage_StorageMode extends $pb.ProtobufEnum {
  static const SettingCloudStorage_StorageMode CLOUD =
      SettingCloudStorage_StorageMode._(0, _omitEnumNames ? '' : 'CLOUD');
  static const SettingCloudStorage_StorageMode CLOUD_AND_SDCARD =
      SettingCloudStorage_StorageMode._(
          1, _omitEnumNames ? '' : 'CLOUD_AND_SDCARD');

  static const $core.List<SettingCloudStorage_StorageMode> values =
      <SettingCloudStorage_StorageMode>[
    CLOUD,
    CLOUD_AND_SDCARD,
  ];

  static final $core.List<SettingCloudStorage_StorageMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SettingCloudStorage_StorageMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SettingCloudStorage_StorageMode._(super.value, super.name);
}

class SettingCloudStorage_Error extends $pb.ProtobufEnum {
  static const SettingCloudStorage_Error ERROR_DEFAULT =
      SettingCloudStorage_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const SettingCloudStorage_Error CAMERA_ID_INVLID =
      SettingCloudStorage_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_INVLID');
  static const SettingCloudStorage_Error NUMBER_DAY_RECORD_INVALID =
      SettingCloudStorage_Error._(
          3, _omitEnumNames ? '' : 'NUMBER_DAY_RECORD_INVALID');
  static const SettingCloudStorage_Error STORAGE_MODE_INVALID =
      SettingCloudStorage_Error._(
          4, _omitEnumNames ? '' : 'STORAGE_MODE_INVALID');

  static const $core.List<SettingCloudStorage_Error> values =
      <SettingCloudStorage_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_INVLID,
    NUMBER_DAY_RECORD_INVALID,
    STORAGE_MODE_INVALID,
  ];

  static final $core.List<SettingCloudStorage_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static SettingCloudStorage_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SettingCloudStorage_Error._(super.value, super.name);
}

class AddCameraRTSP_Error extends $pb.ProtobufEnum {
  static const AddCameraRTSP_Error ERROR_DEFAULT =
      AddCameraRTSP_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCameraRTSP_Error RTSP_EMPTY =
      AddCameraRTSP_Error._(1, _omitEnumNames ? '' : 'RTSP_EMPTY');
  static const AddCameraRTSP_Error USER_NOT_FOUND =
      AddCameraRTSP_Error._(2, _omitEnumNames ? '' : 'USER_NOT_FOUND');
  static const AddCameraRTSP_Error CAMERA_NAME_EMPTY =
      AddCameraRTSP_Error._(3, _omitEnumNames ? '' : 'CAMERA_NAME_EMPTY');
  static const AddCameraRTSP_Error IP_OR_DOMAIN_NOT_AVAILABLE =
      AddCameraRTSP_Error._(
          4, _omitEnumNames ? '' : 'IP_OR_DOMAIN_NOT_AVAILABLE');
  static const AddCameraRTSP_Error USER_NAME_OR_PASSWORD_ERROR =
      AddCameraRTSP_Error._(
          5, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const AddCameraRTSP_Error CAMERA_PORT_ERROR =
      AddCameraRTSP_Error._(6, _omitEnumNames ? '' : 'CAMERA_PORT_ERROR');
  static const AddCameraRTSP_Error CAMERA_EXIST =
      AddCameraRTSP_Error._(7, _omitEnumNames ? '' : 'CAMERA_EXIST');
  static const AddCameraRTSP_Error LOCATION_INVALID =
      AddCameraRTSP_Error._(8, _omitEnumNames ? '' : 'LOCATION_INVALID');
  static const AddCameraRTSP_Error CAMERA_NAME_EXIST =
      AddCameraRTSP_Error._(9, _omitEnumNames ? '' : 'CAMERA_NAME_EXIST');
  static const AddCameraRTSP_Error BOX_ID_INVALID =
      AddCameraRTSP_Error._(10, _omitEnumNames ? '' : 'BOX_ID_INVALID');
  static const AddCameraRTSP_Error BOX_OFFLINE =
      AddCameraRTSP_Error._(11, _omitEnumNames ? '' : 'BOX_OFFLINE');
  static const AddCameraRTSP_Error OVER_QUOTA =
      AddCameraRTSP_Error._(12, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const AddCameraRTSP_Error GROUP_INVALID =
      AddCameraRTSP_Error._(13, _omitEnumNames ? '' : 'GROUP_INVALID');
  static const AddCameraRTSP_Error PACKAGE_NOT_SUPPORT =
      AddCameraRTSP_Error._(14, _omitEnumNames ? '' : 'PACKAGE_NOT_SUPPORT');
  static const AddCameraRTSP_Error SUB_STREAM_INVALID =
      AddCameraRTSP_Error._(15, _omitEnumNames ? '' : 'SUB_STREAM_INVALID');

  static const $core.List<AddCameraRTSP_Error> values = <AddCameraRTSP_Error>[
    ERROR_DEFAULT,
    RTSP_EMPTY,
    USER_NOT_FOUND,
    CAMERA_NAME_EMPTY,
    IP_OR_DOMAIN_NOT_AVAILABLE,
    USER_NAME_OR_PASSWORD_ERROR,
    CAMERA_PORT_ERROR,
    CAMERA_EXIST,
    LOCATION_INVALID,
    CAMERA_NAME_EXIST,
    BOX_ID_INVALID,
    BOX_OFFLINE,
    OVER_QUOTA,
    GROUP_INVALID,
    PACKAGE_NOT_SUPPORT,
    SUB_STREAM_INVALID,
  ];

  static final $core.List<AddCameraRTSP_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 15);
  static AddCameraRTSP_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCameraRTSP_Error._(super.value, super.name);
}

class AddCameraOnVif_Error extends $pb.ProtobufEnum {
  static const AddCameraOnVif_Error ERROR_DEFAULT =
      AddCameraOnVif_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCameraOnVif_Error RTSP_EMPTY =
      AddCameraOnVif_Error._(1, _omitEnumNames ? '' : 'RTSP_EMPTY');
  static const AddCameraOnVif_Error USER_NOT_FOUND =
      AddCameraOnVif_Error._(2, _omitEnumNames ? '' : 'USER_NOT_FOUND');
  static const AddCameraOnVif_Error CAMERA_NAME_EMPTY =
      AddCameraOnVif_Error._(3, _omitEnumNames ? '' : 'CAMERA_NAME_EMPTY');
  static const AddCameraOnVif_Error IP_OR_DOMAIN_NOT_AVAILABLE =
      AddCameraOnVif_Error._(
          4, _omitEnumNames ? '' : 'IP_OR_DOMAIN_NOT_AVAILABLE');
  static const AddCameraOnVif_Error USER_NAME_OR_PASSWORD_ERROR =
      AddCameraOnVif_Error._(
          5, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const AddCameraOnVif_Error SERIAL_NUMBER_EMPTY =
      AddCameraOnVif_Error._(6, _omitEnumNames ? '' : 'SERIAL_NUMBER_EMPTY');
  static const AddCameraOnVif_Error CAMERA_EXIST =
      AddCameraOnVif_Error._(7, _omitEnumNames ? '' : 'CAMERA_EXIST');
  static const AddCameraOnVif_Error RTSP_PORT_ERROR =
      AddCameraOnVif_Error._(8, _omitEnumNames ? '' : 'RTSP_PORT_ERROR');
  static const AddCameraOnVif_Error LOCATION_INVALID =
      AddCameraOnVif_Error._(9, _omitEnumNames ? '' : 'LOCATION_INVALID');
  static const AddCameraOnVif_Error CAMERA_NAME_EXIST =
      AddCameraOnVif_Error._(10, _omitEnumNames ? '' : 'CAMERA_NAME_EXIST');
  static const AddCameraOnVif_Error SERIAL_NUMBER_NOT_MATH =
      AddCameraOnVif_Error._(
          11, _omitEnumNames ? '' : 'SERIAL_NUMBER_NOT_MATH');
  static const AddCameraOnVif_Error BOX_ID_INVALID =
      AddCameraOnVif_Error._(12, _omitEnumNames ? '' : 'BOX_ID_INVALID');
  static const AddCameraOnVif_Error BOX_OFFLINE =
      AddCameraOnVif_Error._(13, _omitEnumNames ? '' : 'BOX_OFFLINE');
  static const AddCameraOnVif_Error RTSP_IP_OR_DOMAIN_NOT_AVAILABLE =
      AddCameraOnVif_Error._(
          14, _omitEnumNames ? '' : 'RTSP_IP_OR_DOMAIN_NOT_AVAILABLE');
  static const AddCameraOnVif_Error RTSP_USER_NAME_OR_PASSWORD_ERROR =
      AddCameraOnVif_Error._(
          15, _omitEnumNames ? '' : 'RTSP_USER_NAME_OR_PASSWORD_ERROR');
  static const AddCameraOnVif_Error OVER_QUOTA =
      AddCameraOnVif_Error._(16, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const AddCameraOnVif_Error GROUP_INVALID =
      AddCameraOnVif_Error._(17, _omitEnumNames ? '' : 'GROUP_INVALID');
  static const AddCameraOnVif_Error PACKAGE_NOT_SUPPORT =
      AddCameraOnVif_Error._(18, _omitEnumNames ? '' : 'PACKAGE_NOT_SUPPORT');
  static const AddCameraOnVif_Error SUB_STREAM_INVALID =
      AddCameraOnVif_Error._(19, _omitEnumNames ? '' : 'SUB_STREAM_INVALID');

  static const $core.List<AddCameraOnVif_Error> values = <AddCameraOnVif_Error>[
    ERROR_DEFAULT,
    RTSP_EMPTY,
    USER_NOT_FOUND,
    CAMERA_NAME_EMPTY,
    IP_OR_DOMAIN_NOT_AVAILABLE,
    USER_NAME_OR_PASSWORD_ERROR,
    SERIAL_NUMBER_EMPTY,
    CAMERA_EXIST,
    RTSP_PORT_ERROR,
    LOCATION_INVALID,
    CAMERA_NAME_EXIST,
    SERIAL_NUMBER_NOT_MATH,
    BOX_ID_INVALID,
    BOX_OFFLINE,
    RTSP_IP_OR_DOMAIN_NOT_AVAILABLE,
    RTSP_USER_NAME_OR_PASSWORD_ERROR,
    OVER_QUOTA,
    GROUP_INVALID,
    PACKAGE_NOT_SUPPORT,
    SUB_STREAM_INVALID,
  ];

  static final $core.List<AddCameraOnVif_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 19);
  static AddCameraOnVif_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCameraOnVif_Error._(super.value, super.name);
}

class GetCloudRecordPlayback_Error extends $pb.ProtobufEnum {
  static const GetCloudRecordPlayback_Error ERROR_DEFAULT =
      GetCloudRecordPlayback_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const GetCloudRecordPlayback_Error CAMERA_ID_EMPTY =
      GetCloudRecordPlayback_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const GetCloudRecordPlayback_Error CAMERA_NOT_FOUND =
      GetCloudRecordPlayback_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');

  static const $core.List<GetCloudRecordPlayback_Error> values =
      <GetCloudRecordPlayback_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
  ];

  static final $core.List<GetCloudRecordPlayback_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GetCloudRecordPlayback_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetCloudRecordPlayback_Error._(super.value, super.name);
}

class GetEventCloud_ALPR_Vehicle_Type extends $pb.ProtobufEnum {
  static const GetEventCloud_ALPR_Vehicle_Type ALL =
      GetEventCloud_ALPR_Vehicle_Type._(0, _omitEnumNames ? '' : 'ALL');
  static const GetEventCloud_ALPR_Vehicle_Type CAR =
      GetEventCloud_ALPR_Vehicle_Type._(1, _omitEnumNames ? '' : 'CAR');
  static const GetEventCloud_ALPR_Vehicle_Type TRUCK =
      GetEventCloud_ALPR_Vehicle_Type._(2, _omitEnumNames ? '' : 'TRUCK');
  static const GetEventCloud_ALPR_Vehicle_Type MOTORBIKE =
      GetEventCloud_ALPR_Vehicle_Type._(3, _omitEnumNames ? '' : 'MOTORBIKE');

  static const $core.List<GetEventCloud_ALPR_Vehicle_Type> values =
      <GetEventCloud_ALPR_Vehicle_Type>[
    ALL,
    CAR,
    TRUCK,
    MOTORBIKE,
  ];

  static final $core.List<GetEventCloud_ALPR_Vehicle_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static GetEventCloud_ALPR_Vehicle_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetEventCloud_ALPR_Vehicle_Type._(super.value, super.name);
}

class GetEventCloud_Error extends $pb.ProtobufEnum {
  static const GetEventCloud_Error ERROR_DEFAULT =
      GetEventCloud_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const GetEventCloud_Error USER_NOT_FOUND =
      GetEventCloud_Error._(1, _omitEnumNames ? '' : 'USER_NOT_FOUND');
  static const GetEventCloud_Error FORM_DATE_TO_DATE_INVALID =
      GetEventCloud_Error._(
          2, _omitEnumNames ? '' : 'FORM_DATE_TO_DATE_INVALID');

  static const $core.List<GetEventCloud_Error> values = <GetEventCloud_Error>[
    ERROR_DEFAULT,
    USER_NOT_FOUND,
    FORM_DATE_TO_DATE_INVALID,
  ];

  static final $core.List<GetEventCloud_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GetEventCloud_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetEventCloud_Error._(super.value, super.name);
}

class OnvifDiscoveryCamera_Error extends $pb.ProtobufEnum {
  static const OnvifDiscoveryCamera_Error ERROR_DEFAULT =
      OnvifDiscoveryCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const OnvifDiscoveryCamera_Error CAMERA_NOT_FOUND =
      OnvifDiscoveryCamera_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const OnvifDiscoveryCamera_Error BOX_ID_NOT_FOUND =
      OnvifDiscoveryCamera_Error._(2, _omitEnumNames ? '' : 'BOX_ID_NOT_FOUND');
  static const OnvifDiscoveryCamera_Error BOX_OFFLINE =
      OnvifDiscoveryCamera_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<OnvifDiscoveryCamera_Error> values =
      <OnvifDiscoveryCamera_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_FOUND,
    BOX_ID_NOT_FOUND,
    BOX_OFFLINE,
  ];

  static final $core.List<OnvifDiscoveryCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static OnvifDiscoveryCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OnvifDiscoveryCamera_Error._(super.value, super.name);
}

class Onvif_PTZ_Pan_Error extends $pb.ProtobufEnum {
  static const Onvif_PTZ_Pan_Error ERROR_DEFAULT =
      Onvif_PTZ_Pan_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Onvif_PTZ_Pan_Error CAMERA_NOT_FOUND =
      Onvif_PTZ_Pan_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const Onvif_PTZ_Pan_Error CAMERA_NOT_ONVIF_DEVICE =
      Onvif_PTZ_Pan_Error._(2, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const Onvif_PTZ_Pan_Error BOX_OFFLINE =
      Onvif_PTZ_Pan_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<Onvif_PTZ_Pan_Error> values = <Onvif_PTZ_Pan_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    BOX_OFFLINE,
  ];

  static final $core.List<Onvif_PTZ_Pan_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Onvif_PTZ_Pan_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Onvif_PTZ_Pan_Error._(super.value, super.name);
}

class Onvif_PTZ_Tilt_Error extends $pb.ProtobufEnum {
  static const Onvif_PTZ_Tilt_Error ERROR_DEFAULT =
      Onvif_PTZ_Tilt_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Onvif_PTZ_Tilt_Error CAMERA_NOT_FOUND =
      Onvif_PTZ_Tilt_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const Onvif_PTZ_Tilt_Error CAMERA_NOT_ONVIF_DEVICE =
      Onvif_PTZ_Tilt_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const Onvif_PTZ_Tilt_Error BOX_OFFLINE =
      Onvif_PTZ_Tilt_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<Onvif_PTZ_Tilt_Error> values = <Onvif_PTZ_Tilt_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    BOX_OFFLINE,
  ];

  static final $core.List<Onvif_PTZ_Tilt_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Onvif_PTZ_Tilt_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Onvif_PTZ_Tilt_Error._(super.value, super.name);
}

class Onvif_PTZ_Zoom_Error extends $pb.ProtobufEnum {
  static const Onvif_PTZ_Zoom_Error ERROR_DEFAULT =
      Onvif_PTZ_Zoom_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Onvif_PTZ_Zoom_Error CAMERA_NOT_FOUND =
      Onvif_PTZ_Zoom_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const Onvif_PTZ_Zoom_Error CAMERA_NOT_ONVIF_DEVICE =
      Onvif_PTZ_Zoom_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const Onvif_PTZ_Zoom_Error BOX_OFFLINE =
      Onvif_PTZ_Zoom_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<Onvif_PTZ_Zoom_Error> values = <Onvif_PTZ_Zoom_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    BOX_OFFLINE,
  ];

  static final $core.List<Onvif_PTZ_Zoom_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Onvif_PTZ_Zoom_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Onvif_PTZ_Zoom_Error._(super.value, super.name);
}

class Onvif_Get_RTSP_URL_Error extends $pb.ProtobufEnum {
  static const Onvif_Get_RTSP_URL_Error ERROR_DEFAULT =
      Onvif_Get_RTSP_URL_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Onvif_Get_RTSP_URL_Error STREAM_NOT_FOUND =
      Onvif_Get_RTSP_URL_Error._(1, _omitEnumNames ? '' : 'STREAM_NOT_FOUND');
  static const Onvif_Get_RTSP_URL_Error CAMERA_NOT_ONVIF_DEVICE =
      Onvif_Get_RTSP_URL_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const Onvif_Get_RTSP_URL_Error USER_NAME_OR_PASSWORD_NOT_MATCH =
      Onvif_Get_RTSP_URL_Error._(
          3, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_NOT_MATCH');
  static const Onvif_Get_RTSP_URL_Error BOX_OFFLINE =
      Onvif_Get_RTSP_URL_Error._(4, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<Onvif_Get_RTSP_URL_Error> values =
      <Onvif_Get_RTSP_URL_Error>[
    ERROR_DEFAULT,
    STREAM_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    USER_NAME_OR_PASSWORD_NOT_MATCH,
    BOX_OFFLINE,
  ];

  static final $core.List<Onvif_Get_RTSP_URL_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Onvif_Get_RTSP_URL_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Onvif_Get_RTSP_URL_Error._(super.value, super.name);
}

class Onvif_PTZ_Zoom_Reset_Error extends $pb.ProtobufEnum {
  static const Onvif_PTZ_Zoom_Reset_Error ERROR_DEFAULT =
      Onvif_PTZ_Zoom_Reset_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Onvif_PTZ_Zoom_Reset_Error CAMERA_NOT_FOUND =
      Onvif_PTZ_Zoom_Reset_Error._(1, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const Onvif_PTZ_Zoom_Reset_Error CAMERA_NOT_ONVIF_DEVICE =
      Onvif_PTZ_Zoom_Reset_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const Onvif_PTZ_Zoom_Reset_Error BOX_OFFLINE =
      Onvif_PTZ_Zoom_Reset_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<Onvif_PTZ_Zoom_Reset_Error> values =
      <Onvif_PTZ_Zoom_Reset_Error>[
    ERROR_DEFAULT,
    CAMERA_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    BOX_OFFLINE,
  ];

  static final $core.List<Onvif_PTZ_Zoom_Reset_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Onvif_PTZ_Zoom_Reset_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Onvif_PTZ_Zoom_Reset_Error._(super.value, super.name);
}

class updateUserAddress_Error extends $pb.ProtobufEnum {
  static const updateUserAddress_Error ERROR_DEFAULT =
      updateUserAddress_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const updateUserAddress_Error EMAIL_EMPTY =
      updateUserAddress_Error._(1, _omitEnumNames ? '' : 'EMAIL_EMPTY');
  static const updateUserAddress_Error EMAIL_INVALID =
      updateUserAddress_Error._(2, _omitEnumNames ? '' : 'EMAIL_INVALID');
  static const updateUserAddress_Error EMAIL_EXIST =
      updateUserAddress_Error._(3, _omitEnumNames ? '' : 'EMAIL_EXIST');
  static const updateUserAddress_Error TEL_EMPTY =
      updateUserAddress_Error._(4, _omitEnumNames ? '' : 'TEL_EMPTY');
  static const updateUserAddress_Error TEL_INVALID =
      updateUserAddress_Error._(5, _omitEnumNames ? '' : 'TEL_INVALID');
  static const updateUserAddress_Error TEL_EXIST =
      updateUserAddress_Error._(6, _omitEnumNames ? '' : 'TEL_EXIST');

  static const $core.List<updateUserAddress_Error> values =
      <updateUserAddress_Error>[
    ERROR_DEFAULT,
    EMAIL_EMPTY,
    EMAIL_INVALID,
    EMAIL_EXIST,
    TEL_EMPTY,
    TEL_INVALID,
    TEL_EXIST,
  ];

  static final $core.List<updateUserAddress_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static updateUserAddress_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const updateUserAddress_Error._(super.value, super.name);
}

class AddGroupCamera_Error extends $pb.ProtobufEnum {
  static const AddGroupCamera_Error ERROR_DEFAULT =
      AddGroupCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddGroupCamera_Error GROUP_NAME_EMPTY =
      AddGroupCamera_Error._(1, _omitEnumNames ? '' : 'GROUP_NAME_EMPTY');
  static const AddGroupCamera_Error PARENT_GROUP_NOT_FOUND_OR_INVALID =
      AddGroupCamera_Error._(
          2, _omitEnumNames ? '' : 'PARENT_GROUP_NOT_FOUND_OR_INVALID');
  static const AddGroupCamera_Error PARENT_GROUP_MAX_LEVEL =
      AddGroupCamera_Error._(3, _omitEnumNames ? '' : 'PARENT_GROUP_MAX_LEVEL');

  static const $core.List<AddGroupCamera_Error> values = <AddGroupCamera_Error>[
    ERROR_DEFAULT,
    GROUP_NAME_EMPTY,
    PARENT_GROUP_NOT_FOUND_OR_INVALID,
    PARENT_GROUP_MAX_LEVEL,
  ];

  static final $core.List<AddGroupCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static AddGroupCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddGroupCamera_Error._(super.value, super.name);
}

class RemoveGroupCamera_Error extends $pb.ProtobufEnum {
  static const RemoveGroupCamera_Error ERROR_DEFAULT =
      RemoveGroupCamera_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RemoveGroupCamera_Error GROUP_ID_EMPTY =
      RemoveGroupCamera_Error._(1, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const RemoveGroupCamera_Error GROUP_ID_NOT_FOUND =
      RemoveGroupCamera_Error._(2, _omitEnumNames ? '' : 'GROUP_ID_NOT_FOUND');

  static const $core.List<RemoveGroupCamera_Error> values =
      <RemoveGroupCamera_Error>[
    ERROR_DEFAULT,
    GROUP_ID_EMPTY,
    GROUP_ID_NOT_FOUND,
  ];

  static final $core.List<RemoveGroupCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RemoveGroupCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RemoveGroupCamera_Error._(super.value, super.name);
}

class AddCameraToGroup_Error extends $pb.ProtobufEnum {
  static const AddCameraToGroup_Error ERROR_DEFAULT =
      AddCameraToGroup_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCameraToGroup_Error CAMERA_ID_EMPTY =
      AddCameraToGroup_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const AddCameraToGroup_Error GROUP_ID_EMPTY =
      AddCameraToGroup_Error._(2, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const AddCameraToGroup_Error CAMERA_ID_NOT_FOUND =
      AddCameraToGroup_Error._(3, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const AddCameraToGroup_Error GROUP_ID_NOT_FOUND =
      AddCameraToGroup_Error._(4, _omitEnumNames ? '' : 'GROUP_ID_NOT_FOUND');
  static const AddCameraToGroup_Error CAMERA_EXIST_GROUP =
      AddCameraToGroup_Error._(5, _omitEnumNames ? '' : 'CAMERA_EXIST_GROUP');

  static const $core.List<AddCameraToGroup_Error> values =
      <AddCameraToGroup_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    GROUP_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    GROUP_ID_NOT_FOUND,
    CAMERA_EXIST_GROUP,
  ];

  static final $core.List<AddCameraToGroup_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static AddCameraToGroup_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCameraToGroup_Error._(super.value, super.name);
}

class RemoveCameraFormGroup_Error extends $pb.ProtobufEnum {
  static const RemoveCameraFormGroup_Error ERROR_DEFAULT =
      RemoveCameraFormGroup_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RemoveCameraFormGroup_Error CAMERA_ID_EMPTY =
      RemoveCameraFormGroup_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const RemoveCameraFormGroup_Error GROUP_ID_EMPTY =
      RemoveCameraFormGroup_Error._(2, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const RemoveCameraFormGroup_Error CAMERA_ID_NOT_FOUND =
      RemoveCameraFormGroup_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const RemoveCameraFormGroup_Error GROUP_ID_NOT_FOUND =
      RemoveCameraFormGroup_Error._(
          4, _omitEnumNames ? '' : 'GROUP_ID_NOT_FOUND');

  static const $core.List<RemoveCameraFormGroup_Error> values =
      <RemoveCameraFormGroup_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    GROUP_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    GROUP_ID_NOT_FOUND,
  ];

  static final $core.List<RemoveCameraFormGroup_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RemoveCameraFormGroup_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RemoveCameraFormGroup_Error._(super.value, super.name);
}

class GetCameraInGroup_Error extends $pb.ProtobufEnum {
  static const GetCameraInGroup_Error ERROR_DEFAULT =
      GetCameraInGroup_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const GetCameraInGroup_Error GROUP_ID_EMPTY =
      GetCameraInGroup_Error._(1, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const GetCameraInGroup_Error GROUP_ID_NOT_FOUND =
      GetCameraInGroup_Error._(2, _omitEnumNames ? '' : 'GROUP_ID_NOT_FOUND');

  static const $core.List<GetCameraInGroup_Error> values =
      <GetCameraInGroup_Error>[
    ERROR_DEFAULT,
    GROUP_ID_EMPTY,
    GROUP_ID_NOT_FOUND,
  ];

  static final $core.List<GetCameraInGroup_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GetCameraInGroup_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetCameraInGroup_Error._(super.value, super.name);
}

class UpdateGroupDevice_Error extends $pb.ProtobufEnum {
  static const UpdateGroupDevice_Error ERROR_DEFAULT =
      UpdateGroupDevice_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const UpdateGroupDevice_Error GROUP_ID_EMPTY =
      UpdateGroupDevice_Error._(1, _omitEnumNames ? '' : 'GROUP_ID_EMPTY');
  static const UpdateGroupDevice_Error GROUP_ID_NOT_FOUND =
      UpdateGroupDevice_Error._(2, _omitEnumNames ? '' : 'GROUP_ID_NOT_FOUND');
  static const UpdateGroupDevice_Error PARENT_GROUP_NOT_FOUND =
      UpdateGroupDevice_Error._(
          3, _omitEnumNames ? '' : 'PARENT_GROUP_NOT_FOUND');
  static const UpdateGroupDevice_Error PARENT_LEVEL_INVALID =
      UpdateGroupDevice_Error._(
          4, _omitEnumNames ? '' : 'PARENT_LEVEL_INVALID');
  static const UpdateGroupDevice_Error PERMISSION_DENIED =
      UpdateGroupDevice_Error._(5, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const UpdateGroupDevice_Error PARENT_GROUP_INVALID =
      UpdateGroupDevice_Error._(
          6, _omitEnumNames ? '' : 'PARENT_GROUP_INVALID');
  static const UpdateGroupDevice_Error PARENT_GROUP_LEVEL_INVALID =
      UpdateGroupDevice_Error._(
          7, _omitEnumNames ? '' : 'PARENT_GROUP_LEVEL_INVALID');

  static const $core.List<UpdateGroupDevice_Error> values =
      <UpdateGroupDevice_Error>[
    ERROR_DEFAULT,
    GROUP_ID_EMPTY,
    GROUP_ID_NOT_FOUND,
    PARENT_GROUP_NOT_FOUND,
    PARENT_LEVEL_INVALID,
    PERMISSION_DENIED,
    PARENT_GROUP_INVALID,
    PARENT_GROUP_LEVEL_INVALID,
  ];

  static final $core.List<UpdateGroupDevice_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static UpdateGroupDevice_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateGroupDevice_Error._(super.value, super.name);
}

class ConfigSendEmail_Error extends $pb.ProtobufEnum {
  static const ConfigSendEmail_Error ERROR_DEFAULT =
      ConfigSendEmail_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');

  static const $core.List<ConfigSendEmail_Error> values =
      <ConfigSendEmail_Error>[
    ERROR_DEFAULT,
  ];

  static final $core.List<ConfigSendEmail_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static ConfigSendEmail_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConfigSendEmail_Error._(super.value, super.name);
}

class Config_RTSP_ONVIF_Motion_Detect_Level extends $pb.ProtobufEnum {
  static const Config_RTSP_ONVIF_Motion_Detect_Level LOW =
      Config_RTSP_ONVIF_Motion_Detect_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const Config_RTSP_ONVIF_Motion_Detect_Level MEDIUM =
      Config_RTSP_ONVIF_Motion_Detect_Level._(
          1, _omitEnumNames ? '' : 'MEDIUM');
  static const Config_RTSP_ONVIF_Motion_Detect_Level HIGH =
      Config_RTSP_ONVIF_Motion_Detect_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<Config_RTSP_ONVIF_Motion_Detect_Level> values =
      <Config_RTSP_ONVIF_Motion_Detect_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.List<Config_RTSP_ONVIF_Motion_Detect_Level?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Config_RTSP_ONVIF_Motion_Detect_Level? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Config_RTSP_ONVIF_Motion_Detect_Level._(super.value, super.name);
}

class Config_RTSP_ONVIF_Motion_Detect_Error extends $pb.ProtobufEnum {
  static const Config_RTSP_ONVIF_Motion_Detect_Error ERROR_DEFAULT =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const Config_RTSP_ONVIF_Motion_Detect_Error CAMERA_ID_EMPTY =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const Config_RTSP_ONVIF_Motion_Detect_Error CAMERA_NOT_FOUND =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_NOT_FOUND');
  static const Config_RTSP_ONVIF_Motion_Detect_Error IVA_SV_ERROR =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          3, _omitEnumNames ? '' : 'IVA_SV_ERROR');
  static const Config_RTSP_ONVIF_Motion_Detect_Error IVA_NOT_REGISTER =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          4, _omitEnumNames ? '' : 'IVA_NOT_REGISTER');
  static const Config_RTSP_ONVIF_Motion_Detect_Error IVA_TOO_MANY_REQUEST =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          5, _omitEnumNames ? '' : 'IVA_TOO_MANY_REQUEST');
  static const Config_RTSP_ONVIF_Motion_Detect_Error OVER_QUOTA =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          6, _omitEnumNames ? '' : 'OVER_QUOTA');
  static const Config_RTSP_ONVIF_Motion_Detect_Error PERMISSION_DENIED =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          7, _omitEnumNames ? '' : 'PERMISSION_DENIED');
  static const Config_RTSP_ONVIF_Motion_Detect_Error CAMERA_NOT_HOMEVISON =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          8, _omitEnumNames ? '' : 'CAMERA_NOT_HOMEVISON');
  static const Config_RTSP_ONVIF_Motion_Detect_Error CAMERA_OFFLINE =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          9, _omitEnumNames ? '' : 'CAMERA_OFFLINE');
  static const Config_RTSP_ONVIF_Motion_Detect_Error
      USER_NAME_OR_PASSWORD_ERROR = Config_RTSP_ONVIF_Motion_Detect_Error._(
          10, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const Config_RTSP_ONVIF_Motion_Detect_Error SERVER_P2P_ERROR =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          11, _omitEnumNames ? '' : 'SERVER_P2P_ERROR');
  static const Config_RTSP_ONVIF_Motion_Detect_Error CAMERA_CLOSE_CONNECTION =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          12, _omitEnumNames ? '' : 'CAMERA_CLOSE_CONNECTION');
  static const Config_RTSP_ONVIF_Motion_Detect_Error UID_INVALID =
      Config_RTSP_ONVIF_Motion_Detect_Error._(
          13, _omitEnumNames ? '' : 'UID_INVALID');

  static const $core.List<Config_RTSP_ONVIF_Motion_Detect_Error> values =
      <Config_RTSP_ONVIF_Motion_Detect_Error>[
    ERROR_DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_NOT_FOUND,
    IVA_SV_ERROR,
    IVA_NOT_REGISTER,
    IVA_TOO_MANY_REQUEST,
    OVER_QUOTA,
    PERMISSION_DENIED,
    CAMERA_NOT_HOMEVISON,
    CAMERA_OFFLINE,
    USER_NAME_OR_PASSWORD_ERROR,
    SERVER_P2P_ERROR,
    CAMERA_CLOSE_CONNECTION,
    UID_INVALID,
  ];

  static final $core.List<Config_RTSP_ONVIF_Motion_Detect_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static Config_RTSP_ONVIF_Motion_Detect_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Config_RTSP_ONVIF_Motion_Detect_Error._(super.value, super.name);
}

class PostEmap_Error extends $pb.ProtobufEnum {
  static const PostEmap_Error ERROR_DEFAULT =
      PostEmap_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const PostEmap_Error EMAP_ID_NOT_FOUND =
      PostEmap_Error._(1, _omitEnumNames ? '' : 'EMAP_ID_NOT_FOUND');
  static const PostEmap_Error FILE_NOT_FOUND =
      PostEmap_Error._(2, _omitEnumNames ? '' : 'FILE_NOT_FOUND');

  static const $core.List<PostEmap_Error> values = <PostEmap_Error>[
    ERROR_DEFAULT,
    EMAP_ID_NOT_FOUND,
    FILE_NOT_FOUND,
  ];

  static final $core.List<PostEmap_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PostEmap_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PostEmap_Error._(super.value, super.name);
}

class RemoveEmap_Error extends $pb.ProtobufEnum {
  static const RemoveEmap_Error ERROR_DEFAULT =
      RemoveEmap_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const RemoveEmap_Error EMAP_ID_NOT_FOUND =
      RemoveEmap_Error._(1, _omitEnumNames ? '' : 'EMAP_ID_NOT_FOUND');

  static const $core.List<RemoveEmap_Error> values = <RemoveEmap_Error>[
    ERROR_DEFAULT,
    EMAP_ID_NOT_FOUND,
  ];

  static final $core.List<RemoveEmap_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static RemoveEmap_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RemoveEmap_Error._(super.value, super.name);
}

class AddCameraEmapInfo_Error extends $pb.ProtobufEnum {
  static const AddCameraEmapInfo_Error ERROR_DEFAULT =
      AddCameraEmapInfo_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const AddCameraEmapInfo_Error EMAP_ID_EMPTY =
      AddCameraEmapInfo_Error._(1, _omitEnumNames ? '' : 'EMAP_ID_EMPTY');
  static const AddCameraEmapInfo_Error EMAP_NOT_FOUND =
      AddCameraEmapInfo_Error._(2, _omitEnumNames ? '' : 'EMAP_NOT_FOUND');
  static const AddCameraEmapInfo_Error CAMERA_EMAP_NOT_FOUND =
      AddCameraEmapInfo_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_EMAP_NOT_FOUND');

  static const $core.List<AddCameraEmapInfo_Error> values =
      <AddCameraEmapInfo_Error>[
    ERROR_DEFAULT,
    EMAP_ID_EMPTY,
    EMAP_NOT_FOUND,
    CAMERA_EMAP_NOT_FOUND,
  ];

  static final $core.List<AddCameraEmapInfo_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static AddCameraEmapInfo_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCameraEmapInfo_Error._(super.value, super.name);
}

class ListCameraEmapInfo_Error extends $pb.ProtobufEnum {
  static const ListCameraEmapInfo_Error ERROR_DEFAULT =
      ListCameraEmapInfo_Error._(0, _omitEnumNames ? '' : 'ERROR_DEFAULT');
  static const ListCameraEmapInfo_Error EMAP_ID_EMPTY =
      ListCameraEmapInfo_Error._(1, _omitEnumNames ? '' : 'EMAP_ID_EMPTY');
  static const ListCameraEmapInfo_Error EMAP_NOT_FOUND =
      ListCameraEmapInfo_Error._(2, _omitEnumNames ? '' : 'EMAP_NOT_FOUND');

  static const $core.List<ListCameraEmapInfo_Error> values =
      <ListCameraEmapInfo_Error>[
    ERROR_DEFAULT,
    EMAP_ID_EMPTY,
    EMAP_NOT_FOUND,
  ];

  static final $core.List<ListCameraEmapInfo_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ListCameraEmapInfo_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListCameraEmapInfo_Error._(super.value, super.name);
}

class AddCustomLiveView_Error extends $pb.ProtobufEnum {
  static const AddCustomLiveView_Error DEFAULT =
      AddCustomLiveView_Error._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const AddCustomLiveView_Error POSITION_INVALID =
      AddCustomLiveView_Error._(1, _omitEnumNames ? '' : 'POSITION_INVALID');
  static const AddCustomLiveView_Error NAME_EMPTY =
      AddCustomLiveView_Error._(2, _omitEnumNames ? '' : 'NAME_EMPTY');

  static const $core.List<AddCustomLiveView_Error> values =
      <AddCustomLiveView_Error>[
    DEFAULT,
    POSITION_INVALID,
    NAME_EMPTY,
  ];

  static final $core.List<AddCustomLiveView_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AddCustomLiveView_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AddCustomLiveView_Error._(super.value, super.name);
}

class UpdateCustomLiveView_Error extends $pb.ProtobufEnum {
  static const UpdateCustomLiveView_Error DEFAULT =
      UpdateCustomLiveView_Error._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const UpdateCustomLiveView_Error POSITION_INVALID =
      UpdateCustomLiveView_Error._(1, _omitEnumNames ? '' : 'POSITION_INVALID');

  static const $core.List<UpdateCustomLiveView_Error> values =
      <UpdateCustomLiveView_Error>[
    DEFAULT,
    POSITION_INVALID,
  ];

  static final $core.List<UpdateCustomLiveView_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static UpdateCustomLiveView_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateCustomLiveView_Error._(super.value, super.name);
}

class DeleteCustomLiveView_Error extends $pb.ProtobufEnum {
  static const DeleteCustomLiveView_Error DEFAULT =
      DeleteCustomLiveView_Error._(0, _omitEnumNames ? '' : 'DEFAULT');

  static const $core.List<DeleteCustomLiveView_Error> values =
      <DeleteCustomLiveView_Error>[
    DEFAULT,
  ];

  static final $core.List<DeleteCustomLiveView_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static DeleteCustomLiveView_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeleteCustomLiveView_Error._(super.value, super.name);
}

class RequestURLDownload_Error extends $pb.ProtobufEnum {
  static const RequestURLDownload_Error DEFAULT =
      RequestURLDownload_Error._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const RequestURLDownload_Error CAMERA_ID_EMPTY =
      RequestURLDownload_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const RequestURLDownload_Error CAMERA_ID_NOT_FOUND =
      RequestURLDownload_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const RequestURLDownload_Error FILE_HAS_BEEN_DELETED =
      RequestURLDownload_Error._(
          3, _omitEnumNames ? '' : 'FILE_HAS_BEEN_DELETED');
  static const RequestURLDownload_Error TIME_INVALID =
      RequestURLDownload_Error._(4, _omitEnumNames ? '' : 'TIME_INVALID');
  static const RequestURLDownload_Error PLAYBACK_ID_NOT_FOUND =
      RequestURLDownload_Error._(
          5, _omitEnumNames ? '' : 'PLAYBACK_ID_NOT_FOUND');

  static const $core.List<RequestURLDownload_Error> values =
      <RequestURLDownload_Error>[
    DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    FILE_HAS_BEEN_DELETED,
    TIME_INVALID,
    PLAYBACK_ID_NOT_FOUND,
  ];

  static final $core.List<RequestURLDownload_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static RequestURLDownload_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RequestURLDownload_Error._(super.value, super.name);
}

class ResetOnvifCamera_Error extends $pb.ProtobufEnum {
  static const ResetOnvifCamera_Error DEFAULT =
      ResetOnvifCamera_Error._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const ResetOnvifCamera_Error CAMERA_ID_EMPTY =
      ResetOnvifCamera_Error._(1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const ResetOnvifCamera_Error CAMERA_ID_NOT_FOUND =
      ResetOnvifCamera_Error._(2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const ResetOnvifCamera_Error BOX_OFFLINE =
      ResetOnvifCamera_Error._(3, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<ResetOnvifCamera_Error> values =
      <ResetOnvifCamera_Error>[
    DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    BOX_OFFLINE,
  ];

  static final $core.List<ResetOnvifCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ResetOnvifCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResetOnvifCamera_Error._(super.value, super.name);
}

class GetListStreamOnvifCamera_Error extends $pb.ProtobufEnum {
  static const GetListStreamOnvifCamera_Error DEFAULT =
      GetListStreamOnvifCamera_Error._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const GetListStreamOnvifCamera_Error CAMERA_ID_EMPTY =
      GetListStreamOnvifCamera_Error._(
          1, _omitEnumNames ? '' : 'CAMERA_ID_EMPTY');
  static const GetListStreamOnvifCamera_Error CAMERA_ID_NOT_FOUND =
      GetListStreamOnvifCamera_Error._(
          2, _omitEnumNames ? '' : 'CAMERA_ID_NOT_FOUND');
  static const GetListStreamOnvifCamera_Error CAMERA_NOT_ONVIF_DEVICE =
      GetListStreamOnvifCamera_Error._(
          3, _omitEnumNames ? '' : 'CAMERA_NOT_ONVIF_DEVICE');
  static const GetListStreamOnvifCamera_Error CAMERA_CAN_T_GET_STREAM =
      GetListStreamOnvifCamera_Error._(
          4, _omitEnumNames ? '' : 'CAMERA_CAN_T_GET_STREAM');
  static const GetListStreamOnvifCamera_Error BOX_OFFLINE =
      GetListStreamOnvifCamera_Error._(5, _omitEnumNames ? '' : 'BOX_OFFLINE');

  static const $core.List<GetListStreamOnvifCamera_Error> values =
      <GetListStreamOnvifCamera_Error>[
    DEFAULT,
    CAMERA_ID_EMPTY,
    CAMERA_ID_NOT_FOUND,
    CAMERA_NOT_ONVIF_DEVICE,
    CAMERA_CAN_T_GET_STREAM,
    BOX_OFFLINE,
  ];

  static final $core.List<GetListStreamOnvifCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static GetListStreamOnvifCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetListStreamOnvifCamera_Error._(super.value, super.name);
}

class GetNumberNotify_Error extends $pb.ProtobufEnum {
  static const GetNumberNotify_Error DEFAULT =
      GetNumberNotify_Error._(0, _omitEnumNames ? '' : 'DEFAULT');

  static const $core.List<GetNumberNotify_Error> values =
      <GetNumberNotify_Error>[
    DEFAULT,
  ];

  static final $core.List<GetNumberNotify_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static GetNumberNotify_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GetNumberNotify_Error._(super.value, super.name);
}

class checkQuotaAddCamera_Error extends $pb.ProtobufEnum {
  static const checkQuotaAddCamera_Error DEFAULT =
      checkQuotaAddCamera_Error._(0, _omitEnumNames ? '' : 'DEFAULT');

  static const $core.List<checkQuotaAddCamera_Error> values =
      <checkQuotaAddCamera_Error>[
    DEFAULT,
  ];

  static final $core.List<checkQuotaAddCamera_Error?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static checkQuotaAddCamera_Error? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const checkQuotaAddCamera_Error._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
