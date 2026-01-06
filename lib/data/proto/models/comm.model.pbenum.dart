//
//  Generated code. Do not modify.
//  source: comm.model.proto
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
  static const ResultType REQUEST_INVALID =
      ResultType._(1000, _omitEnumNames ? '' : 'REQUEST_INVALID');
  static const ResultType SESSION_INVALID =
      ResultType._(1001, _omitEnumNames ? '' : 'SESSION_INVALID');
  static const ResultType SESSION_EXPIRE =
      ResultType._(1002, _omitEnumNames ? '' : 'SESSION_EXPIRE');
  static const ResultType SIZE_LIMITED = ResultType._(1003, _omitEnumNames ? '' : 'SIZE_LIMITED');
  static const ResultType DB_ERROR = ResultType._(1004, _omitEnumNames ? '' : 'DB_ERROR');
  static const ResultType NO_CHANGED = ResultType._(1005, _omitEnumNames ? '' : 'NO_CHANGED');
  static const ResultType NETWORK_ERROR = ResultType._(1006, _omitEnumNames ? '' : 'NETWORK_ERROR');
  static const ResultType DATA_ERROR = ResultType._(1007, _omitEnumNames ? '' : 'DATA_ERROR');
  static const ResultType INTERNAL_ERROR_500 =
      ResultType._(1008, _omitEnumNames ? '' : 'INTERNAL_ERROR_500');
  static const ResultType PERMISSION_DENIED_401 =
      ResultType._(1009, _omitEnumNames ? '' : 'PERMISSION_DENIED_401');

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
    INTERNAL_ERROR_500,
    PERMISSION_DENIED_401,
  ];

  static final $core.Map<$core.int, ResultType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResultType? valueOf($core.int value) => _byValue[value];

  const ResultType._($core.int v, $core.String n) : super(v, n);
}

class EventType extends $pb.ProtobufEnum {
  static const EventType MOTION_DETECTION =
      EventType._(0, _omitEnumNames ? '' : 'MOTION_DETECTION');
  static const EventType LINE_CROSSING = EventType._(1, _omitEnumNames ? '' : 'LINE_CROSSING');
  static const EventType INTRUSION_DETECTION =
      EventType._(2, _omitEnumNames ? '' : 'INTRUSION_DETECTION');
  static const EventType IVA_FACE_DETECTION =
      EventType._(3, _omitEnumNames ? '' : 'IVA_FACE_DETECTION');
  static const EventType IVA_SMOKE_DETECTION =
      EventType._(4, _omitEnumNames ? '' : 'IVA_SMOKE_DETECTION');
  static const EventType IVA_ALPR = EventType._(5, _omitEnumNames ? '' : 'IVA_ALPR');
  static const EventType ALL_TYPE = EventType._(98, _omitEnumNames ? '' : 'ALL_TYPE');
  static const EventType ALL = EventType._(99, _omitEnumNames ? '' : 'ALL');

  static const $core.List<EventType> values = <EventType>[
    MOTION_DETECTION,
    LINE_CROSSING,
    INTRUSION_DETECTION,
    IVA_FACE_DETECTION,
    IVA_SMOKE_DETECTION,
    IVA_ALPR,
    ALL_TYPE,
    ALL,
  ];

  static final $core.Map<$core.int, EventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EventType? valueOf($core.int value) => _byValue[value];

  const EventType._($core.int v, $core.String n) : super(v, n);
}

class Quality extends $pb.ProtobufEnum {
  static const Quality AUTO = Quality._(0, _omitEnumNames ? '' : 'AUTO');
  static const Quality SD = Quality._(1, _omitEnumNames ? '' : 'SD');
  static const Quality HD = Quality._(2, _omitEnumNames ? '' : 'HD');
  static const Quality FHD = Quality._(3, _omitEnumNames ? '' : 'FHD');

  static const $core.List<Quality> values = <Quality>[
    AUTO,
    SD,
    HD,
    FHD,
  ];

  static final $core.Map<$core.int, Quality> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Quality? valueOf($core.int value) => _byValue[value];

  const Quality._($core.int v, $core.String n) : super(v, n);
}

class ProjectTarget extends $pb.ProtobufEnum {
  static const ProjectTarget VIVAS = ProjectTarget._(0, _omitEnumNames ? '' : 'VIVAS');
  static const ProjectTarget VIVAS_CLOUD = ProjectTarget._(1, _omitEnumNames ? '' : 'VIVAS_CLOUD');
  static const ProjectTarget KC01 = ProjectTarget._(99, _omitEnumNames ? '' : 'KC01');

  static const $core.List<ProjectTarget> values = <ProjectTarget>[
    VIVAS,
    VIVAS_CLOUD,
    KC01,
  ];

  static final $core.Map<$core.int, ProjectTarget> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProjectTarget? valueOf($core.int value) => _byValue[value];

  const ProjectTarget._($core.int v, $core.String n) : super(v, n);
}

class Box_Type extends $pb.ProtobufEnum {
  static const Box_Type BOX_UNDEFINED = Box_Type._(0, _omitEnumNames ? '' : 'BOX_UNDEFINED');
  static const Box_Type RASPBERRY = Box_Type._(1, _omitEnumNames ? '' : 'RASPBERRY');
  static const Box_Type ORANGEPI = Box_Type._(2, _omitEnumNames ? '' : 'ORANGEPI');

  static const $core.List<Box_Type> values = <Box_Type>[
    BOX_UNDEFINED,
    RASPBERRY,
    ORANGEPI,
  ];

  static final $core.Map<$core.int, Box_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Box_Type? valueOf($core.int value) => _byValue[value];

  const Box_Type._($core.int v, $core.String n) : super(v, n);
}

class Box_State extends $pb.ProtobufEnum {
  static const Box_State VBOX_ACTIVE = Box_State._(0, _omitEnumNames ? '' : 'VBOX_ACTIVE');
  static const Box_State VBOX_INACTIVE = Box_State._(1, _omitEnumNames ? '' : 'VBOX_INACTIVE');
  static const Box_State VBOX_LOST = Box_State._(2, _omitEnumNames ? '' : 'VBOX_LOST');

  static const $core.List<Box_State> values = <Box_State>[
    VBOX_ACTIVE,
    VBOX_INACTIVE,
    VBOX_LOST,
  ];

  static final $core.Map<$core.int, Box_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Box_State? valueOf($core.int value) => _byValue[value];

  const Box_State._($core.int v, $core.String n) : super(v, n);
}

class Language extends $pb.ProtobufEnum {
  static const Language DEFAULT = Language._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const Language VI = Language._(1, _omitEnumNames ? '' : 'VI');
  static const Language EN = Language._(2, _omitEnumNames ? '' : 'EN');

  static const $core.List<Language> values = <Language>[
    DEFAULT,
    VI,
    EN,
  ];

  static final $core.Map<$core.int, Language> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Language? valueOf($core.int value) => _byValue[value];

  const Language._($core.int v, $core.String n) : super(v, n);
}

class CameraType extends $pb.ProtobufEnum {
  static const CameraType UNKNOW = CameraType._(0, _omitEnumNames ? '' : 'UNKNOW');
  static const CameraType RTSP = CameraType._(1, _omitEnumNames ? '' : 'RTSP');
  static const CameraType ONVIF = CameraType._(2, _omitEnumNames ? '' : 'ONVIF');
  static const CameraType ONEHOME_VNT = CameraType._(3, _omitEnumNames ? '' : 'ONEHOME_VNT');
  static const CameraType RTMP = CameraType._(4, _omitEnumNames ? '' : 'RTMP');

  static const $core.List<CameraType> values = <CameraType>[
    UNKNOW,
    RTSP,
    ONVIF,
    ONEHOME_VNT,
    RTMP,
  ];

  static final $core.Map<$core.int, CameraType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CameraType? valueOf($core.int value) => _byValue[value];

  const CameraType._($core.int v, $core.String n) : super(v, n);
}

class PtzAction extends $pb.ProtobufEnum {
  static const PtzAction PTZ_STOP = PtzAction._(0, _omitEnumNames ? '' : 'PTZ_STOP');
  static const PtzAction PTZ_UP = PtzAction._(1, _omitEnumNames ? '' : 'PTZ_UP');
  static const PtzAction PTZ_DOWN = PtzAction._(2, _omitEnumNames ? '' : 'PTZ_DOWN');
  static const PtzAction PTZ_LEFT = PtzAction._(3, _omitEnumNames ? '' : 'PTZ_LEFT');
  static const PtzAction PTZ_RIGHT = PtzAction._(6, _omitEnumNames ? '' : 'PTZ_RIGHT');

  static const $core.List<PtzAction> values = <PtzAction>[
    PTZ_STOP,
    PTZ_UP,
    PTZ_DOWN,
    PTZ_LEFT,
    PTZ_RIGHT,
  ];

  static final $core.Map<$core.int, PtzAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PtzAction? valueOf($core.int value) => _byValue[value];

  const PtzAction._($core.int v, $core.String n) : super(v, n);
}

class UserStatus extends $pb.ProtobufEnum {
  static const UserStatus ACTIVE = UserStatus._(0, _omitEnumNames ? '' : 'ACTIVE');
  static const UserStatus INACTIVE = UserStatus._(1, _omitEnumNames ? '' : 'INACTIVE');

  static const $core.List<UserStatus> values = <UserStatus>[
    ACTIVE,
    INACTIVE,
  ];

  static final $core.Map<$core.int, UserStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserStatus? valueOf($core.int value) => _byValue[value];

  const UserStatus._($core.int v, $core.String n) : super(v, n);
}

class API extends $pb.ProtobufEnum {
  static const API UNDEFINED = API._(0, _omitEnumNames ? '' : 'UNDEFINED');
  static const API API_VERSION = API._(111, _omitEnumNames ? '' : 'API_VERSION');

  static const $core.List<API> values = <API>[
    UNDEFINED,
    API_VERSION,
  ];

  static final $core.Map<$core.int, API> _byValue = $pb.ProtobufEnum.initByValue(values);
  static API? valueOf($core.int value) => _byValue[value];

  const API._($core.int v, $core.String n) : super(v, n);
}

class NetworkType extends $pb.ProtobufEnum {
  static const NetworkType DHCP = NetworkType._(0, _omitEnumNames ? '' : 'DHCP');
  static const NetworkType STATIC = NetworkType._(1, _omitEnumNames ? '' : 'STATIC');

  static const $core.List<NetworkType> values = <NetworkType>[
    DHCP,
    STATIC,
  ];

  static final $core.Map<$core.int, NetworkType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NetworkType? valueOf($core.int value) => _byValue[value];

  const NetworkType._($core.int v, $core.String n) : super(v, n);
}

class Vehicle_Type extends $pb.ProtobufEnum {
  static const Vehicle_Type CAR = Vehicle_Type._(0, _omitEnumNames ? '' : 'CAR');
  static const Vehicle_Type MOTOBIKE = Vehicle_Type._(1, _omitEnumNames ? '' : 'MOTOBIKE');
  static const Vehicle_Type TRUCK = Vehicle_Type._(2, _omitEnumNames ? '' : 'TRUCK');

  static const $core.List<Vehicle_Type> values = <Vehicle_Type>[
    CAR,
    MOTOBIKE,
    TRUCK,
  ];

  static final $core.Map<$core.int, Vehicle_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Vehicle_Type? valueOf($core.int value) => _byValue[value];

  const Vehicle_Type._($core.int v, $core.String n) : super(v, n);
}

class Base_View extends $pb.ProtobufEnum {
  static const Base_View V_1X1 = Base_View._(0, _omitEnumNames ? '' : 'V_1X1');
  static const Base_View V_2X2 = Base_View._(1, _omitEnumNames ? '' : 'V_2X2');
  static const Base_View V_3X3 = Base_View._(2, _omitEnumNames ? '' : 'V_3X3');
  static const Base_View V_4X4 = Base_View._(3, _omitEnumNames ? '' : 'V_4X4');
  static const Base_View V_5X5 = Base_View._(4, _omitEnumNames ? '' : 'V_5X5');
  static const Base_View V_6X6 = Base_View._(5, _omitEnumNames ? '' : 'V_6X6');

  static const $core.List<Base_View> values = <Base_View>[
    V_1X1,
    V_2X2,
    V_3X3,
    V_4X4,
    V_5X5,
    V_6X6,
  ];

  static final $core.Map<$core.int, Base_View> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Base_View? valueOf($core.int value) => _byValue[value];

  const Base_View._($core.int v, $core.String n) : super(v, n);
}

class Session_Platform extends $pb.ProtobufEnum {
  static const Session_Platform BLACKBERRY_ =
      Session_Platform._(0, _omitEnumNames ? '' : 'BLACKBERRY_');
  static const Session_Platform IOS_ = Session_Platform._(1, _omitEnumNames ? '' : 'IOS_');
  static const Session_Platform ANDROID_ = Session_Platform._(2, _omitEnumNames ? '' : 'ANDROID_');
  static const Session_Platform WINPHONE_ =
      Session_Platform._(3, _omitEnumNames ? '' : 'WINPHONE_');
  static const Session_Platform MACX_ = Session_Platform._(4, _omitEnumNames ? '' : 'MACX_');
  static const Session_Platform WINDOWS_ = Session_Platform._(5, _omitEnumNames ? '' : 'WINDOWS_');
  static const Session_Platform LINUX_ = Session_Platform._(6, _omitEnumNames ? '' : 'LINUX_');
  static const Session_Platform WEB_SOCK_ =
      Session_Platform._(7, _omitEnumNames ? '' : 'WEB_SOCK_');
  static const Session_Platform VBOX_ = Session_Platform._(8, _omitEnumNames ? '' : '_VBOX');
  static const Session_Platform OTHER_ = Session_Platform._(99, _omitEnumNames ? '' : 'OTHER_');

  static const $core.List<Session_Platform> values = <Session_Platform>[
    BLACKBERRY_,
    IOS_,
    ANDROID_,
    WINPHONE_,
    MACX_,
    WINDOWS_,
    LINUX_,
    WEB_SOCK_,
    VBOX_,
    OTHER_,
  ];

  static final $core.Map<$core.int, Session_Platform> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Session_Platform? valueOf($core.int value) => _byValue[value];

  const Session_Platform._($core.int v, $core.String n) : super(v, n);
}

class Profile_Type extends $pb.ProtobufEnum {
  static const Profile_Type USER = Profile_Type._(0, _omitEnumNames ? '' : 'USER');
  static const Profile_Type ADMIN = Profile_Type._(1, _omitEnumNames ? '' : 'ADMIN');
  static const Profile_Type SUPER_ADMIN = Profile_Type._(2, _omitEnumNames ? '' : 'SUPER_ADMIN');
  static const Profile_Type SYS_ADMIN = Profile_Type._(3, _omitEnumNames ? '' : 'SYS_ADMIN');
  static const Profile_Type AGENT = Profile_Type._(4, _omitEnumNames ? '' : 'AGENT');
  static const Profile_Type ADMIN_CLIENT = Profile_Type._(5, _omitEnumNames ? '' : 'ADMIN_CLIENT');

  static const $core.List<Profile_Type> values = <Profile_Type>[
    USER,
    ADMIN,
    SUPER_ADMIN,
    SYS_ADMIN,
    AGENT,
    ADMIN_CLIENT,
  ];

  static final $core.Map<$core.int, Profile_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Profile_Type? valueOf($core.int value) => _byValue[value];

  const Profile_Type._($core.int v, $core.String n) : super(v, n);
}

class BoxInfo_Box_Type extends $pb.ProtobufEnum {
  static const BoxInfo_Box_Type BOX_UNDEFINED =
      BoxInfo_Box_Type._(0, _omitEnumNames ? '' : 'BOX_UNDEFINED');
  static const BoxInfo_Box_Type RASPBERRY =
      BoxInfo_Box_Type._(1, _omitEnumNames ? '' : 'RASPBERRY');
  static const BoxInfo_Box_Type ORANGEPI = BoxInfo_Box_Type._(2, _omitEnumNames ? '' : 'ORANGEPI');

  static const $core.List<BoxInfo_Box_Type> values = <BoxInfo_Box_Type>[
    BOX_UNDEFINED,
    RASPBERRY,
    ORANGEPI,
  ];

  static final $core.Map<$core.int, BoxInfo_Box_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static BoxInfo_Box_Type? valueOf($core.int value) => _byValue[value];

  const BoxInfo_Box_Type._($core.int v, $core.String n) : super(v, n);
}

class ScheduleTime_Day extends $pb.ProtobufEnum {
  static const ScheduleTime_Day CN = ScheduleTime_Day._(0, _omitEnumNames ? '' : 'CN');
  static const ScheduleTime_Day T2 = ScheduleTime_Day._(1, _omitEnumNames ? '' : 'T2');
  static const ScheduleTime_Day T3 = ScheduleTime_Day._(2, _omitEnumNames ? '' : 'T3');
  static const ScheduleTime_Day T4 = ScheduleTime_Day._(3, _omitEnumNames ? '' : 'T4');
  static const ScheduleTime_Day T5 = ScheduleTime_Day._(4, _omitEnumNames ? '' : 'T5');
  static const ScheduleTime_Day T6 = ScheduleTime_Day._(5, _omitEnumNames ? '' : 'T6');
  static const ScheduleTime_Day T7 = ScheduleTime_Day._(6, _omitEnumNames ? '' : 'T7');

  static const $core.List<ScheduleTime_Day> values = <ScheduleTime_Day>[
    CN,
    T2,
    T3,
    T4,
    T5,
    T6,
    T7,
  ];

  static final $core.Map<$core.int, ScheduleTime_Day> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ScheduleTime_Day? valueOf($core.int value) => _byValue[value];

  const ScheduleTime_Day._($core.int v, $core.String n) : super(v, n);
}

class Recording_TypeSchedule extends $pb.ProtobufEnum {
  static const Recording_TypeSchedule ALWAY_RECORDING =
      Recording_TypeSchedule._(0, _omitEnumNames ? '' : 'ALWAY_RECORDING');
  static const Recording_TypeSchedule CUSTOMIZE_RECORDING =
      Recording_TypeSchedule._(2, _omitEnumNames ? '' : 'CUSTOMIZE_RECORDING');

  static const $core.List<Recording_TypeSchedule> values = <Recording_TypeSchedule>[
    ALWAY_RECORDING,
    CUSTOMIZE_RECORDING,
  ];

  static final $core.Map<$core.int, Recording_TypeSchedule> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Recording_TypeSchedule? valueOf($core.int value) => _byValue[value];

  const Recording_TypeSchedule._($core.int v, $core.String n) : super(v, n);
}

class Recording_RecordingForm extends $pb.ProtobufEnum {
  static const Recording_RecordingForm CLOUD =
      Recording_RecordingForm._(0, _omitEnumNames ? '' : 'CLOUD');
  static const Recording_RecordingForm SD_CARD =
      Recording_RecordingForm._(1, _omitEnumNames ? '' : 'SD_CARD');
  static const Recording_RecordingForm ALL =
      Recording_RecordingForm._(2, _omitEnumNames ? '' : 'ALL');

  static const $core.List<Recording_RecordingForm> values = <Recording_RecordingForm>[
    CLOUD,
    SD_CARD,
    ALL,
  ];

  static final $core.Map<$core.int, Recording_RecordingForm> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Recording_RecordingForm? valueOf($core.int value) => _byValue[value];

  const Recording_RecordingForm._($core.int v, $core.String n) : super(v, n);
}

class IVAJobRegionMotionDetect_Level extends $pb.ProtobufEnum {
  static const IVAJobRegionMotionDetect_Level LOW =
      IVAJobRegionMotionDetect_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const IVAJobRegionMotionDetect_Level MEDIUM =
      IVAJobRegionMotionDetect_Level._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const IVAJobRegionMotionDetect_Level HIGH =
      IVAJobRegionMotionDetect_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<IVAJobRegionMotionDetect_Level> values = <IVAJobRegionMotionDetect_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.Map<$core.int, IVAJobRegionMotionDetect_Level> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IVAJobRegionMotionDetect_Level? valueOf($core.int value) => _byValue[value];

  const IVAJobRegionMotionDetect_Level._($core.int v, $core.String n) : super(v, n);
}

class IVA_JobLineCrossing_Detect_DirectionType extends $pb.ProtobufEnum {
  static const IVA_JobLineCrossing_Detect_DirectionType A__B =
      IVA_JobLineCrossing_Detect_DirectionType._(0, _omitEnumNames ? '' : 'A__B');
  static const IVA_JobLineCrossing_Detect_DirectionType B__A =
      IVA_JobLineCrossing_Detect_DirectionType._(1, _omitEnumNames ? '' : 'B__A');
  static const IVA_JobLineCrossing_Detect_DirectionType AB =
      IVA_JobLineCrossing_Detect_DirectionType._(2, _omitEnumNames ? '' : 'AB');

  static const $core.List<IVA_JobLineCrossing_Detect_DirectionType> values =
      <IVA_JobLineCrossing_Detect_DirectionType>[
    A__B,
    B__A,
    AB,
  ];

  static final $core.Map<$core.int, IVA_JobLineCrossing_Detect_DirectionType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IVA_JobLineCrossing_Detect_DirectionType? valueOf($core.int value) => _byValue[value];

  const IVA_JobLineCrossing_Detect_DirectionType._($core.int v, $core.String n) : super(v, n);
}

class IVA_JobLineCrossing_Detect_Level extends $pb.ProtobufEnum {
  static const IVA_JobLineCrossing_Detect_Level LOW =
      IVA_JobLineCrossing_Detect_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const IVA_JobLineCrossing_Detect_Level MEDIUM =
      IVA_JobLineCrossing_Detect_Level._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const IVA_JobLineCrossing_Detect_Level HIGH =
      IVA_JobLineCrossing_Detect_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<IVA_JobLineCrossing_Detect_Level> values =
      <IVA_JobLineCrossing_Detect_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.Map<$core.int, IVA_JobLineCrossing_Detect_Level> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IVA_JobLineCrossing_Detect_Level? valueOf($core.int value) => _byValue[value];

  const IVA_JobLineCrossing_Detect_Level._($core.int v, $core.String n) : super(v, n);
}

class IVA_IntrusionDetection_Detect_Level extends $pb.ProtobufEnum {
  static const IVA_IntrusionDetection_Detect_Level LOW =
      IVA_IntrusionDetection_Detect_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const IVA_IntrusionDetection_Detect_Level MEDIUM =
      IVA_IntrusionDetection_Detect_Level._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const IVA_IntrusionDetection_Detect_Level HIGH =
      IVA_IntrusionDetection_Detect_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<IVA_IntrusionDetection_Detect_Level> values =
      <IVA_IntrusionDetection_Detect_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.Map<$core.int, IVA_IntrusionDetection_Detect_Level> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IVA_IntrusionDetection_Detect_Level? valueOf($core.int value) => _byValue[value];

  const IVA_IntrusionDetection_Detect_Level._($core.int v, $core.String n) : super(v, n);
}

class IVA_Smoke_Detect_Level extends $pb.ProtobufEnum {
  static const IVA_Smoke_Detect_Level LOW =
      IVA_Smoke_Detect_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const IVA_Smoke_Detect_Level MEDIUM =
      IVA_Smoke_Detect_Level._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const IVA_Smoke_Detect_Level HIGH =
      IVA_Smoke_Detect_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<IVA_Smoke_Detect_Level> values = <IVA_Smoke_Detect_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.Map<$core.int, IVA_Smoke_Detect_Level> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IVA_Smoke_Detect_Level? valueOf($core.int value) => _byValue[value];

  const IVA_Smoke_Detect_Level._($core.int v, $core.String n) : super(v, n);
}

class CameraConfig_Rotate extends $pb.ProtobufEnum {
  static const CameraConfig_Rotate NORMAL =
      CameraConfig_Rotate._(0, _omitEnumNames ? '' : 'NORMAL');
  static const CameraConfig_Rotate RIGHT = CameraConfig_Rotate._(1, _omitEnumNames ? '' : 'RIGHT');
  static const CameraConfig_Rotate LEFT = CameraConfig_Rotate._(2, _omitEnumNames ? '' : 'LEFT');

  static const $core.List<CameraConfig_Rotate> values = <CameraConfig_Rotate>[
    NORMAL,
    RIGHT,
    LEFT,
  ];

  static final $core.Map<$core.int, CameraConfig_Rotate> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CameraConfig_Rotate? valueOf($core.int value) => _byValue[value];

  const CameraConfig_Rotate._($core.int v, $core.String n) : super(v, n);
}

class CameraConfig_StorageMode extends $pb.ProtobufEnum {
  static const CameraConfig_StorageMode CLOUD =
      CameraConfig_StorageMode._(0, _omitEnumNames ? '' : 'CLOUD');
  static const CameraConfig_StorageMode CLOUD_AND_SDCARD =
      CameraConfig_StorageMode._(1, _omitEnumNames ? '' : 'CLOUD_AND_SDCARD');

  static const $core.List<CameraConfig_StorageMode> values = <CameraConfig_StorageMode>[
    CLOUD,
    CLOUD_AND_SDCARD,
  ];

  static final $core.Map<$core.int, CameraConfig_StorageMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CameraConfig_StorageMode? valueOf($core.int value) => _byValue[value];

  const CameraConfig_StorageMode._($core.int v, $core.String n) : super(v, n);
}

class CameraConfig_Level extends $pb.ProtobufEnum {
  static const CameraConfig_Level LOW = CameraConfig_Level._(0, _omitEnumNames ? '' : 'LOW');
  static const CameraConfig_Level MEDIUM = CameraConfig_Level._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const CameraConfig_Level HIGH = CameraConfig_Level._(2, _omitEnumNames ? '' : 'HIGH');

  static const $core.List<CameraConfig_Level> values = <CameraConfig_Level>[
    LOW,
    MEDIUM,
    HIGH,
  ];

  static final $core.Map<$core.int, CameraConfig_Level> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CameraConfig_Level? valueOf($core.int value) => _byValue[value];

  const CameraConfig_Level._($core.int v, $core.String n) : super(v, n);
}

class CameraStream_DefaultURL extends $pb.ProtobufEnum {
  static const CameraStream_DefaultURL HLS =
      CameraStream_DefaultURL._(0, _omitEnumNames ? '' : 'HLS');
  static const CameraStream_DefaultURL RTSP_ORIGIN =
      CameraStream_DefaultURL._(1, _omitEnumNames ? '' : 'RTSP_ORIGIN');
  static const CameraStream_DefaultURL RTSP_PROXY =
      CameraStream_DefaultURL._(2, _omitEnumNames ? '' : 'RTSP_PROXY');
  static const CameraStream_DefaultURL RTMP =
      CameraStream_DefaultURL._(3, _omitEnumNames ? '' : 'RTMP');

  static const $core.List<CameraStream_DefaultURL> values = <CameraStream_DefaultURL>[
    HLS,
    RTSP_ORIGIN,
    RTSP_PROXY,
    RTMP,
  ];

  static final $core.Map<$core.int, CameraStream_DefaultURL> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CameraStream_DefaultURL? valueOf($core.int value) => _byValue[value];

  const CameraStream_DefaultURL._($core.int v, $core.String n) : super(v, n);
}

class CameraStream_UrlStream_StreamType extends $pb.ProtobufEnum {
  static const CameraStream_UrlStream_StreamType HLS =
      CameraStream_UrlStream_StreamType._(0, _omitEnumNames ? '' : 'HLS');
  static const CameraStream_UrlStream_StreamType RTSP =
      CameraStream_UrlStream_StreamType._(1, _omitEnumNames ? '' : 'RTSP');
  static const CameraStream_UrlStream_StreamType UDP =
      CameraStream_UrlStream_StreamType._(2, _omitEnumNames ? '' : 'UDP');
  static const CameraStream_UrlStream_StreamType RTSP_PROXY =
      CameraStream_UrlStream_StreamType._(3, _omitEnumNames ? '' : 'RTSP_PROXY');
  static const CameraStream_UrlStream_StreamType RTMP =
      CameraStream_UrlStream_StreamType._(4, _omitEnumNames ? '' : 'RTMP');

  static const $core.List<CameraStream_UrlStream_StreamType> values =
      <CameraStream_UrlStream_StreamType>[
    HLS,
    RTSP,
    UDP,
    RTSP_PROXY,
    RTMP,
  ];

  static final $core.Map<$core.int, CameraStream_UrlStream_StreamType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CameraStream_UrlStream_StreamType? valueOf($core.int value) => _byValue[value];

  const CameraStream_UrlStream_StreamType._($core.int v, $core.String n) : super(v, n);
}

class Camera_Type extends $pb.ProtobufEnum {
  static const Camera_Type OWNER = Camera_Type._(0, _omitEnumNames ? '' : 'OWNER');
  static const Camera_Type SHARED = Camera_Type._(1, _omitEnumNames ? '' : 'SHARED');
  static const Camera_Type GROUP_SHARED = Camera_Type._(2, _omitEnumNames ? '' : 'GROUP_SHARED');

  static const $core.List<Camera_Type> values = <Camera_Type>[
    OWNER,
    SHARED,
    GROUP_SHARED,
  ];

  static final $core.Map<$core.int, Camera_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Camera_Type? valueOf($core.int value) => _byValue[value];

  const Camera_Type._($core.int v, $core.String n) : super(v, n);
}

class Camera_Role extends $pb.ProtobufEnum {
  static const Camera_Role VIEW = Camera_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const Camera_Role ALL = Camera_Role._(1, _omitEnumNames ? '' : 'ALL');

  static const $core.List<Camera_Role> values = <Camera_Role>[
    VIEW,
    ALL,
  ];

  static final $core.Map<$core.int, Camera_Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Camera_Role? valueOf($core.int value) => _byValue[value];

  const Camera_Role._($core.int v, $core.String n) : super(v, n);
}

class Camera_Status extends $pb.ProtobufEnum {
  static const Camera_Status INACTIVE = Camera_Status._(0, _omitEnumNames ? '' : 'INACTIVE');
  static const Camera_Status ACTIVE = Camera_Status._(1, _omitEnumNames ? '' : 'ACTIVE');

  static const $core.List<Camera_Status> values = <Camera_Status>[
    INACTIVE,
    ACTIVE,
  ];

  static final $core.Map<$core.int, Camera_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Camera_Status? valueOf($core.int value) => _byValue[value];

  const Camera_Status._($core.int v, $core.String n) : super(v, n);
}

class Alarm_Type extends $pb.ProtobufEnum {
  static const Alarm_Type MOTION_DETECTION =
      Alarm_Type._(0, _omitEnumNames ? '' : 'MOTION_DETECTION');
  static const Alarm_Type SOUND_DETECTION =
      Alarm_Type._(1, _omitEnumNames ? '' : 'SOUND_DETECTION');

  static const $core.List<Alarm_Type> values = <Alarm_Type>[
    MOTION_DETECTION,
    SOUND_DETECTION,
  ];

  static final $core.Map<$core.int, Alarm_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Alarm_Type? valueOf($core.int value) => _byValue[value];

  const Alarm_Type._($core.int v, $core.String n) : super(v, n);
}

class Alarm_Storage extends $pb.ProtobufEnum {
  static const Alarm_Storage CLOUD_STORAGE =
      Alarm_Storage._(0, _omitEnumNames ? '' : 'CLOUD_STORAGE');
  static const Alarm_Storage SD_CARD = Alarm_Storage._(1, _omitEnumNames ? '' : 'SD_CARD');

  static const $core.List<Alarm_Storage> values = <Alarm_Storage>[
    CLOUD_STORAGE,
    SD_CARD,
  ];

  static final $core.Map<$core.int, Alarm_Storage> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Alarm_Storage? valueOf($core.int value) => _byValue[value];

  const Alarm_Storage._($core.int v, $core.String n) : super(v, n);
}

class FaceDetection_DetectionType extends $pb.ProtobufEnum {
  static const FaceDetection_DetectionType FACE_DETECTION =
      FaceDetection_DetectionType._(0, _omitEnumNames ? '' : 'FACE_DETECTION');
  static const FaceDetection_DetectionType UNKNOWN_DETECTION =
      FaceDetection_DetectionType._(1, _omitEnumNames ? '' : 'UNKNOWN_DETECTION');

  static const $core.List<FaceDetection_DetectionType> values = <FaceDetection_DetectionType>[
    FACE_DETECTION,
    UNKNOWN_DETECTION,
  ];

  static final $core.Map<$core.int, FaceDetection_DetectionType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static FaceDetection_DetectionType? valueOf($core.int value) => _byValue[value];

  const FaceDetection_DetectionType._($core.int v, $core.String n) : super(v, n);
}

class DeviceGroup_Status extends $pb.ProtobufEnum {
  static const DeviceGroup_Status INACTIVE =
      DeviceGroup_Status._(0, _omitEnumNames ? '' : 'INACTIVE');
  static const DeviceGroup_Status ACTIVE = DeviceGroup_Status._(1, _omitEnumNames ? '' : 'ACTIVE');

  static const $core.List<DeviceGroup_Status> values = <DeviceGroup_Status>[
    INACTIVE,
    ACTIVE,
  ];

  static final $core.Map<$core.int, DeviceGroup_Status> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DeviceGroup_Status? valueOf($core.int value) => _byValue[value];

  const DeviceGroup_Status._($core.int v, $core.String n) : super(v, n);
}

class DeviceGroup_Type extends $pb.ProtobufEnum {
  static const DeviceGroup_Type OWNER = DeviceGroup_Type._(0, _omitEnumNames ? '' : 'OWNER');
  static const DeviceGroup_Type SHARED = DeviceGroup_Type._(1, _omitEnumNames ? '' : 'SHARED');
  static const DeviceGroup_Type MOVED = DeviceGroup_Type._(2, _omitEnumNames ? '' : 'MOVED');

  static const $core.List<DeviceGroup_Type> values = <DeviceGroup_Type>[
    OWNER,
    SHARED,
    MOVED,
  ];

  static final $core.Map<$core.int, DeviceGroup_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DeviceGroup_Type? valueOf($core.int value) => _byValue[value];

  const DeviceGroup_Type._($core.int v, $core.String n) : super(v, n);
}

class DeviceGroup_Role extends $pb.ProtobufEnum {
  static const DeviceGroup_Role FULL = DeviceGroup_Role._(0, _omitEnumNames ? '' : 'FULL');
  static const DeviceGroup_Role GVIEW = DeviceGroup_Role._(1, _omitEnumNames ? '' : 'GVIEW');
  static const DeviceGroup_Role GMANAGER = DeviceGroup_Role._(2, _omitEnumNames ? '' : 'GMANAGER');

  static const $core.List<DeviceGroup_Role> values = <DeviceGroup_Role>[
    FULL,
    GVIEW,
    GMANAGER,
  ];

  static final $core.Map<$core.int, DeviceGroup_Role> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DeviceGroup_Role? valueOf($core.int value) => _byValue[value];

  const DeviceGroup_Role._($core.int v, $core.String n) : super(v, n);
}

class InviteMessage_Role extends $pb.ProtobufEnum {
  static const InviteMessage_Role VIEW = InviteMessage_Role._(0, _omitEnumNames ? '' : 'VIEW');
  static const InviteMessage_Role ALL = InviteMessage_Role._(1, _omitEnumNames ? '' : 'ALL');

  static const $core.List<InviteMessage_Role> values = <InviteMessage_Role>[
    VIEW,
    ALL,
  ];

  static final $core.Map<$core.int, InviteMessage_Role> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InviteMessage_Role? valueOf($core.int value) => _byValue[value];

  const InviteMessage_Role._($core.int v, $core.String n) : super(v, n);
}

class InviteMessage_GroupShareRole extends $pb.ProtobufEnum {
  static const InviteMessage_GroupShareRole GFULL =
      InviteMessage_GroupShareRole._(0, _omitEnumNames ? '' : 'GFULL');
  static const InviteMessage_GroupShareRole GVIEW =
      InviteMessage_GroupShareRole._(1, _omitEnumNames ? '' : 'GVIEW');
  static const InviteMessage_GroupShareRole GMANAGER =
      InviteMessage_GroupShareRole._(2, _omitEnumNames ? '' : 'GMANAGER');

  static const $core.List<InviteMessage_GroupShareRole> values = <InviteMessage_GroupShareRole>[
    GFULL,
    GVIEW,
    GMANAGER,
  ];

  static final $core.Map<$core.int, InviteMessage_GroupShareRole> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InviteMessage_GroupShareRole? valueOf($core.int value) => _byValue[value];

  const InviteMessage_GroupShareRole._($core.int v, $core.String n) : super(v, n);
}

class InviteMessage_Status extends $pb.ProtobufEnum {
  static const InviteMessage_Status PENDING =
      InviteMessage_Status._(0, _omitEnumNames ? '' : 'PENDING');
  static const InviteMessage_Status ACCEPT =
      InviteMessage_Status._(1, _omitEnumNames ? '' : 'ACCEPT');
  static const InviteMessage_Status DECLINE =
      InviteMessage_Status._(2, _omitEnumNames ? '' : 'DECLINE');

  static const $core.List<InviteMessage_Status> values = <InviteMessage_Status>[
    PENDING,
    ACCEPT,
    DECLINE,
  ];

  static final $core.Map<$core.int, InviteMessage_Status> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InviteMessage_Status? valueOf($core.int value) => _byValue[value];

  const InviteMessage_Status._($core.int v, $core.String n) : super(v, n);
}

class InviteMessage_ShareType extends $pb.ProtobufEnum {
  static const InviteMessage_ShareType CAMERA =
      InviteMessage_ShareType._(0, _omitEnumNames ? '' : 'CAMERA');
  static const InviteMessage_ShareType GROUP_CAMERA =
      InviteMessage_ShareType._(1, _omitEnumNames ? '' : 'GROUP_CAMERA');

  static const $core.List<InviteMessage_ShareType> values = <InviteMessage_ShareType>[
    CAMERA,
    GROUP_CAMERA,
  ];

  static final $core.Map<$core.int, InviteMessage_ShareType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InviteMessage_ShareType? valueOf($core.int value) => _byValue[value];

  const InviteMessage_ShareType._($core.int v, $core.String n) : super(v, n);
}

class License_profile_ISON extends $pb.ProtobufEnum {
  static const License_profile_ISON OFF = License_profile_ISON._(0, _omitEnumNames ? '' : 'OFF');
  static const License_profile_ISON ON = License_profile_ISON._(1, _omitEnumNames ? '' : 'ON');

  static const $core.List<License_profile_ISON> values = <License_profile_ISON>[
    OFF,
    ON,
  ];

  static final $core.Map<$core.int, License_profile_ISON> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static License_profile_ISON? valueOf($core.int value) => _byValue[value];

  const License_profile_ISON._($core.int v, $core.String n) : super(v, n);
}

class User_Status extends $pb.ProtobufEnum {
  static const User_Status INACTIVE = User_Status._(0, _omitEnumNames ? '' : 'INACTIVE');
  static const User_Status ACTIVE = User_Status._(1, _omitEnumNames ? '' : 'ACTIVE');
  static const User_Status AGENT_CREATE = User_Status._(2, _omitEnumNames ? '' : 'AGENT_CREATE');

  static const $core.List<User_Status> values = <User_Status>[
    INACTIVE,
    ACTIVE,
    AGENT_CREATE,
  ];

  static final $core.Map<$core.int, User_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static User_Status? valueOf($core.int value) => _byValue[value];

  const User_Status._($core.int v, $core.String n) : super(v, n);
}

class User_Type extends $pb.ProtobufEnum {
  static const User_Type USER = User_Type._(0, _omitEnumNames ? '' : 'USER');
  static const User_Type ADMIN = User_Type._(1, _omitEnumNames ? '' : 'ADMIN');
  static const User_Type SUPER_ADMIN = User_Type._(2, _omitEnumNames ? '' : 'SUPER_ADMIN');
  static const User_Type SYS_ADMIN = User_Type._(3, _omitEnumNames ? '' : 'SYS_ADMIN');
  static const User_Type AGENT = User_Type._(4, _omitEnumNames ? '' : 'AGENT');
  static const User_Type ADMIN_CLIENT = User_Type._(5, _omitEnumNames ? '' : 'ADMIN_CLIENT');

  static const $core.List<User_Type> values = <User_Type>[
    USER,
    ADMIN,
    SUPER_ADMIN,
    SYS_ADMIN,
    AGENT,
    ADMIN_CLIENT,
  ];

  static final $core.Map<$core.int, User_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static User_Type? valueOf($core.int value) => _byValue[value];

  const User_Type._($core.int v, $core.String n) : super(v, n);
}

class NotificationMsg_MsgType extends $pb.ProtobufEnum {
  static const NotificationMsg_MsgType GENERIC =
      NotificationMsg_MsgType._(0, _omitEnumNames ? '' : 'GENERIC');
  static const NotificationMsg_MsgType SHARE =
      NotificationMsg_MsgType._(1, _omitEnumNames ? '' : 'SHARE');

  static const $core.List<NotificationMsg_MsgType> values = <NotificationMsg_MsgType>[
    GENERIC,
    SHARE,
  ];

  static final $core.Map<$core.int, NotificationMsg_MsgType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static NotificationMsg_MsgType? valueOf($core.int value) => _byValue[value];

  const NotificationMsg_MsgType._($core.int v, $core.String n) : super(v, n);
}

class InOutCam_VehicleType extends $pb.ProtobufEnum {
  static const InOutCam_VehicleType CAR = InOutCam_VehicleType._(0, _omitEnumNames ? '' : 'CAR');
  static const InOutCam_VehicleType BIKE = InOutCam_VehicleType._(1, _omitEnumNames ? '' : 'BIKE');

  static const $core.List<InOutCam_VehicleType> values = <InOutCam_VehicleType>[
    CAR,
    BIKE,
  ];

  static final $core.Map<$core.int, InOutCam_VehicleType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InOutCam_VehicleType? valueOf($core.int value) => _byValue[value];

  const InOutCam_VehicleType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
