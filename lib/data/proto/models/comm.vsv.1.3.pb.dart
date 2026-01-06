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

export 'comm.vsv.1.3.pbenum.dart';

class ReceiveEvent extends $pb.GeneratedMessage {
  factory ReceiveEvent({
    $core.String? eventType,
    $core.String? eventData,
    $core.String? cameraId,
    $core.int? rECEIVEEVENT,
  }) {
    final $result = create();
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (eventData != null) {
      $result.eventData = eventData;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (rECEIVEEVENT != null) {
      $result.rECEIVEEVENT = rECEIVEEVENT;
    }
    return $result;
  }
  ReceiveEvent._() : super();
  factory ReceiveEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventType')
    ..aOS(2, _omitFieldNames ? '' : 'eventData')
    ..aOS(3, _omitFieldNames ? '' : 'cameraId')
    ..a<$core.int>(2007, _omitFieldNames ? '' : 'RECEIVEEVENT', $pb.PbFieldType.OU3, protoName: 'RECEIVE_EVENT')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveEvent clone() => ReceiveEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveEvent copyWith(void Function(ReceiveEvent) updates) => super.copyWith((message) => updates(message as ReceiveEvent)) as ReceiveEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveEvent create() => ReceiveEvent._();
  ReceiveEvent createEmptyInstance() => create();
  static $pb.PbList<ReceiveEvent> createRepeated() => $pb.PbList<ReceiveEvent>();
  @$core.pragma('dart2js:noInline')
  static ReceiveEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveEvent>(create);
  static ReceiveEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventType => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get eventData => $_getSZ(1);
  @$pb.TagNumber(2)
  set eventData($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventData() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventData() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cameraId => $_getSZ(2);
  @$pb.TagNumber(3)
  set cameraId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraId() => clearField(3);

  @$pb.TagNumber(2007)
  $core.int get rECEIVEEVENT => $_getIZ(3);
  @$pb.TagNumber(2007)
  set rECEIVEEVENT($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(2007)
  $core.bool hasRECEIVEEVENT() => $_has(3);
  @$pb.TagNumber(2007)
  void clearRECEIVEEVENT() => clearField(2007);
}

class ReceiveKick extends $pb.GeneratedMessage {
  factory ReceiveKick({
    $core.int? rECEIVEKICKEVENT,
  }) {
    final $result = create();
    if (rECEIVEKICKEVENT != null) {
      $result.rECEIVEKICKEVENT = rECEIVEKICKEVENT;
    }
    return $result;
  }
  ReceiveKick._() : super();
  factory ReceiveKick.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveKick.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveKick', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2008, _omitFieldNames ? '' : 'RECEIVEKICKEVENT', $pb.PbFieldType.OU3, protoName: 'RECEIVE_KICK_EVENT')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveKick clone() => ReceiveKick()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveKick copyWith(void Function(ReceiveKick) updates) => super.copyWith((message) => updates(message as ReceiveKick)) as ReceiveKick;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveKick create() => ReceiveKick._();
  ReceiveKick createEmptyInstance() => create();
  static $pb.PbList<ReceiveKick> createRepeated() => $pb.PbList<ReceiveKick>();
  @$core.pragma('dart2js:noInline')
  static ReceiveKick getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveKick>(create);
  static ReceiveKick? _defaultInstance;

  @$pb.TagNumber(2008)
  $core.int get rECEIVEKICKEVENT => $_getIZ(0);
  @$pb.TagNumber(2008)
  set rECEIVEKICKEVENT($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2008)
  $core.bool hasRECEIVEKICKEVENT() => $_has(0);
  @$pb.TagNumber(2008)
  void clearRECEIVEKICKEVENT() => clearField(2008);
}

class GetSettingAvaliable_Request extends $pb.GeneratedMessage {
  factory GetSettingAvaliable_Request({
    $core.List<$core.int>? camerasId,
  }) {
    final $result = create();
    if (camerasId != null) {
      $result.camerasId = camerasId;
    }
    return $result;
  }
  GetSettingAvaliable_Request._() : super();
  factory GetSettingAvaliable_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSettingAvaliable_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSettingAvaliable.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'camerasId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSettingAvaliable_Request clone() => GetSettingAvaliable_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSettingAvaliable_Request copyWith(void Function(GetSettingAvaliable_Request) updates) => super.copyWith((message) => updates(message as GetSettingAvaliable_Request)) as GetSettingAvaliable_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSettingAvaliable_Request create() => GetSettingAvaliable_Request._();
  GetSettingAvaliable_Request createEmptyInstance() => create();
  static $pb.PbList<GetSettingAvaliable_Request> createRepeated() => $pb.PbList<GetSettingAvaliable_Request>();
  @$core.pragma('dart2js:noInline')
  static GetSettingAvaliable_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSettingAvaliable_Request>(create);
  static GetSettingAvaliable_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get camerasId => $_getN(0);
  @$pb.TagNumber(1)
  set camerasId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamerasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamerasId() => clearField(1);
}

class GetSettingAvaliable_Reply extends $pb.GeneratedMessage {
  factory GetSettingAvaliable_Reply({
    $core.String? jsonData,
  }) {
    final $result = create();
    if (jsonData != null) {
      $result.jsonData = jsonData;
    }
    return $result;
  }
  GetSettingAvaliable_Reply._() : super();
  factory GetSettingAvaliable_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSettingAvaliable_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSettingAvaliable.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jsonData')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSettingAvaliable_Reply clone() => GetSettingAvaliable_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSettingAvaliable_Reply copyWith(void Function(GetSettingAvaliable_Reply) updates) => super.copyWith((message) => updates(message as GetSettingAvaliable_Reply)) as GetSettingAvaliable_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSettingAvaliable_Reply create() => GetSettingAvaliable_Reply._();
  GetSettingAvaliable_Reply createEmptyInstance() => create();
  static $pb.PbList<GetSettingAvaliable_Reply> createRepeated() => $pb.PbList<GetSettingAvaliable_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetSettingAvaliable_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSettingAvaliable_Reply>(create);
  static GetSettingAvaliable_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jsonData => $_getSZ(0);
  @$pb.TagNumber(1)
  set jsonData($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJsonData() => $_has(0);
  @$pb.TagNumber(1)
  void clearJsonData() => clearField(1);
}

class GetSettingAvaliable extends $pb.GeneratedMessage {
  factory GetSettingAvaliable({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetSettingAvaliable._() : super();
  factory GetSettingAvaliable.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSettingAvaliable.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSettingAvaliable', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2009, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSettingAvaliable clone() => GetSettingAvaliable()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSettingAvaliable copyWith(void Function(GetSettingAvaliable) updates) => super.copyWith((message) => updates(message as GetSettingAvaliable)) as GetSettingAvaliable;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSettingAvaliable create() => GetSettingAvaliable._();
  GetSettingAvaliable createEmptyInstance() => create();
  static $pb.PbList<GetSettingAvaliable> createRepeated() => $pb.PbList<GetSettingAvaliable>();
  @$core.pragma('dart2js:noInline')
  static GetSettingAvaliable getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSettingAvaliable>(create);
  static GetSettingAvaliable? _defaultInstance;

  @$pb.TagNumber(2009)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2009)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2009)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2009)
  void clearID() => clearField(2009);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
