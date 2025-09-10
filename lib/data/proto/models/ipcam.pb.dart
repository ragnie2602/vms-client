// This is a generated file - do not edit.
//
// Generated from ipcam.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $0;
import 'ipcam.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'ipcam.pbenum.dart';

class Request extends $pb.GeneratedMessage {
  factory Request({
    $core.int? type,
    $fixnum.Int64? id,
    $core.List<$core.int>? sid,
    $core.List<$core.int>? uid,
    $0.Any? request,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (id != null) result.id = id;
    if (sid != null) result.sid = sid;
    if (uid != null) result.uid = uid;
    if (request != null) result.request = request;
    return result;
  }

  Request._();

  factory Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'sid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OY)
    ..aOM<$0.Any>(5, _omitFieldNames ? '' : 'request',
        subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Request clone() => Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Request copyWith(void Function(Request) updates) =>
      super.copyWith((message) => updates(message as Request)) as Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  @$core.override
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get sid => $_getN(2);
  @$pb.TagNumber(3)
  set sid($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get uid => $_getN(3);
  @$pb.TagNumber(4)
  set uid($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Any get request => $_getN(4);
  @$pb.TagNumber(5)
  set request($0.Any value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequest() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Any ensureRequest() => $_ensure(4);
}

class Reply extends $pb.GeneratedMessage {
  factory Reply({
    $core.int? type,
    $fixnum.Int64? id,
    $fixnum.Int64? serverTime,
    $0.Any? reply,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (id != null) result.id = id;
    if (serverTime != null) result.serverTime = serverTime;
    if (reply != null) result.reply = reply;
    return result;
  }

  Reply._();

  factory Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'serverTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(4, _omitFieldNames ? '' : 'reply', subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Reply clone() => Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Reply copyWith(void Function(Reply) updates) =>
      super.copyWith((message) => updates(message as Reply)) as Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  @$core.override
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get serverTime => $_getI64(2);
  @$pb.TagNumber(3)
  set serverTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Any get reply => $_getN(3);
  @$pb.TagNumber(4)
  set reply($0.Any value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasReply() => $_has(3);
  @$pb.TagNumber(4)
  void clearReply() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Any ensureReply() => $_ensure(3);
}

class KeepAlive_Request extends $pb.GeneratedMessage {
  factory KeepAlive_Request({
    $core.String? nodeUuid,
    $core.int? currentTaskRunning,
    $core.String? grpcHost,
    $core.int? grpcPort,
    KeepAlive_AppType? apptype,
  }) {
    final result = create();
    if (nodeUuid != null) result.nodeUuid = nodeUuid;
    if (currentTaskRunning != null)
      result.currentTaskRunning = currentTaskRunning;
    if (grpcHost != null) result.grpcHost = grpcHost;
    if (grpcPort != null) result.grpcPort = grpcPort;
    if (apptype != null) result.apptype = apptype;
    return result;
  }

  KeepAlive_Request._();

  factory KeepAlive_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeepAlive_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeepAlive.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeUuid')
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'currentTaskRunning', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'grpcHost')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'grpcPort', $pb.PbFieldType.OU3)
    ..e<KeepAlive_AppType>(
        5, _omitFieldNames ? '' : 'apptype', $pb.PbFieldType.OE,
        defaultOrMaker: KeepAlive_AppType.VMS,
        valueOf: KeepAlive_AppType.valueOf,
        enumValues: KeepAlive_AppType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAlive_Request clone() => KeepAlive_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAlive_Request copyWith(void Function(KeepAlive_Request) updates) =>
      super.copyWith((message) => updates(message as KeepAlive_Request))
          as KeepAlive_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAlive_Request create() => KeepAlive_Request._();
  @$core.override
  KeepAlive_Request createEmptyInstance() => create();
  static $pb.PbList<KeepAlive_Request> createRepeated() =>
      $pb.PbList<KeepAlive_Request>();
  @$core.pragma('dart2js:noInline')
  static KeepAlive_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeepAlive_Request>(create);
  static KeepAlive_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentTaskRunning => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentTaskRunning($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentTaskRunning() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentTaskRunning() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get grpcHost => $_getSZ(2);
  @$pb.TagNumber(3)
  set grpcHost($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrpcHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrpcHost() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get grpcPort => $_getIZ(3);
  @$pb.TagNumber(4)
  set grpcPort($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrpcPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrpcPort() => $_clearField(4);

  @$pb.TagNumber(5)
  KeepAlive_AppType get apptype => $_getN(4);
  @$pb.TagNumber(5)
  set apptype(KeepAlive_AppType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasApptype() => $_has(4);
  @$pb.TagNumber(5)
  void clearApptype() => $_clearField(5);
}

class KeepAlive_Reply extends $pb.GeneratedMessage {
  factory KeepAlive_Reply() => create();

  KeepAlive_Reply._();

  factory KeepAlive_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeepAlive_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeepAlive.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAlive_Reply clone() => KeepAlive_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAlive_Reply copyWith(void Function(KeepAlive_Reply) updates) =>
      super.copyWith((message) => updates(message as KeepAlive_Reply))
          as KeepAlive_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAlive_Reply create() => KeepAlive_Reply._();
  @$core.override
  KeepAlive_Reply createEmptyInstance() => create();
  static $pb.PbList<KeepAlive_Reply> createRepeated() =>
      $pb.PbList<KeepAlive_Reply>();
  @$core.pragma('dart2js:noInline')
  static KeepAlive_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeepAlive_Reply>(create);
  static KeepAlive_Reply? _defaultInstance;
}

class KeepAlive extends $pb.GeneratedMessage {
  factory KeepAlive({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  KeepAlive._();

  factory KeepAlive.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeepAlive.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeepAlive',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(100, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAlive clone() => KeepAlive()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAlive copyWith(void Function(KeepAlive) updates) =>
      super.copyWith((message) => updates(message as KeepAlive)) as KeepAlive;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAlive create() => KeepAlive._();
  @$core.override
  KeepAlive createEmptyInstance() => create();
  static $pb.PbList<KeepAlive> createRepeated() => $pb.PbList<KeepAlive>();
  @$core.pragma('dart2js:noInline')
  static KeepAlive getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeepAlive>(create);
  static KeepAlive? _defaultInstance;

  @$pb.TagNumber(100)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(100)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(100)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(100)
  void clearID() => $_clearField(100);
}

class StartRecord_Request extends $pb.GeneratedMessage {
  factory StartRecord_Request({
    $core.List<$core.int>? cameraId,
    $core.String? wsServer,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    if (wsServer != null) result.wsServer = wsServer;
    return result;
  }

  StartRecord_Request._();

  factory StartRecord_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRecord_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecord.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'wsServer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecord_Request clone() => StartRecord_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecord_Request copyWith(void Function(StartRecord_Request) updates) =>
      super.copyWith((message) => updates(message as StartRecord_Request))
          as StartRecord_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecord_Request create() => StartRecord_Request._();
  @$core.override
  StartRecord_Request createEmptyInstance() => create();
  static $pb.PbList<StartRecord_Request> createRepeated() =>
      $pb.PbList<StartRecord_Request>();
  @$core.pragma('dart2js:noInline')
  static StartRecord_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecord_Request>(create);
  static StartRecord_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get wsServer => $_getSZ(1);
  @$pb.TagNumber(2)
  set wsServer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWsServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearWsServer() => $_clearField(2);
}

class StartRecord_Reply extends $pb.GeneratedMessage {
  factory StartRecord_Reply() => create();

  StartRecord_Reply._();

  factory StartRecord_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRecord_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecord.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecord_Reply clone() => StartRecord_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecord_Reply copyWith(void Function(StartRecord_Reply) updates) =>
      super.copyWith((message) => updates(message as StartRecord_Reply))
          as StartRecord_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecord_Reply create() => StartRecord_Reply._();
  @$core.override
  StartRecord_Reply createEmptyInstance() => create();
  static $pb.PbList<StartRecord_Reply> createRepeated() =>
      $pb.PbList<StartRecord_Reply>();
  @$core.pragma('dart2js:noInline')
  static StartRecord_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecord_Reply>(create);
  static StartRecord_Reply? _defaultInstance;
}

class StartRecord extends $pb.GeneratedMessage {
  factory StartRecord({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  StartRecord._();

  factory StartRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(606, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecord clone() => StartRecord()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecord copyWith(void Function(StartRecord) updates) =>
      super.copyWith((message) => updates(message as StartRecord))
          as StartRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecord create() => StartRecord._();
  @$core.override
  StartRecord createEmptyInstance() => create();
  static $pb.PbList<StartRecord> createRepeated() => $pb.PbList<StartRecord>();
  @$core.pragma('dart2js:noInline')
  static StartRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecord>(create);
  static StartRecord? _defaultInstance;

  @$pb.TagNumber(606)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(606)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(606)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(606)
  void clearID() => $_clearField(606);
}

class StopRecord_Request extends $pb.GeneratedMessage {
  factory StopRecord_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    return result;
  }

  StopRecord_Request._();

  factory StopRecord_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopRecord_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopRecord.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecord_Request clone() => StopRecord_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecord_Request copyWith(void Function(StopRecord_Request) updates) =>
      super.copyWith((message) => updates(message as StopRecord_Request))
          as StopRecord_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecord_Request create() => StopRecord_Request._();
  @$core.override
  StopRecord_Request createEmptyInstance() => create();
  static $pb.PbList<StopRecord_Request> createRepeated() =>
      $pb.PbList<StopRecord_Request>();
  @$core.pragma('dart2js:noInline')
  static StopRecord_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopRecord_Request>(create);
  static StopRecord_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);
}

class StopRecord_Reply extends $pb.GeneratedMessage {
  factory StopRecord_Reply() => create();

  StopRecord_Reply._();

  factory StopRecord_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopRecord_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopRecord.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecord_Reply clone() => StopRecord_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecord_Reply copyWith(void Function(StopRecord_Reply) updates) =>
      super.copyWith((message) => updates(message as StopRecord_Reply))
          as StopRecord_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecord_Reply create() => StopRecord_Reply._();
  @$core.override
  StopRecord_Reply createEmptyInstance() => create();
  static $pb.PbList<StopRecord_Reply> createRepeated() =>
      $pb.PbList<StopRecord_Reply>();
  @$core.pragma('dart2js:noInline')
  static StopRecord_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopRecord_Reply>(create);
  static StopRecord_Reply? _defaultInstance;
}

class StopRecord extends $pb.GeneratedMessage {
  factory StopRecord({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  StopRecord._();

  factory StopRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(607, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecord clone() => StopRecord()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecord copyWith(void Function(StopRecord) updates) =>
      super.copyWith((message) => updates(message as StopRecord)) as StopRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecord create() => StopRecord._();
  @$core.override
  StopRecord createEmptyInstance() => create();
  static $pb.PbList<StopRecord> createRepeated() => $pb.PbList<StopRecord>();
  @$core.pragma('dart2js:noInline')
  static StopRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopRecord>(create);
  static StopRecord? _defaultInstance;

  @$pb.TagNumber(607)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(607)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(607)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(607)
  void clearID() => $_clearField(607);
}

class MakeMp4File_m3u82mp4 extends $pb.GeneratedMessage {
  factory MakeMp4File_m3u82mp4({
    $core.String? pathM3u8,
    $core.String? pathMp4,
    $core.bool? isDone,
  }) {
    final result = create();
    if (pathM3u8 != null) result.pathM3u8 = pathM3u8;
    if (pathMp4 != null) result.pathMp4 = pathMp4;
    if (isDone != null) result.isDone = isDone;
    return result;
  }

  MakeMp4File_m3u82mp4._();

  factory MakeMp4File_m3u82mp4.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeMp4File_m3u82mp4.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeMp4File.m3u82mp4',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pathM3u8')
    ..aOS(2, _omitFieldNames ? '' : 'pathMp4')
    ..aOB(3, _omitFieldNames ? '' : 'isDone', protoName: 'isDone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File_m3u82mp4 clone() =>
      MakeMp4File_m3u82mp4()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File_m3u82mp4 copyWith(void Function(MakeMp4File_m3u82mp4) updates) =>
      super.copyWith((message) => updates(message as MakeMp4File_m3u82mp4))
          as MakeMp4File_m3u82mp4;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeMp4File_m3u82mp4 create() => MakeMp4File_m3u82mp4._();
  @$core.override
  MakeMp4File_m3u82mp4 createEmptyInstance() => create();
  static $pb.PbList<MakeMp4File_m3u82mp4> createRepeated() =>
      $pb.PbList<MakeMp4File_m3u82mp4>();
  @$core.pragma('dart2js:noInline')
  static MakeMp4File_m3u82mp4 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeMp4File_m3u82mp4>(create);
  static MakeMp4File_m3u82mp4? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pathM3u8 => $_getSZ(0);
  @$pb.TagNumber(1)
  set pathM3u8($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPathM3u8() => $_has(0);
  @$pb.TagNumber(1)
  void clearPathM3u8() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pathMp4 => $_getSZ(1);
  @$pb.TagNumber(2)
  set pathMp4($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPathMp4() => $_has(1);
  @$pb.TagNumber(2)
  void clearPathMp4() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isDone => $_getBF(2);
  @$pb.TagNumber(3)
  set isDone($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsDone() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsDone() => $_clearField(3);
}

class MakeMp4File_Request extends $pb.GeneratedMessage {
  factory MakeMp4File_Request({
    $core.Iterable<MakeMp4File_m3u82mp4>? files,
  }) {
    final result = create();
    if (files != null) result.files.addAll(files);
    return result;
  }

  MakeMp4File_Request._();

  factory MakeMp4File_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeMp4File_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeMp4File.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..pc<MakeMp4File_m3u82mp4>(
        1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM,
        subBuilder: MakeMp4File_m3u82mp4.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File_Request clone() => MakeMp4File_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File_Request copyWith(void Function(MakeMp4File_Request) updates) =>
      super.copyWith((message) => updates(message as MakeMp4File_Request))
          as MakeMp4File_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeMp4File_Request create() => MakeMp4File_Request._();
  @$core.override
  MakeMp4File_Request createEmptyInstance() => create();
  static $pb.PbList<MakeMp4File_Request> createRepeated() =>
      $pb.PbList<MakeMp4File_Request>();
  @$core.pragma('dart2js:noInline')
  static MakeMp4File_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeMp4File_Request>(create);
  static MakeMp4File_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MakeMp4File_m3u82mp4> get files => $_getList(0);
}

class MakeMp4File_Reply extends $pb.GeneratedMessage {
  factory MakeMp4File_Reply({
    $core.Iterable<MakeMp4File_m3u82mp4>? files,
  }) {
    final result = create();
    if (files != null) result.files.addAll(files);
    return result;
  }

  MakeMp4File_Reply._();

  factory MakeMp4File_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeMp4File_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeMp4File.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..pc<MakeMp4File_m3u82mp4>(
        1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM,
        subBuilder: MakeMp4File_m3u82mp4.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File_Reply clone() => MakeMp4File_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File_Reply copyWith(void Function(MakeMp4File_Reply) updates) =>
      super.copyWith((message) => updates(message as MakeMp4File_Reply))
          as MakeMp4File_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeMp4File_Reply create() => MakeMp4File_Reply._();
  @$core.override
  MakeMp4File_Reply createEmptyInstance() => create();
  static $pb.PbList<MakeMp4File_Reply> createRepeated() =>
      $pb.PbList<MakeMp4File_Reply>();
  @$core.pragma('dart2js:noInline')
  static MakeMp4File_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeMp4File_Reply>(create);
  static MakeMp4File_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MakeMp4File_m3u82mp4> get files => $_getList(0);
}

class MakeMp4File extends $pb.GeneratedMessage {
  factory MakeMp4File({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  MakeMp4File._();

  factory MakeMp4File.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeMp4File.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeMp4File',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(613, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File clone() => MakeMp4File()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeMp4File copyWith(void Function(MakeMp4File) updates) =>
      super.copyWith((message) => updates(message as MakeMp4File))
          as MakeMp4File;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeMp4File create() => MakeMp4File._();
  @$core.override
  MakeMp4File createEmptyInstance() => create();
  static $pb.PbList<MakeMp4File> createRepeated() => $pb.PbList<MakeMp4File>();
  @$core.pragma('dart2js:noInline')
  static MakeMp4File getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeMp4File>(create);
  static MakeMp4File? _defaultInstance;

  @$pb.TagNumber(613)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(613)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(613)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(613)
  void clearID() => $_clearField(613);
}

class DeleteRecordFile_Request extends $pb.GeneratedMessage {
  factory DeleteRecordFile_Request({
    $core.List<$core.int>? filePath,
  }) {
    final result = create();
    if (filePath != null) result.filePath = filePath;
    return result;
  }

  DeleteRecordFile_Request._();

  factory DeleteRecordFile_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteRecordFile_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteRecordFile.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'filePath', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordFile_Request clone() =>
      DeleteRecordFile_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordFile_Request copyWith(
          void Function(DeleteRecordFile_Request) updates) =>
      super.copyWith((message) => updates(message as DeleteRecordFile_Request))
          as DeleteRecordFile_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordFile_Request create() => DeleteRecordFile_Request._();
  @$core.override
  DeleteRecordFile_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordFile_Request> createRepeated() =>
      $pb.PbList<DeleteRecordFile_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordFile_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteRecordFile_Request>(create);
  static DeleteRecordFile_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get filePath => $_getN(0);
  @$pb.TagNumber(1)
  set filePath($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilePath() => $_clearField(1);
}

class DeleteRecordFile_Reply extends $pb.GeneratedMessage {
  factory DeleteRecordFile_Reply() => create();

  DeleteRecordFile_Reply._();

  factory DeleteRecordFile_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteRecordFile_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteRecordFile.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordFile_Reply clone() =>
      DeleteRecordFile_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordFile_Reply copyWith(
          void Function(DeleteRecordFile_Reply) updates) =>
      super.copyWith((message) => updates(message as DeleteRecordFile_Reply))
          as DeleteRecordFile_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordFile_Reply create() => DeleteRecordFile_Reply._();
  @$core.override
  DeleteRecordFile_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordFile_Reply> createRepeated() =>
      $pb.PbList<DeleteRecordFile_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordFile_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteRecordFile_Reply>(create);
  static DeleteRecordFile_Reply? _defaultInstance;
}

class DeleteRecordFile extends $pb.GeneratedMessage {
  factory DeleteRecordFile({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  DeleteRecordFile._();

  factory DeleteRecordFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteRecordFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteRecordFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(614, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordFile clone() => DeleteRecordFile()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordFile copyWith(void Function(DeleteRecordFile) updates) =>
      super.copyWith((message) => updates(message as DeleteRecordFile))
          as DeleteRecordFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordFile create() => DeleteRecordFile._();
  @$core.override
  DeleteRecordFile createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordFile> createRepeated() =>
      $pb.PbList<DeleteRecordFile>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteRecordFile>(create);
  static DeleteRecordFile? _defaultInstance;

  @$pb.TagNumber(614)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(614)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(614)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(614)
  void clearID() => $_clearField(614);
}

class CaptureVideoEvent_Request extends $pb.GeneratedMessage {
  factory CaptureVideoEvent_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? eventId,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    if (eventId != null) result.eventId = eventId;
    return result;
  }

  CaptureVideoEvent_Request._();

  factory CaptureVideoEvent_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CaptureVideoEvent_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CaptureVideoEvent.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'eventId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaptureVideoEvent_Request clone() =>
      CaptureVideoEvent_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaptureVideoEvent_Request copyWith(
          void Function(CaptureVideoEvent_Request) updates) =>
      super.copyWith((message) => updates(message as CaptureVideoEvent_Request))
          as CaptureVideoEvent_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CaptureVideoEvent_Request create() => CaptureVideoEvent_Request._();
  @$core.override
  CaptureVideoEvent_Request createEmptyInstance() => create();
  static $pb.PbList<CaptureVideoEvent_Request> createRepeated() =>
      $pb.PbList<CaptureVideoEvent_Request>();
  @$core.pragma('dart2js:noInline')
  static CaptureVideoEvent_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CaptureVideoEvent_Request>(create);
  static CaptureVideoEvent_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get eventId => $_getN(1);
  @$pb.TagNumber(2)
  set eventId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEventId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventId() => $_clearField(2);
}

class CaptureVideoEvent_Reply extends $pb.GeneratedMessage {
  factory CaptureVideoEvent_Reply() => create();

  CaptureVideoEvent_Reply._();

  factory CaptureVideoEvent_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CaptureVideoEvent_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CaptureVideoEvent.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaptureVideoEvent_Reply clone() =>
      CaptureVideoEvent_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaptureVideoEvent_Reply copyWith(
          void Function(CaptureVideoEvent_Reply) updates) =>
      super.copyWith((message) => updates(message as CaptureVideoEvent_Reply))
          as CaptureVideoEvent_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CaptureVideoEvent_Reply create() => CaptureVideoEvent_Reply._();
  @$core.override
  CaptureVideoEvent_Reply createEmptyInstance() => create();
  static $pb.PbList<CaptureVideoEvent_Reply> createRepeated() =>
      $pb.PbList<CaptureVideoEvent_Reply>();
  @$core.pragma('dart2js:noInline')
  static CaptureVideoEvent_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CaptureVideoEvent_Reply>(create);
  static CaptureVideoEvent_Reply? _defaultInstance;
}

class CaptureVideoEvent extends $pb.GeneratedMessage {
  factory CaptureVideoEvent({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  CaptureVideoEvent._();

  factory CaptureVideoEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CaptureVideoEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CaptureVideoEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(612, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaptureVideoEvent clone() => CaptureVideoEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaptureVideoEvent copyWith(void Function(CaptureVideoEvent) updates) =>
      super.copyWith((message) => updates(message as CaptureVideoEvent))
          as CaptureVideoEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CaptureVideoEvent create() => CaptureVideoEvent._();
  @$core.override
  CaptureVideoEvent createEmptyInstance() => create();
  static $pb.PbList<CaptureVideoEvent> createRepeated() =>
      $pb.PbList<CaptureVideoEvent>();
  @$core.pragma('dart2js:noInline')
  static CaptureVideoEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CaptureVideoEvent>(create);
  static CaptureVideoEvent? _defaultInstance;

  @$pb.TagNumber(612)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(612)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(612)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(612)
  void clearID() => $_clearField(612);
}

class sendReceiveToSession_Request extends $pb.GeneratedMessage {
  factory sendReceiveToSession_Request({
    $core.List<$core.int>? msgData,
    $core.List<$core.int>? userId,
    $core.List<$core.int>? sessionId,
    $core.bool? sendPushWhenSessionOffline,
    $core.List<$core.int>? boxId,
    $core.List<$core.int>? connectionId,
    $core.int? msgType,
  }) {
    final result = create();
    if (msgData != null) result.msgData = msgData;
    if (userId != null) result.userId = userId;
    if (sessionId != null) result.sessionId = sessionId;
    if (sendPushWhenSessionOffline != null)
      result.sendPushWhenSessionOffline = sendPushWhenSessionOffline;
    if (boxId != null) result.boxId = boxId;
    if (connectionId != null) result.connectionId = connectionId;
    if (msgType != null) result.msgType = msgType;
    return result;
  }

  sendReceiveToSession_Request._();

  factory sendReceiveToSession_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory sendReceiveToSession_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'sendReceiveToSession.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'msgData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OY)
    ..aOB(4, _omitFieldNames ? '' : 'sendPushWhenSessionOffline')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'connectionId', $pb.PbFieldType.OY)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'msgType', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  sendReceiveToSession_Request clone() =>
      sendReceiveToSession_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  sendReceiveToSession_Request copyWith(
          void Function(sendReceiveToSession_Request) updates) =>
      super.copyWith(
              (message) => updates(message as sendReceiveToSession_Request))
          as sendReceiveToSession_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sendReceiveToSession_Request create() =>
      sendReceiveToSession_Request._();
  @$core.override
  sendReceiveToSession_Request createEmptyInstance() => create();
  static $pb.PbList<sendReceiveToSession_Request> createRepeated() =>
      $pb.PbList<sendReceiveToSession_Request>();
  @$core.pragma('dart2js:noInline')
  static sendReceiveToSession_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<sendReceiveToSession_Request>(create);
  static sendReceiveToSession_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get msgData => $_getN(0);
  @$pb.TagNumber(1)
  set msgData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsgData() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgData() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get sessionId => $_getN(2);
  @$pb.TagNumber(3)
  set sessionId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get sendPushWhenSessionOffline => $_getBF(3);
  @$pb.TagNumber(4)
  set sendPushWhenSessionOffline($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSendPushWhenSessionOffline() => $_has(3);
  @$pb.TagNumber(4)
  void clearSendPushWhenSessionOffline() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get boxId => $_getN(4);
  @$pb.TagNumber(5)
  set boxId($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBoxId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoxId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get connectionId => $_getN(5);
  @$pb.TagNumber(6)
  set connectionId($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasConnectionId() => $_has(5);
  @$pb.TagNumber(6)
  void clearConnectionId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get msgType => $_getIZ(6);
  @$pb.TagNumber(7)
  set msgType($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMsgType() => $_has(6);
  @$pb.TagNumber(7)
  void clearMsgType() => $_clearField(7);
}

class sendReceiveToSession_Reply extends $pb.GeneratedMessage {
  factory sendReceiveToSession_Reply() => create();

  sendReceiveToSession_Reply._();

  factory sendReceiveToSession_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory sendReceiveToSession_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'sendReceiveToSession.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  sendReceiveToSession_Reply clone() =>
      sendReceiveToSession_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  sendReceiveToSession_Reply copyWith(
          void Function(sendReceiveToSession_Reply) updates) =>
      super.copyWith(
              (message) => updates(message as sendReceiveToSession_Reply))
          as sendReceiveToSession_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sendReceiveToSession_Reply create() => sendReceiveToSession_Reply._();
  @$core.override
  sendReceiveToSession_Reply createEmptyInstance() => create();
  static $pb.PbList<sendReceiveToSession_Reply> createRepeated() =>
      $pb.PbList<sendReceiveToSession_Reply>();
  @$core.pragma('dart2js:noInline')
  static sendReceiveToSession_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<sendReceiveToSession_Reply>(create);
  static sendReceiveToSession_Reply? _defaultInstance;
}

class sendReceiveToSession extends $pb.GeneratedMessage {
  factory sendReceiveToSession({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  sendReceiveToSession._();

  factory sendReceiveToSession.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory sendReceiveToSession.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'sendReceiveToSession',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(602, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  sendReceiveToSession clone() =>
      sendReceiveToSession()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  sendReceiveToSession copyWith(void Function(sendReceiveToSession) updates) =>
      super.copyWith((message) => updates(message as sendReceiveToSession))
          as sendReceiveToSession;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sendReceiveToSession create() => sendReceiveToSession._();
  @$core.override
  sendReceiveToSession createEmptyInstance() => create();
  static $pb.PbList<sendReceiveToSession> createRepeated() =>
      $pb.PbList<sendReceiveToSession>();
  @$core.pragma('dart2js:noInline')
  static sendReceiveToSession getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<sendReceiveToSession>(create);
  static sendReceiveToSession? _defaultInstance;

  @$pb.TagNumber(602)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(602)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(602)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(602)
  void clearID() => $_clearField(602);
}

class WhoIsHost_Request extends $pb.GeneratedMessage {
  factory WhoIsHost_Request() => create();

  WhoIsHost_Request._();

  factory WhoIsHost_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhoIsHost_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhoIsHost.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhoIsHost_Request clone() => WhoIsHost_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhoIsHost_Request copyWith(void Function(WhoIsHost_Request) updates) =>
      super.copyWith((message) => updates(message as WhoIsHost_Request))
          as WhoIsHost_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhoIsHost_Request create() => WhoIsHost_Request._();
  @$core.override
  WhoIsHost_Request createEmptyInstance() => create();
  static $pb.PbList<WhoIsHost_Request> createRepeated() =>
      $pb.PbList<WhoIsHost_Request>();
  @$core.pragma('dart2js:noInline')
  static WhoIsHost_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhoIsHost_Request>(create);
  static WhoIsHost_Request? _defaultInstance;
}

class WhoIsHost_Reply extends $pb.GeneratedMessage {
  factory WhoIsHost_Reply({
    $core.String? masterNodeUuid,
    $core.String? masterGrpcHost,
    $core.int? masterGrpcPort,
  }) {
    final result = create();
    if (masterNodeUuid != null) result.masterNodeUuid = masterNodeUuid;
    if (masterGrpcHost != null) result.masterGrpcHost = masterGrpcHost;
    if (masterGrpcPort != null) result.masterGrpcPort = masterGrpcPort;
    return result;
  }

  WhoIsHost_Reply._();

  factory WhoIsHost_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhoIsHost_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhoIsHost.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'masterNodeUuid')
    ..aOS(2, _omitFieldNames ? '' : 'masterGrpcHost')
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'masterGrpcPort', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhoIsHost_Reply clone() => WhoIsHost_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhoIsHost_Reply copyWith(void Function(WhoIsHost_Reply) updates) =>
      super.copyWith((message) => updates(message as WhoIsHost_Reply))
          as WhoIsHost_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhoIsHost_Reply create() => WhoIsHost_Reply._();
  @$core.override
  WhoIsHost_Reply createEmptyInstance() => create();
  static $pb.PbList<WhoIsHost_Reply> createRepeated() =>
      $pb.PbList<WhoIsHost_Reply>();
  @$core.pragma('dart2js:noInline')
  static WhoIsHost_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhoIsHost_Reply>(create);
  static WhoIsHost_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get masterNodeUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set masterNodeUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMasterNodeUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMasterNodeUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get masterGrpcHost => $_getSZ(1);
  @$pb.TagNumber(2)
  set masterGrpcHost($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMasterGrpcHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearMasterGrpcHost() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get masterGrpcPort => $_getIZ(2);
  @$pb.TagNumber(3)
  set masterGrpcPort($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMasterGrpcPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearMasterGrpcPort() => $_clearField(3);
}

class WhoIsHost extends $pb.GeneratedMessage {
  factory WhoIsHost({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  WhoIsHost._();

  factory WhoIsHost.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhoIsHost.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhoIsHost',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(604, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhoIsHost clone() => WhoIsHost()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhoIsHost copyWith(void Function(WhoIsHost) updates) =>
      super.copyWith((message) => updates(message as WhoIsHost)) as WhoIsHost;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhoIsHost create() => WhoIsHost._();
  @$core.override
  WhoIsHost createEmptyInstance() => create();
  static $pb.PbList<WhoIsHost> createRepeated() => $pb.PbList<WhoIsHost>();
  @$core.pragma('dart2js:noInline')
  static WhoIsHost getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WhoIsHost>(create);
  static WhoIsHost? _defaultInstance;

  @$pb.TagNumber(604)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(604)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(604)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(604)
  void clearID() => $_clearField(604);
}

class RegisterNode_Request extends $pb.GeneratedMessage {
  factory RegisterNode_Request({
    $core.String? nodeUuid,
    $core.int? currentTask,
    $core.int? maxTask,
  }) {
    final result = create();
    if (nodeUuid != null) result.nodeUuid = nodeUuid;
    if (currentTask != null) result.currentTask = currentTask;
    if (maxTask != null) result.maxTask = maxTask;
    return result;
  }

  RegisterNode_Request._();

  factory RegisterNode_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterNode_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterNode.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeUuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'currentTask', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxTask', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterNode_Request clone() =>
      RegisterNode_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterNode_Request copyWith(void Function(RegisterNode_Request) updates) =>
      super.copyWith((message) => updates(message as RegisterNode_Request))
          as RegisterNode_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterNode_Request create() => RegisterNode_Request._();
  @$core.override
  RegisterNode_Request createEmptyInstance() => create();
  static $pb.PbList<RegisterNode_Request> createRepeated() =>
      $pb.PbList<RegisterNode_Request>();
  @$core.pragma('dart2js:noInline')
  static RegisterNode_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterNode_Request>(create);
  static RegisterNode_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentTask => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentTask($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentTask() => $_clearField(2);

  @$pb.TagNumber(4)
  $core.int get maxTask => $_getIZ(2);
  @$pb.TagNumber(4)
  set maxTask($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxTask() => $_has(2);
  @$pb.TagNumber(4)
  void clearMaxTask() => $_clearField(4);
}

class RegisterNode_Reply extends $pb.GeneratedMessage {
  factory RegisterNode_Reply({
    $core.bool? isBackUpHost,
  }) {
    final result = create();
    if (isBackUpHost != null) result.isBackUpHost = isBackUpHost;
    return result;
  }

  RegisterNode_Reply._();

  factory RegisterNode_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterNode_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterNode.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isBackUpHost', protoName: 'isBackUpHost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterNode_Reply clone() => RegisterNode_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterNode_Reply copyWith(void Function(RegisterNode_Reply) updates) =>
      super.copyWith((message) => updates(message as RegisterNode_Reply))
          as RegisterNode_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterNode_Reply create() => RegisterNode_Reply._();
  @$core.override
  RegisterNode_Reply createEmptyInstance() => create();
  static $pb.PbList<RegisterNode_Reply> createRepeated() =>
      $pb.PbList<RegisterNode_Reply>();
  @$core.pragma('dart2js:noInline')
  static RegisterNode_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterNode_Reply>(create);
  static RegisterNode_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isBackUpHost => $_getBF(0);
  @$pb.TagNumber(1)
  set isBackUpHost($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsBackUpHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsBackUpHost() => $_clearField(1);
}

class RegisterNode extends $pb.GeneratedMessage {
  factory RegisterNode({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  RegisterNode._();

  factory RegisterNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(605, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterNode clone() => RegisterNode()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterNode copyWith(void Function(RegisterNode) updates) =>
      super.copyWith((message) => updates(message as RegisterNode))
          as RegisterNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterNode create() => RegisterNode._();
  @$core.override
  RegisterNode createEmptyInstance() => create();
  static $pb.PbList<RegisterNode> createRepeated() =>
      $pb.PbList<RegisterNode>();
  @$core.pragma('dart2js:noInline')
  static RegisterNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterNode>(create);
  static RegisterNode? _defaultInstance;

  @$pb.TagNumber(605)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(605)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(605)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(605)
  void clearID() => $_clearField(605);
}

class GetNodeAvaliable_Request extends $pb.GeneratedMessage {
  factory GetNodeAvaliable_Request({
    $core.bool? isRecordNode,
    $core.String? nodeId,
  }) {
    final result = create();
    if (isRecordNode != null) result.isRecordNode = isRecordNode;
    if (nodeId != null) result.nodeId = nodeId;
    return result;
  }

  GetNodeAvaliable_Request._();

  factory GetNodeAvaliable_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNodeAvaliable_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNodeAvaliable.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isRecordNode', protoName: 'isRecordNode')
    ..aOS(2, _omitFieldNames ? '' : 'nodeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNodeAvaliable_Request clone() =>
      GetNodeAvaliable_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNodeAvaliable_Request copyWith(
          void Function(GetNodeAvaliable_Request) updates) =>
      super.copyWith((message) => updates(message as GetNodeAvaliable_Request))
          as GetNodeAvaliable_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNodeAvaliable_Request create() => GetNodeAvaliable_Request._();
  @$core.override
  GetNodeAvaliable_Request createEmptyInstance() => create();
  static $pb.PbList<GetNodeAvaliable_Request> createRepeated() =>
      $pb.PbList<GetNodeAvaliable_Request>();
  @$core.pragma('dart2js:noInline')
  static GetNodeAvaliable_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNodeAvaliable_Request>(create);
  static GetNodeAvaliable_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isRecordNode => $_getBF(0);
  @$pb.TagNumber(1)
  set isRecordNode($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsRecordNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsRecordNode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nodeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nodeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeId() => $_clearField(2);
}

class GetNodeAvaliable_Reply extends $pb.GeneratedMessage {
  factory GetNodeAvaliable_Reply({
    $core.bool? hostAvaliable,
    $core.String? nodeUuid,
    $core.String? grpcHost,
    $core.int? grpcPort,
  }) {
    final result = create();
    if (hostAvaliable != null) result.hostAvaliable = hostAvaliable;
    if (nodeUuid != null) result.nodeUuid = nodeUuid;
    if (grpcHost != null) result.grpcHost = grpcHost;
    if (grpcPort != null) result.grpcPort = grpcPort;
    return result;
  }

  GetNodeAvaliable_Reply._();

  factory GetNodeAvaliable_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNodeAvaliable_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNodeAvaliable.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hostAvaliable')
    ..aOS(2, _omitFieldNames ? '' : 'nodeUuid')
    ..aOS(3, _omitFieldNames ? '' : 'grpcHost')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'grpcPort', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNodeAvaliable_Reply clone() =>
      GetNodeAvaliable_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNodeAvaliable_Reply copyWith(
          void Function(GetNodeAvaliable_Reply) updates) =>
      super.copyWith((message) => updates(message as GetNodeAvaliable_Reply))
          as GetNodeAvaliable_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNodeAvaliable_Reply create() => GetNodeAvaliable_Reply._();
  @$core.override
  GetNodeAvaliable_Reply createEmptyInstance() => create();
  static $pb.PbList<GetNodeAvaliable_Reply> createRepeated() =>
      $pb.PbList<GetNodeAvaliable_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetNodeAvaliable_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNodeAvaliable_Reply>(create);
  static GetNodeAvaliable_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hostAvaliable => $_getBF(0);
  @$pb.TagNumber(1)
  set hostAvaliable($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHostAvaliable() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostAvaliable() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nodeUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set nodeUuid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeUuid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get grpcHost => $_getSZ(2);
  @$pb.TagNumber(3)
  set grpcHost($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrpcHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrpcHost() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get grpcPort => $_getIZ(3);
  @$pb.TagNumber(4)
  set grpcPort($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrpcPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrpcPort() => $_clearField(4);
}

class GetNodeAvaliable extends $pb.GeneratedMessage {
  factory GetNodeAvaliable({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  GetNodeAvaliable._();

  factory GetNodeAvaliable.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNodeAvaliable.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNodeAvaliable',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(615, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNodeAvaliable clone() => GetNodeAvaliable()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNodeAvaliable copyWith(void Function(GetNodeAvaliable) updates) =>
      super.copyWith((message) => updates(message as GetNodeAvaliable))
          as GetNodeAvaliable;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNodeAvaliable create() => GetNodeAvaliable._();
  @$core.override
  GetNodeAvaliable createEmptyInstance() => create();
  static $pb.PbList<GetNodeAvaliable> createRepeated() =>
      $pb.PbList<GetNodeAvaliable>();
  @$core.pragma('dart2js:noInline')
  static GetNodeAvaliable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNodeAvaliable>(create);
  static GetNodeAvaliable? _defaultInstance;

  @$pb.TagNumber(615)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(615)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(615)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(615)
  void clearID() => $_clearField(615);
}

class CameraOnlineOffline_Request extends $pb.GeneratedMessage {
  factory CameraOnlineOffline_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    return result;
  }

  CameraOnlineOffline_Request._();

  factory CameraOnlineOffline_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CameraOnlineOffline_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CameraOnlineOffline.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CameraOnlineOffline_Request clone() =>
      CameraOnlineOffline_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CameraOnlineOffline_Request copyWith(
          void Function(CameraOnlineOffline_Request) updates) =>
      super.copyWith(
              (message) => updates(message as CameraOnlineOffline_Request))
          as CameraOnlineOffline_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraOnlineOffline_Request create() =>
      CameraOnlineOffline_Request._();
  @$core.override
  CameraOnlineOffline_Request createEmptyInstance() => create();
  static $pb.PbList<CameraOnlineOffline_Request> createRepeated() =>
      $pb.PbList<CameraOnlineOffline_Request>();
  @$core.pragma('dart2js:noInline')
  static CameraOnlineOffline_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CameraOnlineOffline_Request>(create);
  static CameraOnlineOffline_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);
}

class CameraOnlineOffline_Reply extends $pb.GeneratedMessage {
  factory CameraOnlineOffline_Reply() => create();

  CameraOnlineOffline_Reply._();

  factory CameraOnlineOffline_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CameraOnlineOffline_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CameraOnlineOffline.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CameraOnlineOffline_Reply clone() =>
      CameraOnlineOffline_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CameraOnlineOffline_Reply copyWith(
          void Function(CameraOnlineOffline_Reply) updates) =>
      super.copyWith((message) => updates(message as CameraOnlineOffline_Reply))
          as CameraOnlineOffline_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraOnlineOffline_Reply create() => CameraOnlineOffline_Reply._();
  @$core.override
  CameraOnlineOffline_Reply createEmptyInstance() => create();
  static $pb.PbList<CameraOnlineOffline_Reply> createRepeated() =>
      $pb.PbList<CameraOnlineOffline_Reply>();
  @$core.pragma('dart2js:noInline')
  static CameraOnlineOffline_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CameraOnlineOffline_Reply>(create);
  static CameraOnlineOffline_Reply? _defaultInstance;
}

class CameraOnlineOffline extends $pb.GeneratedMessage {
  factory CameraOnlineOffline({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  CameraOnlineOffline._();

  factory CameraOnlineOffline.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CameraOnlineOffline.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CameraOnlineOffline',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(616, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CameraOnlineOffline clone() => CameraOnlineOffline()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CameraOnlineOffline copyWith(void Function(CameraOnlineOffline) updates) =>
      super.copyWith((message) => updates(message as CameraOnlineOffline))
          as CameraOnlineOffline;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraOnlineOffline create() => CameraOnlineOffline._();
  @$core.override
  CameraOnlineOffline createEmptyInstance() => create();
  static $pb.PbList<CameraOnlineOffline> createRepeated() =>
      $pb.PbList<CameraOnlineOffline>();
  @$core.pragma('dart2js:noInline')
  static CameraOnlineOffline getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CameraOnlineOffline>(create);
  static CameraOnlineOffline? _defaultInstance;

  @$pb.TagNumber(616)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(616)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(616)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(616)
  void clearID() => $_clearField(616);
}

class NewRecordVideo_Request extends $pb.GeneratedMessage {
  factory NewRecordVideo_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? playbackId,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    if (playbackId != null) result.playbackId = playbackId;
    return result;
  }

  NewRecordVideo_Request._();

  factory NewRecordVideo_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewRecordVideo_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewRecordVideo.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'playbackId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewRecordVideo_Request clone() =>
      NewRecordVideo_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewRecordVideo_Request copyWith(
          void Function(NewRecordVideo_Request) updates) =>
      super.copyWith((message) => updates(message as NewRecordVideo_Request))
          as NewRecordVideo_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewRecordVideo_Request create() => NewRecordVideo_Request._();
  @$core.override
  NewRecordVideo_Request createEmptyInstance() => create();
  static $pb.PbList<NewRecordVideo_Request> createRepeated() =>
      $pb.PbList<NewRecordVideo_Request>();
  @$core.pragma('dart2js:noInline')
  static NewRecordVideo_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewRecordVideo_Request>(create);
  static NewRecordVideo_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get playbackId => $_getN(1);
  @$pb.TagNumber(2)
  set playbackId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlaybackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlaybackId() => $_clearField(2);
}

class NewRecordVideo_Reply extends $pb.GeneratedMessage {
  factory NewRecordVideo_Reply() => create();

  NewRecordVideo_Reply._();

  factory NewRecordVideo_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewRecordVideo_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewRecordVideo.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewRecordVideo_Reply clone() =>
      NewRecordVideo_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewRecordVideo_Reply copyWith(void Function(NewRecordVideo_Reply) updates) =>
      super.copyWith((message) => updates(message as NewRecordVideo_Reply))
          as NewRecordVideo_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewRecordVideo_Reply create() => NewRecordVideo_Reply._();
  @$core.override
  NewRecordVideo_Reply createEmptyInstance() => create();
  static $pb.PbList<NewRecordVideo_Reply> createRepeated() =>
      $pb.PbList<NewRecordVideo_Reply>();
  @$core.pragma('dart2js:noInline')
  static NewRecordVideo_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewRecordVideo_Reply>(create);
  static NewRecordVideo_Reply? _defaultInstance;
}

class NewRecordVideo extends $pb.GeneratedMessage {
  factory NewRecordVideo({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  NewRecordVideo._();

  factory NewRecordVideo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewRecordVideo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewRecordVideo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(617, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewRecordVideo clone() => NewRecordVideo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewRecordVideo copyWith(void Function(NewRecordVideo) updates) =>
      super.copyWith((message) => updates(message as NewRecordVideo))
          as NewRecordVideo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewRecordVideo create() => NewRecordVideo._();
  @$core.override
  NewRecordVideo createEmptyInstance() => create();
  static $pb.PbList<NewRecordVideo> createRepeated() =>
      $pb.PbList<NewRecordVideo>();
  @$core.pragma('dart2js:noInline')
  static NewRecordVideo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewRecordVideo>(create);
  static NewRecordVideo? _defaultInstance;

  @$pb.TagNumber(617)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(617)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(617)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(617)
  void clearID() => $_clearField(617);
}

class GetAllNodeAvaliable_Node extends $pb.GeneratedMessage {
  factory GetAllNodeAvaliable_Node({
    $core.String? nodeUuid,
    $core.String? grpcHost,
    $core.int? grpcPort,
  }) {
    final result = create();
    if (nodeUuid != null) result.nodeUuid = nodeUuid;
    if (grpcHost != null) result.grpcHost = grpcHost;
    if (grpcPort != null) result.grpcPort = grpcPort;
    return result;
  }

  GetAllNodeAvaliable_Node._();

  factory GetAllNodeAvaliable_Node.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllNodeAvaliable_Node.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllNodeAvaliable.Node',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeUuid')
    ..aOS(2, _omitFieldNames ? '' : 'grpcHost')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'grpcPort', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable_Node clone() =>
      GetAllNodeAvaliable_Node()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable_Node copyWith(
          void Function(GetAllNodeAvaliable_Node) updates) =>
      super.copyWith((message) => updates(message as GetAllNodeAvaliable_Node))
          as GetAllNodeAvaliable_Node;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable_Node create() => GetAllNodeAvaliable_Node._();
  @$core.override
  GetAllNodeAvaliable_Node createEmptyInstance() => create();
  static $pb.PbList<GetAllNodeAvaliable_Node> createRepeated() =>
      $pb.PbList<GetAllNodeAvaliable_Node>();
  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable_Node getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllNodeAvaliable_Node>(create);
  static GetAllNodeAvaliable_Node? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get grpcHost => $_getSZ(1);
  @$pb.TagNumber(2)
  set grpcHost($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGrpcHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrpcHost() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get grpcPort => $_getIZ(2);
  @$pb.TagNumber(3)
  set grpcPort($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrpcPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrpcPort() => $_clearField(3);
}

class GetAllNodeAvaliable_Request extends $pb.GeneratedMessage {
  factory GetAllNodeAvaliable_Request({
    $core.bool? isRecordNode,
  }) {
    final result = create();
    if (isRecordNode != null) result.isRecordNode = isRecordNode;
    return result;
  }

  GetAllNodeAvaliable_Request._();

  factory GetAllNodeAvaliable_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllNodeAvaliable_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllNodeAvaliable.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isRecordNode', protoName: 'isRecordNode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable_Request clone() =>
      GetAllNodeAvaliable_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable_Request copyWith(
          void Function(GetAllNodeAvaliable_Request) updates) =>
      super.copyWith(
              (message) => updates(message as GetAllNodeAvaliable_Request))
          as GetAllNodeAvaliable_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable_Request create() =>
      GetAllNodeAvaliable_Request._();
  @$core.override
  GetAllNodeAvaliable_Request createEmptyInstance() => create();
  static $pb.PbList<GetAllNodeAvaliable_Request> createRepeated() =>
      $pb.PbList<GetAllNodeAvaliable_Request>();
  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllNodeAvaliable_Request>(create);
  static GetAllNodeAvaliable_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isRecordNode => $_getBF(0);
  @$pb.TagNumber(1)
  set isRecordNode($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsRecordNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsRecordNode() => $_clearField(1);
}

class GetAllNodeAvaliable_Reply extends $pb.GeneratedMessage {
  factory GetAllNodeAvaliable_Reply({
    $core.Iterable<GetAllNodeAvaliable_Node>? nodes,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addAll(nodes);
    return result;
  }

  GetAllNodeAvaliable_Reply._();

  factory GetAllNodeAvaliable_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllNodeAvaliable_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllNodeAvaliable.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..pc<GetAllNodeAvaliable_Node>(
        1, _omitFieldNames ? '' : 'nodes', $pb.PbFieldType.PM,
        subBuilder: GetAllNodeAvaliable_Node.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable_Reply clone() =>
      GetAllNodeAvaliable_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable_Reply copyWith(
          void Function(GetAllNodeAvaliable_Reply) updates) =>
      super.copyWith((message) => updates(message as GetAllNodeAvaliable_Reply))
          as GetAllNodeAvaliable_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable_Reply create() => GetAllNodeAvaliable_Reply._();
  @$core.override
  GetAllNodeAvaliable_Reply createEmptyInstance() => create();
  static $pb.PbList<GetAllNodeAvaliable_Reply> createRepeated() =>
      $pb.PbList<GetAllNodeAvaliable_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllNodeAvaliable_Reply>(create);
  static GetAllNodeAvaliable_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GetAllNodeAvaliable_Node> get nodes => $_getList(0);
}

class GetAllNodeAvaliable extends $pb.GeneratedMessage {
  factory GetAllNodeAvaliable({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  GetAllNodeAvaliable._();

  factory GetAllNodeAvaliable.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllNodeAvaliable.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllNodeAvaliable',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(618, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable clone() => GetAllNodeAvaliable()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllNodeAvaliable copyWith(void Function(GetAllNodeAvaliable) updates) =>
      super.copyWith((message) => updates(message as GetAllNodeAvaliable))
          as GetAllNodeAvaliable;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable create() => GetAllNodeAvaliable._();
  @$core.override
  GetAllNodeAvaliable createEmptyInstance() => create();
  static $pb.PbList<GetAllNodeAvaliable> createRepeated() =>
      $pb.PbList<GetAllNodeAvaliable>();
  @$core.pragma('dart2js:noInline')
  static GetAllNodeAvaliable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllNodeAvaliable>(create);
  static GetAllNodeAvaliable? _defaultInstance;

  @$pb.TagNumber(618)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(618)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(618)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(618)
  void clearID() => $_clearField(618);
}

class startRecordWithTTL_Request extends $pb.GeneratedMessage {
  factory startRecordWithTTL_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? recordId,
    $core.int? ttl,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    if (recordId != null) result.recordId = recordId;
    if (ttl != null) result.ttl = ttl;
    return result;
  }

  startRecordWithTTL_Request._();

  factory startRecordWithTTL_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory startRecordWithTTL_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'startRecordWithTTL.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'ttl', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  startRecordWithTTL_Request clone() =>
      startRecordWithTTL_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  startRecordWithTTL_Request copyWith(
          void Function(startRecordWithTTL_Request) updates) =>
      super.copyWith(
              (message) => updates(message as startRecordWithTTL_Request))
          as startRecordWithTTL_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static startRecordWithTTL_Request create() => startRecordWithTTL_Request._();
  @$core.override
  startRecordWithTTL_Request createEmptyInstance() => create();
  static $pb.PbList<startRecordWithTTL_Request> createRepeated() =>
      $pb.PbList<startRecordWithTTL_Request>();
  @$core.pragma('dart2js:noInline')
  static startRecordWithTTL_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<startRecordWithTTL_Request>(create);
  static startRecordWithTTL_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get recordId => $_getN(1);
  @$pb.TagNumber(2)
  set recordId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecordId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecordId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get ttl => $_getIZ(2);
  @$pb.TagNumber(3)
  set ttl($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTtl() => $_has(2);
  @$pb.TagNumber(3)
  void clearTtl() => $_clearField(3);
}

class startRecordWithTTL_Reply extends $pb.GeneratedMessage {
  factory startRecordWithTTL_Reply() => create();

  startRecordWithTTL_Reply._();

  factory startRecordWithTTL_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory startRecordWithTTL_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'startRecordWithTTL.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  startRecordWithTTL_Reply clone() =>
      startRecordWithTTL_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  startRecordWithTTL_Reply copyWith(
          void Function(startRecordWithTTL_Reply) updates) =>
      super.copyWith((message) => updates(message as startRecordWithTTL_Reply))
          as startRecordWithTTL_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static startRecordWithTTL_Reply create() => startRecordWithTTL_Reply._();
  @$core.override
  startRecordWithTTL_Reply createEmptyInstance() => create();
  static $pb.PbList<startRecordWithTTL_Reply> createRepeated() =>
      $pb.PbList<startRecordWithTTL_Reply>();
  @$core.pragma('dart2js:noInline')
  static startRecordWithTTL_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<startRecordWithTTL_Reply>(create);
  static startRecordWithTTL_Reply? _defaultInstance;
}

class startRecordWithTTL extends $pb.GeneratedMessage {
  factory startRecordWithTTL({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  startRecordWithTTL._();

  factory startRecordWithTTL.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory startRecordWithTTL.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'startRecordWithTTL',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(619, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  startRecordWithTTL clone() => startRecordWithTTL()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  startRecordWithTTL copyWith(void Function(startRecordWithTTL) updates) =>
      super.copyWith((message) => updates(message as startRecordWithTTL))
          as startRecordWithTTL;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static startRecordWithTTL create() => startRecordWithTTL._();
  @$core.override
  startRecordWithTTL createEmptyInstance() => create();
  static $pb.PbList<startRecordWithTTL> createRepeated() =>
      $pb.PbList<startRecordWithTTL>();
  @$core.pragma('dart2js:noInline')
  static startRecordWithTTL getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<startRecordWithTTL>(create);
  static startRecordWithTTL? _defaultInstance;

  @$pb.TagNumber(619)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(619)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(619)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(619)
  void clearID() => $_clearField(619);
}

class StopRecordWithTTL_Request extends $pb.GeneratedMessage {
  factory StopRecordWithTTL_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? recordId,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    if (recordId != null) result.recordId = recordId;
    return result;
  }

  StopRecordWithTTL_Request._();

  factory StopRecordWithTTL_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopRecordWithTTL_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopRecordWithTTL.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecordWithTTL_Request clone() =>
      StopRecordWithTTL_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecordWithTTL_Request copyWith(
          void Function(StopRecordWithTTL_Request) updates) =>
      super.copyWith((message) => updates(message as StopRecordWithTTL_Request))
          as StopRecordWithTTL_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecordWithTTL_Request create() => StopRecordWithTTL_Request._();
  @$core.override
  StopRecordWithTTL_Request createEmptyInstance() => create();
  static $pb.PbList<StopRecordWithTTL_Request> createRepeated() =>
      $pb.PbList<StopRecordWithTTL_Request>();
  @$core.pragma('dart2js:noInline')
  static StopRecordWithTTL_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopRecordWithTTL_Request>(create);
  static StopRecordWithTTL_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get recordId => $_getN(1);
  @$pb.TagNumber(2)
  set recordId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecordId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecordId() => $_clearField(2);
}

class StopRecordWithTTL_Reply extends $pb.GeneratedMessage {
  factory StopRecordWithTTL_Reply({
    $core.String? path,
    $core.int? duration,
  }) {
    final result = create();
    if (path != null) result.path = path;
    if (duration != null) result.duration = duration;
    return result;
  }

  StopRecordWithTTL_Reply._();

  factory StopRecordWithTTL_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopRecordWithTTL_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopRecordWithTTL.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecordWithTTL_Reply clone() =>
      StopRecordWithTTL_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecordWithTTL_Reply copyWith(
          void Function(StopRecordWithTTL_Reply) updates) =>
      super.copyWith((message) => updates(message as StopRecordWithTTL_Reply))
          as StopRecordWithTTL_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecordWithTTL_Reply create() => StopRecordWithTTL_Reply._();
  @$core.override
  StopRecordWithTTL_Reply createEmptyInstance() => create();
  static $pb.PbList<StopRecordWithTTL_Reply> createRepeated() =>
      $pb.PbList<StopRecordWithTTL_Reply>();
  @$core.pragma('dart2js:noInline')
  static StopRecordWithTTL_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopRecordWithTTL_Reply>(create);
  static StopRecordWithTTL_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);
}

class StopRecordWithTTL extends $pb.GeneratedMessage {
  factory StopRecordWithTTL({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  StopRecordWithTTL._();

  factory StopRecordWithTTL.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopRecordWithTTL.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopRecordWithTTL',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(620, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecordWithTTL clone() => StopRecordWithTTL()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopRecordWithTTL copyWith(void Function(StopRecordWithTTL) updates) =>
      super.copyWith((message) => updates(message as StopRecordWithTTL))
          as StopRecordWithTTL;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopRecordWithTTL create() => StopRecordWithTTL._();
  @$core.override
  StopRecordWithTTL createEmptyInstance() => create();
  static $pb.PbList<StopRecordWithTTL> createRepeated() =>
      $pb.PbList<StopRecordWithTTL>();
  @$core.pragma('dart2js:noInline')
  static StopRecordWithTTL getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopRecordWithTTL>(create);
  static StopRecordWithTTL? _defaultInstance;

  @$pb.TagNumber(620)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(620)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(620)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(620)
  void clearID() => $_clearField(620);
}

class RecordTTLDone_Request extends $pb.GeneratedMessage {
  factory RecordTTLDone_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? recordId,
    $core.String? path,
    $core.int? duration,
  }) {
    final result = create();
    if (cameraId != null) result.cameraId = cameraId;
    if (recordId != null) result.recordId = recordId;
    if (path != null) result.path = path;
    if (duration != null) result.duration = duration;
    return result;
  }

  RecordTTLDone_Request._();

  factory RecordTTLDone_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordTTLDone_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordTTLDone.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordTTLDone_Request clone() =>
      RecordTTLDone_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordTTLDone_Request copyWith(
          void Function(RecordTTLDone_Request) updates) =>
      super.copyWith((message) => updates(message as RecordTTLDone_Request))
          as RecordTTLDone_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordTTLDone_Request create() => RecordTTLDone_Request._();
  @$core.override
  RecordTTLDone_Request createEmptyInstance() => create();
  static $pb.PbList<RecordTTLDone_Request> createRepeated() =>
      $pb.PbList<RecordTTLDone_Request>();
  @$core.pragma('dart2js:noInline')
  static RecordTTLDone_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordTTLDone_Request>(create);
  static RecordTTLDone_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get recordId => $_getN(1);
  @$pb.TagNumber(2)
  set recordId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecordId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecordId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => $_clearField(4);
}

class RecordTTLDone_Reply extends $pb.GeneratedMessage {
  factory RecordTTLDone_Reply() => create();

  RecordTTLDone_Reply._();

  factory RecordTTLDone_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordTTLDone_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordTTLDone.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordTTLDone_Reply clone() => RecordTTLDone_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordTTLDone_Reply copyWith(void Function(RecordTTLDone_Reply) updates) =>
      super.copyWith((message) => updates(message as RecordTTLDone_Reply))
          as RecordTTLDone_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordTTLDone_Reply create() => RecordTTLDone_Reply._();
  @$core.override
  RecordTTLDone_Reply createEmptyInstance() => create();
  static $pb.PbList<RecordTTLDone_Reply> createRepeated() =>
      $pb.PbList<RecordTTLDone_Reply>();
  @$core.pragma('dart2js:noInline')
  static RecordTTLDone_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordTTLDone_Reply>(create);
  static RecordTTLDone_Reply? _defaultInstance;
}

class RecordTTLDone extends $pb.GeneratedMessage {
  factory RecordTTLDone({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  RecordTTLDone._();

  factory RecordTTLDone.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordTTLDone.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordTTLDone',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(621, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordTTLDone clone() => RecordTTLDone()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordTTLDone copyWith(void Function(RecordTTLDone) updates) =>
      super.copyWith((message) => updates(message as RecordTTLDone))
          as RecordTTLDone;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordTTLDone create() => RecordTTLDone._();
  @$core.override
  RecordTTLDone createEmptyInstance() => create();
  static $pb.PbList<RecordTTLDone> createRepeated() =>
      $pb.PbList<RecordTTLDone>();
  @$core.pragma('dart2js:noInline')
  static RecordTTLDone getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordTTLDone>(create);
  static RecordTTLDone? _defaultInstance;

  @$pb.TagNumber(621)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(621)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(621)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(621)
  void clearID() => $_clearField(621);
}

class PushReplyToSession_Request extends $pb.GeneratedMessage {
  factory PushReplyToSession_Request({
    $core.List<$core.int>? msgData,
    $core.List<$core.int>? userId,
    $core.List<$core.int>? sessionId,
    $core.List<$core.int>? boxId,
    $core.List<$core.int>? connectionId,
    $core.int? msgType,
    $fixnum.Int64? msgId,
  }) {
    final result = create();
    if (msgData != null) result.msgData = msgData;
    if (userId != null) result.userId = userId;
    if (sessionId != null) result.sessionId = sessionId;
    if (boxId != null) result.boxId = boxId;
    if (connectionId != null) result.connectionId = connectionId;
    if (msgType != null) result.msgType = msgType;
    if (msgId != null) result.msgId = msgId;
    return result;
  }

  PushReplyToSession_Request._();

  factory PushReplyToSession_Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PushReplyToSession_Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PushReplyToSession.Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'msgData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'connectionId', $pb.PbFieldType.OY)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'msgType', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'msgId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PushReplyToSession_Request clone() =>
      PushReplyToSession_Request()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PushReplyToSession_Request copyWith(
          void Function(PushReplyToSession_Request) updates) =>
      super.copyWith(
              (message) => updates(message as PushReplyToSession_Request))
          as PushReplyToSession_Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PushReplyToSession_Request create() => PushReplyToSession_Request._();
  @$core.override
  PushReplyToSession_Request createEmptyInstance() => create();
  static $pb.PbList<PushReplyToSession_Request> createRepeated() =>
      $pb.PbList<PushReplyToSession_Request>();
  @$core.pragma('dart2js:noInline')
  static PushReplyToSession_Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PushReplyToSession_Request>(create);
  static PushReplyToSession_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get msgData => $_getN(0);
  @$pb.TagNumber(1)
  set msgData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsgData() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgData() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get sessionId => $_getN(2);
  @$pb.TagNumber(3)
  set sessionId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => $_clearField(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get boxId => $_getN(3);
  @$pb.TagNumber(5)
  set boxId($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(5)
  $core.bool hasBoxId() => $_has(3);
  @$pb.TagNumber(5)
  void clearBoxId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get connectionId => $_getN(4);
  @$pb.TagNumber(6)
  set connectionId($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(6)
  $core.bool hasConnectionId() => $_has(4);
  @$pb.TagNumber(6)
  void clearConnectionId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get msgType => $_getIZ(5);
  @$pb.TagNumber(7)
  set msgType($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(7)
  $core.bool hasMsgType() => $_has(5);
  @$pb.TagNumber(7)
  void clearMsgType() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get msgId => $_getI64(6);
  @$pb.TagNumber(8)
  set msgId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(8)
  $core.bool hasMsgId() => $_has(6);
  @$pb.TagNumber(8)
  void clearMsgId() => $_clearField(8);
}

class PushReplyToSession_Reply extends $pb.GeneratedMessage {
  factory PushReplyToSession_Reply() => create();

  PushReplyToSession_Reply._();

  factory PushReplyToSession_Reply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PushReplyToSession_Reply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PushReplyToSession.Reply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PushReplyToSession_Reply clone() =>
      PushReplyToSession_Reply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PushReplyToSession_Reply copyWith(
          void Function(PushReplyToSession_Reply) updates) =>
      super.copyWith((message) => updates(message as PushReplyToSession_Reply))
          as PushReplyToSession_Reply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PushReplyToSession_Reply create() => PushReplyToSession_Reply._();
  @$core.override
  PushReplyToSession_Reply createEmptyInstance() => create();
  static $pb.PbList<PushReplyToSession_Reply> createRepeated() =>
      $pb.PbList<PushReplyToSession_Reply>();
  @$core.pragma('dart2js:noInline')
  static PushReplyToSession_Reply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PushReplyToSession_Reply>(create);
  static PushReplyToSession_Reply? _defaultInstance;
}

class PushReplyToSession extends $pb.GeneratedMessage {
  factory PushReplyToSession({
    $core.int? iD,
  }) {
    final result = create();
    if (iD != null) result.iD = iD;
    return result;
  }

  PushReplyToSession._();

  factory PushReplyToSession.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PushReplyToSession.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PushReplyToSession',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VIVAS'),
      createEmptyInstance: create)
    ..a<$core.int>(622, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3,
        protoName: 'ID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PushReplyToSession clone() => PushReplyToSession()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PushReplyToSession copyWith(void Function(PushReplyToSession) updates) =>
      super.copyWith((message) => updates(message as PushReplyToSession))
          as PushReplyToSession;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PushReplyToSession create() => PushReplyToSession._();
  @$core.override
  PushReplyToSession createEmptyInstance() => create();
  static $pb.PbList<PushReplyToSession> createRepeated() =>
      $pb.PbList<PushReplyToSession>();
  @$core.pragma('dart2js:noInline')
  static PushReplyToSession getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PushReplyToSession>(create);
  static PushReplyToSession? _defaultInstance;

  @$pb.TagNumber(622)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(622)
  set iD($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(622)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(622)
  void clearID() => $_clearField(622);
}

class IPCAMApi {
  final $pb.RpcClient _client;

  IPCAMApi(this._client);

  $async.Future<Reply> sendRequest($pb.ClientContext? ctx, Request request) =>
      _client.invoke<Reply>(ctx, 'IPCAM', 'SendRequest', request, Reply());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
