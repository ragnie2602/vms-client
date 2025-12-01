//
//  Generated code. Do not modify.
//  source: comm.command1.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'comm.command1.pbenum.dart';
import 'comm.model.pb.dart' as $1;
import 'comm.model.pbenum.dart' as $1;
import 'google/protobuf/any.pb.dart' as $0;

export 'comm.command1.pbenum.dart';

class ReceiveAddCamera extends $pb.GeneratedMessage {
  factory ReceiveAddCamera({
    $1.Camera? camera,
    ReceiveAddCamera_Status? status,
    $core.int? rECEIVEADDCAMERA,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (status != null) {
      $result.status = status;
    }
    if (rECEIVEADDCAMERA != null) {
      $result.rECEIVEADDCAMERA = rECEIVEADDCAMERA;
    }
    return $result;
  }
  ReceiveAddCamera._() : super();
  factory ReceiveAddCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveAddCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveAddCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..e<ReceiveAddCamera_Status>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ReceiveAddCamera_Status.SUCCESS, valueOf: ReceiveAddCamera_Status.valueOf, enumValues: ReceiveAddCamera_Status.values)
    ..a<$core.int>(23, _omitFieldNames ? '' : 'RECEIVEADDCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_ADD_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveAddCamera clone() => ReceiveAddCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveAddCamera copyWith(void Function(ReceiveAddCamera) updates) => super.copyWith((message) => updates(message as ReceiveAddCamera)) as ReceiveAddCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveAddCamera create() => ReceiveAddCamera._();
  ReceiveAddCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveAddCamera> createRepeated() => $pb.PbList<ReceiveAddCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveAddCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveAddCamera>(create);
  static ReceiveAddCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(2)
  ReceiveAddCamera_Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(ReceiveAddCamera_Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(23)
  $core.int get rECEIVEADDCAMERA => $_getIZ(2);
  @$pb.TagNumber(23)
  set rECEIVEADDCAMERA($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(23)
  $core.bool hasRECEIVEADDCAMERA() => $_has(2);
  @$pb.TagNumber(23)
  void clearRECEIVEADDCAMERA() => clearField(23);
}

class ReceiveNotificationCamera extends $pb.GeneratedMessage {
  factory ReceiveNotificationCamera({
    $core.List<$core.int>? cameraId,
    $core.String? cameraName,
    ReceiveNotificationCamera_Type? type,
    $1.Alarm? alarm,
    ReceiveNotificationCamera_Status? status,
    ReceiveNotificationCamera_Form? form,
    $core.int? rECEIVENOTIFICATIONCAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (type != null) {
      $result.type = type;
    }
    if (alarm != null) {
      $result.alarm = alarm;
    }
    if (status != null) {
      $result.status = status;
    }
    if (form != null) {
      $result.form = form;
    }
    if (rECEIVENOTIFICATIONCAMERA != null) {
      $result.rECEIVENOTIFICATIONCAMERA = rECEIVENOTIFICATIONCAMERA;
    }
    return $result;
  }
  ReceiveNotificationCamera._() : super();
  factory ReceiveNotificationCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveNotificationCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveNotificationCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'cameraName')
    ..e<ReceiveNotificationCamera_Type>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ReceiveNotificationCamera_Type.MOTION_DETECTION, valueOf: ReceiveNotificationCamera_Type.valueOf, enumValues: ReceiveNotificationCamera_Type.values)
    ..aOM<$1.Alarm>(4, _omitFieldNames ? '' : 'alarm', subBuilder: $1.Alarm.create)
    ..e<ReceiveNotificationCamera_Status>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ReceiveNotificationCamera_Status.SUCCESS, valueOf: ReceiveNotificationCamera_Status.valueOf, enumValues: ReceiveNotificationCamera_Status.values)
    ..e<ReceiveNotificationCamera_Form>(6, _omitFieldNames ? '' : 'form', $pb.PbFieldType.OE, defaultOrMaker: ReceiveNotificationCamera_Form.SD_CARD, valueOf: ReceiveNotificationCamera_Form.valueOf, enumValues: ReceiveNotificationCamera_Form.values)
    ..a<$core.int>(25, _omitFieldNames ? '' : 'RECEIVENOTIFICATIONCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_NOTIFICATION_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveNotificationCamera clone() => ReceiveNotificationCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveNotificationCamera copyWith(void Function(ReceiveNotificationCamera) updates) => super.copyWith((message) => updates(message as ReceiveNotificationCamera)) as ReceiveNotificationCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveNotificationCamera create() => ReceiveNotificationCamera._();
  ReceiveNotificationCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveNotificationCamera> createRepeated() => $pb.PbList<ReceiveNotificationCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveNotificationCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveNotificationCamera>(create);
  static ReceiveNotificationCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cameraName => $_getSZ(1);
  @$pb.TagNumber(2)
  set cameraName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraName() => clearField(2);

  @$pb.TagNumber(3)
  ReceiveNotificationCamera_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ReceiveNotificationCamera_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $1.Alarm get alarm => $_getN(3);
  @$pb.TagNumber(4)
  set alarm($1.Alarm v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlarm() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlarm() => clearField(4);
  @$pb.TagNumber(4)
  $1.Alarm ensureAlarm() => $_ensure(3);

  @$pb.TagNumber(5)
  ReceiveNotificationCamera_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(ReceiveNotificationCamera_Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  ReceiveNotificationCamera_Form get form => $_getN(5);
  @$pb.TagNumber(6)
  set form(ReceiveNotificationCamera_Form v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasForm() => $_has(5);
  @$pb.TagNumber(6)
  void clearForm() => clearField(6);

  @$pb.TagNumber(25)
  $core.int get rECEIVENOTIFICATIONCAMERA => $_getIZ(6);
  @$pb.TagNumber(25)
  set rECEIVENOTIFICATIONCAMERA($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(25)
  $core.bool hasRECEIVENOTIFICATIONCAMERA() => $_has(6);
  @$pb.TagNumber(25)
  void clearRECEIVENOTIFICATIONCAMERA() => clearField(25);
}

class ReceiveScheduleCamera extends $pb.GeneratedMessage {
  factory ReceiveScheduleCamera({
    $core.List<$core.int>? cameraId,
    ReceiveScheduleCamera_Status? status,
    $1.Recording? recording,
    $core.int? rECEIVERESULTSHEDULECAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (recording != null) {
      $result.recording = recording;
    }
    if (rECEIVERESULTSHEDULECAMERA != null) {
      $result.rECEIVERESULTSHEDULECAMERA = rECEIVERESULTSHEDULECAMERA;
    }
    return $result;
  }
  ReceiveScheduleCamera._() : super();
  factory ReceiveScheduleCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveScheduleCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveScheduleCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<ReceiveScheduleCamera_Status>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ReceiveScheduleCamera_Status.SUCCESS, valueOf: ReceiveScheduleCamera_Status.valueOf, enumValues: ReceiveScheduleCamera_Status.values)
    ..aOM<$1.Recording>(3, _omitFieldNames ? '' : 'recording', subBuilder: $1.Recording.create)
    ..a<$core.int>(39, _omitFieldNames ? '' : 'RECEIVERESULTSHEDULECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_RESULT_SHEDULE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveScheduleCamera clone() => ReceiveScheduleCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveScheduleCamera copyWith(void Function(ReceiveScheduleCamera) updates) => super.copyWith((message) => updates(message as ReceiveScheduleCamera)) as ReceiveScheduleCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveScheduleCamera create() => ReceiveScheduleCamera._();
  ReceiveScheduleCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveScheduleCamera> createRepeated() => $pb.PbList<ReceiveScheduleCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveScheduleCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveScheduleCamera>(create);
  static ReceiveScheduleCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  ReceiveScheduleCamera_Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(ReceiveScheduleCamera_Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $1.Recording get recording => $_getN(2);
  @$pb.TagNumber(3)
  set recording($1.Recording v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecording() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecording() => clearField(3);
  @$pb.TagNumber(3)
  $1.Recording ensureRecording() => $_ensure(2);

  @$pb.TagNumber(39)
  $core.int get rECEIVERESULTSHEDULECAMERA => $_getIZ(3);
  @$pb.TagNumber(39)
  set rECEIVERESULTSHEDULECAMERA($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(39)
  $core.bool hasRECEIVERESULTSHEDULECAMERA() => $_has(3);
  @$pb.TagNumber(39)
  void clearRECEIVERESULTSHEDULECAMERA() => clearField(39);
}

class ReceiveTimeShiftCamera_Video extends $pb.GeneratedMessage {
  factory ReceiveTimeShiftCamera_Video({
    $core.String? name,
    $1.EventType? eventType,
    $core.int? duration,
    $fixnum.Int64? time,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }
  ReceiveTimeShiftCamera_Video._() : super();
  factory ReceiveTimeShiftCamera_Video.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveTimeShiftCamera_Video.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveTimeShiftCamera.Video', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..e<$1.EventType>(2, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: $1.EventType.MOTION_DETECTION, valueOf: $1.EventType.valueOf, enumValues: $1.EventType.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCamera_Video clone() => ReceiveTimeShiftCamera_Video()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCamera_Video copyWith(void Function(ReceiveTimeShiftCamera_Video) updates) => super.copyWith((message) => updates(message as ReceiveTimeShiftCamera_Video)) as ReceiveTimeShiftCamera_Video;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCamera_Video create() => ReceiveTimeShiftCamera_Video._();
  ReceiveTimeShiftCamera_Video createEmptyInstance() => create();
  static $pb.PbList<ReceiveTimeShiftCamera_Video> createRepeated() => $pb.PbList<ReceiveTimeShiftCamera_Video>();
  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCamera_Video getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveTimeShiftCamera_Video>(create);
  static ReceiveTimeShiftCamera_Video? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $1.EventType get eventType => $_getN(1);
  @$pb.TagNumber(2)
  set eventType($1.EventType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get time => $_getI64(3);
  @$pb.TagNumber(4)
  set time($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);
}

class ReceiveTimeShiftCamera extends $pb.GeneratedMessage {
  factory ReceiveTimeShiftCamera({
    $core.List<$core.int>? cameraId,
    $core.Iterable<ReceiveTimeShiftCamera_Video>? videos,
    $core.bool? end,
    $core.bool? hasSdcard,
    ReceiveTimeShiftCamera_Status? status,
    $core.int? rECEIVETIMESHIFTCAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (videos != null) {
      $result.videos.addAll(videos);
    }
    if (end != null) {
      $result.end = end;
    }
    if (hasSdcard != null) {
      $result.hasSdcard = hasSdcard;
    }
    if (status != null) {
      $result.status = status;
    }
    if (rECEIVETIMESHIFTCAMERA != null) {
      $result.rECEIVETIMESHIFTCAMERA = rECEIVETIMESHIFTCAMERA;
    }
    return $result;
  }
  ReceiveTimeShiftCamera._() : super();
  factory ReceiveTimeShiftCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveTimeShiftCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveTimeShiftCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..pc<ReceiveTimeShiftCamera_Video>(2, _omitFieldNames ? '' : 'videos', $pb.PbFieldType.PM, subBuilder: ReceiveTimeShiftCamera_Video.create)
    ..aOB(3, _omitFieldNames ? '' : 'end')
    ..aOB(4, _omitFieldNames ? '' : 'hasSdcard', protoName: 'has_Sdcard')
    ..e<ReceiveTimeShiftCamera_Status>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ReceiveTimeShiftCamera_Status.SUCCESS, valueOf: ReceiveTimeShiftCamera_Status.valueOf, enumValues: ReceiveTimeShiftCamera_Status.values)
    ..a<$core.int>(40, _omitFieldNames ? '' : 'RECEIVETIMESHIFTCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_TIMESHIFT_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCamera clone() => ReceiveTimeShiftCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCamera copyWith(void Function(ReceiveTimeShiftCamera) updates) => super.copyWith((message) => updates(message as ReceiveTimeShiftCamera)) as ReceiveTimeShiftCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCamera create() => ReceiveTimeShiftCamera._();
  ReceiveTimeShiftCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveTimeShiftCamera> createRepeated() => $pb.PbList<ReceiveTimeShiftCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveTimeShiftCamera>(create);
  static ReceiveTimeShiftCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ReceiveTimeShiftCamera_Video> get videos => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get end => $_getBF(2);
  @$pb.TagNumber(3)
  set end($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasSdcard => $_getBF(3);
  @$pb.TagNumber(4)
  set hasSdcard($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasSdcard() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasSdcard() => clearField(4);

  @$pb.TagNumber(5)
  ReceiveTimeShiftCamera_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(ReceiveTimeShiftCamera_Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(40)
  $core.int get rECEIVETIMESHIFTCAMERA => $_getIZ(5);
  @$pb.TagNumber(40)
  set rECEIVETIMESHIFTCAMERA($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(40)
  $core.bool hasRECEIVETIMESHIFTCAMERA() => $_has(5);
  @$pb.TagNumber(40)
  void clearRECEIVETIMESHIFTCAMERA() => clearField(40);
}

class ReceiveShareCamera extends $pb.GeneratedMessage {
  factory ReceiveShareCamera({
  @$core.Deprecated('This field is deprecated.')
    $core.List<$core.int>? cameraId,
  @$core.Deprecated('This field is deprecated.')
    $core.String? accountA,
  @$core.Deprecated('This field is deprecated.')
    $core.String? accountB,
  @$core.Deprecated('This field is deprecated.')
    $core.String? cameraName,
  @$core.Deprecated('This field is deprecated.')
    ReceiveShareCamera_Role? role,
  @$core.Deprecated('This field is deprecated.')
    $fixnum.Int64? time,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? isOwner,
  @$core.Deprecated('This field is deprecated.')
    $core.List<$core.int>? inviteMsgId,
  @$core.Deprecated('This field is deprecated.')
    $core.int? rECEIVESHARECAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.cameraId = cameraId;
    }
    if (accountA != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.accountA = accountA;
    }
    if (accountB != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.accountB = accountB;
    }
    if (cameraName != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.cameraName = cameraName;
    }
    if (role != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.role = role;
    }
    if (time != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.time = time;
    }
    if (isOwner != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.isOwner = isOwner;
    }
    if (inviteMsgId != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.inviteMsgId = inviteMsgId;
    }
    if (rECEIVESHARECAMERA != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.rECEIVESHARECAMERA = rECEIVESHARECAMERA;
    }
    return $result;
  }
  ReceiveShareCamera._() : super();
  factory ReceiveShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'accountA')
    ..aOS(3, _omitFieldNames ? '' : 'accountB')
    ..aOS(4, _omitFieldNames ? '' : 'cameraName')
    ..e<ReceiveShareCamera_Role>(5, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ReceiveShareCamera_Role.VIEW, valueOf: ReceiveShareCamera_Role.valueOf, enumValues: ReceiveShareCamera_Role.values)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(7, _omitFieldNames ? '' : 'isOwner', protoName: 'isOwner')
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..a<$core.int>(45, _omitFieldNames ? '' : 'RECEIVESHARECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_SHARE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveShareCamera clone() => ReceiveShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveShareCamera copyWith(void Function(ReceiveShareCamera) updates) => super.copyWith((message) => updates(message as ReceiveShareCamera)) as ReceiveShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveShareCamera create() => ReceiveShareCamera._();
  ReceiveShareCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveShareCamera> createRepeated() => $pb.PbList<ReceiveShareCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveShareCamera>(create);
  static ReceiveShareCamera? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.String get accountA => $_getSZ(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set accountA($core.String v) { $_setString(1, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAccountA() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAccountA() => clearField(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.String get accountB => $_getSZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set accountB($core.String v) { $_setString(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasAccountB() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearAccountB() => clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.String get cameraName => $_getSZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set cameraName($core.String v) { $_setString(3, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasCameraName() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearCameraName() => clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  ReceiveShareCamera_Role get role => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set role(ReceiveShareCamera_Role v) { setField(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $fixnum.Int64 get time => $_getI64(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set time($fixnum.Int64 v) { $_setInt64(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearTime() => clearField(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $core.bool get isOwner => $_getBF(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  set isOwner($core.bool v) { $_setBool(6, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $core.bool hasIsOwner() => $_has(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  void clearIsOwner() => clearField(7);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.List<$core.int> get inviteMsgId => $_getN(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(7, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasInviteMsgId() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearInviteMsgId() => clearField(8);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  $core.int get rECEIVESHARECAMERA => $_getIZ(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  set rECEIVESHARECAMERA($core.int v) { $_setUnsignedInt32(8, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  $core.bool hasRECEIVESHARECAMERA() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  void clearRECEIVESHARECAMERA() => clearField(45);
}

class ReceiveResponseShareCamera extends $pb.GeneratedMessage {
  factory ReceiveResponseShareCamera({
    $core.List<$core.int>? cameraId,
    $core.String? accountA,
    $core.String? accountB,
    ReceiveResponseShareCamera_Action? action,
    $core.int? rECEIVERESPONSESHARECAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (accountA != null) {
      $result.accountA = accountA;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (action != null) {
      $result.action = action;
    }
    if (rECEIVERESPONSESHARECAMERA != null) {
      $result.rECEIVERESPONSESHARECAMERA = rECEIVERESPONSESHARECAMERA;
    }
    return $result;
  }
  ReceiveResponseShareCamera._() : super();
  factory ReceiveResponseShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveResponseShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveResponseShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'accountA')
    ..aOS(3, _omitFieldNames ? '' : 'accountB')
    ..e<ReceiveResponseShareCamera_Action>(4, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: ReceiveResponseShareCamera_Action.ACCEPT, valueOf: ReceiveResponseShareCamera_Action.valueOf, enumValues: ReceiveResponseShareCamera_Action.values)
    ..a<$core.int>(46, _omitFieldNames ? '' : 'RECEIVERESPONSESHARECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_RESPONSE_SHARE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveResponseShareCamera clone() => ReceiveResponseShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveResponseShareCamera copyWith(void Function(ReceiveResponseShareCamera) updates) => super.copyWith((message) => updates(message as ReceiveResponseShareCamera)) as ReceiveResponseShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveResponseShareCamera create() => ReceiveResponseShareCamera._();
  ReceiveResponseShareCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveResponseShareCamera> createRepeated() => $pb.PbList<ReceiveResponseShareCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveResponseShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveResponseShareCamera>(create);
  static ReceiveResponseShareCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountA => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountA($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountA() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountA() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountB => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountB($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountB() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountB() => clearField(3);

  @$pb.TagNumber(4)
  ReceiveResponseShareCamera_Action get action => $_getN(3);
  @$pb.TagNumber(4)
  set action(ReceiveResponseShareCamera_Action v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearAction() => clearField(4);

  @$pb.TagNumber(46)
  $core.int get rECEIVERESPONSESHARECAMERA => $_getIZ(4);
  @$pb.TagNumber(46)
  set rECEIVERESPONSESHARECAMERA($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(46)
  $core.bool hasRECEIVERESPONSESHARECAMERA() => $_has(4);
  @$pb.TagNumber(46)
  void clearRECEIVERESPONSESHARECAMERA() => clearField(46);
}

class ReceiveDeleteShareCamera extends $pb.GeneratedMessage {
  factory ReceiveDeleteShareCamera({
    $core.List<$core.int>? cameraId,
    $core.String? accountA,
    $core.String? accountB,
    $core.int? rECEIVEDELETESHARECAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (accountA != null) {
      $result.accountA = accountA;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (rECEIVEDELETESHARECAMERA != null) {
      $result.rECEIVEDELETESHARECAMERA = rECEIVEDELETESHARECAMERA;
    }
    return $result;
  }
  ReceiveDeleteShareCamera._() : super();
  factory ReceiveDeleteShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveDeleteShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveDeleteShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'accountA')
    ..aOS(3, _omitFieldNames ? '' : 'accountB')
    ..a<$core.int>(47, _omitFieldNames ? '' : 'RECEIVEDELETESHARECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_DELETE_SHARE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveDeleteShareCamera clone() => ReceiveDeleteShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveDeleteShareCamera copyWith(void Function(ReceiveDeleteShareCamera) updates) => super.copyWith((message) => updates(message as ReceiveDeleteShareCamera)) as ReceiveDeleteShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteShareCamera create() => ReceiveDeleteShareCamera._();
  ReceiveDeleteShareCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveDeleteShareCamera> createRepeated() => $pb.PbList<ReceiveDeleteShareCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveDeleteShareCamera>(create);
  static ReceiveDeleteShareCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountA => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountA($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountA() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountA() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountB => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountB($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountB() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountB() => clearField(3);

  @$pb.TagNumber(47)
  $core.int get rECEIVEDELETESHARECAMERA => $_getIZ(3);
  @$pb.TagNumber(47)
  set rECEIVEDELETESHARECAMERA($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(47)
  $core.bool hasRECEIVEDELETESHARECAMERA() => $_has(3);
  @$pb.TagNumber(47)
  void clearRECEIVEDELETESHARECAMERA() => clearField(47);
}

class ReceiveDeleteCamera extends $pb.GeneratedMessage {
  factory ReceiveDeleteCamera({
    $core.List<$core.int>? cameraId,
    $core.String? accountA,
    $core.String? accountB,
    $core.int? rECEIVEDELETECAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (accountA != null) {
      $result.accountA = accountA;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (rECEIVEDELETECAMERA != null) {
      $result.rECEIVEDELETECAMERA = rECEIVEDELETECAMERA;
    }
    return $result;
  }
  ReceiveDeleteCamera._() : super();
  factory ReceiveDeleteCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveDeleteCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveDeleteCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'accountA')
    ..aOS(3, _omitFieldNames ? '' : 'accountB')
    ..a<$core.int>(48, _omitFieldNames ? '' : 'RECEIVEDELETECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_DELETE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveDeleteCamera clone() => ReceiveDeleteCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveDeleteCamera copyWith(void Function(ReceiveDeleteCamera) updates) => super.copyWith((message) => updates(message as ReceiveDeleteCamera)) as ReceiveDeleteCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteCamera create() => ReceiveDeleteCamera._();
  ReceiveDeleteCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveDeleteCamera> createRepeated() => $pb.PbList<ReceiveDeleteCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveDeleteCamera>(create);
  static ReceiveDeleteCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountA => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountA($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountA() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountA() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountB => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountB($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountB() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountB() => clearField(3);

  @$pb.TagNumber(48)
  $core.int get rECEIVEDELETECAMERA => $_getIZ(3);
  @$pb.TagNumber(48)
  set rECEIVEDELETECAMERA($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(48)
  $core.bool hasRECEIVEDELETECAMERA() => $_has(3);
  @$pb.TagNumber(48)
  void clearRECEIVEDELETECAMERA() => clearField(48);
}

class ReceiveOnOffCamera extends $pb.GeneratedMessage {
  factory ReceiveOnOffCamera({
    $core.List<$core.int>? cameraId,
    $core.String? cameraName,
    ReceiveOnOffCamera_Status? status,
    $1.Camera? camera,
    $core.int? rECEIVEONOFFCAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (status != null) {
      $result.status = status;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEONOFFCAMERA != null) {
      $result.rECEIVEONOFFCAMERA = rECEIVEONOFFCAMERA;
    }
    return $result;
  }
  ReceiveOnOffCamera._() : super();
  factory ReceiveOnOffCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveOnOffCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveOnOffCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'cameraName')
    ..e<ReceiveOnOffCamera_Status>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ReceiveOnOffCamera_Status.OFF, valueOf: ReceiveOnOffCamera_Status.valueOf, enumValues: ReceiveOnOffCamera_Status.values)
    ..aOM<$1.Camera>(4, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(49, _omitFieldNames ? '' : 'RECEIVEONOFFCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_ONOFF_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveOnOffCamera clone() => ReceiveOnOffCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveOnOffCamera copyWith(void Function(ReceiveOnOffCamera) updates) => super.copyWith((message) => updates(message as ReceiveOnOffCamera)) as ReceiveOnOffCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveOnOffCamera create() => ReceiveOnOffCamera._();
  ReceiveOnOffCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveOnOffCamera> createRepeated() => $pb.PbList<ReceiveOnOffCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveOnOffCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveOnOffCamera>(create);
  static ReceiveOnOffCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cameraName => $_getSZ(1);
  @$pb.TagNumber(2)
  set cameraName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraName() => clearField(2);

  @$pb.TagNumber(3)
  ReceiveOnOffCamera_Status get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(ReceiveOnOffCamera_Status v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $1.Camera get camera => $_getN(3);
  @$pb.TagNumber(4)
  set camera($1.Camera v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCamera() => $_has(3);
  @$pb.TagNumber(4)
  void clearCamera() => clearField(4);
  @$pb.TagNumber(4)
  $1.Camera ensureCamera() => $_ensure(3);

  @$pb.TagNumber(49)
  $core.int get rECEIVEONOFFCAMERA => $_getIZ(4);
  @$pb.TagNumber(49)
  set rECEIVEONOFFCAMERA($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(49)
  $core.bool hasRECEIVEONOFFCAMERA() => $_has(4);
  @$pb.TagNumber(49)
  void clearRECEIVEONOFFCAMERA() => clearField(49);
}

class ReceiveSettingCloud extends $pb.GeneratedMessage {
  factory ReceiveSettingCloud({
    $1.Camera? camera,
    $core.int? rECEIVESETTINGCLOUDCAMERA,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVESETTINGCLOUDCAMERA != null) {
      $result.rECEIVESETTINGCLOUDCAMERA = rECEIVESETTINGCLOUDCAMERA;
    }
    return $result;
  }
  ReceiveSettingCloud._() : super();
  factory ReceiveSettingCloud.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveSettingCloud.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveSettingCloud', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(51, _omitFieldNames ? '' : 'RECEIVESETTINGCLOUDCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_SETTING_CLOUD_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveSettingCloud clone() => ReceiveSettingCloud()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveSettingCloud copyWith(void Function(ReceiveSettingCloud) updates) => super.copyWith((message) => updates(message as ReceiveSettingCloud)) as ReceiveSettingCloud;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveSettingCloud create() => ReceiveSettingCloud._();
  ReceiveSettingCloud createEmptyInstance() => create();
  static $pb.PbList<ReceiveSettingCloud> createRepeated() => $pb.PbList<ReceiveSettingCloud>();
  @$core.pragma('dart2js:noInline')
  static ReceiveSettingCloud getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveSettingCloud>(create);
  static ReceiveSettingCloud? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(51)
  $core.int get rECEIVESETTINGCLOUDCAMERA => $_getIZ(1);
  @$pb.TagNumber(51)
  set rECEIVESETTINGCLOUDCAMERA($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(51)
  $core.bool hasRECEIVESETTINGCLOUDCAMERA() => $_has(1);
  @$pb.TagNumber(51)
  void clearRECEIVESETTINGCLOUDCAMERA() => clearField(51);
}

class ReceiveTimeShiftCloud_TimeData extends $pb.GeneratedMessage {
  factory ReceiveTimeShiftCloud_TimeData({
    $fixnum.Int64? t1,
    $fixnum.Int64? t2,
  }) {
    final $result = create();
    if (t1 != null) {
      $result.t1 = t1;
    }
    if (t2 != null) {
      $result.t2 = t2;
    }
    return $result;
  }
  ReceiveTimeShiftCloud_TimeData._() : super();
  factory ReceiveTimeShiftCloud_TimeData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveTimeShiftCloud_TimeData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveTimeShiftCloud.TimeData', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 't1', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 't2', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCloud_TimeData clone() => ReceiveTimeShiftCloud_TimeData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCloud_TimeData copyWith(void Function(ReceiveTimeShiftCloud_TimeData) updates) => super.copyWith((message) => updates(message as ReceiveTimeShiftCloud_TimeData)) as ReceiveTimeShiftCloud_TimeData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCloud_TimeData create() => ReceiveTimeShiftCloud_TimeData._();
  ReceiveTimeShiftCloud_TimeData createEmptyInstance() => create();
  static $pb.PbList<ReceiveTimeShiftCloud_TimeData> createRepeated() => $pb.PbList<ReceiveTimeShiftCloud_TimeData>();
  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCloud_TimeData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveTimeShiftCloud_TimeData>(create);
  static ReceiveTimeShiftCloud_TimeData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get t1 => $_getI64(0);
  @$pb.TagNumber(1)
  set t1($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasT1() => $_has(0);
  @$pb.TagNumber(1)
  void clearT1() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get t2 => $_getI64(1);
  @$pb.TagNumber(2)
  set t2($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasT2() => $_has(1);
  @$pb.TagNumber(2)
  void clearT2() => clearField(2);
}

class ReceiveTimeShiftCloud extends $pb.GeneratedMessage {
  factory ReceiveTimeShiftCloud({
    $core.List<$core.int>? cameraId,
    $core.String? url,
    $core.Iterable<ReceiveTimeShiftCloud_TimeData>? timeDatas,
    $core.int? rECEIVETIMESHIFTCLOUD,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (url != null) {
      $result.url = url;
    }
    if (timeDatas != null) {
      $result.timeDatas.addAll(timeDatas);
    }
    if (rECEIVETIMESHIFTCLOUD != null) {
      $result.rECEIVETIMESHIFTCLOUD = rECEIVETIMESHIFTCLOUD;
    }
    return $result;
  }
  ReceiveTimeShiftCloud._() : super();
  factory ReceiveTimeShiftCloud.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveTimeShiftCloud.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveTimeShiftCloud', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..pc<ReceiveTimeShiftCloud_TimeData>(3, _omitFieldNames ? '' : 'timeDatas', $pb.PbFieldType.PM, subBuilder: ReceiveTimeShiftCloud_TimeData.create)
    ..a<$core.int>(52, _omitFieldNames ? '' : 'RECEIVETIMESHIFTCLOUD', $pb.PbFieldType.OU3, protoName: 'RECEIVE_TIMESHIFT_CLOUD')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCloud clone() => ReceiveTimeShiftCloud()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveTimeShiftCloud copyWith(void Function(ReceiveTimeShiftCloud) updates) => super.copyWith((message) => updates(message as ReceiveTimeShiftCloud)) as ReceiveTimeShiftCloud;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCloud create() => ReceiveTimeShiftCloud._();
  ReceiveTimeShiftCloud createEmptyInstance() => create();
  static $pb.PbList<ReceiveTimeShiftCloud> createRepeated() => $pb.PbList<ReceiveTimeShiftCloud>();
  @$core.pragma('dart2js:noInline')
  static ReceiveTimeShiftCloud getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveTimeShiftCloud>(create);
  static ReceiveTimeShiftCloud? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ReceiveTimeShiftCloud_TimeData> get timeDatas => $_getList(2);

  @$pb.TagNumber(52)
  $core.int get rECEIVETIMESHIFTCLOUD => $_getIZ(3);
  @$pb.TagNumber(52)
  set rECEIVETIMESHIFTCLOUD($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(52)
  $core.bool hasRECEIVETIMESHIFTCLOUD() => $_has(3);
  @$pb.TagNumber(52)
  void clearRECEIVETIMESHIFTCLOUD() => clearField(52);
}

class ReceiveUpdatePositionCamera extends $pb.GeneratedMessage {
  factory ReceiveUpdatePositionCamera({
    $core.Iterable<$1.Camera>? cameras,
    $core.int? rECEIVEUPDATEPOSITIONCAMERA,
  }) {
    final $result = create();
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    if (rECEIVEUPDATEPOSITIONCAMERA != null) {
      $result.rECEIVEUPDATEPOSITIONCAMERA = rECEIVEUPDATEPOSITIONCAMERA;
    }
    return $result;
  }
  ReceiveUpdatePositionCamera._() : super();
  factory ReceiveUpdatePositionCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdatePositionCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdatePositionCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..a<$core.int>(53, _omitFieldNames ? '' : 'RECEIVEUPDATEPOSITIONCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_POSITION_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdatePositionCamera clone() => ReceiveUpdatePositionCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdatePositionCamera copyWith(void Function(ReceiveUpdatePositionCamera) updates) => super.copyWith((message) => updates(message as ReceiveUpdatePositionCamera)) as ReceiveUpdatePositionCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdatePositionCamera create() => ReceiveUpdatePositionCamera._();
  ReceiveUpdatePositionCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdatePositionCamera> createRepeated() => $pb.PbList<ReceiveUpdatePositionCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdatePositionCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdatePositionCamera>(create);
  static ReceiveUpdatePositionCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get cameras => $_getList(0);

  @$pb.TagNumber(53)
  $core.int get rECEIVEUPDATEPOSITIONCAMERA => $_getIZ(1);
  @$pb.TagNumber(53)
  set rECEIVEUPDATEPOSITIONCAMERA($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(53)
  $core.bool hasRECEIVEUPDATEPOSITIONCAMERA() => $_has(1);
  @$pb.TagNumber(53)
  void clearRECEIVEUPDATEPOSITIONCAMERA() => clearField(53);
}

class ReceiveUpdateRoleShare extends $pb.GeneratedMessage {
  factory ReceiveUpdateRoleShare({
    $core.List<$core.int>? cameraId,
    ReceiveUpdateRoleShare_Role? role,
    $core.List<$core.int>? ivtId,
    $core.int? rECEIVEUPDATEROLESHARE,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (ivtId != null) {
      $result.ivtId = ivtId;
    }
    if (rECEIVEUPDATEROLESHARE != null) {
      $result.rECEIVEUPDATEROLESHARE = rECEIVEUPDATEROLESHARE;
    }
    return $result;
  }
  ReceiveUpdateRoleShare._() : super();
  factory ReceiveUpdateRoleShare.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateRoleShare.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateRoleShare', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<ReceiveUpdateRoleShare_Role>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ReceiveUpdateRoleShare_Role.VIEW, valueOf: ReceiveUpdateRoleShare_Role.valueOf, enumValues: ReceiveUpdateRoleShare_Role.values)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ivtId', $pb.PbFieldType.OY)
    ..a<$core.int>(60, _omitFieldNames ? '' : 'RECEIVEUPDATEROLESHARE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_ROLE_SHARE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateRoleShare clone() => ReceiveUpdateRoleShare()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateRoleShare copyWith(void Function(ReceiveUpdateRoleShare) updates) => super.copyWith((message) => updates(message as ReceiveUpdateRoleShare)) as ReceiveUpdateRoleShare;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateRoleShare create() => ReceiveUpdateRoleShare._();
  ReceiveUpdateRoleShare createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateRoleShare> createRepeated() => $pb.PbList<ReceiveUpdateRoleShare>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateRoleShare getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateRoleShare>(create);
  static ReceiveUpdateRoleShare? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  ReceiveUpdateRoleShare_Role get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ReceiveUpdateRoleShare_Role v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ivtId => $_getN(2);
  @$pb.TagNumber(3)
  set ivtId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIvtId() => $_has(2);
  @$pb.TagNumber(3)
  void clearIvtId() => clearField(3);

  @$pb.TagNumber(60)
  $core.int get rECEIVEUPDATEROLESHARE => $_getIZ(3);
  @$pb.TagNumber(60)
  set rECEIVEUPDATEROLESHARE($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(60)
  $core.bool hasRECEIVEUPDATEROLESHARE() => $_has(3);
  @$pb.TagNumber(60)
  void clearRECEIVEUPDATEROLESHARE() => clearField(60);
}

class ReceiveUpdateRoleCamera extends $pb.GeneratedMessage {
  factory ReceiveUpdateRoleCamera({
    $core.List<$core.int>? cameraId,
    ReceiveUpdateRoleCamera_Role? role,
    $core.List<$core.int>? ivtId,
    $core.int? rECEIVEUPDATEROLECAMERA,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (ivtId != null) {
      $result.ivtId = ivtId;
    }
    if (rECEIVEUPDATEROLECAMERA != null) {
      $result.rECEIVEUPDATEROLECAMERA = rECEIVEUPDATEROLECAMERA;
    }
    return $result;
  }
  ReceiveUpdateRoleCamera._() : super();
  factory ReceiveUpdateRoleCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateRoleCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateRoleCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<ReceiveUpdateRoleCamera_Role>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ReceiveUpdateRoleCamera_Role.VIEW, valueOf: ReceiveUpdateRoleCamera_Role.valueOf, enumValues: ReceiveUpdateRoleCamera_Role.values)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ivtId', $pb.PbFieldType.OY)
    ..a<$core.int>(61, _omitFieldNames ? '' : 'RECEIVEUPDATEROLECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_ROLE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateRoleCamera clone() => ReceiveUpdateRoleCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateRoleCamera copyWith(void Function(ReceiveUpdateRoleCamera) updates) => super.copyWith((message) => updates(message as ReceiveUpdateRoleCamera)) as ReceiveUpdateRoleCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateRoleCamera create() => ReceiveUpdateRoleCamera._();
  ReceiveUpdateRoleCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateRoleCamera> createRepeated() => $pb.PbList<ReceiveUpdateRoleCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateRoleCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateRoleCamera>(create);
  static ReceiveUpdateRoleCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  ReceiveUpdateRoleCamera_Role get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ReceiveUpdateRoleCamera_Role v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ivtId => $_getN(2);
  @$pb.TagNumber(3)
  set ivtId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIvtId() => $_has(2);
  @$pb.TagNumber(3)
  void clearIvtId() => clearField(3);

  @$pb.TagNumber(61)
  $core.int get rECEIVEUPDATEROLECAMERA => $_getIZ(3);
  @$pb.TagNumber(61)
  set rECEIVEUPDATEROLECAMERA($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(61)
  $core.bool hasRECEIVEUPDATEROLECAMERA() => $_has(3);
  @$pb.TagNumber(61)
  void clearRECEIVEUPDATEROLECAMERA() => clearField(61);
}

class ReceiveEventNotification extends $pb.GeneratedMessage {
  factory ReceiveEventNotification({
    $1.EventType? eventType,
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? time,
    $core.String? cameraName,
    $0.Any? eventMetadata,
    $core.String? captureImage,
    $core.String? videoRecordUrl,
    $core.String? captureImageThumb,
    $core.String? description,
    $1.Event? events,
    $core.int? rECEIVEEVENTNOTIFICATION,
  }) {
    final $result = create();
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (time != null) {
      $result.time = time;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (eventMetadata != null) {
      $result.eventMetadata = eventMetadata;
    }
    if (captureImage != null) {
      $result.captureImage = captureImage;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    if (captureImageThumb != null) {
      $result.captureImageThumb = captureImageThumb;
    }
    if (description != null) {
      $result.description = description;
    }
    if (events != null) {
      $result.events = events;
    }
    if (rECEIVEEVENTNOTIFICATION != null) {
      $result.rECEIVEEVENTNOTIFICATION = rECEIVEEVENTNOTIFICATION;
    }
    return $result;
  }
  ReceiveEventNotification._() : super();
  factory ReceiveEventNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveEventNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveEventNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<$1.EventType>(1, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, protoName: 'eventType', defaultOrMaker: $1.EventType.MOTION_DETECTION, valueOf: $1.EventType.valueOf, enumValues: $1.EventType.values)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'cameraName')
    ..aOM<$0.Any>(5, _omitFieldNames ? '' : 'eventMetadata', subBuilder: $0.Any.create)
    ..aOS(6, _omitFieldNames ? '' : 'captureImage')
    ..aOS(7, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(8, _omitFieldNames ? '' : 'captureImageThumb')
    ..aOS(9, _omitFieldNames ? '' : 'description')
    ..aOM<$1.Event>(10, _omitFieldNames ? '' : 'events', subBuilder: $1.Event.create)
    ..a<$core.int>(55, _omitFieldNames ? '' : 'RECEIVEEVENTNOTIFICATION', $pb.PbFieldType.OU3, protoName: 'RECEIVE_EVENT_NOTIFICATION')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveEventNotification clone() => ReceiveEventNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveEventNotification copyWith(void Function(ReceiveEventNotification) updates) => super.copyWith((message) => updates(message as ReceiveEventNotification)) as ReceiveEventNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveEventNotification create() => ReceiveEventNotification._();
  ReceiveEventNotification createEmptyInstance() => create();
  static $pb.PbList<ReceiveEventNotification> createRepeated() => $pb.PbList<ReceiveEventNotification>();
  @$core.pragma('dart2js:noInline')
  static ReceiveEventNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveEventNotification>(create);
  static ReceiveEventNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $1.EventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType($1.EventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cameraName => $_getSZ(3);
  @$pb.TagNumber(4)
  set cameraName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCameraName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCameraName() => clearField(4);

  @$pb.TagNumber(5)
  $0.Any get eventMetadata => $_getN(4);
  @$pb.TagNumber(5)
  set eventMetadata($0.Any v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEventMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventMetadata() => clearField(5);
  @$pb.TagNumber(5)
  $0.Any ensureEventMetadata() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get captureImage => $_getSZ(5);
  @$pb.TagNumber(6)
  set captureImage($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCaptureImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearCaptureImage() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get videoRecordUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set videoRecordUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasVideoRecordUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearVideoRecordUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get captureImageThumb => $_getSZ(7);
  @$pb.TagNumber(8)
  set captureImageThumb($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCaptureImageThumb() => $_has(7);
  @$pb.TagNumber(8)
  void clearCaptureImageThumb() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get description => $_getSZ(8);
  @$pb.TagNumber(9)
  set description($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDescription() => $_has(8);
  @$pb.TagNumber(9)
  void clearDescription() => clearField(9);

  @$pb.TagNumber(10)
  $1.Event get events => $_getN(9);
  @$pb.TagNumber(10)
  set events($1.Event v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEvents() => $_has(9);
  @$pb.TagNumber(10)
  void clearEvents() => clearField(10);
  @$pb.TagNumber(10)
  $1.Event ensureEvents() => $_ensure(9);

  @$pb.TagNumber(55)
  $core.int get rECEIVEEVENTNOTIFICATION => $_getIZ(10);
  @$pb.TagNumber(55)
  set rECEIVEEVENTNOTIFICATION($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(55)
  $core.bool hasRECEIVEEVENTNOTIFICATION() => $_has(10);
  @$pb.TagNumber(55)
  void clearRECEIVEEVENTNOTIFICATION() => clearField(55);
}

class ReceiveUpdateUserAddress extends $pb.GeneratedMessage {
  factory ReceiveUpdateUserAddress({
    $core.String? newAddress,
    $core.String? newDisplayName,
    $core.String? newEmail,
    $core.String? newTel,
    $core.int? rECEIVEUPDATEUSERADDRESS,
  }) {
    final $result = create();
    if (newAddress != null) {
      $result.newAddress = newAddress;
    }
    if (newDisplayName != null) {
      $result.newDisplayName = newDisplayName;
    }
    if (newEmail != null) {
      $result.newEmail = newEmail;
    }
    if (newTel != null) {
      $result.newTel = newTel;
    }
    if (rECEIVEUPDATEUSERADDRESS != null) {
      $result.rECEIVEUPDATEUSERADDRESS = rECEIVEUPDATEUSERADDRESS;
    }
    return $result;
  }
  ReceiveUpdateUserAddress._() : super();
  factory ReceiveUpdateUserAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateUserAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateUserAddress', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'newAddress', protoName: 'newAddress')
    ..aOS(2, _omitFieldNames ? '' : 'newDisplayName', protoName: 'newDisplayName')
    ..aOS(3, _omitFieldNames ? '' : 'newEmail', protoName: 'newEmail')
    ..aOS(4, _omitFieldNames ? '' : 'newTel', protoName: 'newTel')
    ..a<$core.int>(56, _omitFieldNames ? '' : 'RECEIVEUPDATEUSERADDRESS', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_USER_ADDRESS')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateUserAddress clone() => ReceiveUpdateUserAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateUserAddress copyWith(void Function(ReceiveUpdateUserAddress) updates) => super.copyWith((message) => updates(message as ReceiveUpdateUserAddress)) as ReceiveUpdateUserAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateUserAddress create() => ReceiveUpdateUserAddress._();
  ReceiveUpdateUserAddress createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateUserAddress> createRepeated() => $pb.PbList<ReceiveUpdateUserAddress>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateUserAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateUserAddress>(create);
  static ReceiveUpdateUserAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get newAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set newAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newDisplayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set newDisplayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newEmail => $_getSZ(2);
  @$pb.TagNumber(3)
  set newEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get newTel => $_getSZ(3);
  @$pb.TagNumber(4)
  set newTel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewTel() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewTel() => clearField(4);

  @$pb.TagNumber(56)
  $core.int get rECEIVEUPDATEUSERADDRESS => $_getIZ(4);
  @$pb.TagNumber(56)
  set rECEIVEUPDATEUSERADDRESS($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(56)
  $core.bool hasRECEIVEUPDATEUSERADDRESS() => $_has(4);
  @$pb.TagNumber(56)
  void clearRECEIVEUPDATEUSERADDRESS() => clearField(56);
}

class ListCamera_Request extends $pb.GeneratedMessage {
  factory ListCamera_Request({
    $fixnum.Int64? lastTime,
  }) {
    final $result = create();
    if (lastTime != null) {
      $result.lastTime = lastTime;
    }
    return $result;
  }
  ListCamera_Request._() : super();
  factory ListCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'lastTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCamera_Request clone() => ListCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCamera_Request copyWith(void Function(ListCamera_Request) updates) => super.copyWith((message) => updates(message as ListCamera_Request)) as ListCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCamera_Request create() => ListCamera_Request._();
  ListCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ListCamera_Request> createRepeated() => $pb.PbList<ListCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ListCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCamera_Request>(create);
  static ListCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastTime => $_getI64(0);
  @$pb.TagNumber(1)
  set lastTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastTime() => clearField(1);
}

class ListCamera_Reply extends $pb.GeneratedMessage {
  factory ListCamera_Reply({
    $core.Iterable<$1.Camera>? cameras,
    $core.Iterable<$1.DeviceGroup>? groups,
  }) {
    final $result = create();
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    return $result;
  }
  ListCamera_Reply._() : super();
  factory ListCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..pc<$1.DeviceGroup>(2, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCamera_Reply clone() => ListCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCamera_Reply copyWith(void Function(ListCamera_Reply) updates) => super.copyWith((message) => updates(message as ListCamera_Reply)) as ListCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCamera_Reply create() => ListCamera_Reply._();
  ListCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ListCamera_Reply> createRepeated() => $pb.PbList<ListCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCamera_Reply>(create);
  static ListCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get cameras => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$1.DeviceGroup> get groups => $_getList(1);
}

/// ------------NHOM CHUC NANG QUAN LY CAMERA--------------
class ListCamera extends $pb.GeneratedMessage {
  factory ListCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListCamera._() : super();
  factory ListCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(140, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCamera clone() => ListCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCamera copyWith(void Function(ListCamera) updates) => super.copyWith((message) => updates(message as ListCamera)) as ListCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCamera create() => ListCamera._();
  ListCamera createEmptyInstance() => create();
  static $pb.PbList<ListCamera> createRepeated() => $pb.PbList<ListCamera>();
  @$core.pragma('dart2js:noInline')
  static ListCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCamera>(create);
  static ListCamera? _defaultInstance;

  @$pb.TagNumber(140)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(140)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(140)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(140)
  void clearID() => clearField(140);
}

class AddCamera_Request extends $pb.GeneratedMessage {
  factory AddCamera_Request({
    $core.String? name,
    $core.String? serialNumber,
    $core.String? username,
    $core.String? password,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  AddCamera_Request._() : super();
  factory AddCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'serialNumber')
    ..aOS(3, _omitFieldNames ? '' : 'username')
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCamera_Request clone() => AddCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCamera_Request copyWith(void Function(AddCamera_Request) updates) => super.copyWith((message) => updates(message as AddCamera_Request)) as AddCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCamera_Request create() => AddCamera_Request._();
  AddCamera_Request createEmptyInstance() => create();
  static $pb.PbList<AddCamera_Request> createRepeated() => $pb.PbList<AddCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCamera_Request>(create);
  static AddCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serialNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set serialNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerialNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerialNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get username => $_getSZ(2);
  @$pb.TagNumber(3)
  set username($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsername() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);
}

class AddCamera_Reply extends $pb.GeneratedMessage {
  factory AddCamera_Reply({
    $1.Camera? camera,
    AddCamera_Status? status,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  AddCamera_Reply._() : super();
  factory AddCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..e<AddCamera_Status>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AddCamera_Status.OFF, valueOf: AddCamera_Status.valueOf, enumValues: AddCamera_Status.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCamera_Reply clone() => AddCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCamera_Reply copyWith(void Function(AddCamera_Reply) updates) => super.copyWith((message) => updates(message as AddCamera_Reply)) as AddCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCamera_Reply create() => AddCamera_Reply._();
  AddCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCamera_Reply> createRepeated() => $pb.PbList<AddCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCamera_Reply>(create);
  static AddCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(2)
  AddCamera_Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(AddCamera_Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class AddCamera extends $pb.GeneratedMessage {
  factory AddCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCamera._() : super();
  factory AddCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(141, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCamera clone() => AddCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCamera copyWith(void Function(AddCamera) updates) => super.copyWith((message) => updates(message as AddCamera)) as AddCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCamera create() => AddCamera._();
  AddCamera createEmptyInstance() => create();
  static $pb.PbList<AddCamera> createRepeated() => $pb.PbList<AddCamera>();
  @$core.pragma('dart2js:noInline')
  static AddCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCamera>(create);
  static AddCamera? _defaultInstance;

  @$pb.TagNumber(141)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(141)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(141)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(141)
  void clearID() => clearField(141);
}

class UpdateCamera_Request extends $pb.GeneratedMessage {
  factory UpdateCamera_Request({
    $core.List<$core.int>? cameraId,
    $core.String? name,
    $core.String? rtspUrl,
    $core.String? userName,
    $core.String? password,
    $core.int? storageDay,
    $core.String? xaddr,
    $1.MapLocation? location,
    $core.Iterable<$core.String>? subStreamUrls,
    $core.Iterable<$core.List<$core.int>>? tagsetId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (rtspUrl != null) {
      $result.rtspUrl = rtspUrl;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (password != null) {
      $result.password = password;
    }
    if (storageDay != null) {
      $result.storageDay = storageDay;
    }
    if (xaddr != null) {
      $result.xaddr = xaddr;
    }
    if (location != null) {
      $result.location = location;
    }
    if (subStreamUrls != null) {
      $result.subStreamUrls.addAll(subStreamUrls);
    }
    if (tagsetId != null) {
      $result.tagsetId.addAll(tagsetId);
    }
    return $result;
  }
  UpdateCamera_Request._() : super();
  factory UpdateCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'rtspUrl')
    ..aOS(4, _omitFieldNames ? '' : 'userName')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'storageDay', $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : 'xaddr')
    ..aOM<$1.MapLocation>(8, _omitFieldNames ? '' : 'location', subBuilder: $1.MapLocation.create)
    ..pPS(9, _omitFieldNames ? '' : 'subStreamUrls')
    ..p<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'tagsetId', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCamera_Request clone() => UpdateCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCamera_Request copyWith(void Function(UpdateCamera_Request) updates) => super.copyWith((message) => updates(message as UpdateCamera_Request)) as UpdateCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCamera_Request create() => UpdateCamera_Request._();
  UpdateCamera_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateCamera_Request> createRepeated() => $pb.PbList<UpdateCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCamera_Request>(create);
  static UpdateCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rtspUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set rtspUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRtspUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearRtspUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userName => $_getSZ(3);
  @$pb.TagNumber(4)
  set userName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserName() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get storageDay => $_getIZ(5);
  @$pb.TagNumber(6)
  set storageDay($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStorageDay() => $_has(5);
  @$pb.TagNumber(6)
  void clearStorageDay() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get xaddr => $_getSZ(6);
  @$pb.TagNumber(7)
  set xaddr($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasXaddr() => $_has(6);
  @$pb.TagNumber(7)
  void clearXaddr() => clearField(7);

  @$pb.TagNumber(8)
  $1.MapLocation get location => $_getN(7);
  @$pb.TagNumber(8)
  set location($1.MapLocation v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLocation() => $_has(7);
  @$pb.TagNumber(8)
  void clearLocation() => clearField(8);
  @$pb.TagNumber(8)
  $1.MapLocation ensureLocation() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.List<$core.String> get subStreamUrls => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.List<$core.int>> get tagsetId => $_getList(9);
}

class UpdateCamera_Reply extends $pb.GeneratedMessage {
  factory UpdateCamera_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  UpdateCamera_Reply._() : super();
  factory UpdateCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCamera_Reply clone() => UpdateCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCamera_Reply copyWith(void Function(UpdateCamera_Reply) updates) => super.copyWith((message) => updates(message as UpdateCamera_Reply)) as UpdateCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCamera_Reply create() => UpdateCamera_Reply._();
  UpdateCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateCamera_Reply> createRepeated() => $pb.PbList<UpdateCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCamera_Reply>(create);
  static UpdateCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

/// ------------NHOM CHUC NANG CAI DAT CAMERA-------------
class UpdateCamera extends $pb.GeneratedMessage {
  factory UpdateCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateCamera._() : super();
  factory UpdateCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(142, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCamera clone() => UpdateCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCamera copyWith(void Function(UpdateCamera) updates) => super.copyWith((message) => updates(message as UpdateCamera)) as UpdateCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCamera create() => UpdateCamera._();
  UpdateCamera createEmptyInstance() => create();
  static $pb.PbList<UpdateCamera> createRepeated() => $pb.PbList<UpdateCamera>();
  @$core.pragma('dart2js:noInline')
  static UpdateCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCamera>(create);
  static UpdateCamera? _defaultInstance;

  @$pb.TagNumber(142)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(142)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(142)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(142)
  void clearID() => clearField(142);
}

class ChangePasswordCamera_Request extends $pb.GeneratedMessage {
  factory ChangePasswordCamera_Request({
    $core.List<$core.int>? cameraId,
    $core.String? current,
    $core.String? password,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (current != null) {
      $result.current = current;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  ChangePasswordCamera_Request._() : super();
  factory ChangePasswordCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePasswordCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'current')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePasswordCamera_Request clone() => ChangePasswordCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePasswordCamera_Request copyWith(void Function(ChangePasswordCamera_Request) updates) => super.copyWith((message) => updates(message as ChangePasswordCamera_Request)) as ChangePasswordCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordCamera_Request create() => ChangePasswordCamera_Request._();
  ChangePasswordCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordCamera_Request> createRepeated() => $pb.PbList<ChangePasswordCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordCamera_Request>(create);
  static ChangePasswordCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get current => $_getSZ(1);
  @$pb.TagNumber(2)
  set current($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class ChangePasswordCamera_Reply extends $pb.GeneratedMessage {
  factory ChangePasswordCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ChangePasswordCamera_Reply._() : super();
  factory ChangePasswordCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePasswordCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePasswordCamera_Reply clone() => ChangePasswordCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePasswordCamera_Reply copyWith(void Function(ChangePasswordCamera_Reply) updates) => super.copyWith((message) => updates(message as ChangePasswordCamera_Reply)) as ChangePasswordCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordCamera_Reply create() => ChangePasswordCamera_Reply._();
  ChangePasswordCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordCamera_Reply> createRepeated() => $pb.PbList<ChangePasswordCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordCamera_Reply>(create);
  static ChangePasswordCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ChangePasswordCamera extends $pb.GeneratedMessage {
  factory ChangePasswordCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ChangePasswordCamera._() : super();
  factory ChangePasswordCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePasswordCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(143, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePasswordCamera clone() => ChangePasswordCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePasswordCamera copyWith(void Function(ChangePasswordCamera) updates) => super.copyWith((message) => updates(message as ChangePasswordCamera)) as ChangePasswordCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordCamera create() => ChangePasswordCamera._();
  ChangePasswordCamera createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordCamera> createRepeated() => $pb.PbList<ChangePasswordCamera>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordCamera>(create);
  static ChangePasswordCamera? _defaultInstance;

  @$pb.TagNumber(143)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(143)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(143)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(143)
  void clearID() => clearField(143);
}

class ScheduleRecordingCamera_Request extends $pb.GeneratedMessage {
  factory ScheduleRecordingCamera_Request({
    $core.List<$core.int>? cameraId,
    $1.Recording? recording,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (recording != null) {
      $result.recording = recording;
    }
    return $result;
  }
  ScheduleRecordingCamera_Request._() : super();
  factory ScheduleRecordingCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleRecordingCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduleRecordingCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Recording>(2, _omitFieldNames ? '' : 'recording', subBuilder: $1.Recording.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleRecordingCamera_Request clone() => ScheduleRecordingCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleRecordingCamera_Request copyWith(void Function(ScheduleRecordingCamera_Request) updates) => super.copyWith((message) => updates(message as ScheduleRecordingCamera_Request)) as ScheduleRecordingCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRecordingCamera_Request create() => ScheduleRecordingCamera_Request._();
  ScheduleRecordingCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ScheduleRecordingCamera_Request> createRepeated() => $pb.PbList<ScheduleRecordingCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRecordingCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleRecordingCamera_Request>(create);
  static ScheduleRecordingCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Recording get recording => $_getN(1);
  @$pb.TagNumber(2)
  set recording($1.Recording v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecording() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecording() => clearField(2);
  @$pb.TagNumber(2)
  $1.Recording ensureRecording() => $_ensure(1);
}

class ScheduleRecordingCamera_Reply extends $pb.GeneratedMessage {
  factory ScheduleRecordingCamera_Reply({
    $core.List<$core.int>? cameraId,
    $1.Camera? camera,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  ScheduleRecordingCamera_Reply._() : super();
  factory ScheduleRecordingCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleRecordingCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduleRecordingCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleRecordingCamera_Reply clone() => ScheduleRecordingCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleRecordingCamera_Reply copyWith(void Function(ScheduleRecordingCamera_Reply) updates) => super.copyWith((message) => updates(message as ScheduleRecordingCamera_Reply)) as ScheduleRecordingCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRecordingCamera_Reply create() => ScheduleRecordingCamera_Reply._();
  ScheduleRecordingCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ScheduleRecordingCamera_Reply> createRepeated() => $pb.PbList<ScheduleRecordingCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRecordingCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleRecordingCamera_Reply>(create);
  static ScheduleRecordingCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Camera get camera => $_getN(1);
  @$pb.TagNumber(2)
  set camera($1.Camera v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCamera() => $_has(1);
  @$pb.TagNumber(2)
  void clearCamera() => clearField(2);
  @$pb.TagNumber(2)
  $1.Camera ensureCamera() => $_ensure(1);
}

class ScheduleRecordingCamera extends $pb.GeneratedMessage {
  factory ScheduleRecordingCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ScheduleRecordingCamera._() : super();
  factory ScheduleRecordingCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleRecordingCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduleRecordingCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(146, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleRecordingCamera clone() => ScheduleRecordingCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleRecordingCamera copyWith(void Function(ScheduleRecordingCamera) updates) => super.copyWith((message) => updates(message as ScheduleRecordingCamera)) as ScheduleRecordingCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRecordingCamera create() => ScheduleRecordingCamera._();
  ScheduleRecordingCamera createEmptyInstance() => create();
  static $pb.PbList<ScheduleRecordingCamera> createRepeated() => $pb.PbList<ScheduleRecordingCamera>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRecordingCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleRecordingCamera>(create);
  static ScheduleRecordingCamera? _defaultInstance;

  @$pb.TagNumber(146)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(146)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(146)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(146)
  void clearID() => clearField(146);
}

class RestartCamera_Request extends $pb.GeneratedMessage {
  factory RestartCamera_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  RestartCamera_Request._() : super();
  factory RestartCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestartCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestartCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestartCamera_Request clone() => RestartCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestartCamera_Request copyWith(void Function(RestartCamera_Request) updates) => super.copyWith((message) => updates(message as RestartCamera_Request)) as RestartCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartCamera_Request create() => RestartCamera_Request._();
  RestartCamera_Request createEmptyInstance() => create();
  static $pb.PbList<RestartCamera_Request> createRepeated() => $pb.PbList<RestartCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static RestartCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestartCamera_Request>(create);
  static RestartCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class RestartCamera_Reply extends $pb.GeneratedMessage {
  factory RestartCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  RestartCamera_Reply._() : super();
  factory RestartCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestartCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestartCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestartCamera_Reply clone() => RestartCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestartCamera_Reply copyWith(void Function(RestartCamera_Reply) updates) => super.copyWith((message) => updates(message as RestartCamera_Reply)) as RestartCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartCamera_Reply create() => RestartCamera_Reply._();
  RestartCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<RestartCamera_Reply> createRepeated() => $pb.PbList<RestartCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static RestartCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestartCamera_Reply>(create);
  static RestartCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class RestartCamera extends $pb.GeneratedMessage {
  factory RestartCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RestartCamera._() : super();
  factory RestartCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestartCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestartCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(151, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestartCamera clone() => RestartCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestartCamera copyWith(void Function(RestartCamera) updates) => super.copyWith((message) => updates(message as RestartCamera)) as RestartCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartCamera create() => RestartCamera._();
  RestartCamera createEmptyInstance() => create();
  static $pb.PbList<RestartCamera> createRepeated() => $pb.PbList<RestartCamera>();
  @$core.pragma('dart2js:noInline')
  static RestartCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestartCamera>(create);
  static RestartCamera? _defaultInstance;

  @$pb.TagNumber(151)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(151)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(151)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(151)
  void clearID() => clearField(151);
}

class ShareCamera_Request extends $pb.GeneratedMessage {
  factory ShareCamera_Request({
    $core.List<$core.int>? cameraId,
    ShareCamera_Role? role,
    $core.String? accountInvite,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (accountInvite != null) {
      $result.accountInvite = accountInvite;
    }
    return $result;
  }
  ShareCamera_Request._() : super();
  factory ShareCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShareCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<ShareCamera_Role>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ShareCamera_Role.VIEW, valueOf: ShareCamera_Role.valueOf, enumValues: ShareCamera_Role.values)
    ..aOS(3, _omitFieldNames ? '' : 'accountInvite')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShareCamera_Request clone() => ShareCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShareCamera_Request copyWith(void Function(ShareCamera_Request) updates) => super.copyWith((message) => updates(message as ShareCamera_Request)) as ShareCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareCamera_Request create() => ShareCamera_Request._();
  ShareCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ShareCamera_Request> createRepeated() => $pb.PbList<ShareCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ShareCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareCamera_Request>(create);
  static ShareCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  ShareCamera_Role get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ShareCamera_Role v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountInvite => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountInvite($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountInvite() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountInvite() => clearField(3);
}

class ShareCamera_Reply extends $pb.GeneratedMessage {
  factory ShareCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ShareCamera_Reply._() : super();
  factory ShareCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShareCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShareCamera_Reply clone() => ShareCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShareCamera_Reply copyWith(void Function(ShareCamera_Reply) updates) => super.copyWith((message) => updates(message as ShareCamera_Reply)) as ShareCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareCamera_Reply create() => ShareCamera_Reply._();
  ShareCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ShareCamera_Reply> createRepeated() => $pb.PbList<ShareCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ShareCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareCamera_Reply>(create);
  static ShareCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ShareCamera extends $pb.GeneratedMessage {
  factory ShareCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ShareCamera._() : super();
  factory ShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(154, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShareCamera clone() => ShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShareCamera copyWith(void Function(ShareCamera) updates) => super.copyWith((message) => updates(message as ShareCamera)) as ShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareCamera create() => ShareCamera._();
  ShareCamera createEmptyInstance() => create();
  static $pb.PbList<ShareCamera> createRepeated() => $pb.PbList<ShareCamera>();
  @$core.pragma('dart2js:noInline')
  static ShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareCamera>(create);
  static ShareCamera? _defaultInstance;

  @$pb.TagNumber(154)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(154)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(154)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(154)
  void clearID() => clearField(154);
}

class DeleteCamera_Request extends $pb.GeneratedMessage {
  factory DeleteCamera_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  DeleteCamera_Request._() : super();
  factory DeleteCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCamera_Request clone() => DeleteCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCamera_Request copyWith(void Function(DeleteCamera_Request) updates) => super.copyWith((message) => updates(message as DeleteCamera_Request)) as DeleteCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCamera_Request create() => DeleteCamera_Request._();
  DeleteCamera_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteCamera_Request> createRepeated() => $pb.PbList<DeleteCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCamera_Request>(create);
  static DeleteCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class DeleteCamera_Reply extends $pb.GeneratedMessage {
  factory DeleteCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  DeleteCamera_Reply._() : super();
  factory DeleteCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCamera_Reply clone() => DeleteCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCamera_Reply copyWith(void Function(DeleteCamera_Reply) updates) => super.copyWith((message) => updates(message as DeleteCamera_Reply)) as DeleteCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCamera_Reply create() => DeleteCamera_Reply._();
  DeleteCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteCamera_Reply> createRepeated() => $pb.PbList<DeleteCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCamera_Reply>(create);
  static DeleteCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class DeleteCamera extends $pb.GeneratedMessage {
  factory DeleteCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteCamera._() : super();
  factory DeleteCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(155, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCamera clone() => DeleteCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCamera copyWith(void Function(DeleteCamera) updates) => super.copyWith((message) => updates(message as DeleteCamera)) as DeleteCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCamera create() => DeleteCamera._();
  DeleteCamera createEmptyInstance() => create();
  static $pb.PbList<DeleteCamera> createRepeated() => $pb.PbList<DeleteCamera>();
  @$core.pragma('dart2js:noInline')
  static DeleteCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCamera>(create);
  static DeleteCamera? _defaultInstance;

  @$pb.TagNumber(155)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(155)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(155)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(155)
  void clearID() => clearField(155);
}

class CheckAccountShare_Request extends $pb.GeneratedMessage {
  factory CheckAccountShare_Request({
    $core.List<$core.int>? cameraId,
    $core.String? account,
    CheckAccountShare_ShareType? shareType,
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (account != null) {
      $result.account = account;
    }
    if (shareType != null) {
      $result.shareType = shareType;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  CheckAccountShare_Request._() : super();
  factory CheckAccountShare_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccountShare_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccountShare.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'account')
    ..e<CheckAccountShare_ShareType>(3, _omitFieldNames ? '' : 'shareType', $pb.PbFieldType.OE, protoName: 'shareType', defaultOrMaker: CheckAccountShare_ShareType.CAMERA, valueOf: CheckAccountShare_ShareType.valueOf, enumValues: CheckAccountShare_ShareType.values)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccountShare_Request clone() => CheckAccountShare_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccountShare_Request copyWith(void Function(CheckAccountShare_Request) updates) => super.copyWith((message) => updates(message as CheckAccountShare_Request)) as CheckAccountShare_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccountShare_Request create() => CheckAccountShare_Request._();
  CheckAccountShare_Request createEmptyInstance() => create();
  static $pb.PbList<CheckAccountShare_Request> createRepeated() => $pb.PbList<CheckAccountShare_Request>();
  @$core.pragma('dart2js:noInline')
  static CheckAccountShare_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccountShare_Request>(create);
  static CheckAccountShare_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get account => $_getSZ(1);
  @$pb.TagNumber(2)
  set account($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccount() => clearField(2);

  @$pb.TagNumber(3)
  CheckAccountShare_ShareType get shareType => $_getN(2);
  @$pb.TagNumber(3)
  set shareType(CheckAccountShare_ShareType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasShareType() => $_has(2);
  @$pb.TagNumber(3)
  void clearShareType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get groupId => $_getN(3);
  @$pb.TagNumber(4)
  set groupId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGroupId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupId() => clearField(4);
}

class CheckAccountShare_Reply extends $pb.GeneratedMessage {
  factory CheckAccountShare_Reply({
    $core.bool? isExists,
    $core.List<$core.int>? accountInviteId,
  }) {
    final $result = create();
    if (isExists != null) {
      $result.isExists = isExists;
    }
    if (accountInviteId != null) {
      $result.accountInviteId = accountInviteId;
    }
    return $result;
  }
  CheckAccountShare_Reply._() : super();
  factory CheckAccountShare_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccountShare_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccountShare.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isExists', protoName: 'isExists')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'accountInviteId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccountShare_Reply clone() => CheckAccountShare_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccountShare_Reply copyWith(void Function(CheckAccountShare_Reply) updates) => super.copyWith((message) => updates(message as CheckAccountShare_Reply)) as CheckAccountShare_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccountShare_Reply create() => CheckAccountShare_Reply._();
  CheckAccountShare_Reply createEmptyInstance() => create();
  static $pb.PbList<CheckAccountShare_Reply> createRepeated() => $pb.PbList<CheckAccountShare_Reply>();
  @$core.pragma('dart2js:noInline')
  static CheckAccountShare_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccountShare_Reply>(create);
  static CheckAccountShare_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isExists => $_getBF(0);
  @$pb.TagNumber(1)
  set isExists($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsExists() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsExists() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get accountInviteId => $_getN(1);
  @$pb.TagNumber(2)
  set accountInviteId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountInviteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountInviteId() => clearField(2);
}

class CheckAccountShare extends $pb.GeneratedMessage {
  factory CheckAccountShare({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  CheckAccountShare._() : super();
  factory CheckAccountShare.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccountShare.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccountShare', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(502, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccountShare clone() => CheckAccountShare()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccountShare copyWith(void Function(CheckAccountShare) updates) => super.copyWith((message) => updates(message as CheckAccountShare)) as CheckAccountShare;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccountShare create() => CheckAccountShare._();
  CheckAccountShare createEmptyInstance() => create();
  static $pb.PbList<CheckAccountShare> createRepeated() => $pb.PbList<CheckAccountShare>();
  @$core.pragma('dart2js:noInline')
  static CheckAccountShare getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccountShare>(create);
  static CheckAccountShare? _defaultInstance;

  @$pb.TagNumber(502)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(502)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(502)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(502)
  void clearID() => clearField(502);
}

class ShareGroupCamera_Request extends $pb.GeneratedMessage {
  factory ShareGroupCamera_Request({
    $core.List<$core.int>? groupId,
    ShareGroupCamera_GroupShareRole? role,
    $core.List<$core.int>? accountInviteId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (accountInviteId != null) {
      $result.accountInviteId = accountInviteId;
    }
    return $result;
  }
  ShareGroupCamera_Request._() : super();
  factory ShareGroupCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareGroupCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShareGroupCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..e<ShareGroupCamera_GroupShareRole>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ShareGroupCamera_GroupShareRole.NOT_USE_, valueOf: ShareGroupCamera_GroupShareRole.valueOf, enumValues: ShareGroupCamera_GroupShareRole.values)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'accountInviteId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShareGroupCamera_Request clone() => ShareGroupCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShareGroupCamera_Request copyWith(void Function(ShareGroupCamera_Request) updates) => super.copyWith((message) => updates(message as ShareGroupCamera_Request)) as ShareGroupCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareGroupCamera_Request create() => ShareGroupCamera_Request._();
  ShareGroupCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ShareGroupCamera_Request> createRepeated() => $pb.PbList<ShareGroupCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ShareGroupCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareGroupCamera_Request>(create);
  static ShareGroupCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  ShareGroupCamera_GroupShareRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ShareGroupCamera_GroupShareRole v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get accountInviteId => $_getN(2);
  @$pb.TagNumber(3)
  set accountInviteId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountInviteId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountInviteId() => clearField(3);
}

class ShareGroupCamera_Reply extends $pb.GeneratedMessage {
  factory ShareGroupCamera_Reply({
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  ShareGroupCamera_Reply._() : super();
  factory ShareGroupCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareGroupCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShareGroupCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShareGroupCamera_Reply clone() => ShareGroupCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShareGroupCamera_Reply copyWith(void Function(ShareGroupCamera_Reply) updates) => super.copyWith((message) => updates(message as ShareGroupCamera_Reply)) as ShareGroupCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareGroupCamera_Reply create() => ShareGroupCamera_Reply._();
  ShareGroupCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ShareGroupCamera_Reply> createRepeated() => $pb.PbList<ShareGroupCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ShareGroupCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareGroupCamera_Reply>(create);
  static ShareGroupCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);
}

class ShareGroupCamera extends $pb.GeneratedMessage {
  factory ShareGroupCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ShareGroupCamera._() : super();
  factory ShareGroupCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareGroupCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShareGroupCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(234, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShareGroupCamera clone() => ShareGroupCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShareGroupCamera copyWith(void Function(ShareGroupCamera) updates) => super.copyWith((message) => updates(message as ShareGroupCamera)) as ShareGroupCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareGroupCamera create() => ShareGroupCamera._();
  ShareGroupCamera createEmptyInstance() => create();
  static $pb.PbList<ShareGroupCamera> createRepeated() => $pb.PbList<ShareGroupCamera>();
  @$core.pragma('dart2js:noInline')
  static ShareGroupCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareGroupCamera>(create);
  static ShareGroupCamera? _defaultInstance;

  @$pb.TagNumber(234)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(234)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(234)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(234)
  void clearID() => clearField(234);
}

class ReceiveShareGroupCamera extends $pb.GeneratedMessage {
  factory ReceiveShareGroupCamera({
    $core.List<$core.int>? groupId,
    $core.String? accountA,
    $core.String? accountB,
    $core.String? groupName,
    ReceiveShareGroupCamera_GroupShareRole? role,
    $fixnum.Int64? time,
    $core.bool? isOwner,
    $core.List<$core.int>? inviteMsgId,
    $core.int? rECEIVESHAREGROUPCAMERA,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (accountA != null) {
      $result.accountA = accountA;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (groupName != null) {
      $result.groupName = groupName;
    }
    if (role != null) {
      $result.role = role;
    }
    if (time != null) {
      $result.time = time;
    }
    if (isOwner != null) {
      $result.isOwner = isOwner;
    }
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    if (rECEIVESHAREGROUPCAMERA != null) {
      $result.rECEIVESHAREGROUPCAMERA = rECEIVESHAREGROUPCAMERA;
    }
    return $result;
  }
  ReceiveShareGroupCamera._() : super();
  factory ReceiveShareGroupCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveShareGroupCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveShareGroupCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'accountA')
    ..aOS(3, _omitFieldNames ? '' : 'accountB')
    ..aOS(4, _omitFieldNames ? '' : 'groupName')
    ..e<ReceiveShareGroupCamera_GroupShareRole>(5, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ReceiveShareGroupCamera_GroupShareRole.NOT_USE_, valueOf: ReceiveShareGroupCamera_GroupShareRole.valueOf, enumValues: ReceiveShareGroupCamera_GroupShareRole.values)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(7, _omitFieldNames ? '' : 'isOwner', protoName: 'isOwner')
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..a<$core.int>(89, _omitFieldNames ? '' : 'RECEIVESHAREGROUPCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_SHARE_GROUP_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveShareGroupCamera clone() => ReceiveShareGroupCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveShareGroupCamera copyWith(void Function(ReceiveShareGroupCamera) updates) => super.copyWith((message) => updates(message as ReceiveShareGroupCamera)) as ReceiveShareGroupCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveShareGroupCamera create() => ReceiveShareGroupCamera._();
  ReceiveShareGroupCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveShareGroupCamera> createRepeated() => $pb.PbList<ReceiveShareGroupCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveShareGroupCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveShareGroupCamera>(create);
  static ReceiveShareGroupCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountA => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountA($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountA() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountA() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountB => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountB($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountB() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountB() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get groupName => $_getSZ(3);
  @$pb.TagNumber(4)
  set groupName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGroupName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupName() => clearField(4);

  @$pb.TagNumber(5)
  ReceiveShareGroupCamera_GroupShareRole get role => $_getN(4);
  @$pb.TagNumber(5)
  set role(ReceiveShareGroupCamera_GroupShareRole v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get time => $_getI64(5);
  @$pb.TagNumber(6)
  set time($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isOwner => $_getBF(6);
  @$pb.TagNumber(7)
  set isOwner($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsOwner() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsOwner() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get inviteMsgId => $_getN(7);
  @$pb.TagNumber(8)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasInviteMsgId() => $_has(7);
  @$pb.TagNumber(8)
  void clearInviteMsgId() => clearField(8);

  @$pb.TagNumber(89)
  $core.int get rECEIVESHAREGROUPCAMERA => $_getIZ(8);
  @$pb.TagNumber(89)
  set rECEIVESHAREGROUPCAMERA($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(89)
  $core.bool hasRECEIVESHAREGROUPCAMERA() => $_has(8);
  @$pb.TagNumber(89)
  void clearRECEIVESHAREGROUPCAMERA() => clearField(89);
}

class ListShareInviteGroup_Request extends $pb.GeneratedMessage {
  factory ListShareInviteGroup_Request({
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  ListShareInviteGroup_Request._() : super();
  factory ListShareInviteGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListShareInviteGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListShareInviteGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListShareInviteGroup_Request clone() => ListShareInviteGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListShareInviteGroup_Request copyWith(void Function(ListShareInviteGroup_Request) updates) => super.copyWith((message) => updates(message as ListShareInviteGroup_Request)) as ListShareInviteGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShareInviteGroup_Request create() => ListShareInviteGroup_Request._();
  ListShareInviteGroup_Request createEmptyInstance() => create();
  static $pb.PbList<ListShareInviteGroup_Request> createRepeated() => $pb.PbList<ListShareInviteGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static ListShareInviteGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListShareInviteGroup_Request>(create);
  static ListShareInviteGroup_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);
}

class ListShareInviteGroup_Reply extends $pb.GeneratedMessage {
  factory ListShareInviteGroup_Reply({
    $core.Iterable<$1.InviteMessage>? invites,
  }) {
    final $result = create();
    if (invites != null) {
      $result.invites.addAll(invites);
    }
    return $result;
  }
  ListShareInviteGroup_Reply._() : super();
  factory ListShareInviteGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListShareInviteGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListShareInviteGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.InviteMessage>(1, _omitFieldNames ? '' : 'invites', $pb.PbFieldType.PM, subBuilder: $1.InviteMessage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListShareInviteGroup_Reply clone() => ListShareInviteGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListShareInviteGroup_Reply copyWith(void Function(ListShareInviteGroup_Reply) updates) => super.copyWith((message) => updates(message as ListShareInviteGroup_Reply)) as ListShareInviteGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShareInviteGroup_Reply create() => ListShareInviteGroup_Reply._();
  ListShareInviteGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<ListShareInviteGroup_Reply> createRepeated() => $pb.PbList<ListShareInviteGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListShareInviteGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListShareInviteGroup_Reply>(create);
  static ListShareInviteGroup_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.InviteMessage> get invites => $_getList(0);
}

class ListShareInviteGroup extends $pb.GeneratedMessage {
  factory ListShareInviteGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListShareInviteGroup._() : super();
  factory ListShareInviteGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListShareInviteGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListShareInviteGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(235, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListShareInviteGroup clone() => ListShareInviteGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListShareInviteGroup copyWith(void Function(ListShareInviteGroup) updates) => super.copyWith((message) => updates(message as ListShareInviteGroup)) as ListShareInviteGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShareInviteGroup create() => ListShareInviteGroup._();
  ListShareInviteGroup createEmptyInstance() => create();
  static $pb.PbList<ListShareInviteGroup> createRepeated() => $pb.PbList<ListShareInviteGroup>();
  @$core.pragma('dart2js:noInline')
  static ListShareInviteGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListShareInviteGroup>(create);
  static ListShareInviteGroup? _defaultInstance;

  @$pb.TagNumber(235)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(235)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(235)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(235)
  void clearID() => clearField(235);
}

class ResponseShareGroupCamera_Request extends $pb.GeneratedMessage {
  factory ResponseShareGroupCamera_Request({
    ResponseShareGroupCamera_Action? action,
    $core.List<$core.int>? inviteMsgId,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    return $result;
  }
  ResponseShareGroupCamera_Request._() : super();
  factory ResponseShareGroupCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseShareGroupCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseShareGroupCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<ResponseShareGroupCamera_Action>(4, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: ResponseShareGroupCamera_Action.ACCEPT, valueOf: ResponseShareGroupCamera_Action.valueOf, enumValues: ResponseShareGroupCamera_Action.values)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseShareGroupCamera_Request clone() => ResponseShareGroupCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseShareGroupCamera_Request copyWith(void Function(ResponseShareGroupCamera_Request) updates) => super.copyWith((message) => updates(message as ResponseShareGroupCamera_Request)) as ResponseShareGroupCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseShareGroupCamera_Request create() => ResponseShareGroupCamera_Request._();
  ResponseShareGroupCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ResponseShareGroupCamera_Request> createRepeated() => $pb.PbList<ResponseShareGroupCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ResponseShareGroupCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseShareGroupCamera_Request>(create);
  static ResponseShareGroupCamera_Request? _defaultInstance;

  @$pb.TagNumber(4)
  ResponseShareGroupCamera_Action get action => $_getN(0);
  @$pb.TagNumber(4)
  set action(ResponseShareGroupCamera_Action v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(4)
  void clearAction() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get inviteMsgId => $_getN(1);
  @$pb.TagNumber(5)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(5)
  $core.bool hasInviteMsgId() => $_has(1);
  @$pb.TagNumber(5)
  void clearInviteMsgId() => clearField(5);
}

class ResponseShareGroupCamera_Reply extends $pb.GeneratedMessage {
  factory ResponseShareGroupCamera_Reply({
    $core.List<$core.int>? inviteMsgId,
    $core.Iterable<$1.DeviceGroup>? groups,
  }) {
    final $result = create();
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    return $result;
  }
  ResponseShareGroupCamera_Reply._() : super();
  factory ResponseShareGroupCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseShareGroupCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseShareGroupCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..pc<$1.DeviceGroup>(2, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseShareGroupCamera_Reply clone() => ResponseShareGroupCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseShareGroupCamera_Reply copyWith(void Function(ResponseShareGroupCamera_Reply) updates) => super.copyWith((message) => updates(message as ResponseShareGroupCamera_Reply)) as ResponseShareGroupCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseShareGroupCamera_Reply create() => ResponseShareGroupCamera_Reply._();
  ResponseShareGroupCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ResponseShareGroupCamera_Reply> createRepeated() => $pb.PbList<ResponseShareGroupCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ResponseShareGroupCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseShareGroupCamera_Reply>(create);
  static ResponseShareGroupCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get inviteMsgId => $_getN(0);
  @$pb.TagNumber(1)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInviteMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInviteMsgId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.DeviceGroup> get groups => $_getList(1);
}

class ResponseShareGroupCamera extends $pb.GeneratedMessage {
  factory ResponseShareGroupCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ResponseShareGroupCamera._() : super();
  factory ResponseShareGroupCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseShareGroupCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseShareGroupCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(236, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseShareGroupCamera clone() => ResponseShareGroupCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseShareGroupCamera copyWith(void Function(ResponseShareGroupCamera) updates) => super.copyWith((message) => updates(message as ResponseShareGroupCamera)) as ResponseShareGroupCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseShareGroupCamera create() => ResponseShareGroupCamera._();
  ResponseShareGroupCamera createEmptyInstance() => create();
  static $pb.PbList<ResponseShareGroupCamera> createRepeated() => $pb.PbList<ResponseShareGroupCamera>();
  @$core.pragma('dart2js:noInline')
  static ResponseShareGroupCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseShareGroupCamera>(create);
  static ResponseShareGroupCamera? _defaultInstance;

  @$pb.TagNumber(236)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(236)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(236)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(236)
  void clearID() => clearField(236);
}

class ReceiveResponseShareGroupCamera extends $pb.GeneratedMessage {
  factory ReceiveResponseShareGroupCamera({
    ReceiveResponseShareGroupCamera_Action? action,
    $core.List<$core.int>? inviteMsgId,
    $core.List<$core.int>? groupId,
    $core.int? rECEIVERESPONSESHAREGROUPCAMERA,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (rECEIVERESPONSESHAREGROUPCAMERA != null) {
      $result.rECEIVERESPONSESHAREGROUPCAMERA = rECEIVERESPONSESHAREGROUPCAMERA;
    }
    return $result;
  }
  ReceiveResponseShareGroupCamera._() : super();
  factory ReceiveResponseShareGroupCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveResponseShareGroupCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveResponseShareGroupCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<ReceiveResponseShareGroupCamera_Action>(1, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: ReceiveResponseShareGroupCamera_Action.ACCEPT, valueOf: ReceiveResponseShareGroupCamera_Action.valueOf, enumValues: ReceiveResponseShareGroupCamera_Action.values)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..a<$core.int>(90, _omitFieldNames ? '' : 'RECEIVERESPONSESHAREGROUPCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_RESPONSE_SHARE_GROUP_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveResponseShareGroupCamera clone() => ReceiveResponseShareGroupCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveResponseShareGroupCamera copyWith(void Function(ReceiveResponseShareGroupCamera) updates) => super.copyWith((message) => updates(message as ReceiveResponseShareGroupCamera)) as ReceiveResponseShareGroupCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveResponseShareGroupCamera create() => ReceiveResponseShareGroupCamera._();
  ReceiveResponseShareGroupCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveResponseShareGroupCamera> createRepeated() => $pb.PbList<ReceiveResponseShareGroupCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveResponseShareGroupCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveResponseShareGroupCamera>(create);
  static ReceiveResponseShareGroupCamera? _defaultInstance;

  @$pb.TagNumber(1)
  ReceiveResponseShareGroupCamera_Action get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(ReceiveResponseShareGroupCamera_Action v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get inviteMsgId => $_getN(1);
  @$pb.TagNumber(2)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInviteMsgId() => $_has(1);
  @$pb.TagNumber(2)
  void clearInviteMsgId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get groupId => $_getN(2);
  @$pb.TagNumber(3)
  set groupId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => clearField(3);

  @$pb.TagNumber(90)
  $core.int get rECEIVERESPONSESHAREGROUPCAMERA => $_getIZ(3);
  @$pb.TagNumber(90)
  set rECEIVERESPONSESHAREGROUPCAMERA($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(90)
  $core.bool hasRECEIVERESPONSESHAREGROUPCAMERA() => $_has(3);
  @$pb.TagNumber(90)
  void clearRECEIVERESPONSESHAREGROUPCAMERA() => clearField(90);
}

class DeleteCameraEmapInfo_Request extends $pb.GeneratedMessage {
  factory DeleteCameraEmapInfo_Request({
    $core.List<$core.int>? emapId,
    $core.List<$core.int>? cameraEmapInfoId,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    if (cameraEmapInfoId != null) {
      $result.cameraEmapInfoId = cameraEmapInfoId;
    }
    return $result;
  }
  DeleteCameraEmapInfo_Request._() : super();
  factory DeleteCameraEmapInfo_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCameraEmapInfo_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCameraEmapInfo.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraEmapInfoId', $pb.PbFieldType.OY, protoName: 'cameraEmapInfo_id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCameraEmapInfo_Request clone() => DeleteCameraEmapInfo_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCameraEmapInfo_Request copyWith(void Function(DeleteCameraEmapInfo_Request) updates) => super.copyWith((message) => updates(message as DeleteCameraEmapInfo_Request)) as DeleteCameraEmapInfo_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCameraEmapInfo_Request create() => DeleteCameraEmapInfo_Request._();
  DeleteCameraEmapInfo_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteCameraEmapInfo_Request> createRepeated() => $pb.PbList<DeleteCameraEmapInfo_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteCameraEmapInfo_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCameraEmapInfo_Request>(create);
  static DeleteCameraEmapInfo_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraEmapInfoId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraEmapInfoId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraEmapInfoId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraEmapInfoId() => clearField(2);
}

class DeleteCameraEmapInfo_Reply extends $pb.GeneratedMessage {
  factory DeleteCameraEmapInfo_Reply() => create();
  DeleteCameraEmapInfo_Reply._() : super();
  factory DeleteCameraEmapInfo_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCameraEmapInfo_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCameraEmapInfo.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCameraEmapInfo_Reply clone() => DeleteCameraEmapInfo_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCameraEmapInfo_Reply copyWith(void Function(DeleteCameraEmapInfo_Reply) updates) => super.copyWith((message) => updates(message as DeleteCameraEmapInfo_Reply)) as DeleteCameraEmapInfo_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCameraEmapInfo_Reply create() => DeleteCameraEmapInfo_Reply._();
  DeleteCameraEmapInfo_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteCameraEmapInfo_Reply> createRepeated() => $pb.PbList<DeleteCameraEmapInfo_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteCameraEmapInfo_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCameraEmapInfo_Reply>(create);
  static DeleteCameraEmapInfo_Reply? _defaultInstance;
}

class DeleteCameraEmapInfo extends $pb.GeneratedMessage {
  factory DeleteCameraEmapInfo({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteCameraEmapInfo._() : super();
  factory DeleteCameraEmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCameraEmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCameraEmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(237, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCameraEmapInfo clone() => DeleteCameraEmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCameraEmapInfo copyWith(void Function(DeleteCameraEmapInfo) updates) => super.copyWith((message) => updates(message as DeleteCameraEmapInfo)) as DeleteCameraEmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCameraEmapInfo create() => DeleteCameraEmapInfo._();
  DeleteCameraEmapInfo createEmptyInstance() => create();
  static $pb.PbList<DeleteCameraEmapInfo> createRepeated() => $pb.PbList<DeleteCameraEmapInfo>();
  @$core.pragma('dart2js:noInline')
  static DeleteCameraEmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCameraEmapInfo>(create);
  static DeleteCameraEmapInfo? _defaultInstance;

  @$pb.TagNumber(237)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(237)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(237)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(237)
  void clearID() => clearField(237);
}

class ReceiveDeleteCameraEmapInfo extends $pb.GeneratedMessage {
  factory ReceiveDeleteCameraEmapInfo({
    $core.List<$core.int>? emapId,
    $core.List<$core.int>? cameraEmapInfoId,
    $core.int? rECEIVEDELETECAMERAEMAPINFO,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    if (cameraEmapInfoId != null) {
      $result.cameraEmapInfoId = cameraEmapInfoId;
    }
    if (rECEIVEDELETECAMERAEMAPINFO != null) {
      $result.rECEIVEDELETECAMERAEMAPINFO = rECEIVEDELETECAMERAEMAPINFO;
    }
    return $result;
  }
  ReceiveDeleteCameraEmapInfo._() : super();
  factory ReceiveDeleteCameraEmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveDeleteCameraEmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveDeleteCameraEmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraEmapInfoId', $pb.PbFieldType.OY, protoName: 'cameraEmapInfo_id')
    ..a<$core.int>(91, _omitFieldNames ? '' : 'RECEIVEDELETECAMERAEMAPINFO', $pb.PbFieldType.OU3, protoName: 'RECEIVE_DELETE_CAMERA_EMAP_INFO')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveDeleteCameraEmapInfo clone() => ReceiveDeleteCameraEmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveDeleteCameraEmapInfo copyWith(void Function(ReceiveDeleteCameraEmapInfo) updates) => super.copyWith((message) => updates(message as ReceiveDeleteCameraEmapInfo)) as ReceiveDeleteCameraEmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteCameraEmapInfo create() => ReceiveDeleteCameraEmapInfo._();
  ReceiveDeleteCameraEmapInfo createEmptyInstance() => create();
  static $pb.PbList<ReceiveDeleteCameraEmapInfo> createRepeated() => $pb.PbList<ReceiveDeleteCameraEmapInfo>();
  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteCameraEmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveDeleteCameraEmapInfo>(create);
  static ReceiveDeleteCameraEmapInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraEmapInfoId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraEmapInfoId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraEmapInfoId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraEmapInfoId() => clearField(2);

  @$pb.TagNumber(91)
  $core.int get rECEIVEDELETECAMERAEMAPINFO => $_getIZ(2);
  @$pb.TagNumber(91)
  set rECEIVEDELETECAMERAEMAPINFO($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(91)
  $core.bool hasRECEIVEDELETECAMERAEMAPINFO() => $_has(2);
  @$pb.TagNumber(91)
  void clearRECEIVEDELETECAMERAEMAPINFO() => clearField(91);
}

class ReceiveUpdateCamera extends $pb.GeneratedMessage {
  factory ReceiveUpdateCamera({
    $1.Camera? camera,
    $core.int? rECEIVEUPDATECAMERA,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEUPDATECAMERA != null) {
      $result.rECEIVEUPDATECAMERA = rECEIVEUPDATECAMERA;
    }
    return $result;
  }
  ReceiveUpdateCamera._() : super();
  factory ReceiveUpdateCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(92, _omitFieldNames ? '' : 'RECEIVEUPDATECAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateCamera clone() => ReceiveUpdateCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateCamera copyWith(void Function(ReceiveUpdateCamera) updates) => super.copyWith((message) => updates(message as ReceiveUpdateCamera)) as ReceiveUpdateCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateCamera create() => ReceiveUpdateCamera._();
  ReceiveUpdateCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateCamera> createRepeated() => $pb.PbList<ReceiveUpdateCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateCamera>(create);
  static ReceiveUpdateCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(92)
  $core.int get rECEIVEUPDATECAMERA => $_getIZ(1);
  @$pb.TagNumber(92)
  set rECEIVEUPDATECAMERA($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(92)
  $core.bool hasRECEIVEUPDATECAMERA() => $_has(1);
  @$pb.TagNumber(92)
  void clearRECEIVEUPDATECAMERA() => clearField(92);
}

class DeleteShareGroup_Request extends $pb.GeneratedMessage {
  factory DeleteShareGroup_Request({
    $core.List<$core.int>? shareInviteId,
  }) {
    final $result = create();
    if (shareInviteId != null) {
      $result.shareInviteId = shareInviteId;
    }
    return $result;
  }
  DeleteShareGroup_Request._() : super();
  factory DeleteShareGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteShareGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteShareGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'shareInviteId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteShareGroup_Request clone() => DeleteShareGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteShareGroup_Request copyWith(void Function(DeleteShareGroup_Request) updates) => super.copyWith((message) => updates(message as DeleteShareGroup_Request)) as DeleteShareGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShareGroup_Request create() => DeleteShareGroup_Request._();
  DeleteShareGroup_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteShareGroup_Request> createRepeated() => $pb.PbList<DeleteShareGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteShareGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteShareGroup_Request>(create);
  static DeleteShareGroup_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get shareInviteId => $_getN(0);
  @$pb.TagNumber(1)
  set shareInviteId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShareInviteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShareInviteId() => clearField(1);
}

class DeleteShareGroup_Reply extends $pb.GeneratedMessage {
  factory DeleteShareGroup_Reply({
    $core.List<$core.int>? shareInviteId,
  }) {
    final $result = create();
    if (shareInviteId != null) {
      $result.shareInviteId = shareInviteId;
    }
    return $result;
  }
  DeleteShareGroup_Reply._() : super();
  factory DeleteShareGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteShareGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteShareGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'shareInviteId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteShareGroup_Reply clone() => DeleteShareGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteShareGroup_Reply copyWith(void Function(DeleteShareGroup_Reply) updates) => super.copyWith((message) => updates(message as DeleteShareGroup_Reply)) as DeleteShareGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShareGroup_Reply create() => DeleteShareGroup_Reply._();
  DeleteShareGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteShareGroup_Reply> createRepeated() => $pb.PbList<DeleteShareGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteShareGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteShareGroup_Reply>(create);
  static DeleteShareGroup_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get shareInviteId => $_getN(0);
  @$pb.TagNumber(1)
  set shareInviteId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShareInviteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShareInviteId() => clearField(1);
}

class DeleteShareGroup extends $pb.GeneratedMessage {
  factory DeleteShareGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteShareGroup._() : super();
  factory DeleteShareGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteShareGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteShareGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(238, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteShareGroup clone() => DeleteShareGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteShareGroup copyWith(void Function(DeleteShareGroup) updates) => super.copyWith((message) => updates(message as DeleteShareGroup)) as DeleteShareGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShareGroup create() => DeleteShareGroup._();
  DeleteShareGroup createEmptyInstance() => create();
  static $pb.PbList<DeleteShareGroup> createRepeated() => $pb.PbList<DeleteShareGroup>();
  @$core.pragma('dart2js:noInline')
  static DeleteShareGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteShareGroup>(create);
  static DeleteShareGroup? _defaultInstance;

  @$pb.TagNumber(238)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(238)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(238)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(238)
  void clearID() => clearField(238);
}

class ReceiveDeleteShareGroup extends $pb.GeneratedMessage {
  factory ReceiveDeleteShareGroup({
    $core.List<$core.int>? shareInviteId,
    $core.List<$core.int>? groupId,
    $core.int? rECEIVEDELETESHAREGROUP,
  }) {
    final $result = create();
    if (shareInviteId != null) {
      $result.shareInviteId = shareInviteId;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (rECEIVEDELETESHAREGROUP != null) {
      $result.rECEIVEDELETESHAREGROUP = rECEIVEDELETESHAREGROUP;
    }
    return $result;
  }
  ReceiveDeleteShareGroup._() : super();
  factory ReceiveDeleteShareGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveDeleteShareGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveDeleteShareGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'shareInviteId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..a<$core.int>(1001, _omitFieldNames ? '' : 'RECEIVEDELETESHAREGROUP', $pb.PbFieldType.OU3, protoName: 'RECEIVE_DELETE_SHARE_GROUP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveDeleteShareGroup clone() => ReceiveDeleteShareGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveDeleteShareGroup copyWith(void Function(ReceiveDeleteShareGroup) updates) => super.copyWith((message) => updates(message as ReceiveDeleteShareGroup)) as ReceiveDeleteShareGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteShareGroup create() => ReceiveDeleteShareGroup._();
  ReceiveDeleteShareGroup createEmptyInstance() => create();
  static $pb.PbList<ReceiveDeleteShareGroup> createRepeated() => $pb.PbList<ReceiveDeleteShareGroup>();
  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteShareGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveDeleteShareGroup>(create);
  static ReceiveDeleteShareGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get shareInviteId => $_getN(0);
  @$pb.TagNumber(1)
  set shareInviteId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShareInviteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShareInviteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get groupId => $_getN(1);
  @$pb.TagNumber(2)
  set groupId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);

  @$pb.TagNumber(1001)
  $core.int get rECEIVEDELETESHAREGROUP => $_getIZ(2);
  @$pb.TagNumber(1001)
  set rECEIVEDELETESHAREGROUP($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(1001)
  $core.bool hasRECEIVEDELETESHAREGROUP() => $_has(2);
  @$pb.TagNumber(1001)
  void clearRECEIVEDELETESHAREGROUP() => clearField(1001);
}

class Onvif_PTZ_Request extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Request({
    $core.double? pan,
    $core.double? tit,
    $core.double? zoom,
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (pan != null) {
      $result.pan = pan;
    }
    if (tit != null) {
      $result.tit = tit;
    }
    if (zoom != null) {
      $result.zoom = zoom;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  Onvif_PTZ_Request._() : super();
  factory Onvif_PTZ_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'pan', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'tit', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'zoom', $pb.PbFieldType.OF)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Request clone() => Onvif_PTZ_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Request copyWith(void Function(Onvif_PTZ_Request) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Request)) as Onvif_PTZ_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Request create() => Onvif_PTZ_Request._();
  Onvif_PTZ_Request createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Request> createRepeated() => $pb.PbList<Onvif_PTZ_Request>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Request>(create);
  static Onvif_PTZ_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get pan => $_getN(0);
  @$pb.TagNumber(1)
  set pan($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPan() => $_has(0);
  @$pb.TagNumber(1)
  void clearPan() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get tit => $_getN(1);
  @$pb.TagNumber(2)
  set tit($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTit() => $_has(1);
  @$pb.TagNumber(2)
  void clearTit() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get zoom => $_getN(2);
  @$pb.TagNumber(3)
  set zoom($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearZoom() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get cameraId => $_getN(3);
  @$pb.TagNumber(4)
  set cameraId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCameraId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCameraId() => clearField(4);
}

class Onvif_PTZ_Reply extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Reply() => create();
  Onvif_PTZ_Reply._() : super();
  factory Onvif_PTZ_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Reply clone() => Onvif_PTZ_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Reply copyWith(void Function(Onvif_PTZ_Reply) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Reply)) as Onvif_PTZ_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Reply create() => Onvif_PTZ_Reply._();
  Onvif_PTZ_Reply createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Reply> createRepeated() => $pb.PbList<Onvif_PTZ_Reply>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Reply>(create);
  static Onvif_PTZ_Reply? _defaultInstance;
}

class Onvif_PTZ extends $pb.GeneratedMessage {
  factory Onvif_PTZ({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Onvif_PTZ._() : super();
  factory Onvif_PTZ.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(239, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ clone() => Onvif_PTZ()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ copyWith(void Function(Onvif_PTZ) updates) => super.copyWith((message) => updates(message as Onvif_PTZ)) as Onvif_PTZ;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ create() => Onvif_PTZ._();
  Onvif_PTZ createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ> createRepeated() => $pb.PbList<Onvif_PTZ>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ>(create);
  static Onvif_PTZ? _defaultInstance;

  @$pb.TagNumber(239)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(239)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(239)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(239)
  void clearID() => clearField(239);
}

class ReceiveNewVideoPlayback_PlaybackVideo extends $pb.GeneratedMessage {
  factory ReceiveNewVideoPlayback_PlaybackVideo({
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.String? urlPlayback,
    $core.List<$core.int>? cameraId,
    $core.String? urlThumbnail,
    $core.int? duration,
    $core.List<$core.int>? playbackId,
  }) {
    final $result = create();
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (urlPlayback != null) {
      $result.urlPlayback = urlPlayback;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (urlThumbnail != null) {
      $result.urlThumbnail = urlThumbnail;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (playbackId != null) {
      $result.playbackId = playbackId;
    }
    return $result;
  }
  ReceiveNewVideoPlayback_PlaybackVideo._() : super();
  factory ReceiveNewVideoPlayback_PlaybackVideo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveNewVideoPlayback_PlaybackVideo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveNewVideoPlayback.PlaybackVideo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'endTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'urlPlayback')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(6, _omitFieldNames ? '' : 'urlThumbnail')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'playbackId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveNewVideoPlayback_PlaybackVideo clone() => ReceiveNewVideoPlayback_PlaybackVideo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveNewVideoPlayback_PlaybackVideo copyWith(void Function(ReceiveNewVideoPlayback_PlaybackVideo) updates) => super.copyWith((message) => updates(message as ReceiveNewVideoPlayback_PlaybackVideo)) as ReceiveNewVideoPlayback_PlaybackVideo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveNewVideoPlayback_PlaybackVideo create() => ReceiveNewVideoPlayback_PlaybackVideo._();
  ReceiveNewVideoPlayback_PlaybackVideo createEmptyInstance() => create();
  static $pb.PbList<ReceiveNewVideoPlayback_PlaybackVideo> createRepeated() => $pb.PbList<ReceiveNewVideoPlayback_PlaybackVideo>();
  @$core.pragma('dart2js:noInline')
  static ReceiveNewVideoPlayback_PlaybackVideo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveNewVideoPlayback_PlaybackVideo>(create);
  static ReceiveNewVideoPlayback_PlaybackVideo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startTime => $_getI64(0);
  @$pb.TagNumber(1)
  set startTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartTime() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endTime => $_getI64(1);
  @$pb.TagNumber(2)
  set endTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get urlPlayback => $_getSZ(2);
  @$pb.TagNumber(4)
  set urlPlayback($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasUrlPlayback() => $_has(2);
  @$pb.TagNumber(4)
  void clearUrlPlayback() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get cameraId => $_getN(3);
  @$pb.TagNumber(5)
  set cameraId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasCameraId() => $_has(3);
  @$pb.TagNumber(5)
  void clearCameraId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get urlThumbnail => $_getSZ(4);
  @$pb.TagNumber(6)
  set urlThumbnail($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasUrlThumbnail() => $_has(4);
  @$pb.TagNumber(6)
  void clearUrlThumbnail() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get duration => $_getIZ(5);
  @$pb.TagNumber(7)
  set duration($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get playbackId => $_getN(6);
  @$pb.TagNumber(8)
  set playbackId($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasPlaybackId() => $_has(6);
  @$pb.TagNumber(8)
  void clearPlaybackId() => clearField(8);
}

class ReceiveNewVideoPlayback extends $pb.GeneratedMessage {
  factory ReceiveNewVideoPlayback({
    $core.List<$core.int>? cameraId,
    ReceiveNewVideoPlayback_PlaybackVideo? newVideoPlayback,
    $core.int? rECEIVENEWVIDEOPLAYBACK,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (newVideoPlayback != null) {
      $result.newVideoPlayback = newVideoPlayback;
    }
    if (rECEIVENEWVIDEOPLAYBACK != null) {
      $result.rECEIVENEWVIDEOPLAYBACK = rECEIVENEWVIDEOPLAYBACK;
    }
    return $result;
  }
  ReceiveNewVideoPlayback._() : super();
  factory ReceiveNewVideoPlayback.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveNewVideoPlayback.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveNewVideoPlayback', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<ReceiveNewVideoPlayback_PlaybackVideo>(2, _omitFieldNames ? '' : 'newVideoPlayback', protoName: 'newVideoPlayback', subBuilder: ReceiveNewVideoPlayback_PlaybackVideo.create)
    ..a<$core.int>(94, _omitFieldNames ? '' : 'RECEIVENEWVIDEOPLAYBACK', $pb.PbFieldType.OU3, protoName: 'RECEIVE_NEW_VIDEO_PLAYBACK')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveNewVideoPlayback clone() => ReceiveNewVideoPlayback()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveNewVideoPlayback copyWith(void Function(ReceiveNewVideoPlayback) updates) => super.copyWith((message) => updates(message as ReceiveNewVideoPlayback)) as ReceiveNewVideoPlayback;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveNewVideoPlayback create() => ReceiveNewVideoPlayback._();
  ReceiveNewVideoPlayback createEmptyInstance() => create();
  static $pb.PbList<ReceiveNewVideoPlayback> createRepeated() => $pb.PbList<ReceiveNewVideoPlayback>();
  @$core.pragma('dart2js:noInline')
  static ReceiveNewVideoPlayback getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveNewVideoPlayback>(create);
  static ReceiveNewVideoPlayback? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  ReceiveNewVideoPlayback_PlaybackVideo get newVideoPlayback => $_getN(1);
  @$pb.TagNumber(2)
  set newVideoPlayback(ReceiveNewVideoPlayback_PlaybackVideo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewVideoPlayback() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewVideoPlayback() => clearField(2);
  @$pb.TagNumber(2)
  ReceiveNewVideoPlayback_PlaybackVideo ensureNewVideoPlayback() => $_ensure(1);

  @$pb.TagNumber(94)
  $core.int get rECEIVENEWVIDEOPLAYBACK => $_getIZ(2);
  @$pb.TagNumber(94)
  set rECEIVENEWVIDEOPLAYBACK($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(94)
  $core.bool hasRECEIVENEWVIDEOPLAYBACK() => $_has(2);
  @$pb.TagNumber(94)
  void clearRECEIVENEWVIDEOPLAYBACK() => clearField(94);
}

class IVALineCrossing_Request extends $pb.GeneratedMessage {
  factory IVALineCrossing_Request({
    $core.List<$core.int>? cameraId,
    IVALineCrossing_DirectionType? direction,
    $core.bool? isEnable,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
    $core.bool? isPushNotification,
    $1.Roi? roiStart,
    $1.Roi? roiEnd,
    $1.Roi? directionStart,
    $1.Roi? directionEnd,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (isEnable != null) {
      $result.isEnable = isEnable;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (roiStart != null) {
      $result.roiStart = roiStart;
    }
    if (roiEnd != null) {
      $result.roiEnd = roiEnd;
    }
    if (directionStart != null) {
      $result.directionStart = directionStart;
    }
    if (directionEnd != null) {
      $result.directionEnd = directionEnd;
    }
    return $result;
  }
  IVALineCrossing_Request._() : super();
  factory IVALineCrossing_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVALineCrossing_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVALineCrossing.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<IVALineCrossing_DirectionType>(2, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: IVALineCrossing_DirectionType.A__B, valueOf: IVALineCrossing_DirectionType.valueOf, enumValues: IVALineCrossing_DirectionType.values)
    ..aOB(3, _omitFieldNames ? '' : 'isEnable', protoName: 'isEnable')
    ..aOB(5, _omitFieldNames ? '' : 'isSendEmail')
    ..aOB(6, _omitFieldNames ? '' : 'isRecord')
    ..aOB(7, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..aOM<$1.Roi>(8, _omitFieldNames ? '' : 'roiStart', subBuilder: $1.Roi.create)
    ..aOM<$1.Roi>(9, _omitFieldNames ? '' : 'roiEnd', subBuilder: $1.Roi.create)
    ..aOM<$1.Roi>(10, _omitFieldNames ? '' : 'directionStart', subBuilder: $1.Roi.create)
    ..aOM<$1.Roi>(11, _omitFieldNames ? '' : 'directionEnd', subBuilder: $1.Roi.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVALineCrossing_Request clone() => IVALineCrossing_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVALineCrossing_Request copyWith(void Function(IVALineCrossing_Request) updates) => super.copyWith((message) => updates(message as IVALineCrossing_Request)) as IVALineCrossing_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVALineCrossing_Request create() => IVALineCrossing_Request._();
  IVALineCrossing_Request createEmptyInstance() => create();
  static $pb.PbList<IVALineCrossing_Request> createRepeated() => $pb.PbList<IVALineCrossing_Request>();
  @$core.pragma('dart2js:noInline')
  static IVALineCrossing_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVALineCrossing_Request>(create);
  static IVALineCrossing_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  IVALineCrossing_DirectionType get direction => $_getN(1);
  @$pb.TagNumber(2)
  set direction(IVALineCrossing_DirectionType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isEnable => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnable($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsEnable() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnable() => clearField(3);

  /// 		Level level = 4; /// mức level
  @$pb.TagNumber(5)
  $core.bool get isSendEmail => $_getBF(3);
  @$pb.TagNumber(5)
  set isSendEmail($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsSendEmail() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsSendEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isRecord => $_getBF(4);
  @$pb.TagNumber(6)
  set isRecord($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsRecord() => $_has(4);
  @$pb.TagNumber(6)
  void clearIsRecord() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isPushNotification => $_getBF(5);
  @$pb.TagNumber(7)
  set isPushNotification($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsPushNotification() => $_has(5);
  @$pb.TagNumber(7)
  void clearIsPushNotification() => clearField(7);

  @$pb.TagNumber(8)
  $1.Roi get roiStart => $_getN(6);
  @$pb.TagNumber(8)
  set roiStart($1.Roi v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRoiStart() => $_has(6);
  @$pb.TagNumber(8)
  void clearRoiStart() => clearField(8);
  @$pb.TagNumber(8)
  $1.Roi ensureRoiStart() => $_ensure(6);

  @$pb.TagNumber(9)
  $1.Roi get roiEnd => $_getN(7);
  @$pb.TagNumber(9)
  set roiEnd($1.Roi v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoiEnd() => $_has(7);
  @$pb.TagNumber(9)
  void clearRoiEnd() => clearField(9);
  @$pb.TagNumber(9)
  $1.Roi ensureRoiEnd() => $_ensure(7);

  @$pb.TagNumber(10)
  $1.Roi get directionStart => $_getN(8);
  @$pb.TagNumber(10)
  set directionStart($1.Roi v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDirectionStart() => $_has(8);
  @$pb.TagNumber(10)
  void clearDirectionStart() => clearField(10);
  @$pb.TagNumber(10)
  $1.Roi ensureDirectionStart() => $_ensure(8);

  @$pb.TagNumber(11)
  $1.Roi get directionEnd => $_getN(9);
  @$pb.TagNumber(11)
  set directionEnd($1.Roi v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDirectionEnd() => $_has(9);
  @$pb.TagNumber(11)
  void clearDirectionEnd() => clearField(11);
  @$pb.TagNumber(11)
  $1.Roi ensureDirectionEnd() => $_ensure(9);
}

class IVALineCrossing_Reply extends $pb.GeneratedMessage {
  factory IVALineCrossing_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  IVALineCrossing_Reply._() : super();
  factory IVALineCrossing_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVALineCrossing_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVALineCrossing.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVALineCrossing_Reply clone() => IVALineCrossing_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVALineCrossing_Reply copyWith(void Function(IVALineCrossing_Reply) updates) => super.copyWith((message) => updates(message as IVALineCrossing_Reply)) as IVALineCrossing_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVALineCrossing_Reply create() => IVALineCrossing_Reply._();
  IVALineCrossing_Reply createEmptyInstance() => create();
  static $pb.PbList<IVALineCrossing_Reply> createRepeated() => $pb.PbList<IVALineCrossing_Reply>();
  @$core.pragma('dart2js:noInline')
  static IVALineCrossing_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVALineCrossing_Reply>(create);
  static IVALineCrossing_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

class IVALineCrossing extends $pb.GeneratedMessage {
  factory IVALineCrossing({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  IVALineCrossing._() : super();
  factory IVALineCrossing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVALineCrossing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVALineCrossing', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(240, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVALineCrossing clone() => IVALineCrossing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVALineCrossing copyWith(void Function(IVALineCrossing) updates) => super.copyWith((message) => updates(message as IVALineCrossing)) as IVALineCrossing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVALineCrossing create() => IVALineCrossing._();
  IVALineCrossing createEmptyInstance() => create();
  static $pb.PbList<IVALineCrossing> createRepeated() => $pb.PbList<IVALineCrossing>();
  @$core.pragma('dart2js:noInline')
  static IVALineCrossing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVALineCrossing>(create);
  static IVALineCrossing? _defaultInstance;

  @$pb.TagNumber(240)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(240)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(240)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(240)
  void clearID() => clearField(240);
}

class ReceiveIVALineCrossing extends $pb.GeneratedMessage {
  factory ReceiveIVALineCrossing({
    $1.Camera? camera,
    $core.int? rECEIVEIVALINECROSSING,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEIVALINECROSSING != null) {
      $result.rECEIVEIVALINECROSSING = rECEIVEIVALINECROSSING;
    }
    return $result;
  }
  ReceiveIVALineCrossing._() : super();
  factory ReceiveIVALineCrossing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveIVALineCrossing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveIVALineCrossing', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(95, _omitFieldNames ? '' : 'RECEIVEIVALINECROSSING', $pb.PbFieldType.OU3, protoName: 'RECEIVE_IVA_LINE_CROSSING')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveIVALineCrossing clone() => ReceiveIVALineCrossing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveIVALineCrossing copyWith(void Function(ReceiveIVALineCrossing) updates) => super.copyWith((message) => updates(message as ReceiveIVALineCrossing)) as ReceiveIVALineCrossing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveIVALineCrossing create() => ReceiveIVALineCrossing._();
  ReceiveIVALineCrossing createEmptyInstance() => create();
  static $pb.PbList<ReceiveIVALineCrossing> createRepeated() => $pb.PbList<ReceiveIVALineCrossing>();
  @$core.pragma('dart2js:noInline')
  static ReceiveIVALineCrossing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveIVALineCrossing>(create);
  static ReceiveIVALineCrossing? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(95)
  $core.int get rECEIVEIVALINECROSSING => $_getIZ(1);
  @$pb.TagNumber(95)
  set rECEIVEIVALINECROSSING($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(95)
  $core.bool hasRECEIVEIVALINECROSSING() => $_has(1);
  @$pb.TagNumber(95)
  void clearRECEIVEIVALINECROSSING() => clearField(95);
}

class IVAIntrusionDetection_Request extends $pb.GeneratedMessage {
  factory IVAIntrusionDetection_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? isEnable,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
    $core.bool? isPushNotification,
    $core.Iterable<$1.Roi>? rois,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (isEnable != null) {
      $result.isEnable = isEnable;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    return $result;
  }
  IVAIntrusionDetection_Request._() : super();
  factory IVAIntrusionDetection_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAIntrusionDetection_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAIntrusionDetection.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isEnable', protoName: 'isEnable')
    ..aOB(4, _omitFieldNames ? '' : 'isSendEmail')
    ..aOB(5, _omitFieldNames ? '' : 'isRecord')
    ..aOB(6, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..pc<$1.Roi>(7, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: $1.Roi.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAIntrusionDetection_Request clone() => IVAIntrusionDetection_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAIntrusionDetection_Request copyWith(void Function(IVAIntrusionDetection_Request) updates) => super.copyWith((message) => updates(message as IVAIntrusionDetection_Request)) as IVAIntrusionDetection_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAIntrusionDetection_Request create() => IVAIntrusionDetection_Request._();
  IVAIntrusionDetection_Request createEmptyInstance() => create();
  static $pb.PbList<IVAIntrusionDetection_Request> createRepeated() => $pb.PbList<IVAIntrusionDetection_Request>();
  @$core.pragma('dart2js:noInline')
  static IVAIntrusionDetection_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAIntrusionDetection_Request>(create);
  static IVAIntrusionDetection_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isEnable => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnable() => clearField(2);

  /// Level level = 3; /// mức level
  @$pb.TagNumber(4)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(4)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(4)
  void clearIsSendEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecord => $_getBF(3);
  @$pb.TagNumber(5)
  set isRecord($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecord() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsRecord() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPushNotification => $_getBF(4);
  @$pb.TagNumber(6)
  set isPushNotification($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPushNotification() => $_has(4);
  @$pb.TagNumber(6)
  void clearIsPushNotification() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$1.Roi> get rois => $_getList(5);
}

class IVAIntrusionDetection_Reply extends $pb.GeneratedMessage {
  factory IVAIntrusionDetection_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  IVAIntrusionDetection_Reply._() : super();
  factory IVAIntrusionDetection_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAIntrusionDetection_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAIntrusionDetection.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAIntrusionDetection_Reply clone() => IVAIntrusionDetection_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAIntrusionDetection_Reply copyWith(void Function(IVAIntrusionDetection_Reply) updates) => super.copyWith((message) => updates(message as IVAIntrusionDetection_Reply)) as IVAIntrusionDetection_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAIntrusionDetection_Reply create() => IVAIntrusionDetection_Reply._();
  IVAIntrusionDetection_Reply createEmptyInstance() => create();
  static $pb.PbList<IVAIntrusionDetection_Reply> createRepeated() => $pb.PbList<IVAIntrusionDetection_Reply>();
  @$core.pragma('dart2js:noInline')
  static IVAIntrusionDetection_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAIntrusionDetection_Reply>(create);
  static IVAIntrusionDetection_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

class IVAIntrusionDetection extends $pb.GeneratedMessage {
  factory IVAIntrusionDetection({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  IVAIntrusionDetection._() : super();
  factory IVAIntrusionDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAIntrusionDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAIntrusionDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(241, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAIntrusionDetection clone() => IVAIntrusionDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAIntrusionDetection copyWith(void Function(IVAIntrusionDetection) updates) => super.copyWith((message) => updates(message as IVAIntrusionDetection)) as IVAIntrusionDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAIntrusionDetection create() => IVAIntrusionDetection._();
  IVAIntrusionDetection createEmptyInstance() => create();
  static $pb.PbList<IVAIntrusionDetection> createRepeated() => $pb.PbList<IVAIntrusionDetection>();
  @$core.pragma('dart2js:noInline')
  static IVAIntrusionDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAIntrusionDetection>(create);
  static IVAIntrusionDetection? _defaultInstance;

  @$pb.TagNumber(241)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(241)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(241)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(241)
  void clearID() => clearField(241);
}

class ReceiveIVAIntrusionDetection extends $pb.GeneratedMessage {
  factory ReceiveIVAIntrusionDetection({
    $1.Camera? camera,
    $core.int? rECEIVEIVAINTDET,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEIVAINTDET != null) {
      $result.rECEIVEIVAINTDET = rECEIVEIVAINTDET;
    }
    return $result;
  }
  ReceiveIVAIntrusionDetection._() : super();
  factory ReceiveIVAIntrusionDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveIVAIntrusionDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveIVAIntrusionDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(96, _omitFieldNames ? '' : 'RECEIVEIVAINTDET', $pb.PbFieldType.OU3, protoName: 'RECEIVE_IVA_INT_DET')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveIVAIntrusionDetection clone() => ReceiveIVAIntrusionDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveIVAIntrusionDetection copyWith(void Function(ReceiveIVAIntrusionDetection) updates) => super.copyWith((message) => updates(message as ReceiveIVAIntrusionDetection)) as ReceiveIVAIntrusionDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveIVAIntrusionDetection create() => ReceiveIVAIntrusionDetection._();
  ReceiveIVAIntrusionDetection createEmptyInstance() => create();
  static $pb.PbList<ReceiveIVAIntrusionDetection> createRepeated() => $pb.PbList<ReceiveIVAIntrusionDetection>();
  @$core.pragma('dart2js:noInline')
  static ReceiveIVAIntrusionDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveIVAIntrusionDetection>(create);
  static ReceiveIVAIntrusionDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(96)
  $core.int get rECEIVEIVAINTDET => $_getIZ(1);
  @$pb.TagNumber(96)
  set rECEIVEIVAINTDET($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(96)
  $core.bool hasRECEIVEIVAINTDET() => $_has(1);
  @$pb.TagNumber(96)
  void clearRECEIVEIVAINTDET() => clearField(96);
}

class UpdateInviteGroup_Request extends $pb.GeneratedMessage {
  factory UpdateInviteGroup_Request({
    $core.List<$core.int>? shareInviteId,
    UpdateInviteGroup_GroupShareRole? role,
  }) {
    final $result = create();
    if (shareInviteId != null) {
      $result.shareInviteId = shareInviteId;
    }
    if (role != null) {
      $result.role = role;
    }
    return $result;
  }
  UpdateInviteGroup_Request._() : super();
  factory UpdateInviteGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInviteGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInviteGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'shareInviteId', $pb.PbFieldType.OY)
    ..e<UpdateInviteGroup_GroupShareRole>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: UpdateInviteGroup_GroupShareRole.NOT_USE_, valueOf: UpdateInviteGroup_GroupShareRole.valueOf, enumValues: UpdateInviteGroup_GroupShareRole.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInviteGroup_Request clone() => UpdateInviteGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInviteGroup_Request copyWith(void Function(UpdateInviteGroup_Request) updates) => super.copyWith((message) => updates(message as UpdateInviteGroup_Request)) as UpdateInviteGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInviteGroup_Request create() => UpdateInviteGroup_Request._();
  UpdateInviteGroup_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateInviteGroup_Request> createRepeated() => $pb.PbList<UpdateInviteGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateInviteGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInviteGroup_Request>(create);
  static UpdateInviteGroup_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get shareInviteId => $_getN(0);
  @$pb.TagNumber(1)
  set shareInviteId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShareInviteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShareInviteId() => clearField(1);

  @$pb.TagNumber(2)
  UpdateInviteGroup_GroupShareRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(UpdateInviteGroup_GroupShareRole v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);
}

class UpdateInviteGroup_Reply extends $pb.GeneratedMessage {
  factory UpdateInviteGroup_Reply({
    $core.List<$core.int>? shareInviteId,
  }) {
    final $result = create();
    if (shareInviteId != null) {
      $result.shareInviteId = shareInviteId;
    }
    return $result;
  }
  UpdateInviteGroup_Reply._() : super();
  factory UpdateInviteGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInviteGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInviteGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'shareInviteId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInviteGroup_Reply clone() => UpdateInviteGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInviteGroup_Reply copyWith(void Function(UpdateInviteGroup_Reply) updates) => super.copyWith((message) => updates(message as UpdateInviteGroup_Reply)) as UpdateInviteGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInviteGroup_Reply create() => UpdateInviteGroup_Reply._();
  UpdateInviteGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateInviteGroup_Reply> createRepeated() => $pb.PbList<UpdateInviteGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateInviteGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInviteGroup_Reply>(create);
  static UpdateInviteGroup_Reply? _defaultInstance;

  @$pb.TagNumber(3)
  $core.List<$core.int> get shareInviteId => $_getN(0);
  @$pb.TagNumber(3)
  set shareInviteId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasShareInviteId() => $_has(0);
  @$pb.TagNumber(3)
  void clearShareInviteId() => clearField(3);
}

class UpdateInviteGroup extends $pb.GeneratedMessage {
  factory UpdateInviteGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateInviteGroup._() : super();
  factory UpdateInviteGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInviteGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInviteGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(242, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInviteGroup clone() => UpdateInviteGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInviteGroup copyWith(void Function(UpdateInviteGroup) updates) => super.copyWith((message) => updates(message as UpdateInviteGroup)) as UpdateInviteGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInviteGroup create() => UpdateInviteGroup._();
  UpdateInviteGroup createEmptyInstance() => create();
  static $pb.PbList<UpdateInviteGroup> createRepeated() => $pb.PbList<UpdateInviteGroup>();
  @$core.pragma('dart2js:noInline')
  static UpdateInviteGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInviteGroup>(create);
  static UpdateInviteGroup? _defaultInstance;

  @$pb.TagNumber(242)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(242)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(242)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(242)
  void clearID() => clearField(242);
}

class ReceiveUpdateInviteGroup extends $pb.GeneratedMessage {
  factory ReceiveUpdateInviteGroup({
    $core.List<$core.int>? shareInviteId,
    ReceiveUpdateInviteGroup_GroupShareRole? role,
    $core.int? rECEIVEUPDATEINVITEGROUP,
  }) {
    final $result = create();
    if (shareInviteId != null) {
      $result.shareInviteId = shareInviteId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (rECEIVEUPDATEINVITEGROUP != null) {
      $result.rECEIVEUPDATEINVITEGROUP = rECEIVEUPDATEINVITEGROUP;
    }
    return $result;
  }
  ReceiveUpdateInviteGroup._() : super();
  factory ReceiveUpdateInviteGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateInviteGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateInviteGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'shareInviteId', $pb.PbFieldType.OY)
    ..e<ReceiveUpdateInviteGroup_GroupShareRole>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ReceiveUpdateInviteGroup_GroupShareRole.NOT_USE_, valueOf: ReceiveUpdateInviteGroup_GroupShareRole.valueOf, enumValues: ReceiveUpdateInviteGroup_GroupShareRole.values)
    ..a<$core.int>(97, _omitFieldNames ? '' : 'RECEIVEUPDATEINVITEGROUP', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_INVITE_GROUP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateInviteGroup clone() => ReceiveUpdateInviteGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateInviteGroup copyWith(void Function(ReceiveUpdateInviteGroup) updates) => super.copyWith((message) => updates(message as ReceiveUpdateInviteGroup)) as ReceiveUpdateInviteGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateInviteGroup create() => ReceiveUpdateInviteGroup._();
  ReceiveUpdateInviteGroup createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateInviteGroup> createRepeated() => $pb.PbList<ReceiveUpdateInviteGroup>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateInviteGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateInviteGroup>(create);
  static ReceiveUpdateInviteGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get shareInviteId => $_getN(0);
  @$pb.TagNumber(1)
  set shareInviteId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShareInviteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShareInviteId() => clearField(1);

  @$pb.TagNumber(2)
  ReceiveUpdateInviteGroup_GroupShareRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ReceiveUpdateInviteGroup_GroupShareRole v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(97)
  $core.int get rECEIVEUPDATEINVITEGROUP => $_getIZ(2);
  @$pb.TagNumber(97)
  set rECEIVEUPDATEINVITEGROUP($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(97)
  $core.bool hasRECEIVEUPDATEINVITEGROUP() => $_has(2);
  @$pb.TagNumber(97)
  void clearRECEIVEUPDATEINVITEGROUP() => clearField(97);
}

class ReceiveUpdateGroupRole extends $pb.GeneratedMessage {
  factory ReceiveUpdateGroupRole({
    $core.List<$core.int>? groupId,
    ReceiveUpdateGroupRole_GroupShareRole? role,
    $1.DeviceGroup? group,
    $core.int? rECEIVEUPDATEGROUPROLE,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (group != null) {
      $result.group = group;
    }
    if (rECEIVEUPDATEGROUPROLE != null) {
      $result.rECEIVEUPDATEGROUPROLE = rECEIVEUPDATEGROUPROLE;
    }
    return $result;
  }
  ReceiveUpdateGroupRole._() : super();
  factory ReceiveUpdateGroupRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateGroupRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateGroupRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..e<ReceiveUpdateGroupRole_GroupShareRole>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ReceiveUpdateGroupRole_GroupShareRole.NOT_USE_, valueOf: ReceiveUpdateGroupRole_GroupShareRole.valueOf, enumValues: ReceiveUpdateGroupRole_GroupShareRole.values)
    ..aOM<$1.DeviceGroup>(3, _omitFieldNames ? '' : 'group', subBuilder: $1.DeviceGroup.create)
    ..a<$core.int>(98, _omitFieldNames ? '' : 'RECEIVEUPDATEGROUPROLE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_GROUP_ROLE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateGroupRole clone() => ReceiveUpdateGroupRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateGroupRole copyWith(void Function(ReceiveUpdateGroupRole) updates) => super.copyWith((message) => updates(message as ReceiveUpdateGroupRole)) as ReceiveUpdateGroupRole;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateGroupRole create() => ReceiveUpdateGroupRole._();
  ReceiveUpdateGroupRole createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateGroupRole> createRepeated() => $pb.PbList<ReceiveUpdateGroupRole>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateGroupRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateGroupRole>(create);
  static ReceiveUpdateGroupRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  ReceiveUpdateGroupRole_GroupShareRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ReceiveUpdateGroupRole_GroupShareRole v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $1.DeviceGroup get group => $_getN(2);
  @$pb.TagNumber(3)
  set group($1.DeviceGroup v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => clearField(3);
  @$pb.TagNumber(3)
  $1.DeviceGroup ensureGroup() => $_ensure(2);

  @$pb.TagNumber(98)
  $core.int get rECEIVEUPDATEGROUPROLE => $_getIZ(3);
  @$pb.TagNumber(98)
  set rECEIVEUPDATEGROUPROLE($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(98)
  $core.bool hasRECEIVEUPDATEGROUPROLE() => $_has(3);
  @$pb.TagNumber(98)
  void clearRECEIVEUPDATEGROUPROLE() => clearField(98);
}

class GetCurrentRecoding_Request extends $pb.GeneratedMessage {
  factory GetCurrentRecoding_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  GetCurrentRecoding_Request._() : super();
  factory GetCurrentRecoding_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCurrentRecoding_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCurrentRecoding.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCurrentRecoding_Request clone() => GetCurrentRecoding_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCurrentRecoding_Request copyWith(void Function(GetCurrentRecoding_Request) updates) => super.copyWith((message) => updates(message as GetCurrentRecoding_Request)) as GetCurrentRecoding_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentRecoding_Request create() => GetCurrentRecoding_Request._();
  GetCurrentRecoding_Request createEmptyInstance() => create();
  static $pb.PbList<GetCurrentRecoding_Request> createRepeated() => $pb.PbList<GetCurrentRecoding_Request>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentRecoding_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCurrentRecoding_Request>(create);
  static GetCurrentRecoding_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class GetCurrentRecoding_Reply extends $pb.GeneratedMessage {
  factory GetCurrentRecoding_Reply({
    $core.String? currentRecordFilePath,
    $core.int? startRecord,
  }) {
    final $result = create();
    if (currentRecordFilePath != null) {
      $result.currentRecordFilePath = currentRecordFilePath;
    }
    if (startRecord != null) {
      $result.startRecord = startRecord;
    }
    return $result;
  }
  GetCurrentRecoding_Reply._() : super();
  factory GetCurrentRecoding_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCurrentRecoding_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCurrentRecoding.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentRecordFilePath')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'startRecord', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCurrentRecoding_Reply clone() => GetCurrentRecoding_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCurrentRecoding_Reply copyWith(void Function(GetCurrentRecoding_Reply) updates) => super.copyWith((message) => updates(message as GetCurrentRecoding_Reply)) as GetCurrentRecoding_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentRecoding_Reply create() => GetCurrentRecoding_Reply._();
  GetCurrentRecoding_Reply createEmptyInstance() => create();
  static $pb.PbList<GetCurrentRecoding_Reply> createRepeated() => $pb.PbList<GetCurrentRecoding_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentRecoding_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCurrentRecoding_Reply>(create);
  static GetCurrentRecoding_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentRecordFilePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentRecordFilePath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentRecordFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentRecordFilePath() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startRecord => $_getIZ(1);
  @$pb.TagNumber(2)
  set startRecord($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartRecord() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartRecord() => clearField(2);
}

/// / lấy về file m3u8 hiện tại mà server vẫn đang record
class GetCurrentRecoding extends $pb.GeneratedMessage {
  factory GetCurrentRecoding({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetCurrentRecoding._() : super();
  factory GetCurrentRecoding.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCurrentRecoding.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCurrentRecoding', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(244, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCurrentRecoding clone() => GetCurrentRecoding()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCurrentRecoding copyWith(void Function(GetCurrentRecoding) updates) => super.copyWith((message) => updates(message as GetCurrentRecoding)) as GetCurrentRecoding;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentRecoding create() => GetCurrentRecoding._();
  GetCurrentRecoding createEmptyInstance() => create();
  static $pb.PbList<GetCurrentRecoding> createRepeated() => $pb.PbList<GetCurrentRecoding>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentRecoding getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCurrentRecoding>(create);
  static GetCurrentRecoding? _defaultInstance;

  @$pb.TagNumber(244)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(244)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(244)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(244)
  void clearID() => clearField(244);
}

class GetAllCamera_Request extends $pb.GeneratedMessage {
  factory GetAllCamera_Request({
    $core.List<$core.int>? cameraId,
    GetAllCamera_Status? status,
    GetAllCamera_Iva_Type? ivaType,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (ivaType != null) {
      $result.ivaType = ivaType;
    }
    return $result;
  }
  GetAllCamera_Request._() : super();
  factory GetAllCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<GetAllCamera_Status>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: GetAllCamera_Status.ALL_C, valueOf: GetAllCamera_Status.valueOf, enumValues: GetAllCamera_Status.values)
    ..e<GetAllCamera_Iva_Type>(3, _omitFieldNames ? '' : 'ivaType', $pb.PbFieldType.OE, defaultOrMaker: GetAllCamera_Iva_Type.ALL, valueOf: GetAllCamera_Iva_Type.valueOf, enumValues: GetAllCamera_Iva_Type.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllCamera_Request clone() => GetAllCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllCamera_Request copyWith(void Function(GetAllCamera_Request) updates) => super.copyWith((message) => updates(message as GetAllCamera_Request)) as GetAllCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllCamera_Request create() => GetAllCamera_Request._();
  GetAllCamera_Request createEmptyInstance() => create();
  static $pb.PbList<GetAllCamera_Request> createRepeated() => $pb.PbList<GetAllCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static GetAllCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllCamera_Request>(create);
  static GetAllCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  GetAllCamera_Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(GetAllCamera_Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  GetAllCamera_Iva_Type get ivaType => $_getN(2);
  @$pb.TagNumber(3)
  set ivaType(GetAllCamera_Iva_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIvaType() => $_has(2);
  @$pb.TagNumber(3)
  void clearIvaType() => clearField(3);
}

class GetAllCamera_Reply extends $pb.GeneratedMessage {
  factory GetAllCamera_Reply({
    $core.Iterable<$1.Camera>? cameras,
  }) {
    final $result = create();
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    return $result;
  }
  GetAllCamera_Reply._() : super();
  factory GetAllCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllCamera_Reply clone() => GetAllCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllCamera_Reply copyWith(void Function(GetAllCamera_Reply) updates) => super.copyWith((message) => updates(message as GetAllCamera_Reply)) as GetAllCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllCamera_Reply create() => GetAllCamera_Reply._();
  GetAllCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<GetAllCamera_Reply> createRepeated() => $pb.PbList<GetAllCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetAllCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllCamera_Reply>(create);
  static GetAllCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get cameras => $_getList(0);
}

class GetAllCamera extends $pb.GeneratedMessage {
  factory GetAllCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetAllCamera._() : super();
  factory GetAllCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(245, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllCamera clone() => GetAllCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllCamera copyWith(void Function(GetAllCamera) updates) => super.copyWith((message) => updates(message as GetAllCamera)) as GetAllCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllCamera create() => GetAllCamera._();
  GetAllCamera createEmptyInstance() => create();
  static $pb.PbList<GetAllCamera> createRepeated() => $pb.PbList<GetAllCamera>();
  @$core.pragma('dart2js:noInline')
  static GetAllCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllCamera>(create);
  static GetAllCamera? _defaultInstance;

  @$pb.TagNumber(245)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(245)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(245)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(245)
  void clearID() => clearField(245);
}

class GetAllGroup_Request extends $pb.GeneratedMessage {
  factory GetAllGroup_Request() => create();
  GetAllGroup_Request._() : super();
  factory GetAllGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllGroup_Request clone() => GetAllGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllGroup_Request copyWith(void Function(GetAllGroup_Request) updates) => super.copyWith((message) => updates(message as GetAllGroup_Request)) as GetAllGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllGroup_Request create() => GetAllGroup_Request._();
  GetAllGroup_Request createEmptyInstance() => create();
  static $pb.PbList<GetAllGroup_Request> createRepeated() => $pb.PbList<GetAllGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static GetAllGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllGroup_Request>(create);
  static GetAllGroup_Request? _defaultInstance;
}

class GetAllGroup_Reply extends $pb.GeneratedMessage {
  factory GetAllGroup_Reply({
    $core.Iterable<$1.DeviceGroup>? groups,
  }) {
    final $result = create();
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    return $result;
  }
  GetAllGroup_Reply._() : super();
  factory GetAllGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.DeviceGroup>(2, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllGroup_Reply clone() => GetAllGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllGroup_Reply copyWith(void Function(GetAllGroup_Reply) updates) => super.copyWith((message) => updates(message as GetAllGroup_Reply)) as GetAllGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllGroup_Reply create() => GetAllGroup_Reply._();
  GetAllGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<GetAllGroup_Reply> createRepeated() => $pb.PbList<GetAllGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetAllGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllGroup_Reply>(create);
  static GetAllGroup_Reply? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$1.DeviceGroup> get groups => $_getList(0);
}

class GetAllGroup extends $pb.GeneratedMessage {
  factory GetAllGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetAllGroup._() : super();
  factory GetAllGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(246, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllGroup clone() => GetAllGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllGroup copyWith(void Function(GetAllGroup) updates) => super.copyWith((message) => updates(message as GetAllGroup)) as GetAllGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllGroup create() => GetAllGroup._();
  GetAllGroup createEmptyInstance() => create();
  static $pb.PbList<GetAllGroup> createRepeated() => $pb.PbList<GetAllGroup>();
  @$core.pragma('dart2js:noInline')
  static GetAllGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllGroup>(create);
  static GetAllGroup? _defaultInstance;

  @$pb.TagNumber(246)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(246)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(246)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(246)
  void clearID() => clearField(246);
}

class ReceiveGroupChange extends $pb.GeneratedMessage {
  factory ReceiveGroupChange({
    $core.Iterable<$1.DeviceGroup>? groups,
    $core.int? rECEIVEUPDATEGROUPDEVICE,
  }) {
    final $result = create();
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    if (rECEIVEUPDATEGROUPDEVICE != null) {
      $result.rECEIVEUPDATEGROUPDEVICE = rECEIVEUPDATEGROUPDEVICE;
    }
    return $result;
  }
  ReceiveGroupChange._() : super();
  factory ReceiveGroupChange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveGroupChange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveGroupChange', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.DeviceGroup>(1, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..a<$core.int>(99, _omitFieldNames ? '' : 'RECEIVEUPDATEGROUPDEVICE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_GROUP_DEVICE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveGroupChange clone() => ReceiveGroupChange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveGroupChange copyWith(void Function(ReceiveGroupChange) updates) => super.copyWith((message) => updates(message as ReceiveGroupChange)) as ReceiveGroupChange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveGroupChange create() => ReceiveGroupChange._();
  ReceiveGroupChange createEmptyInstance() => create();
  static $pb.PbList<ReceiveGroupChange> createRepeated() => $pb.PbList<ReceiveGroupChange>();
  @$core.pragma('dart2js:noInline')
  static ReceiveGroupChange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveGroupChange>(create);
  static ReceiveGroupChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.DeviceGroup> get groups => $_getList(0);

  @$pb.TagNumber(99)
  $core.int get rECEIVEUPDATEGROUPDEVICE => $_getIZ(1);
  @$pb.TagNumber(99)
  set rECEIVEUPDATEGROUPDEVICE($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(99)
  $core.bool hasRECEIVEUPDATEGROUPDEVICE() => $_has(1);
  @$pb.TagNumber(99)
  void clearRECEIVEUPDATEGROUPDEVICE() => clearField(99);
}

class CheckCameraOnvif_Request extends $pb.GeneratedMessage {
  factory CheckCameraOnvif_Request({
    $core.String? xaddrs,
    $core.String? userName,
    $core.String? password,
    $core.List<$core.int>? boxId,
  }) {
    final $result = create();
    if (xaddrs != null) {
      $result.xaddrs = xaddrs;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (password != null) {
      $result.password = password;
    }
    if (boxId != null) {
      $result.boxId = boxId;
    }
    return $result;
  }
  CheckCameraOnvif_Request._() : super();
  factory CheckCameraOnvif_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckCameraOnvif_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckCameraOnvif.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'xaddrs')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckCameraOnvif_Request clone() => CheckCameraOnvif_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckCameraOnvif_Request copyWith(void Function(CheckCameraOnvif_Request) updates) => super.copyWith((message) => updates(message as CheckCameraOnvif_Request)) as CheckCameraOnvif_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckCameraOnvif_Request create() => CheckCameraOnvif_Request._();
  CheckCameraOnvif_Request createEmptyInstance() => create();
  static $pb.PbList<CheckCameraOnvif_Request> createRepeated() => $pb.PbList<CheckCameraOnvif_Request>();
  @$core.pragma('dart2js:noInline')
  static CheckCameraOnvif_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckCameraOnvif_Request>(create);
  static CheckCameraOnvif_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get xaddrs => $_getSZ(0);
  @$pb.TagNumber(1)
  set xaddrs($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasXaddrs() => $_has(0);
  @$pb.TagNumber(1)
  void clearXaddrs() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get boxId => $_getN(3);
  @$pb.TagNumber(4)
  set boxId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoxId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoxId() => clearField(4);
}

class CheckCameraOnvif_Reply extends $pb.GeneratedMessage {
  factory CheckCameraOnvif_Reply({
    $core.String? rtspUrl,
    $core.String? serialNumber,
    $core.Iterable<$core.String>? subStreamUrl,
  }) {
    final $result = create();
    if (rtspUrl != null) {
      $result.rtspUrl = rtspUrl;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (subStreamUrl != null) {
      $result.subStreamUrl.addAll(subStreamUrl);
    }
    return $result;
  }
  CheckCameraOnvif_Reply._() : super();
  factory CheckCameraOnvif_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckCameraOnvif_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckCameraOnvif.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rtspUrl')
    ..aOS(2, _omitFieldNames ? '' : 'SerialNumber', protoName: 'SerialNumber')
    ..pPS(3, _omitFieldNames ? '' : 'subStreamUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckCameraOnvif_Reply clone() => CheckCameraOnvif_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckCameraOnvif_Reply copyWith(void Function(CheckCameraOnvif_Reply) updates) => super.copyWith((message) => updates(message as CheckCameraOnvif_Reply)) as CheckCameraOnvif_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckCameraOnvif_Reply create() => CheckCameraOnvif_Reply._();
  CheckCameraOnvif_Reply createEmptyInstance() => create();
  static $pb.PbList<CheckCameraOnvif_Reply> createRepeated() => $pb.PbList<CheckCameraOnvif_Reply>();
  @$core.pragma('dart2js:noInline')
  static CheckCameraOnvif_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckCameraOnvif_Reply>(create);
  static CheckCameraOnvif_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rtspUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set rtspUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRtspUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRtspUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serialNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set serialNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerialNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerialNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get subStreamUrl => $_getList(2);
}

class CheckCameraOnvif extends $pb.GeneratedMessage {
  factory CheckCameraOnvif({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  CheckCameraOnvif._() : super();
  factory CheckCameraOnvif.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckCameraOnvif.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckCameraOnvif', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(247, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckCameraOnvif clone() => CheckCameraOnvif()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckCameraOnvif copyWith(void Function(CheckCameraOnvif) updates) => super.copyWith((message) => updates(message as CheckCameraOnvif)) as CheckCameraOnvif;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckCameraOnvif create() => CheckCameraOnvif._();
  CheckCameraOnvif createEmptyInstance() => create();
  static $pb.PbList<CheckCameraOnvif> createRepeated() => $pb.PbList<CheckCameraOnvif>();
  @$core.pragma('dart2js:noInline')
  static CheckCameraOnvif getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckCameraOnvif>(create);
  static CheckCameraOnvif? _defaultInstance;

  @$pb.TagNumber(247)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(247)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(247)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(247)
  void clearID() => clearField(247);
}

class SetCameraLocation_Request extends $pb.GeneratedMessage {
  factory SetCameraLocation_Request({
    $1.MapLocation? location,
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (location != null) {
      $result.location = location;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  SetCameraLocation_Request._() : super();
  factory SetCameraLocation_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCameraLocation_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetCameraLocation.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.MapLocation>(1, _omitFieldNames ? '' : 'location', subBuilder: $1.MapLocation.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetCameraLocation_Request clone() => SetCameraLocation_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetCameraLocation_Request copyWith(void Function(SetCameraLocation_Request) updates) => super.copyWith((message) => updates(message as SetCameraLocation_Request)) as SetCameraLocation_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCameraLocation_Request create() => SetCameraLocation_Request._();
  SetCameraLocation_Request createEmptyInstance() => create();
  static $pb.PbList<SetCameraLocation_Request> createRepeated() => $pb.PbList<SetCameraLocation_Request>();
  @$core.pragma('dart2js:noInline')
  static SetCameraLocation_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCameraLocation_Request>(create);
  static SetCameraLocation_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $1.MapLocation get location => $_getN(0);
  @$pb.TagNumber(1)
  set location($1.MapLocation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);
  @$pb.TagNumber(1)
  $1.MapLocation ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);
}

class SetCameraLocation_Reply extends $pb.GeneratedMessage {
  factory SetCameraLocation_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  SetCameraLocation_Reply._() : super();
  factory SetCameraLocation_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCameraLocation_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetCameraLocation.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetCameraLocation_Reply clone() => SetCameraLocation_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetCameraLocation_Reply copyWith(void Function(SetCameraLocation_Reply) updates) => super.copyWith((message) => updates(message as SetCameraLocation_Reply)) as SetCameraLocation_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCameraLocation_Reply create() => SetCameraLocation_Reply._();
  SetCameraLocation_Reply createEmptyInstance() => create();
  static $pb.PbList<SetCameraLocation_Reply> createRepeated() => $pb.PbList<SetCameraLocation_Reply>();
  @$core.pragma('dart2js:noInline')
  static SetCameraLocation_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCameraLocation_Reply>(create);
  static SetCameraLocation_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

class SetCameraLocation extends $pb.GeneratedMessage {
  factory SetCameraLocation({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  SetCameraLocation._() : super();
  factory SetCameraLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCameraLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetCameraLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(248, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetCameraLocation clone() => SetCameraLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetCameraLocation copyWith(void Function(SetCameraLocation) updates) => super.copyWith((message) => updates(message as SetCameraLocation)) as SetCameraLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCameraLocation create() => SetCameraLocation._();
  SetCameraLocation createEmptyInstance() => create();
  static $pb.PbList<SetCameraLocation> createRepeated() => $pb.PbList<SetCameraLocation>();
  @$core.pragma('dart2js:noInline')
  static SetCameraLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCameraLocation>(create);
  static SetCameraLocation? _defaultInstance;

  @$pb.TagNumber(248)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(248)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(248)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(248)
  void clearID() => clearField(248);
}

class ReceiveUpdateCameraLocation extends $pb.GeneratedMessage {
  factory ReceiveUpdateCameraLocation({
    $1.Camera? camera,
    $core.int? rECEIVEUPDATECAMERALOCATION,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEUPDATECAMERALOCATION != null) {
      $result.rECEIVEUPDATECAMERALOCATION = rECEIVEUPDATECAMERALOCATION;
    }
    return $result;
  }
  ReceiveUpdateCameraLocation._() : super();
  factory ReceiveUpdateCameraLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateCameraLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateCameraLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(1002, _omitFieldNames ? '' : 'RECEIVEUPDATECAMERALOCATION', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_CAMERA_LOCATION')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateCameraLocation clone() => ReceiveUpdateCameraLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateCameraLocation copyWith(void Function(ReceiveUpdateCameraLocation) updates) => super.copyWith((message) => updates(message as ReceiveUpdateCameraLocation)) as ReceiveUpdateCameraLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateCameraLocation create() => ReceiveUpdateCameraLocation._();
  ReceiveUpdateCameraLocation createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateCameraLocation> createRepeated() => $pb.PbList<ReceiveUpdateCameraLocation>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateCameraLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateCameraLocation>(create);
  static ReceiveUpdateCameraLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(1002)
  $core.int get rECEIVEUPDATECAMERALOCATION => $_getIZ(1);
  @$pb.TagNumber(1002)
  set rECEIVEUPDATECAMERALOCATION($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1002)
  $core.bool hasRECEIVEUPDATECAMERALOCATION() => $_has(1);
  @$pb.TagNumber(1002)
  void clearRECEIVEUPDATECAMERALOCATION() => clearField(1002);
}

class IVASmokeDetection_Request extends $pb.GeneratedMessage {
  factory IVASmokeDetection_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? isEnable,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
    $core.bool? isPushNotification,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (isEnable != null) {
      $result.isEnable = isEnable;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    return $result;
  }
  IVASmokeDetection_Request._() : super();
  factory IVASmokeDetection_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVASmokeDetection_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVASmokeDetection.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isEnable', protoName: 'isEnable')
    ..aOB(3, _omitFieldNames ? '' : 'isSendEmail')
    ..aOB(4, _omitFieldNames ? '' : 'isRecord')
    ..aOB(5, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVASmokeDetection_Request clone() => IVASmokeDetection_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVASmokeDetection_Request copyWith(void Function(IVASmokeDetection_Request) updates) => super.copyWith((message) => updates(message as IVASmokeDetection_Request)) as IVASmokeDetection_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVASmokeDetection_Request create() => IVASmokeDetection_Request._();
  IVASmokeDetection_Request createEmptyInstance() => create();
  static $pb.PbList<IVASmokeDetection_Request> createRepeated() => $pb.PbList<IVASmokeDetection_Request>();
  @$core.pragma('dart2js:noInline')
  static IVASmokeDetection_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVASmokeDetection_Request>(create);
  static IVASmokeDetection_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isEnable => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnable() => clearField(2);

  /// 		Level level = 4; /// mức level
  @$pb.TagNumber(3)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(3)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSendEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isRecord => $_getBF(3);
  @$pb.TagNumber(4)
  set isRecord($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsRecord() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsRecord() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isPushNotification => $_getBF(4);
  @$pb.TagNumber(5)
  set isPushNotification($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsPushNotification() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPushNotification() => clearField(5);
}

class IVASmokeDetection_Reply extends $pb.GeneratedMessage {
  factory IVASmokeDetection_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  IVASmokeDetection_Reply._() : super();
  factory IVASmokeDetection_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVASmokeDetection_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVASmokeDetection.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVASmokeDetection_Reply clone() => IVASmokeDetection_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVASmokeDetection_Reply copyWith(void Function(IVASmokeDetection_Reply) updates) => super.copyWith((message) => updates(message as IVASmokeDetection_Reply)) as IVASmokeDetection_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVASmokeDetection_Reply create() => IVASmokeDetection_Reply._();
  IVASmokeDetection_Reply createEmptyInstance() => create();
  static $pb.PbList<IVASmokeDetection_Reply> createRepeated() => $pb.PbList<IVASmokeDetection_Reply>();
  @$core.pragma('dart2js:noInline')
  static IVASmokeDetection_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVASmokeDetection_Reply>(create);
  static IVASmokeDetection_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

class IVASmokeDetection extends $pb.GeneratedMessage {
  factory IVASmokeDetection({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  IVASmokeDetection._() : super();
  factory IVASmokeDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVASmokeDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVASmokeDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(250, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVASmokeDetection clone() => IVASmokeDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVASmokeDetection copyWith(void Function(IVASmokeDetection) updates) => super.copyWith((message) => updates(message as IVASmokeDetection)) as IVASmokeDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVASmokeDetection create() => IVASmokeDetection._();
  IVASmokeDetection createEmptyInstance() => create();
  static $pb.PbList<IVASmokeDetection> createRepeated() => $pb.PbList<IVASmokeDetection>();
  @$core.pragma('dart2js:noInline')
  static IVASmokeDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVASmokeDetection>(create);
  static IVASmokeDetection? _defaultInstance;

  @$pb.TagNumber(250)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(250)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(250)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(250)
  void clearID() => clearField(250);
}

class ReceiveIVASmokeDetection extends $pb.GeneratedMessage {
  factory ReceiveIVASmokeDetection({
    $1.Camera? camera,
    $core.int? rECEIVEIVASMOKEDETECTION,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEIVASMOKEDETECTION != null) {
      $result.rECEIVEIVASMOKEDETECTION = rECEIVEIVASMOKEDETECTION;
    }
    return $result;
  }
  ReceiveIVASmokeDetection._() : super();
  factory ReceiveIVASmokeDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveIVASmokeDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveIVASmokeDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(1003, _omitFieldNames ? '' : 'RECEIVEIVASMOKEDETECTION', $pb.PbFieldType.OU3, protoName: 'RECEIVE_IVA_SMOKE_DETECTION')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveIVASmokeDetection clone() => ReceiveIVASmokeDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveIVASmokeDetection copyWith(void Function(ReceiveIVASmokeDetection) updates) => super.copyWith((message) => updates(message as ReceiveIVASmokeDetection)) as ReceiveIVASmokeDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveIVASmokeDetection create() => ReceiveIVASmokeDetection._();
  ReceiveIVASmokeDetection createEmptyInstance() => create();
  static $pb.PbList<ReceiveIVASmokeDetection> createRepeated() => $pb.PbList<ReceiveIVASmokeDetection>();
  @$core.pragma('dart2js:noInline')
  static ReceiveIVASmokeDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveIVASmokeDetection>(create);
  static ReceiveIVASmokeDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(1003)
  $core.int get rECEIVEIVASMOKEDETECTION => $_getIZ(1);
  @$pb.TagNumber(1003)
  set rECEIVEIVASMOKEDETECTION($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1003)
  $core.bool hasRECEIVEIVASMOKEDETECTION() => $_has(1);
  @$pb.TagNumber(1003)
  void clearRECEIVEIVASMOKEDETECTION() => clearField(1003);
}

class IVAFaceDetection_Request extends $pb.GeneratedMessage {
  factory IVAFaceDetection_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? isEnable,
    $core.bool? isStrangerDetectNoti,
    $core.bool? isRelativeDetectNoti,
    $core.bool? isRecord,
    $core.Iterable<$1.Roi>? rois,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (isEnable != null) {
      $result.isEnable = isEnable;
    }
    if (isStrangerDetectNoti != null) {
      $result.isStrangerDetectNoti = isStrangerDetectNoti;
    }
    if (isRelativeDetectNoti != null) {
      $result.isRelativeDetectNoti = isRelativeDetectNoti;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    return $result;
  }
  IVAFaceDetection_Request._() : super();
  factory IVAFaceDetection_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAFaceDetection_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAFaceDetection.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isEnable', protoName: 'isEnable')
    ..aOB(3, _omitFieldNames ? '' : 'isStrangerDetectNoti', protoName: 'isStrangerDetectNoti')
    ..aOB(4, _omitFieldNames ? '' : 'isRelativeDetectNoti', protoName: 'isRelativeDetectNoti')
    ..aOB(5, _omitFieldNames ? '' : 'isRecord')
    ..pc<$1.Roi>(6, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: $1.Roi.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAFaceDetection_Request clone() => IVAFaceDetection_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAFaceDetection_Request copyWith(void Function(IVAFaceDetection_Request) updates) => super.copyWith((message) => updates(message as IVAFaceDetection_Request)) as IVAFaceDetection_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAFaceDetection_Request create() => IVAFaceDetection_Request._();
  IVAFaceDetection_Request createEmptyInstance() => create();
  static $pb.PbList<IVAFaceDetection_Request> createRepeated() => $pb.PbList<IVAFaceDetection_Request>();
  @$core.pragma('dart2js:noInline')
  static IVAFaceDetection_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAFaceDetection_Request>(create);
  static IVAFaceDetection_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isEnable => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnable() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isStrangerDetectNoti => $_getBF(2);
  @$pb.TagNumber(3)
  set isStrangerDetectNoti($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsStrangerDetectNoti() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsStrangerDetectNoti() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isRelativeDetectNoti => $_getBF(3);
  @$pb.TagNumber(4)
  set isRelativeDetectNoti($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsRelativeDetectNoti() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsRelativeDetectNoti() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecord => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecord($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecord() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecord() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$1.Roi> get rois => $_getList(5);
}

class IVAFaceDetection_Reply extends $pb.GeneratedMessage {
  factory IVAFaceDetection_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  IVAFaceDetection_Reply._() : super();
  factory IVAFaceDetection_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAFaceDetection_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAFaceDetection.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAFaceDetection_Reply clone() => IVAFaceDetection_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAFaceDetection_Reply copyWith(void Function(IVAFaceDetection_Reply) updates) => super.copyWith((message) => updates(message as IVAFaceDetection_Reply)) as IVAFaceDetection_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAFaceDetection_Reply create() => IVAFaceDetection_Reply._();
  IVAFaceDetection_Reply createEmptyInstance() => create();
  static $pb.PbList<IVAFaceDetection_Reply> createRepeated() => $pb.PbList<IVAFaceDetection_Reply>();
  @$core.pragma('dart2js:noInline')
  static IVAFaceDetection_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAFaceDetection_Reply>(create);
  static IVAFaceDetection_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

class IVAFaceDetection extends $pb.GeneratedMessage {
  factory IVAFaceDetection({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  IVAFaceDetection._() : super();
  factory IVAFaceDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAFaceDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAFaceDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(251, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAFaceDetection clone() => IVAFaceDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAFaceDetection copyWith(void Function(IVAFaceDetection) updates) => super.copyWith((message) => updates(message as IVAFaceDetection)) as IVAFaceDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAFaceDetection create() => IVAFaceDetection._();
  IVAFaceDetection createEmptyInstance() => create();
  static $pb.PbList<IVAFaceDetection> createRepeated() => $pb.PbList<IVAFaceDetection>();
  @$core.pragma('dart2js:noInline')
  static IVAFaceDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAFaceDetection>(create);
  static IVAFaceDetection? _defaultInstance;

  @$pb.TagNumber(251)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(251)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(251)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(251)
  void clearID() => clearField(251);
}

class ReceiveIVAFaceDetection extends $pb.GeneratedMessage {
  factory ReceiveIVAFaceDetection({
    $1.Camera? camera,
    $core.int? rECEIVEIVAFACEDETECTION,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEIVAFACEDETECTION != null) {
      $result.rECEIVEIVAFACEDETECTION = rECEIVEIVAFACEDETECTION;
    }
    return $result;
  }
  ReceiveIVAFaceDetection._() : super();
  factory ReceiveIVAFaceDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveIVAFaceDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveIVAFaceDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(1004, _omitFieldNames ? '' : 'RECEIVEIVAFACEDETECTION', $pb.PbFieldType.OU3, protoName: 'RECEIVE_IVA_FACE_DETECTION')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveIVAFaceDetection clone() => ReceiveIVAFaceDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveIVAFaceDetection copyWith(void Function(ReceiveIVAFaceDetection) updates) => super.copyWith((message) => updates(message as ReceiveIVAFaceDetection)) as ReceiveIVAFaceDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveIVAFaceDetection create() => ReceiveIVAFaceDetection._();
  ReceiveIVAFaceDetection createEmptyInstance() => create();
  static $pb.PbList<ReceiveIVAFaceDetection> createRepeated() => $pb.PbList<ReceiveIVAFaceDetection>();
  @$core.pragma('dart2js:noInline')
  static ReceiveIVAFaceDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveIVAFaceDetection>(create);
  static ReceiveIVAFaceDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(1004)
  $core.int get rECEIVEIVAFACEDETECTION => $_getIZ(1);
  @$pb.TagNumber(1004)
  set rECEIVEIVAFACEDETECTION($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1004)
  $core.bool hasRECEIVEIVAFACEDETECTION() => $_has(1);
  @$pb.TagNumber(1004)
  void clearRECEIVEIVAFACEDETECTION() => clearField(1004);
}

class GetEventByLogId_Request extends $pb.GeneratedMessage {
  factory GetEventByLogId_Request({
    $core.String? logId,
  }) {
    final $result = create();
    if (logId != null) {
      $result.logId = logId;
    }
    return $result;
  }
  GetEventByLogId_Request._() : super();
  factory GetEventByLogId_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventByLogId_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventByLogId.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'logId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventByLogId_Request clone() => GetEventByLogId_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventByLogId_Request copyWith(void Function(GetEventByLogId_Request) updates) => super.copyWith((message) => updates(message as GetEventByLogId_Request)) as GetEventByLogId_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventByLogId_Request create() => GetEventByLogId_Request._();
  GetEventByLogId_Request createEmptyInstance() => create();
  static $pb.PbList<GetEventByLogId_Request> createRepeated() => $pb.PbList<GetEventByLogId_Request>();
  @$core.pragma('dart2js:noInline')
  static GetEventByLogId_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventByLogId_Request>(create);
  static GetEventByLogId_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get logId => $_getSZ(0);
  @$pb.TagNumber(1)
  set logId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLogId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogId() => clearField(1);
}

class GetEventByLogId_Reply extends $pb.GeneratedMessage {
  factory GetEventByLogId_Reply({
    $1.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  GetEventByLogId_Reply._() : super();
  factory GetEventByLogId_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventByLogId_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventByLogId.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $1.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventByLogId_Reply clone() => GetEventByLogId_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventByLogId_Reply copyWith(void Function(GetEventByLogId_Reply) updates) => super.copyWith((message) => updates(message as GetEventByLogId_Reply)) as GetEventByLogId_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventByLogId_Reply create() => GetEventByLogId_Reply._();
  GetEventByLogId_Reply createEmptyInstance() => create();
  static $pb.PbList<GetEventByLogId_Reply> createRepeated() => $pb.PbList<GetEventByLogId_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetEventByLogId_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventByLogId_Reply>(create);
  static GetEventByLogId_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($1.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $1.Event ensureEvent() => $_ensure(0);
}

class GetEventByLogId extends $pb.GeneratedMessage {
  factory GetEventByLogId({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetEventByLogId._() : super();
  factory GetEventByLogId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventByLogId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventByLogId', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(252, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventByLogId clone() => GetEventByLogId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventByLogId copyWith(void Function(GetEventByLogId) updates) => super.copyWith((message) => updates(message as GetEventByLogId)) as GetEventByLogId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventByLogId create() => GetEventByLogId._();
  GetEventByLogId createEmptyInstance() => create();
  static $pb.PbList<GetEventByLogId> createRepeated() => $pb.PbList<GetEventByLogId>();
  @$core.pragma('dart2js:noInline')
  static GetEventByLogId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventByLogId>(create);
  static GetEventByLogId? _defaultInstance;

  @$pb.TagNumber(252)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(252)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(252)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(252)
  void clearID() => clearField(252);
}

class BoxGetCameras_Request extends $pb.GeneratedMessage {
  factory BoxGetCameras_Request({
    $core.List<$core.int>? boxId,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    return $result;
  }
  BoxGetCameras_Request._() : super();
  factory BoxGetCameras_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoxGetCameras_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoxGetCameras.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoxGetCameras_Request clone() => BoxGetCameras_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoxGetCameras_Request copyWith(void Function(BoxGetCameras_Request) updates) => super.copyWith((message) => updates(message as BoxGetCameras_Request)) as BoxGetCameras_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxGetCameras_Request create() => BoxGetCameras_Request._();
  BoxGetCameras_Request createEmptyInstance() => create();
  static $pb.PbList<BoxGetCameras_Request> createRepeated() => $pb.PbList<BoxGetCameras_Request>();
  @$core.pragma('dart2js:noInline')
  static BoxGetCameras_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoxGetCameras_Request>(create);
  static BoxGetCameras_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);
}

class BoxGetCameras_Reply extends $pb.GeneratedMessage {
  factory BoxGetCameras_Reply({
    $core.Iterable<$1.Camera>? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera.addAll(camera);
    }
    return $result;
  }
  BoxGetCameras_Reply._() : super();
  factory BoxGetCameras_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoxGetCameras_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoxGetCameras.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'camera', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoxGetCameras_Reply clone() => BoxGetCameras_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoxGetCameras_Reply copyWith(void Function(BoxGetCameras_Reply) updates) => super.copyWith((message) => updates(message as BoxGetCameras_Reply)) as BoxGetCameras_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxGetCameras_Reply create() => BoxGetCameras_Reply._();
  BoxGetCameras_Reply createEmptyInstance() => create();
  static $pb.PbList<BoxGetCameras_Reply> createRepeated() => $pb.PbList<BoxGetCameras_Reply>();
  @$core.pragma('dart2js:noInline')
  static BoxGetCameras_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoxGetCameras_Reply>(create);
  static BoxGetCameras_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get camera => $_getList(0);
}

class BoxGetCameras extends $pb.GeneratedMessage {
  factory BoxGetCameras({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  BoxGetCameras._() : super();
  factory BoxGetCameras.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoxGetCameras.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoxGetCameras', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(253, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoxGetCameras clone() => BoxGetCameras()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoxGetCameras copyWith(void Function(BoxGetCameras) updates) => super.copyWith((message) => updates(message as BoxGetCameras)) as BoxGetCameras;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxGetCameras create() => BoxGetCameras._();
  BoxGetCameras createEmptyInstance() => create();
  static $pb.PbList<BoxGetCameras> createRepeated() => $pb.PbList<BoxGetCameras>();
  @$core.pragma('dart2js:noInline')
  static BoxGetCameras getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoxGetCameras>(create);
  static BoxGetCameras? _defaultInstance;

  @$pb.TagNumber(253)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(253)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(253)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(253)
  void clearID() => clearField(253);
}

class UserAddBox_Request extends $pb.GeneratedMessage {
  factory UserAddBox_Request({
    $core.String? boxName,
    $core.String? boxSerialNumber,
  }) {
    final $result = create();
    if (boxName != null) {
      $result.boxName = boxName;
    }
    if (boxSerialNumber != null) {
      $result.boxSerialNumber = boxSerialNumber;
    }
    return $result;
  }
  UserAddBox_Request._() : super();
  factory UserAddBox_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddBox_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserAddBox.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boxName')
    ..aOS(2, _omitFieldNames ? '' : 'boxSerialNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAddBox_Request clone() => UserAddBox_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAddBox_Request copyWith(void Function(UserAddBox_Request) updates) => super.copyWith((message) => updates(message as UserAddBox_Request)) as UserAddBox_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAddBox_Request create() => UserAddBox_Request._();
  UserAddBox_Request createEmptyInstance() => create();
  static $pb.PbList<UserAddBox_Request> createRepeated() => $pb.PbList<UserAddBox_Request>();
  @$core.pragma('dart2js:noInline')
  static UserAddBox_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAddBox_Request>(create);
  static UserAddBox_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boxName => $_getSZ(0);
  @$pb.TagNumber(1)
  set boxName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxName() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boxSerialNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set boxSerialNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoxSerialNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoxSerialNumber() => clearField(2);
}

class UserAddBox_Reply extends $pb.GeneratedMessage {
  factory UserAddBox_Reply({
    $core.Iterable<$1.Vbox>? boxs,
  }) {
    final $result = create();
    if (boxs != null) {
      $result.boxs.addAll(boxs);
    }
    return $result;
  }
  UserAddBox_Reply._() : super();
  factory UserAddBox_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddBox_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserAddBox.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Vbox>(1, _omitFieldNames ? '' : 'boxs', $pb.PbFieldType.PM, subBuilder: $1.Vbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAddBox_Reply clone() => UserAddBox_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAddBox_Reply copyWith(void Function(UserAddBox_Reply) updates) => super.copyWith((message) => updates(message as UserAddBox_Reply)) as UserAddBox_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAddBox_Reply create() => UserAddBox_Reply._();
  UserAddBox_Reply createEmptyInstance() => create();
  static $pb.PbList<UserAddBox_Reply> createRepeated() => $pb.PbList<UserAddBox_Reply>();
  @$core.pragma('dart2js:noInline')
  static UserAddBox_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAddBox_Reply>(create);
  static UserAddBox_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Vbox> get boxs => $_getList(0);
}

class UserAddBox extends $pb.GeneratedMessage {
  factory UserAddBox({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UserAddBox._() : super();
  factory UserAddBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserAddBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(254, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAddBox clone() => UserAddBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAddBox copyWith(void Function(UserAddBox) updates) => super.copyWith((message) => updates(message as UserAddBox)) as UserAddBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAddBox create() => UserAddBox._();
  UserAddBox createEmptyInstance() => create();
  static $pb.PbList<UserAddBox> createRepeated() => $pb.PbList<UserAddBox>();
  @$core.pragma('dart2js:noInline')
  static UserAddBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAddBox>(create);
  static UserAddBox? _defaultInstance;

  @$pb.TagNumber(254)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(254)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(254)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(254)
  void clearID() => clearField(254);
}

class ReceiveUserAddBox extends $pb.GeneratedMessage {
  factory ReceiveUserAddBox({
    $core.Iterable<$1.Vbox>? boxs,
    $core.int? rECEIVEADDVBOX,
  }) {
    final $result = create();
    if (boxs != null) {
      $result.boxs.addAll(boxs);
    }
    if (rECEIVEADDVBOX != null) {
      $result.rECEIVEADDVBOX = rECEIVEADDVBOX;
    }
    return $result;
  }
  ReceiveUserAddBox._() : super();
  factory ReceiveUserAddBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUserAddBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUserAddBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Vbox>(1, _omitFieldNames ? '' : 'boxs', $pb.PbFieldType.PM, subBuilder: $1.Vbox.create)
    ..a<$core.int>(1100, _omitFieldNames ? '' : 'RECEIVEADDVBOX', $pb.PbFieldType.OU3, protoName: 'RECEIVE_ADD_VBOX')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUserAddBox clone() => ReceiveUserAddBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUserAddBox copyWith(void Function(ReceiveUserAddBox) updates) => super.copyWith((message) => updates(message as ReceiveUserAddBox)) as ReceiveUserAddBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUserAddBox create() => ReceiveUserAddBox._();
  ReceiveUserAddBox createEmptyInstance() => create();
  static $pb.PbList<ReceiveUserAddBox> createRepeated() => $pb.PbList<ReceiveUserAddBox>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUserAddBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUserAddBox>(create);
  static ReceiveUserAddBox? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Vbox> get boxs => $_getList(0);

  @$pb.TagNumber(1100)
  $core.int get rECEIVEADDVBOX => $_getIZ(1);
  @$pb.TagNumber(1100)
  set rECEIVEADDVBOX($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1100)
  $core.bool hasRECEIVEADDVBOX() => $_has(1);
  @$pb.TagNumber(1100)
  void clearRECEIVEADDVBOX() => clearField(1100);
}

class GetListBox_Request extends $pb.GeneratedMessage {
  factory GetListBox_Request({
    $core.String? boxName,
    $core.List<$core.int>? boxId,
  }) {
    final $result = create();
    if (boxName != null) {
      $result.boxName = boxName;
    }
    if (boxId != null) {
      $result.boxId = boxId;
    }
    return $result;
  }
  GetListBox_Request._() : super();
  factory GetListBox_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListBox_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListBox.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boxName')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListBox_Request clone() => GetListBox_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListBox_Request copyWith(void Function(GetListBox_Request) updates) => super.copyWith((message) => updates(message as GetListBox_Request)) as GetListBox_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListBox_Request create() => GetListBox_Request._();
  GetListBox_Request createEmptyInstance() => create();
  static $pb.PbList<GetListBox_Request> createRepeated() => $pb.PbList<GetListBox_Request>();
  @$core.pragma('dart2js:noInline')
  static GetListBox_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListBox_Request>(create);
  static GetListBox_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boxName => $_getSZ(0);
  @$pb.TagNumber(1)
  set boxName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxName() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get boxId => $_getN(1);
  @$pb.TagNumber(2)
  set boxId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoxId() => clearField(2);
}

class GetListBox_Reply extends $pb.GeneratedMessage {
  factory GetListBox_Reply({
    $core.Iterable<$1.Vbox>? boxs,
  }) {
    final $result = create();
    if (boxs != null) {
      $result.boxs.addAll(boxs);
    }
    return $result;
  }
  GetListBox_Reply._() : super();
  factory GetListBox_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListBox_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListBox.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Vbox>(1, _omitFieldNames ? '' : 'boxs', $pb.PbFieldType.PM, subBuilder: $1.Vbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListBox_Reply clone() => GetListBox_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListBox_Reply copyWith(void Function(GetListBox_Reply) updates) => super.copyWith((message) => updates(message as GetListBox_Reply)) as GetListBox_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListBox_Reply create() => GetListBox_Reply._();
  GetListBox_Reply createEmptyInstance() => create();
  static $pb.PbList<GetListBox_Reply> createRepeated() => $pb.PbList<GetListBox_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetListBox_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListBox_Reply>(create);
  static GetListBox_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Vbox> get boxs => $_getList(0);
}

class GetListBox extends $pb.GeneratedMessage {
  factory GetListBox({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetListBox._() : super();
  factory GetListBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(255, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListBox clone() => GetListBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListBox copyWith(void Function(GetListBox) updates) => super.copyWith((message) => updates(message as GetListBox)) as GetListBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListBox create() => GetListBox._();
  GetListBox createEmptyInstance() => create();
  static $pb.PbList<GetListBox> createRepeated() => $pb.PbList<GetListBox>();
  @$core.pragma('dart2js:noInline')
  static GetListBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListBox>(create);
  static GetListBox? _defaultInstance;

  @$pb.TagNumber(255)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(255)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(255)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(255)
  void clearID() => clearField(255);
}

class UserRemoveBox_Request extends $pb.GeneratedMessage {
  factory UserRemoveBox_Request({
    $core.List<$core.int>? boxId,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    return $result;
  }
  UserRemoveBox_Request._() : super();
  factory UserRemoveBox_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRemoveBox_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserRemoveBox.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRemoveBox_Request clone() => UserRemoveBox_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRemoveBox_Request copyWith(void Function(UserRemoveBox_Request) updates) => super.copyWith((message) => updates(message as UserRemoveBox_Request)) as UserRemoveBox_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRemoveBox_Request create() => UserRemoveBox_Request._();
  UserRemoveBox_Request createEmptyInstance() => create();
  static $pb.PbList<UserRemoveBox_Request> createRepeated() => $pb.PbList<UserRemoveBox_Request>();
  @$core.pragma('dart2js:noInline')
  static UserRemoveBox_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRemoveBox_Request>(create);
  static UserRemoveBox_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);
}

class UserRemoveBox_Reply extends $pb.GeneratedMessage {
  factory UserRemoveBox_Reply({
    $core.List<$core.int>? boxId,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    return $result;
  }
  UserRemoveBox_Reply._() : super();
  factory UserRemoveBox_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRemoveBox_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserRemoveBox.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRemoveBox_Reply clone() => UserRemoveBox_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRemoveBox_Reply copyWith(void Function(UserRemoveBox_Reply) updates) => super.copyWith((message) => updates(message as UserRemoveBox_Reply)) as UserRemoveBox_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRemoveBox_Reply create() => UserRemoveBox_Reply._();
  UserRemoveBox_Reply createEmptyInstance() => create();
  static $pb.PbList<UserRemoveBox_Reply> createRepeated() => $pb.PbList<UserRemoveBox_Reply>();
  @$core.pragma('dart2js:noInline')
  static UserRemoveBox_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRemoveBox_Reply>(create);
  static UserRemoveBox_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);
}

class UserRemoveBox extends $pb.GeneratedMessage {
  factory UserRemoveBox({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UserRemoveBox._() : super();
  factory UserRemoveBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRemoveBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserRemoveBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(256, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRemoveBox clone() => UserRemoveBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRemoveBox copyWith(void Function(UserRemoveBox) updates) => super.copyWith((message) => updates(message as UserRemoveBox)) as UserRemoveBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRemoveBox create() => UserRemoveBox._();
  UserRemoveBox createEmptyInstance() => create();
  static $pb.PbList<UserRemoveBox> createRepeated() => $pb.PbList<UserRemoveBox>();
  @$core.pragma('dart2js:noInline')
  static UserRemoveBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRemoveBox>(create);
  static UserRemoveBox? _defaultInstance;

  @$pb.TagNumber(256)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(256)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(256)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(256)
  void clearID() => clearField(256);
}

class ReceiveUserRemoveBox extends $pb.GeneratedMessage {
  factory ReceiveUserRemoveBox({
    $core.List<$core.int>? boxId,
    $core.int? rECEIVEREMOVEVBOX,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    if (rECEIVEREMOVEVBOX != null) {
      $result.rECEIVEREMOVEVBOX = rECEIVEREMOVEVBOX;
    }
    return $result;
  }
  ReceiveUserRemoveBox._() : super();
  factory ReceiveUserRemoveBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUserRemoveBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUserRemoveBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..a<$core.int>(1101, _omitFieldNames ? '' : 'RECEIVEREMOVEVBOX', $pb.PbFieldType.OU3, protoName: 'RECEIVE_REMOVE_VBOX')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUserRemoveBox clone() => ReceiveUserRemoveBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUserRemoveBox copyWith(void Function(ReceiveUserRemoveBox) updates) => super.copyWith((message) => updates(message as ReceiveUserRemoveBox)) as ReceiveUserRemoveBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUserRemoveBox create() => ReceiveUserRemoveBox._();
  ReceiveUserRemoveBox createEmptyInstance() => create();
  static $pb.PbList<ReceiveUserRemoveBox> createRepeated() => $pb.PbList<ReceiveUserRemoveBox>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUserRemoveBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUserRemoveBox>(create);
  static ReceiveUserRemoveBox? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);

  @$pb.TagNumber(1101)
  $core.int get rECEIVEREMOVEVBOX => $_getIZ(1);
  @$pb.TagNumber(1101)
  set rECEIVEREMOVEVBOX($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1101)
  $core.bool hasRECEIVEREMOVEVBOX() => $_has(1);
  @$pb.TagNumber(1101)
  void clearRECEIVEREMOVEVBOX() => clearField(1101);
}

class UserUpdateNameBox_Request extends $pb.GeneratedMessage {
  factory UserUpdateNameBox_Request({
    $core.List<$core.int>? boxId,
    $core.String? newNameBox,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    if (newNameBox != null) {
      $result.newNameBox = newNameBox;
    }
    return $result;
  }
  UserUpdateNameBox_Request._() : super();
  factory UserUpdateNameBox_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserUpdateNameBox_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserUpdateNameBox.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'newNameBox')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserUpdateNameBox_Request clone() => UserUpdateNameBox_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserUpdateNameBox_Request copyWith(void Function(UserUpdateNameBox_Request) updates) => super.copyWith((message) => updates(message as UserUpdateNameBox_Request)) as UserUpdateNameBox_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserUpdateNameBox_Request create() => UserUpdateNameBox_Request._();
  UserUpdateNameBox_Request createEmptyInstance() => create();
  static $pb.PbList<UserUpdateNameBox_Request> createRepeated() => $pb.PbList<UserUpdateNameBox_Request>();
  @$core.pragma('dart2js:noInline')
  static UserUpdateNameBox_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserUpdateNameBox_Request>(create);
  static UserUpdateNameBox_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newNameBox => $_getSZ(1);
  @$pb.TagNumber(2)
  set newNameBox($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewNameBox() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewNameBox() => clearField(2);
}

class UserUpdateNameBox_Reply extends $pb.GeneratedMessage {
  factory UserUpdateNameBox_Reply({
    $1.Vbox? box,
  }) {
    final $result = create();
    if (box != null) {
      $result.box = box;
    }
    return $result;
  }
  UserUpdateNameBox_Reply._() : super();
  factory UserUpdateNameBox_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserUpdateNameBox_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserUpdateNameBox.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Vbox>(1, _omitFieldNames ? '' : 'box', subBuilder: $1.Vbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserUpdateNameBox_Reply clone() => UserUpdateNameBox_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserUpdateNameBox_Reply copyWith(void Function(UserUpdateNameBox_Reply) updates) => super.copyWith((message) => updates(message as UserUpdateNameBox_Reply)) as UserUpdateNameBox_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserUpdateNameBox_Reply create() => UserUpdateNameBox_Reply._();
  UserUpdateNameBox_Reply createEmptyInstance() => create();
  static $pb.PbList<UserUpdateNameBox_Reply> createRepeated() => $pb.PbList<UserUpdateNameBox_Reply>();
  @$core.pragma('dart2js:noInline')
  static UserUpdateNameBox_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserUpdateNameBox_Reply>(create);
  static UserUpdateNameBox_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Vbox get box => $_getN(0);
  @$pb.TagNumber(1)
  set box($1.Vbox v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearBox() => clearField(1);
  @$pb.TagNumber(1)
  $1.Vbox ensureBox() => $_ensure(0);
}

class UserUpdateNameBox extends $pb.GeneratedMessage {
  factory UserUpdateNameBox({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UserUpdateNameBox._() : super();
  factory UserUpdateNameBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserUpdateNameBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserUpdateNameBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(257, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserUpdateNameBox clone() => UserUpdateNameBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserUpdateNameBox copyWith(void Function(UserUpdateNameBox) updates) => super.copyWith((message) => updates(message as UserUpdateNameBox)) as UserUpdateNameBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserUpdateNameBox create() => UserUpdateNameBox._();
  UserUpdateNameBox createEmptyInstance() => create();
  static $pb.PbList<UserUpdateNameBox> createRepeated() => $pb.PbList<UserUpdateNameBox>();
  @$core.pragma('dart2js:noInline')
  static UserUpdateNameBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserUpdateNameBox>(create);
  static UserUpdateNameBox? _defaultInstance;

  @$pb.TagNumber(257)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(257)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(257)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(257)
  void clearID() => clearField(257);
}

class ReceiveUserUpdateNameBox extends $pb.GeneratedMessage {
  factory ReceiveUserUpdateNameBox({
    $1.Vbox? box,
    $core.int? rECEIVEUPDATENAMEVBOX,
  }) {
    final $result = create();
    if (box != null) {
      $result.box = box;
    }
    if (rECEIVEUPDATENAMEVBOX != null) {
      $result.rECEIVEUPDATENAMEVBOX = rECEIVEUPDATENAMEVBOX;
    }
    return $result;
  }
  ReceiveUserUpdateNameBox._() : super();
  factory ReceiveUserUpdateNameBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUserUpdateNameBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUserUpdateNameBox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Vbox>(1, _omitFieldNames ? '' : 'box', subBuilder: $1.Vbox.create)
    ..a<$core.int>(1102, _omitFieldNames ? '' : 'RECEIVEUPDATENAMEVBOX', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_NAME_VBOX')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUserUpdateNameBox clone() => ReceiveUserUpdateNameBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUserUpdateNameBox copyWith(void Function(ReceiveUserUpdateNameBox) updates) => super.copyWith((message) => updates(message as ReceiveUserUpdateNameBox)) as ReceiveUserUpdateNameBox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUserUpdateNameBox create() => ReceiveUserUpdateNameBox._();
  ReceiveUserUpdateNameBox createEmptyInstance() => create();
  static $pb.PbList<ReceiveUserUpdateNameBox> createRepeated() => $pb.PbList<ReceiveUserUpdateNameBox>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUserUpdateNameBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUserUpdateNameBox>(create);
  static ReceiveUserUpdateNameBox? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Vbox get box => $_getN(0);
  @$pb.TagNumber(1)
  set box($1.Vbox v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearBox() => clearField(1);
  @$pb.TagNumber(1)
  $1.Vbox ensureBox() => $_ensure(0);

  @$pb.TagNumber(1102)
  $core.int get rECEIVEUPDATENAMEVBOX => $_getIZ(1);
  @$pb.TagNumber(1102)
  set rECEIVEUPDATENAMEVBOX($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1102)
  $core.bool hasRECEIVEUPDATENAMEVBOX() => $_has(1);
  @$pb.TagNumber(1102)
  void clearRECEIVEUPDATENAMEVBOX() => clearField(1102);
}

class ReceiveBoxOffline extends $pb.GeneratedMessage {
  factory ReceiveBoxOffline({
    $1.Vbox? box,
    $core.int? rECEIVEBOXOFFLINE,
  }) {
    final $result = create();
    if (box != null) {
      $result.box = box;
    }
    if (rECEIVEBOXOFFLINE != null) {
      $result.rECEIVEBOXOFFLINE = rECEIVEBOXOFFLINE;
    }
    return $result;
  }
  ReceiveBoxOffline._() : super();
  factory ReceiveBoxOffline.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveBoxOffline.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveBoxOffline', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Vbox>(1, _omitFieldNames ? '' : 'box', subBuilder: $1.Vbox.create)
    ..a<$core.int>(1103, _omitFieldNames ? '' : 'RECEIVEBOXOFFLINE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_BOX_OFFLINE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveBoxOffline clone() => ReceiveBoxOffline()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveBoxOffline copyWith(void Function(ReceiveBoxOffline) updates) => super.copyWith((message) => updates(message as ReceiveBoxOffline)) as ReceiveBoxOffline;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveBoxOffline create() => ReceiveBoxOffline._();
  ReceiveBoxOffline createEmptyInstance() => create();
  static $pb.PbList<ReceiveBoxOffline> createRepeated() => $pb.PbList<ReceiveBoxOffline>();
  @$core.pragma('dart2js:noInline')
  static ReceiveBoxOffline getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveBoxOffline>(create);
  static ReceiveBoxOffline? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Vbox get box => $_getN(0);
  @$pb.TagNumber(1)
  set box($1.Vbox v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearBox() => clearField(1);
  @$pb.TagNumber(1)
  $1.Vbox ensureBox() => $_ensure(0);

  @$pb.TagNumber(1103)
  $core.int get rECEIVEBOXOFFLINE => $_getIZ(1);
  @$pb.TagNumber(1103)
  set rECEIVEBOXOFFLINE($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1103)
  $core.bool hasRECEIVEBOXOFFLINE() => $_has(1);
  @$pb.TagNumber(1103)
  void clearRECEIVEBOXOFFLINE() => clearField(1103);
}

class ReceiveBoxOnline extends $pb.GeneratedMessage {
  factory ReceiveBoxOnline({
    $1.Vbox? box,
    $core.int? rECEIVEBOXONLINE,
  }) {
    final $result = create();
    if (box != null) {
      $result.box = box;
    }
    if (rECEIVEBOXONLINE != null) {
      $result.rECEIVEBOXONLINE = rECEIVEBOXONLINE;
    }
    return $result;
  }
  ReceiveBoxOnline._() : super();
  factory ReceiveBoxOnline.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveBoxOnline.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveBoxOnline', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Vbox>(1, _omitFieldNames ? '' : 'box', subBuilder: $1.Vbox.create)
    ..a<$core.int>(1104, _omitFieldNames ? '' : 'RECEIVEBOXONLINE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_BOX_ONLINE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveBoxOnline clone() => ReceiveBoxOnline()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveBoxOnline copyWith(void Function(ReceiveBoxOnline) updates) => super.copyWith((message) => updates(message as ReceiveBoxOnline)) as ReceiveBoxOnline;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveBoxOnline create() => ReceiveBoxOnline._();
  ReceiveBoxOnline createEmptyInstance() => create();
  static $pb.PbList<ReceiveBoxOnline> createRepeated() => $pb.PbList<ReceiveBoxOnline>();
  @$core.pragma('dart2js:noInline')
  static ReceiveBoxOnline getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveBoxOnline>(create);
  static ReceiveBoxOnline? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Vbox get box => $_getN(0);
  @$pb.TagNumber(1)
  set box($1.Vbox v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearBox() => clearField(1);
  @$pb.TagNumber(1)
  $1.Vbox ensureBox() => $_ensure(0);

  @$pb.TagNumber(1104)
  $core.int get rECEIVEBOXONLINE => $_getIZ(1);
  @$pb.TagNumber(1104)
  set rECEIVEBOXONLINE($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1104)
  $core.bool hasRECEIVEBOXONLINE() => $_has(1);
  @$pb.TagNumber(1104)
  void clearRECEIVEBOXONLINE() => clearField(1104);
}

class AddUser_Request extends $pb.GeneratedMessage {
  factory AddUser_Request({
    $core.String? account,
    $core.String? email,
    $core.String? tel,
    $core.String? address,
    $core.String? userName,
    $core.bool? isAdmin,
    $core.String? desc,
    $core.String? password,
    $core.bool? changePassDenied,
    $core.bool? addCamDenied,
    $1.UserStatus? status,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (email != null) {
      $result.email = email;
    }
    if (tel != null) {
      $result.tel = tel;
    }
    if (address != null) {
      $result.address = address;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (desc != null) {
      $result.desc = desc;
    }
    if (password != null) {
      $result.password = password;
    }
    if (changePassDenied != null) {
      $result.changePassDenied = changePassDenied;
    }
    if (addCamDenied != null) {
      $result.addCamDenied = addCamDenied;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  AddUser_Request._() : super();
  factory AddUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUser.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'tel')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'userName')
    ..aOB(6, _omitFieldNames ? '' : 'isAdmin', protoName: 'isAdmin')
    ..aOS(7, _omitFieldNames ? '' : 'desc')
    ..aOS(8, _omitFieldNames ? '' : 'password')
    ..aOB(9, _omitFieldNames ? '' : 'changePassDenied', protoName: 'changePassDenied')
    ..aOB(10, _omitFieldNames ? '' : 'addCamDenied', protoName: 'addCamDenied')
    ..e<$1.UserStatus>(11, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $1.UserStatus.ACTIVE, valueOf: $1.UserStatus.valueOf, enumValues: $1.UserStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUser_Request clone() => AddUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUser_Request copyWith(void Function(AddUser_Request) updates) => super.copyWith((message) => updates(message as AddUser_Request)) as AddUser_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUser_Request create() => AddUser_Request._();
  AddUser_Request createEmptyInstance() => create();
  static $pb.PbList<AddUser_Request> createRepeated() => $pb.PbList<AddUser_Request>();
  @$core.pragma('dart2js:noInline')
  static AddUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUser_Request>(create);
  static AddUser_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tel => $_getSZ(2);
  @$pb.TagNumber(3)
  set tel($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTel() => $_has(2);
  @$pb.TagNumber(3)
  void clearTel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userName => $_getSZ(4);
  @$pb.TagNumber(5)
  set userName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserName() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isAdmin => $_getBF(5);
  @$pb.TagNumber(6)
  set isAdmin($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsAdmin() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsAdmin() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(7)
  set desc($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDesc() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get password => $_getSZ(7);
  @$pb.TagNumber(8)
  set password($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearPassword() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get changePassDenied => $_getBF(8);
  @$pb.TagNumber(9)
  set changePassDenied($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasChangePassDenied() => $_has(8);
  @$pb.TagNumber(9)
  void clearChangePassDenied() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get addCamDenied => $_getBF(9);
  @$pb.TagNumber(10)
  set addCamDenied($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddCamDenied() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddCamDenied() => clearField(10);

  @$pb.TagNumber(11)
  $1.UserStatus get status => $_getN(10);
  @$pb.TagNumber(11)
  set status($1.UserStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);
}

class AddUser_Reply extends $pb.GeneratedMessage {
  factory AddUser_Reply({
    $1.User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  AddUser_Reply._() : super();
  factory AddUser_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUser_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUser.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $1.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUser_Reply clone() => AddUser_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUser_Reply copyWith(void Function(AddUser_Reply) updates) => super.copyWith((message) => updates(message as AddUser_Reply)) as AddUser_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUser_Reply create() => AddUser_Reply._();
  AddUser_Reply createEmptyInstance() => create();
  static $pb.PbList<AddUser_Reply> createRepeated() => $pb.PbList<AddUser_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddUser_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUser_Reply>(create);
  static AddUser_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);
}

class AddUser extends $pb.GeneratedMessage {
  factory AddUser({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddUser._() : super();
  factory AddUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(258, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUser clone() => AddUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUser copyWith(void Function(AddUser) updates) => super.copyWith((message) => updates(message as AddUser)) as AddUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUser create() => AddUser._();
  AddUser createEmptyInstance() => create();
  static $pb.PbList<AddUser> createRepeated() => $pb.PbList<AddUser>();
  @$core.pragma('dart2js:noInline')
  static AddUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUser>(create);
  static AddUser? _defaultInstance;

  @$pb.TagNumber(258)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(258)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(258)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(258)
  void clearID() => clearField(258);
}

class EditUser_Request extends $pb.GeneratedMessage {
  factory EditUser_Request({
    $core.List<$core.int>? userId,
    $core.String? account,
    $core.String? email,
    $core.String? tel,
    $core.String? address,
    $core.String? userName,
    $core.bool? isAdmin,
    $core.String? desc,
    $core.String? password,
    $core.String? uidStr,
    $core.bool? changePassDenied,
    $core.bool? addCamDenied,
    $1.UserStatus? status,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (account != null) {
      $result.account = account;
    }
    if (email != null) {
      $result.email = email;
    }
    if (tel != null) {
      $result.tel = tel;
    }
    if (address != null) {
      $result.address = address;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (desc != null) {
      $result.desc = desc;
    }
    if (password != null) {
      $result.password = password;
    }
    if (uidStr != null) {
      $result.uidStr = uidStr;
    }
    if (changePassDenied != null) {
      $result.changePassDenied = changePassDenied;
    }
    if (addCamDenied != null) {
      $result.addCamDenied = addCamDenied;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  EditUser_Request._() : super();
  factory EditUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditUser.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'account')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'tel')
    ..aOS(5, _omitFieldNames ? '' : 'address')
    ..aOS(6, _omitFieldNames ? '' : 'userName')
    ..aOB(7, _omitFieldNames ? '' : 'isAdmin', protoName: 'isAdmin')
    ..aOS(8, _omitFieldNames ? '' : 'desc')
    ..aOS(9, _omitFieldNames ? '' : 'password')
    ..aOS(10, _omitFieldNames ? '' : 'uidStr')
    ..aOB(11, _omitFieldNames ? '' : 'changePassDenied', protoName: 'changePassDenied')
    ..aOB(12, _omitFieldNames ? '' : 'addCamDenied', protoName: 'addCamDenied')
    ..e<$1.UserStatus>(13, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $1.UserStatus.ACTIVE, valueOf: $1.UserStatus.valueOf, enumValues: $1.UserStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditUser_Request clone() => EditUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditUser_Request copyWith(void Function(EditUser_Request) updates) => super.copyWith((message) => updates(message as EditUser_Request)) as EditUser_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditUser_Request create() => EditUser_Request._();
  EditUser_Request createEmptyInstance() => create();
  static $pb.PbList<EditUser_Request> createRepeated() => $pb.PbList<EditUser_Request>();
  @$core.pragma('dart2js:noInline')
  static EditUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditUser_Request>(create);
  static EditUser_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get account => $_getSZ(1);
  @$pb.TagNumber(2)
  set account($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tel => $_getSZ(3);
  @$pb.TagNumber(4)
  set tel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTel() => $_has(3);
  @$pb.TagNumber(4)
  void clearTel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get address => $_getSZ(4);
  @$pb.TagNumber(5)
  set address($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddress() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userName => $_getSZ(5);
  @$pb.TagNumber(6)
  set userName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserName() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserName() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isAdmin => $_getBF(6);
  @$pb.TagNumber(7)
  set isAdmin($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsAdmin() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsAdmin() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get password => $_getSZ(8);
  @$pb.TagNumber(9)
  set password($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPassword() => $_has(8);
  @$pb.TagNumber(9)
  void clearPassword() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uidStr => $_getSZ(9);
  @$pb.TagNumber(10)
  set uidStr($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUidStr() => $_has(9);
  @$pb.TagNumber(10)
  void clearUidStr() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get changePassDenied => $_getBF(10);
  @$pb.TagNumber(11)
  set changePassDenied($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasChangePassDenied() => $_has(10);
  @$pb.TagNumber(11)
  void clearChangePassDenied() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get addCamDenied => $_getBF(11);
  @$pb.TagNumber(12)
  set addCamDenied($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAddCamDenied() => $_has(11);
  @$pb.TagNumber(12)
  void clearAddCamDenied() => clearField(12);

  @$pb.TagNumber(13)
  $1.UserStatus get status => $_getN(12);
  @$pb.TagNumber(13)
  set status($1.UserStatus v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearStatus() => clearField(13);
}

class EditUser_Reply extends $pb.GeneratedMessage {
  factory EditUser_Reply({
    $1.User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  EditUser_Reply._() : super();
  factory EditUser_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditUser_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditUser.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $1.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditUser_Reply clone() => EditUser_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditUser_Reply copyWith(void Function(EditUser_Reply) updates) => super.copyWith((message) => updates(message as EditUser_Reply)) as EditUser_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditUser_Reply create() => EditUser_Reply._();
  EditUser_Reply createEmptyInstance() => create();
  static $pb.PbList<EditUser_Reply> createRepeated() => $pb.PbList<EditUser_Reply>();
  @$core.pragma('dart2js:noInline')
  static EditUser_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditUser_Reply>(create);
  static EditUser_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);
}

class EditUser extends $pb.GeneratedMessage {
  factory EditUser({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  EditUser._() : super();
  factory EditUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(259, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditUser clone() => EditUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditUser copyWith(void Function(EditUser) updates) => super.copyWith((message) => updates(message as EditUser)) as EditUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditUser create() => EditUser._();
  EditUser createEmptyInstance() => create();
  static $pb.PbList<EditUser> createRepeated() => $pb.PbList<EditUser>();
  @$core.pragma('dart2js:noInline')
  static EditUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditUser>(create);
  static EditUser? _defaultInstance;

  @$pb.TagNumber(259)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(259)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(259)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(259)
  void clearID() => clearField(259);
}

class DeleteUser_Request extends $pb.GeneratedMessage {
  factory DeleteUser_Request({
    $core.List<$core.int>? userId,
    $core.String? uidStr,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (uidStr != null) {
      $result.uidStr = uidStr;
    }
    return $result;
  }
  DeleteUser_Request._() : super();
  factory DeleteUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteUser.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'uidStr')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUser_Request clone() => DeleteUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUser_Request copyWith(void Function(DeleteUser_Request) updates) => super.copyWith((message) => updates(message as DeleteUser_Request)) as DeleteUser_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUser_Request create() => DeleteUser_Request._();
  DeleteUser_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteUser_Request> createRepeated() => $pb.PbList<DeleteUser_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUser_Request>(create);
  static DeleteUser_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uidStr => $_getSZ(1);
  @$pb.TagNumber(2)
  set uidStr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUidStr() => $_has(1);
  @$pb.TagNumber(2)
  void clearUidStr() => clearField(2);
}

class DeleteUser_Reply extends $pb.GeneratedMessage {
  factory DeleteUser_Reply({
    $core.List<$core.int>? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  DeleteUser_Reply._() : super();
  factory DeleteUser_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUser_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteUser.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUser_Reply clone() => DeleteUser_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUser_Reply copyWith(void Function(DeleteUser_Reply) updates) => super.copyWith((message) => updates(message as DeleteUser_Reply)) as DeleteUser_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUser_Reply create() => DeleteUser_Reply._();
  DeleteUser_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteUser_Reply> createRepeated() => $pb.PbList<DeleteUser_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteUser_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUser_Reply>(create);
  static DeleteUser_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class DeleteUser extends $pb.GeneratedMessage {
  factory DeleteUser({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteUser._() : super();
  factory DeleteUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(260, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUser clone() => DeleteUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUser copyWith(void Function(DeleteUser) updates) => super.copyWith((message) => updates(message as DeleteUser)) as DeleteUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUser create() => DeleteUser._();
  DeleteUser createEmptyInstance() => create();
  static $pb.PbList<DeleteUser> createRepeated() => $pb.PbList<DeleteUser>();
  @$core.pragma('dart2js:noInline')
  static DeleteUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUser>(create);
  static DeleteUser? _defaultInstance;

  @$pb.TagNumber(260)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(260)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(260)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(260)
  void clearID() => clearField(260);
}

class ListUser_Request extends $pb.GeneratedMessage {
  factory ListUser_Request() => create();
  ListUser_Request._() : super();
  factory ListUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUser.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUser_Request clone() => ListUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUser_Request copyWith(void Function(ListUser_Request) updates) => super.copyWith((message) => updates(message as ListUser_Request)) as ListUser_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUser_Request create() => ListUser_Request._();
  ListUser_Request createEmptyInstance() => create();
  static $pb.PbList<ListUser_Request> createRepeated() => $pb.PbList<ListUser_Request>();
  @$core.pragma('dart2js:noInline')
  static ListUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUser_Request>(create);
  static ListUser_Request? _defaultInstance;
}

class ListUser_Reply extends $pb.GeneratedMessage {
  factory ListUser_Reply({
    $core.Iterable<$1.User>? users,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    return $result;
  }
  ListUser_Reply._() : super();
  factory ListUser_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUser_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUser.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.User>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: $1.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUser_Reply clone() => ListUser_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUser_Reply copyWith(void Function(ListUser_Reply) updates) => super.copyWith((message) => updates(message as ListUser_Reply)) as ListUser_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUser_Reply create() => ListUser_Reply._();
  ListUser_Reply createEmptyInstance() => create();
  static $pb.PbList<ListUser_Reply> createRepeated() => $pb.PbList<ListUser_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListUser_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUser_Reply>(create);
  static ListUser_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.User> get users => $_getList(0);
}

class ListUser extends $pb.GeneratedMessage {
  factory ListUser({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListUser._() : super();
  factory ListUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(261, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUser clone() => ListUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUser copyWith(void Function(ListUser) updates) => super.copyWith((message) => updates(message as ListUser)) as ListUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUser create() => ListUser._();
  ListUser createEmptyInstance() => create();
  static $pb.PbList<ListUser> createRepeated() => $pb.PbList<ListUser>();
  @$core.pragma('dart2js:noInline')
  static ListUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUser>(create);
  static ListUser? _defaultInstance;

  @$pb.TagNumber(261)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(261)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(261)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(261)
  void clearID() => clearField(261);
}

class AddCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory AddCameraHomeVision_Request({
    $core.String? cameraUid,
    $core.String? cameraUserName,
    $core.String? cameraPassword,
    $core.String? cameraName,
    $1.MapLocation? location,
    $core.List<$core.int>? groupId,
    $core.String? macAddress,
  }) {
    final $result = create();
    if (cameraUid != null) {
      $result.cameraUid = cameraUid;
    }
    if (cameraUserName != null) {
      $result.cameraUserName = cameraUserName;
    }
    if (cameraPassword != null) {
      $result.cameraPassword = cameraPassword;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (location != null) {
      $result.location = location;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (macAddress != null) {
      $result.macAddress = macAddress;
    }
    return $result;
  }
  AddCameraHomeVision_Request._() : super();
  factory AddCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cameraUid')
    ..aOS(2, _omitFieldNames ? '' : 'cameraUserName')
    ..aOS(3, _omitFieldNames ? '' : 'cameraPassword')
    ..aOS(4, _omitFieldNames ? '' : 'cameraName')
    ..aOM<$1.MapLocation>(5, _omitFieldNames ? '' : 'location', subBuilder: $1.MapLocation.create)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..aOS(7, _omitFieldNames ? '' : 'macAddress')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraHomeVision_Request clone() => AddCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraHomeVision_Request copyWith(void Function(AddCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as AddCameraHomeVision_Request)) as AddCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraHomeVision_Request create() => AddCameraHomeVision_Request._();
  AddCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<AddCameraHomeVision_Request> createRepeated() => $pb.PbList<AddCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraHomeVision_Request>(create);
  static AddCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cameraUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set cameraUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cameraUserName => $_getSZ(1);
  @$pb.TagNumber(2)
  set cameraUserName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cameraPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set cameraPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cameraName => $_getSZ(3);
  @$pb.TagNumber(4)
  set cameraName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCameraName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCameraName() => clearField(4);

  @$pb.TagNumber(5)
  $1.MapLocation get location => $_getN(4);
  @$pb.TagNumber(5)
  set location($1.MapLocation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);
  @$pb.TagNumber(5)
  $1.MapLocation ensureLocation() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get groupId => $_getN(5);
  @$pb.TagNumber(6)
  set groupId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGroupId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get macAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set macAddress($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMacAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearMacAddress() => clearField(7);
}

class AddCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory AddCameraHomeVision_Reply({
    $core.List<$core.int>? cameraId,
    $1.Camera? camera,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  AddCameraHomeVision_Reply._() : super();
  factory AddCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraHomeVision_Reply clone() => AddCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraHomeVision_Reply copyWith(void Function(AddCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as AddCameraHomeVision_Reply)) as AddCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraHomeVision_Reply create() => AddCameraHomeVision_Reply._();
  AddCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCameraHomeVision_Reply> createRepeated() => $pb.PbList<AddCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraHomeVision_Reply>(create);
  static AddCameraHomeVision_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Camera get camera => $_getN(1);
  @$pb.TagNumber(2)
  set camera($1.Camera v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCamera() => $_has(1);
  @$pb.TagNumber(2)
  void clearCamera() => clearField(2);
  @$pb.TagNumber(2)
  $1.Camera ensureCamera() => $_ensure(1);
}

class AddCameraHomeVision extends $pb.GeneratedMessage {
  factory AddCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCameraHomeVision._() : super();
  factory AddCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(263, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraHomeVision clone() => AddCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraHomeVision copyWith(void Function(AddCameraHomeVision) updates) => super.copyWith((message) => updates(message as AddCameraHomeVision)) as AddCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraHomeVision create() => AddCameraHomeVision._();
  AddCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<AddCameraHomeVision> createRepeated() => $pb.PbList<AddCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static AddCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraHomeVision>(create);
  static AddCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(263)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(263)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(263)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(263)
  void clearID() => clearField(263);
}

class PTZCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory PTZCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
    $1.PtzAction? action,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  PTZCameraHomeVision_Request._() : super();
  factory PTZCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PTZCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PTZCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<$1.PtzAction>(2, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: $1.PtzAction.PTZ_STOP, valueOf: $1.PtzAction.valueOf, enumValues: $1.PtzAction.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PTZCameraHomeVision_Request clone() => PTZCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PTZCameraHomeVision_Request copyWith(void Function(PTZCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as PTZCameraHomeVision_Request)) as PTZCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PTZCameraHomeVision_Request create() => PTZCameraHomeVision_Request._();
  PTZCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<PTZCameraHomeVision_Request> createRepeated() => $pb.PbList<PTZCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static PTZCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PTZCameraHomeVision_Request>(create);
  static PTZCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $1.PtzAction get action => $_getN(1);
  @$pb.TagNumber(2)
  set action($1.PtzAction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => clearField(2);
}

class PTZCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory PTZCameraHomeVision_Reply() => create();
  PTZCameraHomeVision_Reply._() : super();
  factory PTZCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PTZCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PTZCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PTZCameraHomeVision_Reply clone() => PTZCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PTZCameraHomeVision_Reply copyWith(void Function(PTZCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as PTZCameraHomeVision_Reply)) as PTZCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PTZCameraHomeVision_Reply create() => PTZCameraHomeVision_Reply._();
  PTZCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<PTZCameraHomeVision_Reply> createRepeated() => $pb.PbList<PTZCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static PTZCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PTZCameraHomeVision_Reply>(create);
  static PTZCameraHomeVision_Reply? _defaultInstance;
}

class PTZCameraHomeVision extends $pb.GeneratedMessage {
  factory PTZCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  PTZCameraHomeVision._() : super();
  factory PTZCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PTZCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PTZCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(264, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PTZCameraHomeVision clone() => PTZCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PTZCameraHomeVision copyWith(void Function(PTZCameraHomeVision) updates) => super.copyWith((message) => updates(message as PTZCameraHomeVision)) as PTZCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PTZCameraHomeVision create() => PTZCameraHomeVision._();
  PTZCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<PTZCameraHomeVision> createRepeated() => $pb.PbList<PTZCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static PTZCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PTZCameraHomeVision>(create);
  static PTZCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(264)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(264)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(264)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(264)
  void clearID() => clearField(264);
}

class ResetCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory ResetCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ResetCameraHomeVision_Request._() : super();
  factory ResetCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetCameraHomeVision_Request clone() => ResetCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetCameraHomeVision_Request copyWith(void Function(ResetCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as ResetCameraHomeVision_Request)) as ResetCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetCameraHomeVision_Request create() => ResetCameraHomeVision_Request._();
  ResetCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<ResetCameraHomeVision_Request> createRepeated() => $pb.PbList<ResetCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static ResetCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetCameraHomeVision_Request>(create);
  static ResetCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ResetCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory ResetCameraHomeVision_Reply() => create();
  ResetCameraHomeVision_Reply._() : super();
  factory ResetCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetCameraHomeVision_Reply clone() => ResetCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetCameraHomeVision_Reply copyWith(void Function(ResetCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as ResetCameraHomeVision_Reply)) as ResetCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetCameraHomeVision_Reply create() => ResetCameraHomeVision_Reply._();
  ResetCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<ResetCameraHomeVision_Reply> createRepeated() => $pb.PbList<ResetCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static ResetCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetCameraHomeVision_Reply>(create);
  static ResetCameraHomeVision_Reply? _defaultInstance;
}

class ResetCameraHomeVision extends $pb.GeneratedMessage {
  factory ResetCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ResetCameraHomeVision._() : super();
  factory ResetCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(265, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetCameraHomeVision clone() => ResetCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetCameraHomeVision copyWith(void Function(ResetCameraHomeVision) updates) => super.copyWith((message) => updates(message as ResetCameraHomeVision)) as ResetCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetCameraHomeVision create() => ResetCameraHomeVision._();
  ResetCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<ResetCameraHomeVision> createRepeated() => $pb.PbList<ResetCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static ResetCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetCameraHomeVision>(create);
  static ResetCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(265)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(265)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(265)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(265)
  void clearID() => clearField(265);
}

class ReceivePairCamera extends $pb.GeneratedMessage {
  factory ReceivePairCamera({
    $core.String? userId,
    $core.String? cameraId,
    $core.String? cameraType,
    ReceivePairCamera_pairStatus? status,
    $core.int? rECEIVEPAIRCAMERA,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (cameraType != null) {
      $result.cameraType = cameraType;
    }
    if (status != null) {
      $result.status = status;
    }
    if (rECEIVEPAIRCAMERA != null) {
      $result.rECEIVEPAIRCAMERA = rECEIVEPAIRCAMERA;
    }
    return $result;
  }
  ReceivePairCamera._() : super();
  factory ReceivePairCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceivePairCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceivePairCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'cameraId')
    ..aOS(3, _omitFieldNames ? '' : 'cameraType')
    ..e<ReceivePairCamera_pairStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ReceivePairCamera_pairStatus.DEFAULT, valueOf: ReceivePairCamera_pairStatus.valueOf, enumValues: ReceivePairCamera_pairStatus.values)
    ..a<$core.int>(266, _omitFieldNames ? '' : 'RECEIVEPAIRCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_PAIR_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceivePairCamera clone() => ReceivePairCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceivePairCamera copyWith(void Function(ReceivePairCamera) updates) => super.copyWith((message) => updates(message as ReceivePairCamera)) as ReceivePairCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceivePairCamera create() => ReceivePairCamera._();
  ReceivePairCamera createEmptyInstance() => create();
  static $pb.PbList<ReceivePairCamera> createRepeated() => $pb.PbList<ReceivePairCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceivePairCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceivePairCamera>(create);
  static ReceivePairCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cameraId => $_getSZ(1);
  @$pb.TagNumber(2)
  set cameraId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cameraType => $_getSZ(2);
  @$pb.TagNumber(3)
  set cameraType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraType() => clearField(3);

  @$pb.TagNumber(4)
  ReceivePairCamera_pairStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(ReceivePairCamera_pairStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(266)
  $core.int get rECEIVEPAIRCAMERA => $_getIZ(4);
  @$pb.TagNumber(266)
  set rECEIVEPAIRCAMERA($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(266)
  $core.bool hasRECEIVEPAIRCAMERA() => $_has(4);
  @$pb.TagNumber(266)
  void clearRECEIVEPAIRCAMERA() => clearField(266);
}

class generateQRCodeString_Request extends $pb.GeneratedMessage {
  factory generateQRCodeString_Request({
    $core.String? sSID,
    $core.String? pASS,
  }) {
    final $result = create();
    if (sSID != null) {
      $result.sSID = sSID;
    }
    if (pASS != null) {
      $result.pASS = pASS;
    }
    return $result;
  }
  generateQRCodeString_Request._() : super();
  factory generateQRCodeString_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory generateQRCodeString_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'generateQRCodeString.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SSID', protoName: 'SSID')
    ..aOS(2, _omitFieldNames ? '' : 'PASS', protoName: 'PASS')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  generateQRCodeString_Request clone() => generateQRCodeString_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  generateQRCodeString_Request copyWith(void Function(generateQRCodeString_Request) updates) => super.copyWith((message) => updates(message as generateQRCodeString_Request)) as generateQRCodeString_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static generateQRCodeString_Request create() => generateQRCodeString_Request._();
  generateQRCodeString_Request createEmptyInstance() => create();
  static $pb.PbList<generateQRCodeString_Request> createRepeated() => $pb.PbList<generateQRCodeString_Request>();
  @$core.pragma('dart2js:noInline')
  static generateQRCodeString_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<generateQRCodeString_Request>(create);
  static generateQRCodeString_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sSID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sSID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSSID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSSID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pASS => $_getSZ(1);
  @$pb.TagNumber(2)
  set pASS($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPASS() => $_has(1);
  @$pb.TagNumber(2)
  void clearPASS() => clearField(2);
}

class generateQRCodeString_Reply extends $pb.GeneratedMessage {
  factory generateQRCodeString_Reply({
    $core.String? qrcode,
  }) {
    final $result = create();
    if (qrcode != null) {
      $result.qrcode = qrcode;
    }
    return $result;
  }
  generateQRCodeString_Reply._() : super();
  factory generateQRCodeString_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory generateQRCodeString_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'generateQRCodeString.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'qrcode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  generateQRCodeString_Reply clone() => generateQRCodeString_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  generateQRCodeString_Reply copyWith(void Function(generateQRCodeString_Reply) updates) => super.copyWith((message) => updates(message as generateQRCodeString_Reply)) as generateQRCodeString_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static generateQRCodeString_Reply create() => generateQRCodeString_Reply._();
  generateQRCodeString_Reply createEmptyInstance() => create();
  static $pb.PbList<generateQRCodeString_Reply> createRepeated() => $pb.PbList<generateQRCodeString_Reply>();
  @$core.pragma('dart2js:noInline')
  static generateQRCodeString_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<generateQRCodeString_Reply>(create);
  static generateQRCodeString_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qrcode => $_getSZ(0);
  @$pb.TagNumber(1)
  set qrcode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQrcode() => $_has(0);
  @$pb.TagNumber(1)
  void clearQrcode() => clearField(1);
}

class generateQRCodeString extends $pb.GeneratedMessage {
  factory generateQRCodeString({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  generateQRCodeString._() : super();
  factory generateQRCodeString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory generateQRCodeString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'generateQRCodeString', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(267, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  generateQRCodeString clone() => generateQRCodeString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  generateQRCodeString copyWith(void Function(generateQRCodeString) updates) => super.copyWith((message) => updates(message as generateQRCodeString)) as generateQRCodeString;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static generateQRCodeString create() => generateQRCodeString._();
  generateQRCodeString createEmptyInstance() => create();
  static $pb.PbList<generateQRCodeString> createRepeated() => $pb.PbList<generateQRCodeString>();
  @$core.pragma('dart2js:noInline')
  static generateQRCodeString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<generateQRCodeString>(create);
  static generateQRCodeString? _defaultInstance;

  @$pb.TagNumber(267)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(267)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(267)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(267)
  void clearID() => clearField(267);
}

class ChangePasswordCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory ChangePasswordCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
    $core.String? oldPass,
    $core.String? newPass,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (oldPass != null) {
      $result.oldPass = oldPass;
    }
    if (newPass != null) {
      $result.newPass = newPass;
    }
    return $result;
  }
  ChangePasswordCameraHomeVision_Request._() : super();
  factory ChangePasswordCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePasswordCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'oldPass')
    ..aOS(3, _omitFieldNames ? '' : 'newPass')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePasswordCameraHomeVision_Request clone() => ChangePasswordCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePasswordCameraHomeVision_Request copyWith(void Function(ChangePasswordCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as ChangePasswordCameraHomeVision_Request)) as ChangePasswordCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordCameraHomeVision_Request create() => ChangePasswordCameraHomeVision_Request._();
  ChangePasswordCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordCameraHomeVision_Request> createRepeated() => $pb.PbList<ChangePasswordCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordCameraHomeVision_Request>(create);
  static ChangePasswordCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get oldPass => $_getSZ(1);
  @$pb.TagNumber(2)
  set oldPass($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOldPass() => $_has(1);
  @$pb.TagNumber(2)
  void clearOldPass() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPass => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPass($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewPass() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPass() => clearField(3);
}

class ChangePasswordCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory ChangePasswordCameraHomeVision_Reply() => create();
  ChangePasswordCameraHomeVision_Reply._() : super();
  factory ChangePasswordCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePasswordCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePasswordCameraHomeVision_Reply clone() => ChangePasswordCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePasswordCameraHomeVision_Reply copyWith(void Function(ChangePasswordCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as ChangePasswordCameraHomeVision_Reply)) as ChangePasswordCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordCameraHomeVision_Reply create() => ChangePasswordCameraHomeVision_Reply._();
  ChangePasswordCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordCameraHomeVision_Reply> createRepeated() => $pb.PbList<ChangePasswordCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordCameraHomeVision_Reply>(create);
  static ChangePasswordCameraHomeVision_Reply? _defaultInstance;
}

class ChangePasswordCameraHomeVision extends $pb.GeneratedMessage {
  factory ChangePasswordCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ChangePasswordCameraHomeVision._() : super();
  factory ChangePasswordCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePasswordCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(268, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePasswordCameraHomeVision clone() => ChangePasswordCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePasswordCameraHomeVision copyWith(void Function(ChangePasswordCameraHomeVision) updates) => super.copyWith((message) => updates(message as ChangePasswordCameraHomeVision)) as ChangePasswordCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordCameraHomeVision create() => ChangePasswordCameraHomeVision._();
  ChangePasswordCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordCameraHomeVision> createRepeated() => $pb.PbList<ChangePasswordCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordCameraHomeVision>(create);
  static ChangePasswordCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(268)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(268)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(268)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(268)
  void clearID() => clearField(268);
}

class MDCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory MDCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? isOn,
    MDCameraHomeVision_Level? level,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
    $core.bool? isPushNotification,
    $core.Iterable<$1.Roi>? rois,
    $core.bool? soundAlarm,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (isOn != null) {
      $result.isOn = isOn;
    }
    if (level != null) {
      $result.level = level;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (soundAlarm != null) {
      $result.soundAlarm = soundAlarm;
    }
    return $result;
  }
  MDCameraHomeVision_Request._() : super();
  factory MDCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MDCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MDCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isOn')
    ..e<MDCameraHomeVision_Level>(3, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: MDCameraHomeVision_Level.LOW, valueOf: MDCameraHomeVision_Level.valueOf, enumValues: MDCameraHomeVision_Level.values)
    ..aOB(4, _omitFieldNames ? '' : 'isSendEmail')
    ..aOB(5, _omitFieldNames ? '' : 'isRecord')
    ..aOB(6, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..pc<$1.Roi>(7, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: $1.Roi.create)
    ..aOB(8, _omitFieldNames ? '' : 'SoundAlarm', protoName: 'SoundAlarm')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MDCameraHomeVision_Request clone() => MDCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MDCameraHomeVision_Request copyWith(void Function(MDCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as MDCameraHomeVision_Request)) as MDCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MDCameraHomeVision_Request create() => MDCameraHomeVision_Request._();
  MDCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<MDCameraHomeVision_Request> createRepeated() => $pb.PbList<MDCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static MDCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MDCameraHomeVision_Request>(create);
  static MDCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isOn => $_getBF(1);
  @$pb.TagNumber(2)
  set isOn($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsOn() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsOn() => clearField(2);

  @$pb.TagNumber(3)
  MDCameraHomeVision_Level get level => $_getN(2);
  @$pb.TagNumber(3)
  set level(MDCameraHomeVision_Level v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isSendEmail => $_getBF(3);
  @$pb.TagNumber(4)
  set isSendEmail($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsSendEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsSendEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecord => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecord($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecord() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecord() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPushNotification => $_getBF(5);
  @$pb.TagNumber(6)
  set isPushNotification($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPushNotification() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsPushNotification() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$1.Roi> get rois => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get soundAlarm => $_getBF(7);
  @$pb.TagNumber(8)
  set soundAlarm($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSoundAlarm() => $_has(7);
  @$pb.TagNumber(8)
  void clearSoundAlarm() => clearField(8);
}

class MDCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory MDCameraHomeVision_Reply({
    $core.List<$core.int>? cameraId,
    $1.Camera? camera,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  MDCameraHomeVision_Reply._() : super();
  factory MDCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MDCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MDCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MDCameraHomeVision_Reply clone() => MDCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MDCameraHomeVision_Reply copyWith(void Function(MDCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as MDCameraHomeVision_Reply)) as MDCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MDCameraHomeVision_Reply create() => MDCameraHomeVision_Reply._();
  MDCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<MDCameraHomeVision_Reply> createRepeated() => $pb.PbList<MDCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static MDCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MDCameraHomeVision_Reply>(create);
  static MDCameraHomeVision_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Camera get camera => $_getN(1);
  @$pb.TagNumber(2)
  set camera($1.Camera v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCamera() => $_has(1);
  @$pb.TagNumber(2)
  void clearCamera() => clearField(2);
  @$pb.TagNumber(2)
  $1.Camera ensureCamera() => $_ensure(1);
}

class MDCameraHomeVision extends $pb.GeneratedMessage {
  factory MDCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  MDCameraHomeVision._() : super();
  factory MDCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MDCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MDCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(269, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MDCameraHomeVision clone() => MDCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MDCameraHomeVision copyWith(void Function(MDCameraHomeVision) updates) => super.copyWith((message) => updates(message as MDCameraHomeVision)) as MDCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MDCameraHomeVision create() => MDCameraHomeVision._();
  MDCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<MDCameraHomeVision> createRepeated() => $pb.PbList<MDCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static MDCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MDCameraHomeVision>(create);
  static MDCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(269)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(269)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(269)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(269)
  void clearID() => clearField(269);
}

class ResetPassword_Request extends $pb.GeneratedMessage {
  factory ResetPassword_Request({
    $core.List<$core.int>? userId,
    $core.String? uidStr,
    $core.String? newPassword,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (uidStr != null) {
      $result.uidStr = uidStr;
    }
    if (newPassword != null) {
      $result.newPassword = newPassword;
    }
    return $result;
  }
  ResetPassword_Request._() : super();
  factory ResetPassword_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPassword_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPassword.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'uidStr')
    ..aOS(3, _omitFieldNames ? '' : 'newPassword', protoName: 'newPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPassword_Request clone() => ResetPassword_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPassword_Request copyWith(void Function(ResetPassword_Request) updates) => super.copyWith((message) => updates(message as ResetPassword_Request)) as ResetPassword_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPassword_Request create() => ResetPassword_Request._();
  ResetPassword_Request createEmptyInstance() => create();
  static $pb.PbList<ResetPassword_Request> createRepeated() => $pb.PbList<ResetPassword_Request>();
  @$core.pragma('dart2js:noInline')
  static ResetPassword_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPassword_Request>(create);
  static ResetPassword_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uidStr => $_getSZ(1);
  @$pb.TagNumber(2)
  set uidStr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUidStr() => $_has(1);
  @$pb.TagNumber(2)
  void clearUidStr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPassword() => clearField(3);
}

class ResetPassword_Reply extends $pb.GeneratedMessage {
  factory ResetPassword_Reply() => create();
  ResetPassword_Reply._() : super();
  factory ResetPassword_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPassword_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPassword.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPassword_Reply clone() => ResetPassword_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPassword_Reply copyWith(void Function(ResetPassword_Reply) updates) => super.copyWith((message) => updates(message as ResetPassword_Reply)) as ResetPassword_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPassword_Reply create() => ResetPassword_Reply._();
  ResetPassword_Reply createEmptyInstance() => create();
  static $pb.PbList<ResetPassword_Reply> createRepeated() => $pb.PbList<ResetPassword_Reply>();
  @$core.pragma('dart2js:noInline')
  static ResetPassword_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPassword_Reply>(create);
  static ResetPassword_Reply? _defaultInstance;
}

class ResetPassword extends $pb.GeneratedMessage {
  factory ResetPassword({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ResetPassword._() : super();
  factory ResetPassword.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPassword.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPassword', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(270, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPassword clone() => ResetPassword()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPassword copyWith(void Function(ResetPassword) updates) => super.copyWith((message) => updates(message as ResetPassword)) as ResetPassword;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPassword create() => ResetPassword._();
  ResetPassword createEmptyInstance() => create();
  static $pb.PbList<ResetPassword> createRepeated() => $pb.PbList<ResetPassword>();
  @$core.pragma('dart2js:noInline')
  static ResetPassword getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPassword>(create);
  static ResetPassword? _defaultInstance;

  @$pb.TagNumber(270)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(270)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(270)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(270)
  void clearID() => clearField(270);
}

class CheckUpdateCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory CheckUpdateCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  CheckUpdateCameraHomeVision_Request._() : super();
  factory CheckUpdateCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckUpdateCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUpdateCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckUpdateCameraHomeVision_Request clone() => CheckUpdateCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckUpdateCameraHomeVision_Request copyWith(void Function(CheckUpdateCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as CheckUpdateCameraHomeVision_Request)) as CheckUpdateCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUpdateCameraHomeVision_Request create() => CheckUpdateCameraHomeVision_Request._();
  CheckUpdateCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<CheckUpdateCameraHomeVision_Request> createRepeated() => $pb.PbList<CheckUpdateCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static CheckUpdateCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUpdateCameraHomeVision_Request>(create);
  static CheckUpdateCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class CheckUpdateCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory CheckUpdateCameraHomeVision_Reply({
    $core.bool? isUpdate,
    $core.List<$core.int>? fwId,
    $core.int? newVersion,
    $core.String? des,
  }) {
    final $result = create();
    if (isUpdate != null) {
      $result.isUpdate = isUpdate;
    }
    if (fwId != null) {
      $result.fwId = fwId;
    }
    if (newVersion != null) {
      $result.newVersion = newVersion;
    }
    if (des != null) {
      $result.des = des;
    }
    return $result;
  }
  CheckUpdateCameraHomeVision_Reply._() : super();
  factory CheckUpdateCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckUpdateCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUpdateCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isUpdate', protoName: 'isUpdate')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'fwId', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'newVersion', $pb.PbFieldType.OU3, protoName: 'newVersion')
    ..aOS(4, _omitFieldNames ? '' : 'des')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckUpdateCameraHomeVision_Reply clone() => CheckUpdateCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckUpdateCameraHomeVision_Reply copyWith(void Function(CheckUpdateCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as CheckUpdateCameraHomeVision_Reply)) as CheckUpdateCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUpdateCameraHomeVision_Reply create() => CheckUpdateCameraHomeVision_Reply._();
  CheckUpdateCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<CheckUpdateCameraHomeVision_Reply> createRepeated() => $pb.PbList<CheckUpdateCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static CheckUpdateCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUpdateCameraHomeVision_Reply>(create);
  static CheckUpdateCameraHomeVision_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isUpdate => $_getBF(0);
  @$pb.TagNumber(1)
  set isUpdate($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsUpdate() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsUpdate() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get fwId => $_getN(1);
  @$pb.TagNumber(2)
  set fwId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFwId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFwId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get newVersion => $_getIZ(2);
  @$pb.TagNumber(3)
  set newVersion($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get des => $_getSZ(3);
  @$pb.TagNumber(4)
  set des($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDes() => $_has(3);
  @$pb.TagNumber(4)
  void clearDes() => clearField(4);
}

/// // CR010
/// / UPDATE FW CAMERA HOME VISION
class CheckUpdateCameraHomeVision extends $pb.GeneratedMessage {
  factory CheckUpdateCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  CheckUpdateCameraHomeVision._() : super();
  factory CheckUpdateCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckUpdateCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUpdateCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(271, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckUpdateCameraHomeVision clone() => CheckUpdateCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckUpdateCameraHomeVision copyWith(void Function(CheckUpdateCameraHomeVision) updates) => super.copyWith((message) => updates(message as CheckUpdateCameraHomeVision)) as CheckUpdateCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUpdateCameraHomeVision create() => CheckUpdateCameraHomeVision._();
  CheckUpdateCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<CheckUpdateCameraHomeVision> createRepeated() => $pb.PbList<CheckUpdateCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static CheckUpdateCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUpdateCameraHomeVision>(create);
  static CheckUpdateCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(271)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(271)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(271)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(271)
  void clearID() => clearField(271);
}

class UpdateFWCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory UpdateFWCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? fwId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (fwId != null) {
      $result.fwId = fwId;
    }
    return $result;
  }
  UpdateFWCameraHomeVision_Request._() : super();
  factory UpdateFWCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFWCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateFWCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'fwId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFWCameraHomeVision_Request clone() => UpdateFWCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFWCameraHomeVision_Request copyWith(void Function(UpdateFWCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as UpdateFWCameraHomeVision_Request)) as UpdateFWCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateFWCameraHomeVision_Request create() => UpdateFWCameraHomeVision_Request._();
  UpdateFWCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateFWCameraHomeVision_Request> createRepeated() => $pb.PbList<UpdateFWCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateFWCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFWCameraHomeVision_Request>(create);
  static UpdateFWCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get fwId => $_getN(1);
  @$pb.TagNumber(2)
  set fwId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFwId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFwId() => clearField(2);
}

class UpdateFWCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory UpdateFWCameraHomeVision_Reply() => create();
  UpdateFWCameraHomeVision_Reply._() : super();
  factory UpdateFWCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFWCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateFWCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFWCameraHomeVision_Reply clone() => UpdateFWCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFWCameraHomeVision_Reply copyWith(void Function(UpdateFWCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as UpdateFWCameraHomeVision_Reply)) as UpdateFWCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateFWCameraHomeVision_Reply create() => UpdateFWCameraHomeVision_Reply._();
  UpdateFWCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateFWCameraHomeVision_Reply> createRepeated() => $pb.PbList<UpdateFWCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateFWCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFWCameraHomeVision_Reply>(create);
  static UpdateFWCameraHomeVision_Reply? _defaultInstance;
}

/// // CR010
class UpdateFWCameraHomeVision extends $pb.GeneratedMessage {
  factory UpdateFWCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateFWCameraHomeVision._() : super();
  factory UpdateFWCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFWCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateFWCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(272, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFWCameraHomeVision clone() => UpdateFWCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFWCameraHomeVision copyWith(void Function(UpdateFWCameraHomeVision) updates) => super.copyWith((message) => updates(message as UpdateFWCameraHomeVision)) as UpdateFWCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateFWCameraHomeVision create() => UpdateFWCameraHomeVision._();
  UpdateFWCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<UpdateFWCameraHomeVision> createRepeated() => $pb.PbList<UpdateFWCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static UpdateFWCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFWCameraHomeVision>(create);
  static UpdateFWCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(272)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(272)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(272)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(272)
  void clearID() => clearField(272);
}

class HomeVisionFlipImage_Request extends $pb.GeneratedMessage {
  factory HomeVisionFlipImage_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? flip,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (flip != null) {
      $result.flip = flip;
    }
    return $result;
  }
  HomeVisionFlipImage_Request._() : super();
  factory HomeVisionFlipImage_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVisionFlipImage_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVisionFlipImage.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'flip')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVisionFlipImage_Request clone() => HomeVisionFlipImage_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVisionFlipImage_Request copyWith(void Function(HomeVisionFlipImage_Request) updates) => super.copyWith((message) => updates(message as HomeVisionFlipImage_Request)) as HomeVisionFlipImage_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVisionFlipImage_Request create() => HomeVisionFlipImage_Request._();
  HomeVisionFlipImage_Request createEmptyInstance() => create();
  static $pb.PbList<HomeVisionFlipImage_Request> createRepeated() => $pb.PbList<HomeVisionFlipImage_Request>();
  @$core.pragma('dart2js:noInline')
  static HomeVisionFlipImage_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVisionFlipImage_Request>(create);
  static HomeVisionFlipImage_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get flip => $_getBF(1);
  @$pb.TagNumber(2)
  set flip($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFlip() => $_has(1);
  @$pb.TagNumber(2)
  void clearFlip() => clearField(2);
}

class HomeVisionFlipImage_Reply extends $pb.GeneratedMessage {
  factory HomeVisionFlipImage_Reply() => create();
  HomeVisionFlipImage_Reply._() : super();
  factory HomeVisionFlipImage_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVisionFlipImage_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVisionFlipImage.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVisionFlipImage_Reply clone() => HomeVisionFlipImage_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVisionFlipImage_Reply copyWith(void Function(HomeVisionFlipImage_Reply) updates) => super.copyWith((message) => updates(message as HomeVisionFlipImage_Reply)) as HomeVisionFlipImage_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVisionFlipImage_Reply create() => HomeVisionFlipImage_Reply._();
  HomeVisionFlipImage_Reply createEmptyInstance() => create();
  static $pb.PbList<HomeVisionFlipImage_Reply> createRepeated() => $pb.PbList<HomeVisionFlipImage_Reply>();
  @$core.pragma('dart2js:noInline')
  static HomeVisionFlipImage_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVisionFlipImage_Reply>(create);
  static HomeVisionFlipImage_Reply? _defaultInstance;
}

class HomeVisionFlipImage extends $pb.GeneratedMessage {
  factory HomeVisionFlipImage({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  HomeVisionFlipImage._() : super();
  factory HomeVisionFlipImage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVisionFlipImage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVisionFlipImage', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(273, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVisionFlipImage clone() => HomeVisionFlipImage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVisionFlipImage copyWith(void Function(HomeVisionFlipImage) updates) => super.copyWith((message) => updates(message as HomeVisionFlipImage)) as HomeVisionFlipImage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVisionFlipImage create() => HomeVisionFlipImage._();
  HomeVisionFlipImage createEmptyInstance() => create();
  static $pb.PbList<HomeVisionFlipImage> createRepeated() => $pb.PbList<HomeVisionFlipImage>();
  @$core.pragma('dart2js:noInline')
  static HomeVisionFlipImage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVisionFlipImage>(create);
  static HomeVisionFlipImage? _defaultInstance;

  @$pb.TagNumber(273)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(273)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(273)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(273)
  void clearID() => clearField(273);
}

class HomeVisionFormatSDCard_Request extends $pb.GeneratedMessage {
  factory HomeVisionFormatSDCard_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  HomeVisionFormatSDCard_Request._() : super();
  factory HomeVisionFormatSDCard_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVisionFormatSDCard_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVisionFormatSDCard.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVisionFormatSDCard_Request clone() => HomeVisionFormatSDCard_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVisionFormatSDCard_Request copyWith(void Function(HomeVisionFormatSDCard_Request) updates) => super.copyWith((message) => updates(message as HomeVisionFormatSDCard_Request)) as HomeVisionFormatSDCard_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVisionFormatSDCard_Request create() => HomeVisionFormatSDCard_Request._();
  HomeVisionFormatSDCard_Request createEmptyInstance() => create();
  static $pb.PbList<HomeVisionFormatSDCard_Request> createRepeated() => $pb.PbList<HomeVisionFormatSDCard_Request>();
  @$core.pragma('dart2js:noInline')
  static HomeVisionFormatSDCard_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVisionFormatSDCard_Request>(create);
  static HomeVisionFormatSDCard_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class HomeVisionFormatSDCard_Reply extends $pb.GeneratedMessage {
  factory HomeVisionFormatSDCard_Reply() => create();
  HomeVisionFormatSDCard_Reply._() : super();
  factory HomeVisionFormatSDCard_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVisionFormatSDCard_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVisionFormatSDCard.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVisionFormatSDCard_Reply clone() => HomeVisionFormatSDCard_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVisionFormatSDCard_Reply copyWith(void Function(HomeVisionFormatSDCard_Reply) updates) => super.copyWith((message) => updates(message as HomeVisionFormatSDCard_Reply)) as HomeVisionFormatSDCard_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVisionFormatSDCard_Reply create() => HomeVisionFormatSDCard_Reply._();
  HomeVisionFormatSDCard_Reply createEmptyInstance() => create();
  static $pb.PbList<HomeVisionFormatSDCard_Reply> createRepeated() => $pb.PbList<HomeVisionFormatSDCard_Reply>();
  @$core.pragma('dart2js:noInline')
  static HomeVisionFormatSDCard_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVisionFormatSDCard_Reply>(create);
  static HomeVisionFormatSDCard_Reply? _defaultInstance;
}

class HomeVisionFormatSDCard extends $pb.GeneratedMessage {
  factory HomeVisionFormatSDCard({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  HomeVisionFormatSDCard._() : super();
  factory HomeVisionFormatSDCard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVisionFormatSDCard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVisionFormatSDCard', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(276, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVisionFormatSDCard clone() => HomeVisionFormatSDCard()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVisionFormatSDCard copyWith(void Function(HomeVisionFormatSDCard) updates) => super.copyWith((message) => updates(message as HomeVisionFormatSDCard)) as HomeVisionFormatSDCard;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVisionFormatSDCard create() => HomeVisionFormatSDCard._();
  HomeVisionFormatSDCard createEmptyInstance() => create();
  static $pb.PbList<HomeVisionFormatSDCard> createRepeated() => $pb.PbList<HomeVisionFormatSDCard>();
  @$core.pragma('dart2js:noInline')
  static HomeVisionFormatSDCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVisionFormatSDCard>(create);
  static HomeVisionFormatSDCard? _defaultInstance;

  @$pb.TagNumber(276)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(276)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(276)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(276)
  void clearID() => clearField(276);
}

class ListNotification_Request extends $pb.GeneratedMessage {
  factory ListNotification_Request({
    ListNotification_GetType? getType,
    $core.int? count,
    $core.List<$core.int>? lastNotification,
  }) {
    final $result = create();
    if (getType != null) {
      $result.getType = getType;
    }
    if (count != null) {
      $result.count = count;
    }
    if (lastNotification != null) {
      $result.lastNotification = lastNotification;
    }
    return $result;
  }
  ListNotification_Request._() : super();
  factory ListNotification_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNotification_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNotification.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<ListNotification_GetType>(1, _omitFieldNames ? '' : 'getType', $pb.PbFieldType.OE, protoName: 'getType', defaultOrMaker: ListNotification_GetType.DEFAULT, valueOf: ListNotification_GetType.valueOf, enumValues: ListNotification_GetType.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'lastNotification', $pb.PbFieldType.OY, protoName: 'lastNotification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNotification_Request clone() => ListNotification_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNotification_Request copyWith(void Function(ListNotification_Request) updates) => super.copyWith((message) => updates(message as ListNotification_Request)) as ListNotification_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNotification_Request create() => ListNotification_Request._();
  ListNotification_Request createEmptyInstance() => create();
  static $pb.PbList<ListNotification_Request> createRepeated() => $pb.PbList<ListNotification_Request>();
  @$core.pragma('dart2js:noInline')
  static ListNotification_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNotification_Request>(create);
  static ListNotification_Request? _defaultInstance;

  @$pb.TagNumber(1)
  ListNotification_GetType get getType => $_getN(0);
  @$pb.TagNumber(1)
  set getType(ListNotification_GetType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGetType() => $_has(0);
  @$pb.TagNumber(1)
  void clearGetType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get lastNotification => $_getN(2);
  @$pb.TagNumber(3)
  set lastNotification($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastNotification() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastNotification() => clearField(3);
}

class ListNotification_Reply extends $pb.GeneratedMessage {
  factory ListNotification_Reply({
    $core.Iterable<$1.NotificationMsg>? messages,
    $core.bool? isEnd,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (isEnd != null) {
      $result.isEnd = isEnd;
    }
    return $result;
  }
  ListNotification_Reply._() : super();
  factory ListNotification_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNotification_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNotification.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.NotificationMsg>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: $1.NotificationMsg.create)
    ..aOB(2, _omitFieldNames ? '' : 'isEnd', protoName: 'isEnd')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNotification_Reply clone() => ListNotification_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNotification_Reply copyWith(void Function(ListNotification_Reply) updates) => super.copyWith((message) => updates(message as ListNotification_Reply)) as ListNotification_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNotification_Reply create() => ListNotification_Reply._();
  ListNotification_Reply createEmptyInstance() => create();
  static $pb.PbList<ListNotification_Reply> createRepeated() => $pb.PbList<ListNotification_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListNotification_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNotification_Reply>(create);
  static ListNotification_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.NotificationMsg> get messages => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isEnd => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnd($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnd() => clearField(2);
}

/// // CR010 - NOTIFICATION
///  chứa danh sách notifion share , notification thông báo , ....
class ListNotification extends $pb.GeneratedMessage {
  factory ListNotification({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListNotification._() : super();
  factory ListNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(274, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNotification clone() => ListNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNotification copyWith(void Function(ListNotification) updates) => super.copyWith((message) => updates(message as ListNotification)) as ListNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNotification create() => ListNotification._();
  ListNotification createEmptyInstance() => create();
  static $pb.PbList<ListNotification> createRepeated() => $pb.PbList<ListNotification>();
  @$core.pragma('dart2js:noInline')
  static ListNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNotification>(create);
  static ListNotification? _defaultInstance;

  @$pb.TagNumber(274)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(274)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(274)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(274)
  void clearID() => clearField(274);
}

class MarkReadNotification_Request extends $pb.GeneratedMessage {
  factory MarkReadNotification_Request({
    $core.List<$core.int>? msgId,
  }) {
    final $result = create();
    if (msgId != null) {
      $result.msgId = msgId;
    }
    return $result;
  }
  MarkReadNotification_Request._() : super();
  factory MarkReadNotification_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkReadNotification_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkReadNotification.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'msgId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkReadNotification_Request clone() => MarkReadNotification_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkReadNotification_Request copyWith(void Function(MarkReadNotification_Request) updates) => super.copyWith((message) => updates(message as MarkReadNotification_Request)) as MarkReadNotification_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkReadNotification_Request create() => MarkReadNotification_Request._();
  MarkReadNotification_Request createEmptyInstance() => create();
  static $pb.PbList<MarkReadNotification_Request> createRepeated() => $pb.PbList<MarkReadNotification_Request>();
  @$core.pragma('dart2js:noInline')
  static MarkReadNotification_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkReadNotification_Request>(create);
  static MarkReadNotification_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get msgId => $_getN(0);
  @$pb.TagNumber(1)
  set msgId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgId() => clearField(1);
}

class MarkReadNotification_Reply extends $pb.GeneratedMessage {
  factory MarkReadNotification_Reply() => create();
  MarkReadNotification_Reply._() : super();
  factory MarkReadNotification_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkReadNotification_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkReadNotification.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkReadNotification_Reply clone() => MarkReadNotification_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkReadNotification_Reply copyWith(void Function(MarkReadNotification_Reply) updates) => super.copyWith((message) => updates(message as MarkReadNotification_Reply)) as MarkReadNotification_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkReadNotification_Reply create() => MarkReadNotification_Reply._();
  MarkReadNotification_Reply createEmptyInstance() => create();
  static $pb.PbList<MarkReadNotification_Reply> createRepeated() => $pb.PbList<MarkReadNotification_Reply>();
  @$core.pragma('dart2js:noInline')
  static MarkReadNotification_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkReadNotification_Reply>(create);
  static MarkReadNotification_Reply? _defaultInstance;
}

/// / Đánh dấu 1 message đã được đọc
class MarkReadNotification extends $pb.GeneratedMessage {
  factory MarkReadNotification({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  MarkReadNotification._() : super();
  factory MarkReadNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkReadNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkReadNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(275, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkReadNotification clone() => MarkReadNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkReadNotification copyWith(void Function(MarkReadNotification) updates) => super.copyWith((message) => updates(message as MarkReadNotification)) as MarkReadNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkReadNotification create() => MarkReadNotification._();
  MarkReadNotification createEmptyInstance() => create();
  static $pb.PbList<MarkReadNotification> createRepeated() => $pb.PbList<MarkReadNotification>();
  @$core.pragma('dart2js:noInline')
  static MarkReadNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkReadNotification>(create);
  static MarkReadNotification? _defaultInstance;

  @$pb.TagNumber(275)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(275)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(275)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(275)
  void clearID() => clearField(275);
}

class ReceiveNotification extends $pb.GeneratedMessage {
  factory ReceiveNotification({
    $1.NotificationMsg? messages,
    $core.int? unreadMsgCount,
    $core.int? rECEIVEMESSAGE,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages = messages;
    }
    if (unreadMsgCount != null) {
      $result.unreadMsgCount = unreadMsgCount;
    }
    if (rECEIVEMESSAGE != null) {
      $result.rECEIVEMESSAGE = rECEIVEMESSAGE;
    }
    return $result;
  }
  ReceiveNotification._() : super();
  factory ReceiveNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.NotificationMsg>(1, _omitFieldNames ? '' : 'messages', subBuilder: $1.NotificationMsg.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'unreadMsgCount', $pb.PbFieldType.OU3)
    ..a<$core.int>(277, _omitFieldNames ? '' : 'RECEIVEMESSAGE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_MESSAGE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveNotification clone() => ReceiveNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveNotification copyWith(void Function(ReceiveNotification) updates) => super.copyWith((message) => updates(message as ReceiveNotification)) as ReceiveNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveNotification create() => ReceiveNotification._();
  ReceiveNotification createEmptyInstance() => create();
  static $pb.PbList<ReceiveNotification> createRepeated() => $pb.PbList<ReceiveNotification>();
  @$core.pragma('dart2js:noInline')
  static ReceiveNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveNotification>(create);
  static ReceiveNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $1.NotificationMsg get messages => $_getN(0);
  @$pb.TagNumber(1)
  set messages($1.NotificationMsg v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessages() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessages() => clearField(1);
  @$pb.TagNumber(1)
  $1.NotificationMsg ensureMessages() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get unreadMsgCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set unreadMsgCount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnreadMsgCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnreadMsgCount() => clearField(2);

  @$pb.TagNumber(277)
  $core.int get rECEIVEMESSAGE => $_getIZ(2);
  @$pb.TagNumber(277)
  set rECEIVEMESSAGE($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(277)
  $core.bool hasRECEIVEMESSAGE() => $_has(2);
  @$pb.TagNumber(277)
  void clearRECEIVEMESSAGE() => clearField(277);
}

class ReceiveNotificationUnReadCount extends $pb.GeneratedMessage {
  factory ReceiveNotificationUnReadCount({
    $core.int? unreadMsgCount,
    $core.Iterable<$core.List<$core.int>>? idsMarkread,
    $core.int? rECEIVEUNREADNOTIFICATIONCOUNT,
  }) {
    final $result = create();
    if (unreadMsgCount != null) {
      $result.unreadMsgCount = unreadMsgCount;
    }
    if (idsMarkread != null) {
      $result.idsMarkread.addAll(idsMarkread);
    }
    if (rECEIVEUNREADNOTIFICATIONCOUNT != null) {
      $result.rECEIVEUNREADNOTIFICATIONCOUNT = rECEIVEUNREADNOTIFICATIONCOUNT;
    }
    return $result;
  }
  ReceiveNotificationUnReadCount._() : super();
  factory ReceiveNotificationUnReadCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveNotificationUnReadCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveNotificationUnReadCount', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'unreadMsgCount', $pb.PbFieldType.OU3)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'idsMarkread', $pb.PbFieldType.PY)
    ..a<$core.int>(278, _omitFieldNames ? '' : 'RECEIVEUNREADNOTIFICATIONCOUNT', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UNREAD_NOTIFICATION_COUNT')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveNotificationUnReadCount clone() => ReceiveNotificationUnReadCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveNotificationUnReadCount copyWith(void Function(ReceiveNotificationUnReadCount) updates) => super.copyWith((message) => updates(message as ReceiveNotificationUnReadCount)) as ReceiveNotificationUnReadCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveNotificationUnReadCount create() => ReceiveNotificationUnReadCount._();
  ReceiveNotificationUnReadCount createEmptyInstance() => create();
  static $pb.PbList<ReceiveNotificationUnReadCount> createRepeated() => $pb.PbList<ReceiveNotificationUnReadCount>();
  @$core.pragma('dart2js:noInline')
  static ReceiveNotificationUnReadCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveNotificationUnReadCount>(create);
  static ReceiveNotificationUnReadCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unreadMsgCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set unreadMsgCount($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadMsgCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadMsgCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get idsMarkread => $_getList(1);

  @$pb.TagNumber(278)
  $core.int get rECEIVEUNREADNOTIFICATIONCOUNT => $_getIZ(2);
  @$pb.TagNumber(278)
  set rECEIVEUNREADNOTIFICATIONCOUNT($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(278)
  $core.bool hasRECEIVEUNREADNOTIFICATIONCOUNT() => $_has(2);
  @$pb.TagNumber(278)
  void clearRECEIVEUNREADNOTIFICATIONCOUNT() => clearField(278);
}

class UpdateVolumeCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory UpdateVolumeCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
    $core.int? volume,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (volume != null) {
      $result.volume = volume;
    }
    return $result;
  }
  UpdateVolumeCameraHomeVision_Request._() : super();
  factory UpdateVolumeCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVolumeCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVolumeCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'volume', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVolumeCameraHomeVision_Request clone() => UpdateVolumeCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVolumeCameraHomeVision_Request copyWith(void Function(UpdateVolumeCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as UpdateVolumeCameraHomeVision_Request)) as UpdateVolumeCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVolumeCameraHomeVision_Request create() => UpdateVolumeCameraHomeVision_Request._();
  UpdateVolumeCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateVolumeCameraHomeVision_Request> createRepeated() => $pb.PbList<UpdateVolumeCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateVolumeCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVolumeCameraHomeVision_Request>(create);
  static UpdateVolumeCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get volume => $_getIZ(1);
  @$pb.TagNumber(2)
  set volume($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolume() => clearField(2);
}

class UpdateVolumeCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory UpdateVolumeCameraHomeVision_Reply() => create();
  UpdateVolumeCameraHomeVision_Reply._() : super();
  factory UpdateVolumeCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVolumeCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVolumeCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVolumeCameraHomeVision_Reply clone() => UpdateVolumeCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVolumeCameraHomeVision_Reply copyWith(void Function(UpdateVolumeCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as UpdateVolumeCameraHomeVision_Reply)) as UpdateVolumeCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVolumeCameraHomeVision_Reply create() => UpdateVolumeCameraHomeVision_Reply._();
  UpdateVolumeCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateVolumeCameraHomeVision_Reply> createRepeated() => $pb.PbList<UpdateVolumeCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateVolumeCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVolumeCameraHomeVision_Reply>(create);
  static UpdateVolumeCameraHomeVision_Reply? _defaultInstance;
}

class UpdateVolumeCameraHomeVision extends $pb.GeneratedMessage {
  factory UpdateVolumeCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateVolumeCameraHomeVision._() : super();
  factory UpdateVolumeCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVolumeCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVolumeCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(279, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVolumeCameraHomeVision clone() => UpdateVolumeCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVolumeCameraHomeVision copyWith(void Function(UpdateVolumeCameraHomeVision) updates) => super.copyWith((message) => updates(message as UpdateVolumeCameraHomeVision)) as UpdateVolumeCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVolumeCameraHomeVision create() => UpdateVolumeCameraHomeVision._();
  UpdateVolumeCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<UpdateVolumeCameraHomeVision> createRepeated() => $pb.PbList<UpdateVolumeCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static UpdateVolumeCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVolumeCameraHomeVision>(create);
  static UpdateVolumeCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(279)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(279)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(279)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(279)
  void clearID() => clearField(279);
}

class ReceiveBeginUpdateFWCamera extends $pb.GeneratedMessage {
  factory ReceiveBeginUpdateFWCamera({
    $1.Camera? camera,
    $core.int? rECEIVEBEGINUPDATEFWCAMERA,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEBEGINUPDATEFWCAMERA != null) {
      $result.rECEIVEBEGINUPDATEFWCAMERA = rECEIVEBEGINUPDATEFWCAMERA;
    }
    return $result;
  }
  ReceiveBeginUpdateFWCamera._() : super();
  factory ReceiveBeginUpdateFWCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveBeginUpdateFWCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveBeginUpdateFWCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(280, _omitFieldNames ? '' : 'RECEIVEBEGINUPDATEFWCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_BEGIN_UPDATE_FW_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveBeginUpdateFWCamera clone() => ReceiveBeginUpdateFWCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveBeginUpdateFWCamera copyWith(void Function(ReceiveBeginUpdateFWCamera) updates) => super.copyWith((message) => updates(message as ReceiveBeginUpdateFWCamera)) as ReceiveBeginUpdateFWCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveBeginUpdateFWCamera create() => ReceiveBeginUpdateFWCamera._();
  ReceiveBeginUpdateFWCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveBeginUpdateFWCamera> createRepeated() => $pb.PbList<ReceiveBeginUpdateFWCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveBeginUpdateFWCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveBeginUpdateFWCamera>(create);
  static ReceiveBeginUpdateFWCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(280)
  $core.int get rECEIVEBEGINUPDATEFWCAMERA => $_getIZ(1);
  @$pb.TagNumber(280)
  set rECEIVEBEGINUPDATEFWCAMERA($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(280)
  $core.bool hasRECEIVEBEGINUPDATEFWCAMERA() => $_has(1);
  @$pb.TagNumber(280)
  void clearRECEIVEBEGINUPDATEFWCAMERA() => clearField(280);
}

class sdCardTypeCameraHomeVision_Request extends $pb.GeneratedMessage {
  factory sdCardTypeCameraHomeVision_Request({
    $core.List<$core.int>? cameraId,
    sdCardTypeCameraHomeVision_RecordType? recordType,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (recordType != null) {
      $result.recordType = recordType;
    }
    return $result;
  }
  sdCardTypeCameraHomeVision_Request._() : super();
  factory sdCardTypeCameraHomeVision_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sdCardTypeCameraHomeVision_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'sdCardTypeCameraHomeVision.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<sdCardTypeCameraHomeVision_RecordType>(2, _omitFieldNames ? '' : 'recordType', $pb.PbFieldType.OE, defaultOrMaker: sdCardTypeCameraHomeVision_RecordType.OFF, valueOf: sdCardTypeCameraHomeVision_RecordType.valueOf, enumValues: sdCardTypeCameraHomeVision_RecordType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sdCardTypeCameraHomeVision_Request clone() => sdCardTypeCameraHomeVision_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sdCardTypeCameraHomeVision_Request copyWith(void Function(sdCardTypeCameraHomeVision_Request) updates) => super.copyWith((message) => updates(message as sdCardTypeCameraHomeVision_Request)) as sdCardTypeCameraHomeVision_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sdCardTypeCameraHomeVision_Request create() => sdCardTypeCameraHomeVision_Request._();
  sdCardTypeCameraHomeVision_Request createEmptyInstance() => create();
  static $pb.PbList<sdCardTypeCameraHomeVision_Request> createRepeated() => $pb.PbList<sdCardTypeCameraHomeVision_Request>();
  @$core.pragma('dart2js:noInline')
  static sdCardTypeCameraHomeVision_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sdCardTypeCameraHomeVision_Request>(create);
  static sdCardTypeCameraHomeVision_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  sdCardTypeCameraHomeVision_RecordType get recordType => $_getN(1);
  @$pb.TagNumber(2)
  set recordType(sdCardTypeCameraHomeVision_RecordType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecordType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecordType() => clearField(2);
}

class sdCardTypeCameraHomeVision_Reply extends $pb.GeneratedMessage {
  factory sdCardTypeCameraHomeVision_Reply() => create();
  sdCardTypeCameraHomeVision_Reply._() : super();
  factory sdCardTypeCameraHomeVision_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sdCardTypeCameraHomeVision_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'sdCardTypeCameraHomeVision.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sdCardTypeCameraHomeVision_Reply clone() => sdCardTypeCameraHomeVision_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sdCardTypeCameraHomeVision_Reply copyWith(void Function(sdCardTypeCameraHomeVision_Reply) updates) => super.copyWith((message) => updates(message as sdCardTypeCameraHomeVision_Reply)) as sdCardTypeCameraHomeVision_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sdCardTypeCameraHomeVision_Reply create() => sdCardTypeCameraHomeVision_Reply._();
  sdCardTypeCameraHomeVision_Reply createEmptyInstance() => create();
  static $pb.PbList<sdCardTypeCameraHomeVision_Reply> createRepeated() => $pb.PbList<sdCardTypeCameraHomeVision_Reply>();
  @$core.pragma('dart2js:noInline')
  static sdCardTypeCameraHomeVision_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sdCardTypeCameraHomeVision_Reply>(create);
  static sdCardTypeCameraHomeVision_Reply? _defaultInstance;
}

class sdCardTypeCameraHomeVision extends $pb.GeneratedMessage {
  factory sdCardTypeCameraHomeVision({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  sdCardTypeCameraHomeVision._() : super();
  factory sdCardTypeCameraHomeVision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sdCardTypeCameraHomeVision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'sdCardTypeCameraHomeVision', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(281, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sdCardTypeCameraHomeVision clone() => sdCardTypeCameraHomeVision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sdCardTypeCameraHomeVision copyWith(void Function(sdCardTypeCameraHomeVision) updates) => super.copyWith((message) => updates(message as sdCardTypeCameraHomeVision)) as sdCardTypeCameraHomeVision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sdCardTypeCameraHomeVision create() => sdCardTypeCameraHomeVision._();
  sdCardTypeCameraHomeVision createEmptyInstance() => create();
  static $pb.PbList<sdCardTypeCameraHomeVision> createRepeated() => $pb.PbList<sdCardTypeCameraHomeVision>();
  @$core.pragma('dart2js:noInline')
  static sdCardTypeCameraHomeVision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sdCardTypeCameraHomeVision>(create);
  static sdCardTypeCameraHomeVision? _defaultInstance;

  @$pb.TagNumber(281)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(281)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(281)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(281)
  void clearID() => clearField(281);
}

class ReceiveUpdateFWSuccessCamera extends $pb.GeneratedMessage {
  factory ReceiveUpdateFWSuccessCamera({
    $1.Camera? camera,
    $core.int? status,
    $core.int? rECEIVEUPDATEFWSUCCESSCAMERA,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (status != null) {
      $result.status = status;
    }
    if (rECEIVEUPDATEFWSUCCESSCAMERA != null) {
      $result.rECEIVEUPDATEFWSUCCESSCAMERA = rECEIVEUPDATEFWSUCCESSCAMERA;
    }
    return $result;
  }
  ReceiveUpdateFWSuccessCamera._() : super();
  factory ReceiveUpdateFWSuccessCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateFWSuccessCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateFWSuccessCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..a<$core.int>(282, _omitFieldNames ? '' : 'RECEIVEUPDATEFWSUCCESSCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_FW_SUCCESS_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateFWSuccessCamera clone() => ReceiveUpdateFWSuccessCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateFWSuccessCamera copyWith(void Function(ReceiveUpdateFWSuccessCamera) updates) => super.copyWith((message) => updates(message as ReceiveUpdateFWSuccessCamera)) as ReceiveUpdateFWSuccessCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateFWSuccessCamera create() => ReceiveUpdateFWSuccessCamera._();
  ReceiveUpdateFWSuccessCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateFWSuccessCamera> createRepeated() => $pb.PbList<ReceiveUpdateFWSuccessCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateFWSuccessCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateFWSuccessCamera>(create);
  static ReceiveUpdateFWSuccessCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(282)
  $core.int get rECEIVEUPDATEFWSUCCESSCAMERA => $_getIZ(2);
  @$pb.TagNumber(282)
  set rECEIVEUPDATEFWSUCCESSCAMERA($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(282)
  $core.bool hasRECEIVEUPDATEFWSUCCESSCAMERA() => $_has(2);
  @$pb.TagNumber(282)
  void clearRECEIVEUPDATEFWSUCCESSCAMERA() => clearField(282);
}

class ListFileInSDCard_Request extends $pb.GeneratedMessage {
  factory ListFileInSDCard_Request({
    $core.List<$core.int>? cameraId,
    $core.int? day,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (day != null) {
      $result.day = day;
    }
    return $result;
  }
  ListFileInSDCard_Request._() : super();
  factory ListFileInSDCard_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListFileInSDCard_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListFileInSDCard.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'day', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListFileInSDCard_Request clone() => ListFileInSDCard_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListFileInSDCard_Request copyWith(void Function(ListFileInSDCard_Request) updates) => super.copyWith((message) => updates(message as ListFileInSDCard_Request)) as ListFileInSDCard_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFileInSDCard_Request create() => ListFileInSDCard_Request._();
  ListFileInSDCard_Request createEmptyInstance() => create();
  static $pb.PbList<ListFileInSDCard_Request> createRepeated() => $pb.PbList<ListFileInSDCard_Request>();
  @$core.pragma('dart2js:noInline')
  static ListFileInSDCard_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListFileInSDCard_Request>(create);
  static ListFileInSDCard_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get day => $_getIZ(1);
  @$pb.TagNumber(2)
  set day($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDay() => clearField(2);
}

class ListFileInSDCard_Reply extends $pb.GeneratedMessage {
  factory ListFileInSDCard_Reply({
    $1.SDCardFiles? sdCardFiles,
  }) {
    final $result = create();
    if (sdCardFiles != null) {
      $result.sdCardFiles = sdCardFiles;
    }
    return $result;
  }
  ListFileInSDCard_Reply._() : super();
  factory ListFileInSDCard_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListFileInSDCard_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListFileInSDCard.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.SDCardFiles>(1, _omitFieldNames ? '' : 'sdCardFiles', protoName: 'sdCardFiles', subBuilder: $1.SDCardFiles.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListFileInSDCard_Reply clone() => ListFileInSDCard_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListFileInSDCard_Reply copyWith(void Function(ListFileInSDCard_Reply) updates) => super.copyWith((message) => updates(message as ListFileInSDCard_Reply)) as ListFileInSDCard_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFileInSDCard_Reply create() => ListFileInSDCard_Reply._();
  ListFileInSDCard_Reply createEmptyInstance() => create();
  static $pb.PbList<ListFileInSDCard_Reply> createRepeated() => $pb.PbList<ListFileInSDCard_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListFileInSDCard_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListFileInSDCard_Reply>(create);
  static ListFileInSDCard_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.SDCardFiles get sdCardFiles => $_getN(0);
  @$pb.TagNumber(1)
  set sdCardFiles($1.SDCardFiles v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSdCardFiles() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdCardFiles() => clearField(1);
  @$pb.TagNumber(1)
  $1.SDCardFiles ensureSdCardFiles() => $_ensure(0);
}

class ListFileInSDCard extends $pb.GeneratedMessage {
  factory ListFileInSDCard({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListFileInSDCard._() : super();
  factory ListFileInSDCard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListFileInSDCard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListFileInSDCard', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(283, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListFileInSDCard clone() => ListFileInSDCard()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListFileInSDCard copyWith(void Function(ListFileInSDCard) updates) => super.copyWith((message) => updates(message as ListFileInSDCard)) as ListFileInSDCard;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFileInSDCard create() => ListFileInSDCard._();
  ListFileInSDCard createEmptyInstance() => create();
  static $pb.PbList<ListFileInSDCard> createRepeated() => $pb.PbList<ListFileInSDCard>();
  @$core.pragma('dart2js:noInline')
  static ListFileInSDCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListFileInSDCard>(create);
  static ListFileInSDCard? _defaultInstance;

  @$pb.TagNumber(283)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(283)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(283)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(283)
  void clearID() => clearField(283);
}

class IVAALPRConfig_Request extends $pb.GeneratedMessage {
  factory IVAALPRConfig_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? isEnable,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
    $core.bool? isPushNotification,
    $core.Iterable<$1.Roi>? rois,
    $core.bool? in_8,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (isEnable != null) {
      $result.isEnable = isEnable;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (in_8 != null) {
      $result.in_8 = in_8;
    }
    return $result;
  }
  IVAALPRConfig_Request._() : super();
  factory IVAALPRConfig_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAALPRConfig_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAALPRConfig.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isEnable', protoName: 'isEnable')
    ..aOB(4, _omitFieldNames ? '' : 'isSendEmail')
    ..aOB(5, _omitFieldNames ? '' : 'isRecord')
    ..aOB(6, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..pc<$1.Roi>(7, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: $1.Roi.create)
    ..aOB(8, _omitFieldNames ? '' : 'in')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAALPRConfig_Request clone() => IVAALPRConfig_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAALPRConfig_Request copyWith(void Function(IVAALPRConfig_Request) updates) => super.copyWith((message) => updates(message as IVAALPRConfig_Request)) as IVAALPRConfig_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAALPRConfig_Request create() => IVAALPRConfig_Request._();
  IVAALPRConfig_Request createEmptyInstance() => create();
  static $pb.PbList<IVAALPRConfig_Request> createRepeated() => $pb.PbList<IVAALPRConfig_Request>();
  @$core.pragma('dart2js:noInline')
  static IVAALPRConfig_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAALPRConfig_Request>(create);
  static IVAALPRConfig_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isEnable => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnable() => clearField(2);

  @$pb.TagNumber(4)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(4)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(4)
  void clearIsSendEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecord => $_getBF(3);
  @$pb.TagNumber(5)
  set isRecord($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecord() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsRecord() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPushNotification => $_getBF(4);
  @$pb.TagNumber(6)
  set isPushNotification($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPushNotification() => $_has(4);
  @$pb.TagNumber(6)
  void clearIsPushNotification() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$1.Roi> get rois => $_getList(5);

  @$pb.TagNumber(8)
  $core.bool get in_8 => $_getBF(6);
  @$pb.TagNumber(8)
  set in_8($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasIn_8() => $_has(6);
  @$pb.TagNumber(8)
  void clearIn_8() => clearField(8);
}

class IVAALPRConfig_Reply extends $pb.GeneratedMessage {
  factory IVAALPRConfig_Reply({
    $1.Camera? camera,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  IVAALPRConfig_Reply._() : super();
  factory IVAALPRConfig_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAALPRConfig_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAALPRConfig.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAALPRConfig_Reply clone() => IVAALPRConfig_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAALPRConfig_Reply copyWith(void Function(IVAALPRConfig_Reply) updates) => super.copyWith((message) => updates(message as IVAALPRConfig_Reply)) as IVAALPRConfig_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAALPRConfig_Reply create() => IVAALPRConfig_Reply._();
  IVAALPRConfig_Reply createEmptyInstance() => create();
  static $pb.PbList<IVAALPRConfig_Reply> createRepeated() => $pb.PbList<IVAALPRConfig_Reply>();
  @$core.pragma('dart2js:noInline')
  static IVAALPRConfig_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAALPRConfig_Reply>(create);
  static IVAALPRConfig_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);
}

/// / iva nhận diện biển số xe
class IVAALPRConfig extends $pb.GeneratedMessage {
  factory IVAALPRConfig({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  IVAALPRConfig._() : super();
  factory IVAALPRConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAALPRConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAALPRConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(284, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAALPRConfig clone() => IVAALPRConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAALPRConfig copyWith(void Function(IVAALPRConfig) updates) => super.copyWith((message) => updates(message as IVAALPRConfig)) as IVAALPRConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAALPRConfig create() => IVAALPRConfig._();
  IVAALPRConfig createEmptyInstance() => create();
  static $pb.PbList<IVAALPRConfig> createRepeated() => $pb.PbList<IVAALPRConfig>();
  @$core.pragma('dart2js:noInline')
  static IVAALPRConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAALPRConfig>(create);
  static IVAALPRConfig? _defaultInstance;

  @$pb.TagNumber(284)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(284)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(284)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(284)
  void clearID() => clearField(284);
}

class ReceiveALPRConfig extends $pb.GeneratedMessage {
  factory ReceiveALPRConfig({
    $1.Camera? camera,
    $core.int? rECEIVEIVAALPR,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEIVAALPR != null) {
      $result.rECEIVEIVAALPR = rECEIVEIVAALPR;
    }
    return $result;
  }
  ReceiveALPRConfig._() : super();
  factory ReceiveALPRConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveALPRConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveALPRConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(1, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(285, _omitFieldNames ? '' : 'RECEIVEIVAALPR', $pb.PbFieldType.OU3, protoName: 'RECEIVE_IVA_ALPR')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveALPRConfig clone() => ReceiveALPRConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveALPRConfig copyWith(void Function(ReceiveALPRConfig) updates) => super.copyWith((message) => updates(message as ReceiveALPRConfig)) as ReceiveALPRConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveALPRConfig create() => ReceiveALPRConfig._();
  ReceiveALPRConfig createEmptyInstance() => create();
  static $pb.PbList<ReceiveALPRConfig> createRepeated() => $pb.PbList<ReceiveALPRConfig>();
  @$core.pragma('dart2js:noInline')
  static ReceiveALPRConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveALPRConfig>(create);
  static ReceiveALPRConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(1)
  set camera($1.Camera v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamera() => clearField(1);
  @$pb.TagNumber(1)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(285)
  $core.int get rECEIVEIVAALPR => $_getIZ(1);
  @$pb.TagNumber(285)
  set rECEIVEIVAALPR($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(285)
  $core.bool hasRECEIVEIVAALPR() => $_has(1);
  @$pb.TagNumber(285)
  void clearRECEIVEIVAALPR() => clearField(285);
}

class UpdateVehiclePlate_Request extends $pb.GeneratedMessage {
  factory UpdateVehiclePlate_Request({
    $core.List<$core.int>? eventId,
    $core.String? newVehiclePlate,
  }) {
    final $result = create();
    if (eventId != null) {
      $result.eventId = eventId;
    }
    if (newVehiclePlate != null) {
      $result.newVehiclePlate = newVehiclePlate;
    }
    return $result;
  }
  UpdateVehiclePlate_Request._() : super();
  factory UpdateVehiclePlate_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVehiclePlate_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVehiclePlate.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'eventId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'newVehiclePlate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVehiclePlate_Request clone() => UpdateVehiclePlate_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVehiclePlate_Request copyWith(void Function(UpdateVehiclePlate_Request) updates) => super.copyWith((message) => updates(message as UpdateVehiclePlate_Request)) as UpdateVehiclePlate_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVehiclePlate_Request create() => UpdateVehiclePlate_Request._();
  UpdateVehiclePlate_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateVehiclePlate_Request> createRepeated() => $pb.PbList<UpdateVehiclePlate_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateVehiclePlate_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVehiclePlate_Request>(create);
  static UpdateVehiclePlate_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get eventId => $_getN(0);
  @$pb.TagNumber(1)
  set eventId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newVehiclePlate => $_getSZ(1);
  @$pb.TagNumber(2)
  set newVehiclePlate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewVehiclePlate() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewVehiclePlate() => clearField(2);
}

class UpdateVehiclePlate_Reply extends $pb.GeneratedMessage {
  factory UpdateVehiclePlate_Reply() => create();
  UpdateVehiclePlate_Reply._() : super();
  factory UpdateVehiclePlate_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVehiclePlate_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVehiclePlate.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVehiclePlate_Reply clone() => UpdateVehiclePlate_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVehiclePlate_Reply copyWith(void Function(UpdateVehiclePlate_Reply) updates) => super.copyWith((message) => updates(message as UpdateVehiclePlate_Reply)) as UpdateVehiclePlate_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVehiclePlate_Reply create() => UpdateVehiclePlate_Reply._();
  UpdateVehiclePlate_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateVehiclePlate_Reply> createRepeated() => $pb.PbList<UpdateVehiclePlate_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateVehiclePlate_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVehiclePlate_Reply>(create);
  static UpdateVehiclePlate_Reply? _defaultInstance;
}

class UpdateVehiclePlate extends $pb.GeneratedMessage {
  factory UpdateVehiclePlate({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateVehiclePlate._() : super();
  factory UpdateVehiclePlate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVehiclePlate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVehiclePlate', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(286, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVehiclePlate clone() => UpdateVehiclePlate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVehiclePlate copyWith(void Function(UpdateVehiclePlate) updates) => super.copyWith((message) => updates(message as UpdateVehiclePlate)) as UpdateVehiclePlate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVehiclePlate create() => UpdateVehiclePlate._();
  UpdateVehiclePlate createEmptyInstance() => create();
  static $pb.PbList<UpdateVehiclePlate> createRepeated() => $pb.PbList<UpdateVehiclePlate>();
  @$core.pragma('dart2js:noInline')
  static UpdateVehiclePlate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVehiclePlate>(create);
  static UpdateVehiclePlate? _defaultInstance;

  @$pb.TagNumber(286)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(286)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(286)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(286)
  void clearID() => clearField(286);
}

class StartRecordStream_Request extends $pb.GeneratedMessage {
  factory StartRecordStream_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  StartRecordStream_Request._() : super();
  factory StartRecordStream_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartRecordStream_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartRecordStream.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartRecordStream_Request clone() => StartRecordStream_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartRecordStream_Request copyWith(void Function(StartRecordStream_Request) updates) => super.copyWith((message) => updates(message as StartRecordStream_Request)) as StartRecordStream_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecordStream_Request create() => StartRecordStream_Request._();
  StartRecordStream_Request createEmptyInstance() => create();
  static $pb.PbList<StartRecordStream_Request> createRepeated() => $pb.PbList<StartRecordStream_Request>();
  @$core.pragma('dart2js:noInline')
  static StartRecordStream_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartRecordStream_Request>(create);
  static StartRecordStream_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class StartRecordStream_Reply extends $pb.GeneratedMessage {
  factory StartRecordStream_Reply({
    $core.List<$core.int>? recordId,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    return $result;
  }
  StartRecordStream_Reply._() : super();
  factory StartRecordStream_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartRecordStream_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartRecordStream.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartRecordStream_Reply clone() => StartRecordStream_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartRecordStream_Reply copyWith(void Function(StartRecordStream_Reply) updates) => super.copyWith((message) => updates(message as StartRecordStream_Reply)) as StartRecordStream_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecordStream_Reply create() => StartRecordStream_Reply._();
  StartRecordStream_Reply createEmptyInstance() => create();
  static $pb.PbList<StartRecordStream_Reply> createRepeated() => $pb.PbList<StartRecordStream_Reply>();
  @$core.pragma('dart2js:noInline')
  static StartRecordStream_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartRecordStream_Reply>(create);
  static StartRecordStream_Reply? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get recordId => $_getN(0);
  @$pb.TagNumber(2)
  set recordId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(2)
  void clearRecordId() => clearField(2);
}

class StartRecordStream extends $pb.GeneratedMessage {
  factory StartRecordStream({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  StartRecordStream._() : super();
  factory StartRecordStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartRecordStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartRecordStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(287, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartRecordStream clone() => StartRecordStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartRecordStream copyWith(void Function(StartRecordStream) updates) => super.copyWith((message) => updates(message as StartRecordStream)) as StartRecordStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecordStream create() => StartRecordStream._();
  StartRecordStream createEmptyInstance() => create();
  static $pb.PbList<StartRecordStream> createRepeated() => $pb.PbList<StartRecordStream>();
  @$core.pragma('dart2js:noInline')
  static StartRecordStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartRecordStream>(create);
  static StartRecordStream? _defaultInstance;

  @$pb.TagNumber(287)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(287)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(287)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(287)
  void clearID() => clearField(287);
}

class StopRecordStream_Request extends $pb.GeneratedMessage {
  factory StopRecordStream_Request({
    $core.List<$core.int>? recordId,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    return $result;
  }
  StopRecordStream_Request._() : super();
  factory StopRecordStream_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopRecordStream_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopRecordStream.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopRecordStream_Request clone() => StopRecordStream_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopRecordStream_Request copyWith(void Function(StopRecordStream_Request) updates) => super.copyWith((message) => updates(message as StopRecordStream_Request)) as StopRecordStream_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecordStream_Request create() => StopRecordStream_Request._();
  StopRecordStream_Request createEmptyInstance() => create();
  static $pb.PbList<StopRecordStream_Request> createRepeated() => $pb.PbList<StopRecordStream_Request>();
  @$core.pragma('dart2js:noInline')
  static StopRecordStream_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopRecordStream_Request>(create);
  static StopRecordStream_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get recordId => $_getN(0);
  @$pb.TagNumber(1)
  set recordId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => clearField(1);
}

class StopRecordStream_Reply extends $pb.GeneratedMessage {
  factory StopRecordStream_Reply({
    $core.String? urlDownload,
    $core.int? duration,
  }) {
    final $result = create();
    if (urlDownload != null) {
      $result.urlDownload = urlDownload;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  StopRecordStream_Reply._() : super();
  factory StopRecordStream_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopRecordStream_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopRecordStream.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'urlDownload')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopRecordStream_Reply clone() => StopRecordStream_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopRecordStream_Reply copyWith(void Function(StopRecordStream_Reply) updates) => super.copyWith((message) => updates(message as StopRecordStream_Reply)) as StopRecordStream_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecordStream_Reply create() => StopRecordStream_Reply._();
  StopRecordStream_Reply createEmptyInstance() => create();
  static $pb.PbList<StopRecordStream_Reply> createRepeated() => $pb.PbList<StopRecordStream_Reply>();
  @$core.pragma('dart2js:noInline')
  static StopRecordStream_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopRecordStream_Reply>(create);
  static StopRecordStream_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get urlDownload => $_getSZ(0);
  @$pb.TagNumber(1)
  set urlDownload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrlDownload() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrlDownload() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);
}

class StopRecordStream extends $pb.GeneratedMessage {
  factory StopRecordStream({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  StopRecordStream._() : super();
  factory StopRecordStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopRecordStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopRecordStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(288, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopRecordStream clone() => StopRecordStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopRecordStream copyWith(void Function(StopRecordStream) updates) => super.copyWith((message) => updates(message as StopRecordStream)) as StopRecordStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecordStream create() => StopRecordStream._();
  StopRecordStream createEmptyInstance() => create();
  static $pb.PbList<StopRecordStream> createRepeated() => $pb.PbList<StopRecordStream>();
  @$core.pragma('dart2js:noInline')
  static StopRecordStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopRecordStream>(create);
  static StopRecordStream? _defaultInstance;

  @$pb.TagNumber(288)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(288)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(288)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(288)
  void clearID() => clearField(288);
}

class ReceiveRecordStreamDone extends $pb.GeneratedMessage {
  factory ReceiveRecordStreamDone({
    $core.String? urlDownload,
    $core.int? duration,
    $core.int? rECEIVERECORDSTREAMDONE,
  }) {
    final $result = create();
    if (urlDownload != null) {
      $result.urlDownload = urlDownload;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (rECEIVERECORDSTREAMDONE != null) {
      $result.rECEIVERECORDSTREAMDONE = rECEIVERECORDSTREAMDONE;
    }
    return $result;
  }
  ReceiveRecordStreamDone._() : super();
  factory ReceiveRecordStreamDone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveRecordStreamDone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveRecordStreamDone', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'urlDownload')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
    ..a<$core.int>(289, _omitFieldNames ? '' : 'RECEIVERECORDSTREAMDONE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_RECORD_STREAM_DONE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveRecordStreamDone clone() => ReceiveRecordStreamDone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveRecordStreamDone copyWith(void Function(ReceiveRecordStreamDone) updates) => super.copyWith((message) => updates(message as ReceiveRecordStreamDone)) as ReceiveRecordStreamDone;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveRecordStreamDone create() => ReceiveRecordStreamDone._();
  ReceiveRecordStreamDone createEmptyInstance() => create();
  static $pb.PbList<ReceiveRecordStreamDone> createRepeated() => $pb.PbList<ReceiveRecordStreamDone>();
  @$core.pragma('dart2js:noInline')
  static ReceiveRecordStreamDone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveRecordStreamDone>(create);
  static ReceiveRecordStreamDone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get urlDownload => $_getSZ(0);
  @$pb.TagNumber(1)
  set urlDownload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrlDownload() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrlDownload() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(289)
  $core.int get rECEIVERECORDSTREAMDONE => $_getIZ(2);
  @$pb.TagNumber(289)
  set rECEIVERECORDSTREAMDONE($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(289)
  $core.bool hasRECEIVERECORDSTREAMDONE() => $_has(2);
  @$pb.TagNumber(289)
  void clearRECEIVERECORDSTREAMDONE() => clearField(289);
}

class MarkReadAllNotification_Request extends $pb.GeneratedMessage {
  factory MarkReadAllNotification_Request() => create();
  MarkReadAllNotification_Request._() : super();
  factory MarkReadAllNotification_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkReadAllNotification_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkReadAllNotification.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkReadAllNotification_Request clone() => MarkReadAllNotification_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkReadAllNotification_Request copyWith(void Function(MarkReadAllNotification_Request) updates) => super.copyWith((message) => updates(message as MarkReadAllNotification_Request)) as MarkReadAllNotification_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkReadAllNotification_Request create() => MarkReadAllNotification_Request._();
  MarkReadAllNotification_Request createEmptyInstance() => create();
  static $pb.PbList<MarkReadAllNotification_Request> createRepeated() => $pb.PbList<MarkReadAllNotification_Request>();
  @$core.pragma('dart2js:noInline')
  static MarkReadAllNotification_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkReadAllNotification_Request>(create);
  static MarkReadAllNotification_Request? _defaultInstance;
}

class MarkReadAllNotification_Reply extends $pb.GeneratedMessage {
  factory MarkReadAllNotification_Reply() => create();
  MarkReadAllNotification_Reply._() : super();
  factory MarkReadAllNotification_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkReadAllNotification_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkReadAllNotification.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkReadAllNotification_Reply clone() => MarkReadAllNotification_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkReadAllNotification_Reply copyWith(void Function(MarkReadAllNotification_Reply) updates) => super.copyWith((message) => updates(message as MarkReadAllNotification_Reply)) as MarkReadAllNotification_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkReadAllNotification_Reply create() => MarkReadAllNotification_Reply._();
  MarkReadAllNotification_Reply createEmptyInstance() => create();
  static $pb.PbList<MarkReadAllNotification_Reply> createRepeated() => $pb.PbList<MarkReadAllNotification_Reply>();
  @$core.pragma('dart2js:noInline')
  static MarkReadAllNotification_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkReadAllNotification_Reply>(create);
  static MarkReadAllNotification_Reply? _defaultInstance;
}

/// / Đánh dấu ALL message đã được đọc
class MarkReadAllNotification extends $pb.GeneratedMessage {
  factory MarkReadAllNotification({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  MarkReadAllNotification._() : super();
  factory MarkReadAllNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkReadAllNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkReadAllNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(290, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkReadAllNotification clone() => MarkReadAllNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkReadAllNotification copyWith(void Function(MarkReadAllNotification) updates) => super.copyWith((message) => updates(message as MarkReadAllNotification)) as MarkReadAllNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkReadAllNotification create() => MarkReadAllNotification._();
  MarkReadAllNotification createEmptyInstance() => create();
  static $pb.PbList<MarkReadAllNotification> createRepeated() => $pb.PbList<MarkReadAllNotification>();
  @$core.pragma('dart2js:noInline')
  static MarkReadAllNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkReadAllNotification>(create);
  static MarkReadAllNotification? _defaultInstance;

  @$pb.TagNumber(290)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(290)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(290)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(290)
  void clearID() => clearField(290);
}

class ConfigOnOffBarrier_Request extends $pb.GeneratedMessage {
  factory ConfigOnOffBarrier_Request({
    $core.bool? on,
    $core.String? startTime,
    $core.String? endTime,
  }) {
    final $result = create();
    if (on != null) {
      $result.on = on;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    return $result;
  }
  ConfigOnOffBarrier_Request._() : super();
  factory ConfigOnOffBarrier_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigOnOffBarrier_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigOnOffBarrier.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOS(2, _omitFieldNames ? '' : 'startTime')
    ..aOS(3, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigOnOffBarrier_Request clone() => ConfigOnOffBarrier_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigOnOffBarrier_Request copyWith(void Function(ConfigOnOffBarrier_Request) updates) => super.copyWith((message) => updates(message as ConfigOnOffBarrier_Request)) as ConfigOnOffBarrier_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigOnOffBarrier_Request create() => ConfigOnOffBarrier_Request._();
  ConfigOnOffBarrier_Request createEmptyInstance() => create();
  static $pb.PbList<ConfigOnOffBarrier_Request> createRepeated() => $pb.PbList<ConfigOnOffBarrier_Request>();
  @$core.pragma('dart2js:noInline')
  static ConfigOnOffBarrier_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigOnOffBarrier_Request>(create);
  static ConfigOnOffBarrier_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get startTime => $_getSZ(1);
  @$pb.TagNumber(2)
  set startTime($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get endTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set endTime($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);
}

class ConfigOnOffBarrier_Reply extends $pb.GeneratedMessage {
  factory ConfigOnOffBarrier_Reply({
    $core.bool? on,
    $core.String? startTime,
    $core.String? endTime,
  }) {
    final $result = create();
    if (on != null) {
      $result.on = on;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    return $result;
  }
  ConfigOnOffBarrier_Reply._() : super();
  factory ConfigOnOffBarrier_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigOnOffBarrier_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigOnOffBarrier.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOS(2, _omitFieldNames ? '' : 'startTime')
    ..aOS(3, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigOnOffBarrier_Reply clone() => ConfigOnOffBarrier_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigOnOffBarrier_Reply copyWith(void Function(ConfigOnOffBarrier_Reply) updates) => super.copyWith((message) => updates(message as ConfigOnOffBarrier_Reply)) as ConfigOnOffBarrier_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigOnOffBarrier_Reply create() => ConfigOnOffBarrier_Reply._();
  ConfigOnOffBarrier_Reply createEmptyInstance() => create();
  static $pb.PbList<ConfigOnOffBarrier_Reply> createRepeated() => $pb.PbList<ConfigOnOffBarrier_Reply>();
  @$core.pragma('dart2js:noInline')
  static ConfigOnOffBarrier_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigOnOffBarrier_Reply>(create);
  static ConfigOnOffBarrier_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get startTime => $_getSZ(1);
  @$pb.TagNumber(2)
  set startTime($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get endTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set endTime($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);
}

/// / Cấu hình tự động đóng mở barrier trong khoảng thời gian --> sử dụng hệ thống VNPT NET
class ConfigOnOffBarrier extends $pb.GeneratedMessage {
  factory ConfigOnOffBarrier({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ConfigOnOffBarrier._() : super();
  factory ConfigOnOffBarrier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigOnOffBarrier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigOnOffBarrier', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(291, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigOnOffBarrier clone() => ConfigOnOffBarrier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigOnOffBarrier copyWith(void Function(ConfigOnOffBarrier) updates) => super.copyWith((message) => updates(message as ConfigOnOffBarrier)) as ConfigOnOffBarrier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigOnOffBarrier create() => ConfigOnOffBarrier._();
  ConfigOnOffBarrier createEmptyInstance() => create();
  static $pb.PbList<ConfigOnOffBarrier> createRepeated() => $pb.PbList<ConfigOnOffBarrier>();
  @$core.pragma('dart2js:noInline')
  static ConfigOnOffBarrier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigOnOffBarrier>(create);
  static ConfigOnOffBarrier? _defaultInstance;

  @$pb.TagNumber(291)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(291)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(291)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(291)
  void clearID() => clearField(291);
}

class ReceiveConfigOnOffBarrier extends $pb.GeneratedMessage {
  factory ReceiveConfigOnOffBarrier({
    $core.bool? on,
    $core.String? startTime,
    $core.String? endTime,
    $core.int? rECEIVECONFIGONOFFBARRIER,
  }) {
    final $result = create();
    if (on != null) {
      $result.on = on;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (rECEIVECONFIGONOFFBARRIER != null) {
      $result.rECEIVECONFIGONOFFBARRIER = rECEIVECONFIGONOFFBARRIER;
    }
    return $result;
  }
  ReceiveConfigOnOffBarrier._() : super();
  factory ReceiveConfigOnOffBarrier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveConfigOnOffBarrier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveConfigOnOffBarrier', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOS(2, _omitFieldNames ? '' : 'startTime')
    ..aOS(3, _omitFieldNames ? '' : 'endTime')
    ..a<$core.int>(62, _omitFieldNames ? '' : 'RECEIVECONFIGONOFFBARRIER', $pb.PbFieldType.OU3, protoName: 'RECEIVE_CONFIG_ON_OFF_BARRIER')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveConfigOnOffBarrier clone() => ReceiveConfigOnOffBarrier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveConfigOnOffBarrier copyWith(void Function(ReceiveConfigOnOffBarrier) updates) => super.copyWith((message) => updates(message as ReceiveConfigOnOffBarrier)) as ReceiveConfigOnOffBarrier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveConfigOnOffBarrier create() => ReceiveConfigOnOffBarrier._();
  ReceiveConfigOnOffBarrier createEmptyInstance() => create();
  static $pb.PbList<ReceiveConfigOnOffBarrier> createRepeated() => $pb.PbList<ReceiveConfigOnOffBarrier>();
  @$core.pragma('dart2js:noInline')
  static ReceiveConfigOnOffBarrier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveConfigOnOffBarrier>(create);
  static ReceiveConfigOnOffBarrier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get startTime => $_getSZ(1);
  @$pb.TagNumber(2)
  set startTime($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get endTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set endTime($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);

  @$pb.TagNumber(62)
  $core.int get rECEIVECONFIGONOFFBARRIER => $_getIZ(3);
  @$pb.TagNumber(62)
  set rECEIVECONFIGONOFFBARRIER($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(62)
  $core.bool hasRECEIVECONFIGONOFFBARRIER() => $_has(3);
  @$pb.TagNumber(62)
  void clearRECEIVECONFIGONOFFBARRIER() => clearField(62);
}

class ListVehicle_Request extends $pb.GeneratedMessage {
  factory ListVehicle_Request({
    $core.String? keyword,
  }) {
    final $result = create();
    if (keyword != null) {
      $result.keyword = keyword;
    }
    return $result;
  }
  ListVehicle_Request._() : super();
  factory ListVehicle_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVehicle_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVehicle.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keyword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVehicle_Request clone() => ListVehicle_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVehicle_Request copyWith(void Function(ListVehicle_Request) updates) => super.copyWith((message) => updates(message as ListVehicle_Request)) as ListVehicle_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVehicle_Request create() => ListVehicle_Request._();
  ListVehicle_Request createEmptyInstance() => create();
  static $pb.PbList<ListVehicle_Request> createRepeated() => $pb.PbList<ListVehicle_Request>();
  @$core.pragma('dart2js:noInline')
  static ListVehicle_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVehicle_Request>(create);
  static ListVehicle_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyword => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyword($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKeyword() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyword() => clearField(1);
}

class ListVehicle_Reply extends $pb.GeneratedMessage {
  factory ListVehicle_Reply({
    $core.Iterable<$1.Vehicle>? vehicles,
  }) {
    final $result = create();
    if (vehicles != null) {
      $result.vehicles.addAll(vehicles);
    }
    return $result;
  }
  ListVehicle_Reply._() : super();
  factory ListVehicle_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVehicle_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVehicle.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Vehicle>(1, _omitFieldNames ? '' : 'vehicles', $pb.PbFieldType.PM, subBuilder: $1.Vehicle.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVehicle_Reply clone() => ListVehicle_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVehicle_Reply copyWith(void Function(ListVehicle_Reply) updates) => super.copyWith((message) => updates(message as ListVehicle_Reply)) as ListVehicle_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVehicle_Reply create() => ListVehicle_Reply._();
  ListVehicle_Reply createEmptyInstance() => create();
  static $pb.PbList<ListVehicle_Reply> createRepeated() => $pb.PbList<ListVehicle_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListVehicle_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVehicle_Reply>(create);
  static ListVehicle_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Vehicle> get vehicles => $_getList(0);
}

/// / Lấy danh sách phương tiện
class ListVehicle extends $pb.GeneratedMessage {
  factory ListVehicle({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListVehicle._() : super();
  factory ListVehicle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVehicle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVehicle', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(292, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVehicle clone() => ListVehicle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVehicle copyWith(void Function(ListVehicle) updates) => super.copyWith((message) => updates(message as ListVehicle)) as ListVehicle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVehicle create() => ListVehicle._();
  ListVehicle createEmptyInstance() => create();
  static $pb.PbList<ListVehicle> createRepeated() => $pb.PbList<ListVehicle>();
  @$core.pragma('dart2js:noInline')
  static ListVehicle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVehicle>(create);
  static ListVehicle? _defaultInstance;

  @$pb.TagNumber(292)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(292)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(292)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(292)
  void clearID() => clearField(292);
}

class UpdateInfoVehicle_Request extends $pb.GeneratedMessage {
  factory UpdateInfoVehicle_Request({
    $1.Vehicle? vehicle,
  }) {
    final $result = create();
    if (vehicle != null) {
      $result.vehicle = vehicle;
    }
    return $result;
  }
  UpdateInfoVehicle_Request._() : super();
  factory UpdateInfoVehicle_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInfoVehicle_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInfoVehicle.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Vehicle>(1, _omitFieldNames ? '' : 'vehicle', subBuilder: $1.Vehicle.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInfoVehicle_Request clone() => UpdateInfoVehicle_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInfoVehicle_Request copyWith(void Function(UpdateInfoVehicle_Request) updates) => super.copyWith((message) => updates(message as UpdateInfoVehicle_Request)) as UpdateInfoVehicle_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInfoVehicle_Request create() => UpdateInfoVehicle_Request._();
  UpdateInfoVehicle_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateInfoVehicle_Request> createRepeated() => $pb.PbList<UpdateInfoVehicle_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateInfoVehicle_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInfoVehicle_Request>(create);
  static UpdateInfoVehicle_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Vehicle get vehicle => $_getN(0);
  @$pb.TagNumber(1)
  set vehicle($1.Vehicle v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVehicle() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicle() => clearField(1);
  @$pb.TagNumber(1)
  $1.Vehicle ensureVehicle() => $_ensure(0);
}

class UpdateInfoVehicle_Reply extends $pb.GeneratedMessage {
  factory UpdateInfoVehicle_Reply({
    $1.Vehicle? vehicle,
  }) {
    final $result = create();
    if (vehicle != null) {
      $result.vehicle = vehicle;
    }
    return $result;
  }
  UpdateInfoVehicle_Reply._() : super();
  factory UpdateInfoVehicle_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInfoVehicle_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInfoVehicle.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Vehicle>(1, _omitFieldNames ? '' : 'vehicle', subBuilder: $1.Vehicle.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInfoVehicle_Reply clone() => UpdateInfoVehicle_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInfoVehicle_Reply copyWith(void Function(UpdateInfoVehicle_Reply) updates) => super.copyWith((message) => updates(message as UpdateInfoVehicle_Reply)) as UpdateInfoVehicle_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInfoVehicle_Reply create() => UpdateInfoVehicle_Reply._();
  UpdateInfoVehicle_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateInfoVehicle_Reply> createRepeated() => $pb.PbList<UpdateInfoVehicle_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateInfoVehicle_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInfoVehicle_Reply>(create);
  static UpdateInfoVehicle_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Vehicle get vehicle => $_getN(0);
  @$pb.TagNumber(1)
  set vehicle($1.Vehicle v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVehicle() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicle() => clearField(1);
  @$pb.TagNumber(1)
  $1.Vehicle ensureVehicle() => $_ensure(0);
}

/// / Cập nhật thông tin phương tiện
class UpdateInfoVehicle extends $pb.GeneratedMessage {
  factory UpdateInfoVehicle({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateInfoVehicle._() : super();
  factory UpdateInfoVehicle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInfoVehicle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInfoVehicle', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(293, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInfoVehicle clone() => UpdateInfoVehicle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInfoVehicle copyWith(void Function(UpdateInfoVehicle) updates) => super.copyWith((message) => updates(message as UpdateInfoVehicle)) as UpdateInfoVehicle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInfoVehicle create() => UpdateInfoVehicle._();
  UpdateInfoVehicle createEmptyInstance() => create();
  static $pb.PbList<UpdateInfoVehicle> createRepeated() => $pb.PbList<UpdateInfoVehicle>();
  @$core.pragma('dart2js:noInline')
  static UpdateInfoVehicle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInfoVehicle>(create);
  static UpdateInfoVehicle? _defaultInstance;

  @$pb.TagNumber(293)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(293)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(293)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(293)
  void clearID() => clearField(293);
}

class AddVehicle_Request extends $pb.GeneratedMessage {
  factory AddVehicle_Request({
    $core.Iterable<$1.Vehicle>? vehicles,
  }) {
    final $result = create();
    if (vehicles != null) {
      $result.vehicles.addAll(vehicles);
    }
    return $result;
  }
  AddVehicle_Request._() : super();
  factory AddVehicle_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddVehicle_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddVehicle.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Vehicle>(1, _omitFieldNames ? '' : 'vehicles', $pb.PbFieldType.PM, subBuilder: $1.Vehicle.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddVehicle_Request clone() => AddVehicle_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddVehicle_Request copyWith(void Function(AddVehicle_Request) updates) => super.copyWith((message) => updates(message as AddVehicle_Request)) as AddVehicle_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddVehicle_Request create() => AddVehicle_Request._();
  AddVehicle_Request createEmptyInstance() => create();
  static $pb.PbList<AddVehicle_Request> createRepeated() => $pb.PbList<AddVehicle_Request>();
  @$core.pragma('dart2js:noInline')
  static AddVehicle_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddVehicle_Request>(create);
  static AddVehicle_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Vehicle> get vehicles => $_getList(0);
}

class AddVehicle_Reply extends $pb.GeneratedMessage {
  factory AddVehicle_Reply({
    $core.Iterable<$1.Vehicle>? vehicles,
  }) {
    final $result = create();
    if (vehicles != null) {
      $result.vehicles.addAll(vehicles);
    }
    return $result;
  }
  AddVehicle_Reply._() : super();
  factory AddVehicle_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddVehicle_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddVehicle.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Vehicle>(1, _omitFieldNames ? '' : 'vehicles', $pb.PbFieldType.PM, subBuilder: $1.Vehicle.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddVehicle_Reply clone() => AddVehicle_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddVehicle_Reply copyWith(void Function(AddVehicle_Reply) updates) => super.copyWith((message) => updates(message as AddVehicle_Reply)) as AddVehicle_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddVehicle_Reply create() => AddVehicle_Reply._();
  AddVehicle_Reply createEmptyInstance() => create();
  static $pb.PbList<AddVehicle_Reply> createRepeated() => $pb.PbList<AddVehicle_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddVehicle_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddVehicle_Reply>(create);
  static AddVehicle_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Vehicle> get vehicles => $_getList(0);
}

/// / Thêm phương tiện
class AddVehicle extends $pb.GeneratedMessage {
  factory AddVehicle({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddVehicle._() : super();
  factory AddVehicle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddVehicle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddVehicle', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(294, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddVehicle clone() => AddVehicle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddVehicle copyWith(void Function(AddVehicle) updates) => super.copyWith((message) => updates(message as AddVehicle)) as AddVehicle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddVehicle create() => AddVehicle._();
  AddVehicle createEmptyInstance() => create();
  static $pb.PbList<AddVehicle> createRepeated() => $pb.PbList<AddVehicle>();
  @$core.pragma('dart2js:noInline')
  static AddVehicle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddVehicle>(create);
  static AddVehicle? _defaultInstance;

  @$pb.TagNumber(294)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(294)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(294)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(294)
  void clearID() => clearField(294);
}

class DeleteVehicle_Request extends $pb.GeneratedMessage {
  factory DeleteVehicle_Request({
    $core.List<$core.int>? vehicleId,
  }) {
    final $result = create();
    if (vehicleId != null) {
      $result.vehicleId = vehicleId;
    }
    return $result;
  }
  DeleteVehicle_Request._() : super();
  factory DeleteVehicle_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteVehicle_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteVehicle.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'vehicleId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteVehicle_Request clone() => DeleteVehicle_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteVehicle_Request copyWith(void Function(DeleteVehicle_Request) updates) => super.copyWith((message) => updates(message as DeleteVehicle_Request)) as DeleteVehicle_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteVehicle_Request create() => DeleteVehicle_Request._();
  DeleteVehicle_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteVehicle_Request> createRepeated() => $pb.PbList<DeleteVehicle_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteVehicle_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteVehicle_Request>(create);
  static DeleteVehicle_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get vehicleId => $_getN(0);
  @$pb.TagNumber(1)
  set vehicleId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVehicleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicleId() => clearField(1);
}

class DeleteVehicle_Reply extends $pb.GeneratedMessage {
  factory DeleteVehicle_Reply() => create();
  DeleteVehicle_Reply._() : super();
  factory DeleteVehicle_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteVehicle_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteVehicle.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteVehicle_Reply clone() => DeleteVehicle_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteVehicle_Reply copyWith(void Function(DeleteVehicle_Reply) updates) => super.copyWith((message) => updates(message as DeleteVehicle_Reply)) as DeleteVehicle_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteVehicle_Reply create() => DeleteVehicle_Reply._();
  DeleteVehicle_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteVehicle_Reply> createRepeated() => $pb.PbList<DeleteVehicle_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteVehicle_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteVehicle_Reply>(create);
  static DeleteVehicle_Reply? _defaultInstance;
}

/// / Xóa phương tiện
class DeleteVehicle extends $pb.GeneratedMessage {
  factory DeleteVehicle({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteVehicle._() : super();
  factory DeleteVehicle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteVehicle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteVehicle', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(295, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteVehicle clone() => DeleteVehicle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteVehicle copyWith(void Function(DeleteVehicle) updates) => super.copyWith((message) => updates(message as DeleteVehicle)) as DeleteVehicle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteVehicle create() => DeleteVehicle._();
  DeleteVehicle createEmptyInstance() => create();
  static $pb.PbList<DeleteVehicle> createRepeated() => $pb.PbList<DeleteVehicle>();
  @$core.pragma('dart2js:noInline')
  static DeleteVehicle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteVehicle>(create);
  static DeleteVehicle? _defaultInstance;

  @$pb.TagNumber(295)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(295)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(295)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(295)
  void clearID() => clearField(295);
}

class GetConfigBarrier_Request extends $pb.GeneratedMessage {
  factory GetConfigBarrier_Request() => create();
  GetConfigBarrier_Request._() : super();
  factory GetConfigBarrier_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConfigBarrier_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetConfigBarrier.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConfigBarrier_Request clone() => GetConfigBarrier_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConfigBarrier_Request copyWith(void Function(GetConfigBarrier_Request) updates) => super.copyWith((message) => updates(message as GetConfigBarrier_Request)) as GetConfigBarrier_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConfigBarrier_Request create() => GetConfigBarrier_Request._();
  GetConfigBarrier_Request createEmptyInstance() => create();
  static $pb.PbList<GetConfigBarrier_Request> createRepeated() => $pb.PbList<GetConfigBarrier_Request>();
  @$core.pragma('dart2js:noInline')
  static GetConfigBarrier_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConfigBarrier_Request>(create);
  static GetConfigBarrier_Request? _defaultInstance;
}

class GetConfigBarrier_Reply extends $pb.GeneratedMessage {
  factory GetConfigBarrier_Reply({
    $1.ConfigBarrier? config,
    $core.int? carIn,
    $core.int? carOut,
  }) {
    final $result = create();
    if (config != null) {
      $result.config = config;
    }
    if (carIn != null) {
      $result.carIn = carIn;
    }
    if (carOut != null) {
      $result.carOut = carOut;
    }
    return $result;
  }
  GetConfigBarrier_Reply._() : super();
  factory GetConfigBarrier_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConfigBarrier_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetConfigBarrier.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.ConfigBarrier>(1, _omitFieldNames ? '' : 'config', subBuilder: $1.ConfigBarrier.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'carIn', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'carOut', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConfigBarrier_Reply clone() => GetConfigBarrier_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConfigBarrier_Reply copyWith(void Function(GetConfigBarrier_Reply) updates) => super.copyWith((message) => updates(message as GetConfigBarrier_Reply)) as GetConfigBarrier_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConfigBarrier_Reply create() => GetConfigBarrier_Reply._();
  GetConfigBarrier_Reply createEmptyInstance() => create();
  static $pb.PbList<GetConfigBarrier_Reply> createRepeated() => $pb.PbList<GetConfigBarrier_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetConfigBarrier_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConfigBarrier_Reply>(create);
  static GetConfigBarrier_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ConfigBarrier get config => $_getN(0);
  @$pb.TagNumber(1)
  set config($1.ConfigBarrier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  $1.ConfigBarrier ensureConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get carIn => $_getIZ(1);
  @$pb.TagNumber(2)
  set carIn($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCarIn() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarIn() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get carOut => $_getIZ(2);
  @$pb.TagNumber(3)
  set carOut($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCarOut() => $_has(2);
  @$pb.TagNumber(3)
  void clearCarOut() => clearField(3);
}

/// / Lấy thông tin cấu hình --> sử dụng hệ thống VNPT NET
class GetConfigBarrier extends $pb.GeneratedMessage {
  factory GetConfigBarrier({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetConfigBarrier._() : super();
  factory GetConfigBarrier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConfigBarrier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetConfigBarrier', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(296, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConfigBarrier clone() => GetConfigBarrier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConfigBarrier copyWith(void Function(GetConfigBarrier) updates) => super.copyWith((message) => updates(message as GetConfigBarrier)) as GetConfigBarrier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConfigBarrier create() => GetConfigBarrier._();
  GetConfigBarrier createEmptyInstance() => create();
  static $pb.PbList<GetConfigBarrier> createRepeated() => $pb.PbList<GetConfigBarrier>();
  @$core.pragma('dart2js:noInline')
  static GetConfigBarrier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConfigBarrier>(create);
  static GetConfigBarrier? _defaultInstance;

  @$pb.TagNumber(296)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(296)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(296)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(296)
  void clearID() => clearField(296);
}

class ConfigInOutCam_Request extends $pb.GeneratedMessage {
  factory ConfigInOutCam_Request({
    $1.InOutCam? inOutCar,
    $1.InOutCam? inOutBike,
  }) {
    final $result = create();
    if (inOutCar != null) {
      $result.inOutCar = inOutCar;
    }
    if (inOutBike != null) {
      $result.inOutBike = inOutBike;
    }
    return $result;
  }
  ConfigInOutCam_Request._() : super();
  factory ConfigInOutCam_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigInOutCam_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigInOutCam.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.InOutCam>(1, _omitFieldNames ? '' : 'inOutCar', subBuilder: $1.InOutCam.create)
    ..aOM<$1.InOutCam>(2, _omitFieldNames ? '' : 'inOutBike', subBuilder: $1.InOutCam.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigInOutCam_Request clone() => ConfigInOutCam_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigInOutCam_Request copyWith(void Function(ConfigInOutCam_Request) updates) => super.copyWith((message) => updates(message as ConfigInOutCam_Request)) as ConfigInOutCam_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigInOutCam_Request create() => ConfigInOutCam_Request._();
  ConfigInOutCam_Request createEmptyInstance() => create();
  static $pb.PbList<ConfigInOutCam_Request> createRepeated() => $pb.PbList<ConfigInOutCam_Request>();
  @$core.pragma('dart2js:noInline')
  static ConfigInOutCam_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigInOutCam_Request>(create);
  static ConfigInOutCam_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $1.InOutCam get inOutCar => $_getN(0);
  @$pb.TagNumber(1)
  set inOutCar($1.InOutCam v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInOutCar() => $_has(0);
  @$pb.TagNumber(1)
  void clearInOutCar() => clearField(1);
  @$pb.TagNumber(1)
  $1.InOutCam ensureInOutCar() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.InOutCam get inOutBike => $_getN(1);
  @$pb.TagNumber(2)
  set inOutBike($1.InOutCam v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInOutBike() => $_has(1);
  @$pb.TagNumber(2)
  void clearInOutBike() => clearField(2);
  @$pb.TagNumber(2)
  $1.InOutCam ensureInOutBike() => $_ensure(1);
}

class ConfigInOutCam_Reply extends $pb.GeneratedMessage {
  factory ConfigInOutCam_Reply() => create();
  ConfigInOutCam_Reply._() : super();
  factory ConfigInOutCam_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigInOutCam_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigInOutCam.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigInOutCam_Reply clone() => ConfigInOutCam_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigInOutCam_Reply copyWith(void Function(ConfigInOutCam_Reply) updates) => super.copyWith((message) => updates(message as ConfigInOutCam_Reply)) as ConfigInOutCam_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigInOutCam_Reply create() => ConfigInOutCam_Reply._();
  ConfigInOutCam_Reply createEmptyInstance() => create();
  static $pb.PbList<ConfigInOutCam_Reply> createRepeated() => $pb.PbList<ConfigInOutCam_Reply>();
  @$core.pragma('dart2js:noInline')
  static ConfigInOutCam_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigInOutCam_Reply>(create);
  static ConfigInOutCam_Reply? _defaultInstance;
}

/// / Cấu hình cam vào ra --> sử dụng hệ thống VNPT NET
class ConfigInOutCam extends $pb.GeneratedMessage {
  factory ConfigInOutCam({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ConfigInOutCam._() : super();
  factory ConfigInOutCam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigInOutCam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigInOutCam', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(297, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigInOutCam clone() => ConfigInOutCam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigInOutCam copyWith(void Function(ConfigInOutCam) updates) => super.copyWith((message) => updates(message as ConfigInOutCam)) as ConfigInOutCam;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigInOutCam create() => ConfigInOutCam._();
  ConfigInOutCam createEmptyInstance() => create();
  static $pb.PbList<ConfigInOutCam> createRepeated() => $pb.PbList<ConfigInOutCam>();
  @$core.pragma('dart2js:noInline')
  static ConfigInOutCam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigInOutCam>(create);
  static ConfigInOutCam? _defaultInstance;

  @$pb.TagNumber(297)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(297)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(297)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(297)
  void clearID() => clearField(297);
}

class ConfigParkingLot_Request extends $pb.GeneratedMessage {
  factory ConfigParkingLot_Request({
    $core.int? parkingLots,
    $core.int? usedLots,
  }) {
    final $result = create();
    if (parkingLots != null) {
      $result.parkingLots = parkingLots;
    }
    if (usedLots != null) {
      $result.usedLots = usedLots;
    }
    return $result;
  }
  ConfigParkingLot_Request._() : super();
  factory ConfigParkingLot_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigParkingLot_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigParkingLot.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'parkingLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'usedLots', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigParkingLot_Request clone() => ConfigParkingLot_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigParkingLot_Request copyWith(void Function(ConfigParkingLot_Request) updates) => super.copyWith((message) => updates(message as ConfigParkingLot_Request)) as ConfigParkingLot_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigParkingLot_Request create() => ConfigParkingLot_Request._();
  ConfigParkingLot_Request createEmptyInstance() => create();
  static $pb.PbList<ConfigParkingLot_Request> createRepeated() => $pb.PbList<ConfigParkingLot_Request>();
  @$core.pragma('dart2js:noInline')
  static ConfigParkingLot_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigParkingLot_Request>(create);
  static ConfigParkingLot_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get parkingLots => $_getIZ(0);
  @$pb.TagNumber(1)
  set parkingLots($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParkingLots() => $_has(0);
  @$pb.TagNumber(1)
  void clearParkingLots() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get usedLots => $_getIZ(1);
  @$pb.TagNumber(2)
  set usedLots($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsedLots() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsedLots() => clearField(2);
}

class ConfigParkingLot_Reply extends $pb.GeneratedMessage {
  factory ConfigParkingLot_Reply({
    $core.int? parkingLots,
    $core.int? usedLots,
    $core.int? availableLots,
    $core.int? carIn,
    $core.int? carOut,
  }) {
    final $result = create();
    if (parkingLots != null) {
      $result.parkingLots = parkingLots;
    }
    if (usedLots != null) {
      $result.usedLots = usedLots;
    }
    if (availableLots != null) {
      $result.availableLots = availableLots;
    }
    if (carIn != null) {
      $result.carIn = carIn;
    }
    if (carOut != null) {
      $result.carOut = carOut;
    }
    return $result;
  }
  ConfigParkingLot_Reply._() : super();
  factory ConfigParkingLot_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigParkingLot_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigParkingLot.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'parkingLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'usedLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'availableLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'carIn', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'carOut', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigParkingLot_Reply clone() => ConfigParkingLot_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigParkingLot_Reply copyWith(void Function(ConfigParkingLot_Reply) updates) => super.copyWith((message) => updates(message as ConfigParkingLot_Reply)) as ConfigParkingLot_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigParkingLot_Reply create() => ConfigParkingLot_Reply._();
  ConfigParkingLot_Reply createEmptyInstance() => create();
  static $pb.PbList<ConfigParkingLot_Reply> createRepeated() => $pb.PbList<ConfigParkingLot_Reply>();
  @$core.pragma('dart2js:noInline')
  static ConfigParkingLot_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigParkingLot_Reply>(create);
  static ConfigParkingLot_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get parkingLots => $_getIZ(0);
  @$pb.TagNumber(1)
  set parkingLots($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParkingLots() => $_has(0);
  @$pb.TagNumber(1)
  void clearParkingLots() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get usedLots => $_getIZ(1);
  @$pb.TagNumber(2)
  set usedLots($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsedLots() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsedLots() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get availableLots => $_getIZ(2);
  @$pb.TagNumber(3)
  set availableLots($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvailableLots() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvailableLots() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get carIn => $_getIZ(3);
  @$pb.TagNumber(4)
  set carIn($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCarIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarIn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get carOut => $_getIZ(4);
  @$pb.TagNumber(5)
  set carOut($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCarOut() => $_has(4);
  @$pb.TagNumber(5)
  void clearCarOut() => clearField(5);
}

/// / Cấu hình số chỗ trống --> sử dụng hệ thống VNPT NET
class ConfigParkingLot extends $pb.GeneratedMessage {
  factory ConfigParkingLot({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ConfigParkingLot._() : super();
  factory ConfigParkingLot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigParkingLot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigParkingLot', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(298, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigParkingLot clone() => ConfigParkingLot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigParkingLot copyWith(void Function(ConfigParkingLot) updates) => super.copyWith((message) => updates(message as ConfigParkingLot)) as ConfigParkingLot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigParkingLot create() => ConfigParkingLot._();
  ConfigParkingLot createEmptyInstance() => create();
  static $pb.PbList<ConfigParkingLot> createRepeated() => $pb.PbList<ConfigParkingLot>();
  @$core.pragma('dart2js:noInline')
  static ConfigParkingLot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigParkingLot>(create);
  static ConfigParkingLot? _defaultInstance;

  @$pb.TagNumber(298)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(298)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(298)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(298)
  void clearID() => clearField(298);
}

class ReceiveUpdateParkingLot extends $pb.GeneratedMessage {
  factory ReceiveUpdateParkingLot({
    $core.int? parkingLots,
    $core.int? usedLots,
    $core.int? availableLots,
    $core.int? carIn,
    $core.int? carOut,
    $core.int? rECEIVECONFIGONOFFBARRIER,
  }) {
    final $result = create();
    if (parkingLots != null) {
      $result.parkingLots = parkingLots;
    }
    if (usedLots != null) {
      $result.usedLots = usedLots;
    }
    if (availableLots != null) {
      $result.availableLots = availableLots;
    }
    if (carIn != null) {
      $result.carIn = carIn;
    }
    if (carOut != null) {
      $result.carOut = carOut;
    }
    if (rECEIVECONFIGONOFFBARRIER != null) {
      $result.rECEIVECONFIGONOFFBARRIER = rECEIVECONFIGONOFFBARRIER;
    }
    return $result;
  }
  ReceiveUpdateParkingLot._() : super();
  factory ReceiveUpdateParkingLot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateParkingLot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateParkingLot', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'parkingLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'usedLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'availableLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'carIn', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'carOut', $pb.PbFieldType.OU3)
    ..a<$core.int>(63, _omitFieldNames ? '' : 'RECEIVECONFIGONOFFBARRIER', $pb.PbFieldType.OU3, protoName: 'RECEIVE_CONFIG_ON_OFF_BARRIER')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateParkingLot clone() => ReceiveUpdateParkingLot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateParkingLot copyWith(void Function(ReceiveUpdateParkingLot) updates) => super.copyWith((message) => updates(message as ReceiveUpdateParkingLot)) as ReceiveUpdateParkingLot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateParkingLot create() => ReceiveUpdateParkingLot._();
  ReceiveUpdateParkingLot createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateParkingLot> createRepeated() => $pb.PbList<ReceiveUpdateParkingLot>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateParkingLot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateParkingLot>(create);
  static ReceiveUpdateParkingLot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get parkingLots => $_getIZ(0);
  @$pb.TagNumber(1)
  set parkingLots($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParkingLots() => $_has(0);
  @$pb.TagNumber(1)
  void clearParkingLots() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get usedLots => $_getIZ(1);
  @$pb.TagNumber(2)
  set usedLots($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsedLots() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsedLots() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get availableLots => $_getIZ(2);
  @$pb.TagNumber(3)
  set availableLots($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvailableLots() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvailableLots() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get carIn => $_getIZ(3);
  @$pb.TagNumber(4)
  set carIn($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCarIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarIn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get carOut => $_getIZ(4);
  @$pb.TagNumber(5)
  set carOut($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCarOut() => $_has(4);
  @$pb.TagNumber(5)
  void clearCarOut() => clearField(5);

  @$pb.TagNumber(63)
  $core.int get rECEIVECONFIGONOFFBARRIER => $_getIZ(5);
  @$pb.TagNumber(63)
  set rECEIVECONFIGONOFFBARRIER($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(63)
  $core.bool hasRECEIVECONFIGONOFFBARRIER() => $_has(5);
  @$pb.TagNumber(63)
  void clearRECEIVECONFIGONOFFBARRIER() => clearField(63);
}

class AddCameraRTMP_Request extends $pb.GeneratedMessage {
  factory AddCameraRTMP_Request({
    $core.String? name,
    $core.String? encoder,
    $core.int? bitrate,
    $core.int? framerate,
    $1.MapLocation? location,
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (encoder != null) {
      $result.encoder = encoder;
    }
    if (bitrate != null) {
      $result.bitrate = bitrate;
    }
    if (framerate != null) {
      $result.framerate = framerate;
    }
    if (location != null) {
      $result.location = location;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  AddCameraRTMP_Request._() : super();
  factory AddCameraRTMP_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraRTMP_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraRTMP.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'encoder')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'bitrate', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'framerate', $pb.PbFieldType.OU3)
    ..aOM<$1.MapLocation>(5, _omitFieldNames ? '' : 'location', subBuilder: $1.MapLocation.create)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraRTMP_Request clone() => AddCameraRTMP_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraRTMP_Request copyWith(void Function(AddCameraRTMP_Request) updates) => super.copyWith((message) => updates(message as AddCameraRTMP_Request)) as AddCameraRTMP_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraRTMP_Request create() => AddCameraRTMP_Request._();
  AddCameraRTMP_Request createEmptyInstance() => create();
  static $pb.PbList<AddCameraRTMP_Request> createRepeated() => $pb.PbList<AddCameraRTMP_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCameraRTMP_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraRTMP_Request>(create);
  static AddCameraRTMP_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get encoder => $_getSZ(1);
  @$pb.TagNumber(2)
  set encoder($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEncoder() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncoder() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get bitrate => $_getIZ(2);
  @$pb.TagNumber(3)
  set bitrate($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBitrate() => $_has(2);
  @$pb.TagNumber(3)
  void clearBitrate() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get framerate => $_getIZ(3);
  @$pb.TagNumber(4)
  set framerate($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFramerate() => $_has(3);
  @$pb.TagNumber(4)
  void clearFramerate() => clearField(4);

  @$pb.TagNumber(5)
  $1.MapLocation get location => $_getN(4);
  @$pb.TagNumber(5)
  set location($1.MapLocation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);
  @$pb.TagNumber(5)
  $1.MapLocation ensureLocation() => $_ensure(4);

  @$pb.TagNumber(7)
  $core.List<$core.int> get groupId => $_getN(5);
  @$pb.TagNumber(7)
  set groupId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasGroupId() => $_has(5);
  @$pb.TagNumber(7)
  void clearGroupId() => clearField(7);
}

class AddCameraRTMP_Reply extends $pb.GeneratedMessage {
  factory AddCameraRTMP_Reply({
    $core.List<$core.int>? cameraId,
    $1.Camera? camera,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  AddCameraRTMP_Reply._() : super();
  factory AddCameraRTMP_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraRTMP_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraRTMP.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraRTMP_Reply clone() => AddCameraRTMP_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraRTMP_Reply copyWith(void Function(AddCameraRTMP_Reply) updates) => super.copyWith((message) => updates(message as AddCameraRTMP_Reply)) as AddCameraRTMP_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraRTMP_Reply create() => AddCameraRTMP_Reply._();
  AddCameraRTMP_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCameraRTMP_Reply> createRepeated() => $pb.PbList<AddCameraRTMP_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCameraRTMP_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraRTMP_Reply>(create);
  static AddCameraRTMP_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Camera get camera => $_getN(1);
  @$pb.TagNumber(2)
  set camera($1.Camera v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCamera() => $_has(1);
  @$pb.TagNumber(2)
  void clearCamera() => clearField(2);
  @$pb.TagNumber(2)
  $1.Camera ensureCamera() => $_ensure(1);
}

class AddCameraRTMP extends $pb.GeneratedMessage {
  factory AddCameraRTMP({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCameraRTMP._() : super();
  factory AddCameraRTMP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraRTMP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraRTMP', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(299, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraRTMP clone() => AddCameraRTMP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraRTMP copyWith(void Function(AddCameraRTMP) updates) => super.copyWith((message) => updates(message as AddCameraRTMP)) as AddCameraRTMP;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraRTMP create() => AddCameraRTMP._();
  AddCameraRTMP createEmptyInstance() => create();
  static $pb.PbList<AddCameraRTMP> createRepeated() => $pb.PbList<AddCameraRTMP>();
  @$core.pragma('dart2js:noInline')
  static AddCameraRTMP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraRTMP>(create);
  static AddCameraRTMP? _defaultInstance;

  @$pb.TagNumber(299)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(299)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(299)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(299)
  void clearID() => clearField(299);
}

class ReceiveStatusCamera extends $pb.GeneratedMessage {
  factory ReceiveStatusCamera({
    $core.Iterable<$1.Camera>? camera,
    $core.int? rECEIVESTATUSCAMERA,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera.addAll(camera);
    }
    if (rECEIVESTATUSCAMERA != null) {
      $result.rECEIVESTATUSCAMERA = rECEIVESTATUSCAMERA;
    }
    return $result;
  }
  ReceiveStatusCamera._() : super();
  factory ReceiveStatusCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveStatusCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveStatusCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'camera', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..a<$core.int>(1300, _omitFieldNames ? '' : 'RECEIVESTATUSCAMERA', $pb.PbFieldType.OU3, protoName: 'RECEIVE_STATUS_CAMERA')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveStatusCamera clone() => ReceiveStatusCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveStatusCamera copyWith(void Function(ReceiveStatusCamera) updates) => super.copyWith((message) => updates(message as ReceiveStatusCamera)) as ReceiveStatusCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveStatusCamera create() => ReceiveStatusCamera._();
  ReceiveStatusCamera createEmptyInstance() => create();
  static $pb.PbList<ReceiveStatusCamera> createRepeated() => $pb.PbList<ReceiveStatusCamera>();
  @$core.pragma('dart2js:noInline')
  static ReceiveStatusCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveStatusCamera>(create);
  static ReceiveStatusCamera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get camera => $_getList(0);

  @$pb.TagNumber(1300)
  $core.int get rECEIVESTATUSCAMERA => $_getIZ(1);
  @$pb.TagNumber(1300)
  set rECEIVESTATUSCAMERA($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(1300)
  $core.bool hasRECEIVESTATUSCAMERA() => $_has(1);
  @$pb.TagNumber(1300)
  void clearRECEIVESTATUSCAMERA() => clearField(1300);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
