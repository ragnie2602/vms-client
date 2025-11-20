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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'comm.model.pbenum.dart';
import 'google/protobuf/any.pb.dart' as $0;

export 'comm.model.pbenum.dart';

class Reply extends $pb.GeneratedMessage {
  factory Reply({
    $core.int? type,
    $core.Iterable<Presence>? presences,
    $fixnum.Int64? time,
    $0.Any? reply,
    $fixnum.Int64? id,
    $core.String? messageError,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (presences != null) {
      $result.presences.addAll(presences);
    }
    if (time != null) {
      $result.time = time;
    }
    if (reply != null) {
      $result.reply = reply;
    }
    if (id != null) {
      $result.id = id;
    }
    if (messageError != null) {
      $result.messageError = messageError;
    }
    return $result;
  }
  Reply._() : super();
  factory Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..pc<Presence>(2, _omitFieldNames ? '' : 'presences', $pb.PbFieldType.PM, subBuilder: Presence.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(4, _omitFieldNames ? '' : 'reply', subBuilder: $0.Any.create)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'messageError', protoName: 'message_Error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply clone() => Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply copyWith(void Function(Reply) updates) => super.copyWith((message) => updates(message as Reply)) as Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Presence> get presences => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $0.Any get reply => $_getN(3);
  @$pb.TagNumber(4)
  set reply($0.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReply() => $_has(3);
  @$pb.TagNumber(4)
  void clearReply() => clearField(4);
  @$pb.TagNumber(4)
  $0.Any ensureReply() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get id => $_getI64(4);
  @$pb.TagNumber(5)
  set id($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get messageError => $_getSZ(5);
  @$pb.TagNumber(6)
  set messageError($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMessageError() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessageError() => clearField(6);
}

class HttpReply extends $pb.GeneratedMessage {
  factory HttpReply({
    $core.int? type,
    $fixnum.Int64? time,
    $0.Any? reply,
    $core.String? messageError,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (time != null) {
      $result.time = time;
    }
    if (reply != null) {
      $result.reply = reply;
    }
    if (messageError != null) {
      $result.messageError = messageError;
    }
    return $result;
  }
  HttpReply._() : super();
  factory HttpReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HttpReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(3, _omitFieldNames ? '' : 'reply', subBuilder: $0.Any.create)
    ..aOS(4, _omitFieldNames ? '' : 'messageError', protoName: 'message_Error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpReply clone() => HttpReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpReply copyWith(void Function(HttpReply) updates) => super.copyWith((message) => updates(message as HttpReply)) as HttpReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HttpReply create() => HttpReply._();
  HttpReply createEmptyInstance() => create();
  static $pb.PbList<HttpReply> createRepeated() => $pb.PbList<HttpReply>();
  @$core.pragma('dart2js:noInline')
  static HttpReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpReply>(create);
  static HttpReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $0.Any get reply => $_getN(2);
  @$pb.TagNumber(3)
  set reply($0.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReply() => $_has(2);
  @$pb.TagNumber(3)
  void clearReply() => clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureReply() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get messageError => $_getSZ(3);
  @$pb.TagNumber(4)
  set messageError($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageError() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageError() => clearField(4);
}

class Request extends $pb.GeneratedMessage {
  factory Request({
    $core.int? type,
    $core.String? toppicFrom,
    $core.String? toppicTo,
    $core.String? nodeUuid,
    $0.Any? request,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (toppicFrom != null) {
      $result.toppicFrom = toppicFrom;
    }
    if (toppicTo != null) {
      $result.toppicTo = toppicTo;
    }
    if (nodeUuid != null) {
      $result.nodeUuid = nodeUuid;
    }
    if (request != null) {
      $result.request = request;
    }
    return $result;
  }
  Request._() : super();
  factory Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'toppicFrom')
    ..aOS(3, _omitFieldNames ? '' : 'toppicTo')
    ..aOS(4, _omitFieldNames ? '' : 'nodeUuid')
    ..aOM<$0.Any>(5, _omitFieldNames ? '' : 'request', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request clone() => Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request copyWith(void Function(Request) updates) => super.copyWith((message) => updates(message as Request)) as Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toppicFrom => $_getSZ(1);
  @$pb.TagNumber(2)
  set toppicFrom($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToppicFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearToppicFrom() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toppicTo => $_getSZ(2);
  @$pb.TagNumber(3)
  set toppicTo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToppicTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearToppicTo() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nodeUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set nodeUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNodeUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearNodeUuid() => clearField(4);

  @$pb.TagNumber(5)
  $0.Any get request => $_getN(4);
  @$pb.TagNumber(5)
  set request($0.Any v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequest() => clearField(5);
  @$pb.TagNumber(5)
  $0.Any ensureRequest() => $_ensure(4);
}

class HttpRequest extends $pb.GeneratedMessage {
  factory HttpRequest({
    $core.int? type,
    $core.List<$core.int>? sid,
    $core.List<$core.int>? uid,
    $0.Any? request,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (sid != null) {
      $result.sid = sid;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (request != null) {
      $result.request = request;
    }
    return $result;
  }
  HttpRequest._() : super();
  factory HttpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HttpRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'sid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OY)
    ..aOM<$0.Any>(4, _omitFieldNames ? '' : 'request', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpRequest clone() => HttpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpRequest copyWith(void Function(HttpRequest) updates) => super.copyWith((message) => updates(message as HttpRequest)) as HttpRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HttpRequest create() => HttpRequest._();
  HttpRequest createEmptyInstance() => create();
  static $pb.PbList<HttpRequest> createRepeated() => $pb.PbList<HttpRequest>();
  @$core.pragma('dart2js:noInline')
  static HttpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpRequest>(create);
  static HttpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get sid => $_getN(1);
  @$pb.TagNumber(2)
  set sid($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearSid() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get uid => $_getN(2);
  @$pb.TagNumber(3)
  set uid($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $0.Any get request => $_getN(3);
  @$pb.TagNumber(4)
  set request($0.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequest() => clearField(4);
  @$pb.TagNumber(4)
  $0.Any ensureRequest() => $_ensure(3);
}

class Receive extends $pb.GeneratedMessage {
  factory Receive({
    $fixnum.Int64? time,
    $core.String? deviceToken,
    $0.Any? receive,
  }) {
    final $result = create();
    if (time != null) {
      $result.time = time;
    }
    if (deviceToken != null) {
      $result.deviceToken = deviceToken;
    }
    if (receive != null) {
      $result.receive = receive;
    }
    return $result;
  }
  Receive._() : super();
  factory Receive.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Receive.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Receive', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'deviceToken')
    ..aOM<$0.Any>(3, _omitFieldNames ? '' : 'receive', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Receive clone() => Receive()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Receive copyWith(void Function(Receive) updates) => super.copyWith((message) => updates(message as Receive)) as Receive;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Receive create() => Receive._();
  Receive createEmptyInstance() => create();
  static $pb.PbList<Receive> createRepeated() => $pb.PbList<Receive>();
  @$core.pragma('dart2js:noInline')
  static Receive getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Receive>(create);
  static Receive? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceToken() => clearField(2);

  @$pb.TagNumber(3)
  $0.Any get receive => $_getN(2);
  @$pb.TagNumber(3)
  set receive($0.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceive() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceive() => clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureReceive() => $_ensure(2);
}

/// DATA MODEL
class Presence extends $pb.GeneratedMessage {
  factory Presence({
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? activeTime,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (activeTime != null) {
      $result.activeTime = activeTime;
    }
    return $result;
  }
  Presence._() : super();
  factory Presence.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Presence.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Presence', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'activeTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Presence clone() => Presence()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Presence copyWith(void Function(Presence) updates) => super.copyWith((message) => updates(message as Presence)) as Presence;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Presence create() => Presence._();
  Presence createEmptyInstance() => create();
  static $pb.PbList<Presence> createRepeated() => $pb.PbList<Presence>();
  @$core.pragma('dart2js:noInline')
  static Presence getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Presence>(create);
  static Presence? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get activeTime => $_getI64(1);
  @$pb.TagNumber(2)
  set activeTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActiveTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveTime() => clearField(2);
}

class Session extends $pb.GeneratedMessage {
  factory Session({
    $core.String? imageBaseUrl,
  }) {
    final $result = create();
    if (imageBaseUrl != null) {
      $result.imageBaseUrl = imageBaseUrl;
    }
    return $result;
  }
  Session._() : super();
  factory Session.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Session.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Session', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageBaseUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Session clone() => Session()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Session copyWith(void Function(Session) updates) => super.copyWith((message) => updates(message as Session)) as Session;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Session create() => Session._();
  Session createEmptyInstance() => create();
  static $pb.PbList<Session> createRepeated() => $pb.PbList<Session>();
  @$core.pragma('dart2js:noInline')
  static Session getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Session>(create);
  static Session? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageBaseUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageBaseUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageBaseUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageBaseUrl() => clearField(1);
}

class TurnAccount extends $pb.GeneratedMessage {
  factory TurnAccount({
    $core.String? username,
    $core.String? password,
    $core.String? host,
    $core.int? port,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  TurnAccount._() : super();
  factory TurnAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TurnAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TurnAccount', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'port', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TurnAccount clone() => TurnAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TurnAccount copyWith(void Function(TurnAccount) updates) => super.copyWith((message) => updates(message as TurnAccount)) as TurnAccount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TurnAccount create() => TurnAccount._();
  TurnAccount createEmptyInstance() => create();
  static $pb.PbList<TurnAccount> createRepeated() => $pb.PbList<TurnAccount>();
  @$core.pragma('dart2js:noInline')
  static TurnAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TurnAccount>(create);
  static TurnAccount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get host => $_getSZ(2);
  @$pb.TagNumber(3)
  set host($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearHost() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get port => $_getIZ(3);
  @$pb.TagNumber(4)
  set port($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearPort() => clearField(4);
}

class CameraEmapInfo extends $pb.GeneratedMessage {
  factory CameraEmapInfo({
    $core.List<$core.int>? cameraId,
    $core.int? typeIcon,
    $core.int? xCoordinate,
    $core.int? yCoordinate,
    $core.List<$core.int>? cameraEmapInfoId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (typeIcon != null) {
      $result.typeIcon = typeIcon;
    }
    if (xCoordinate != null) {
      $result.xCoordinate = xCoordinate;
    }
    if (yCoordinate != null) {
      $result.yCoordinate = yCoordinate;
    }
    if (cameraEmapInfoId != null) {
      $result.cameraEmapInfoId = cameraEmapInfoId;
    }
    return $result;
  }
  CameraEmapInfo._() : super();
  factory CameraEmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraEmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraEmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'typeIcon', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'xCoordinate', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'yCoordinate', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'cameraEmapInfoId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraEmapInfo clone() => CameraEmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraEmapInfo copyWith(void Function(CameraEmapInfo) updates) => super.copyWith((message) => updates(message as CameraEmapInfo)) as CameraEmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraEmapInfo create() => CameraEmapInfo._();
  CameraEmapInfo createEmptyInstance() => create();
  static $pb.PbList<CameraEmapInfo> createRepeated() => $pb.PbList<CameraEmapInfo>();
  @$core.pragma('dart2js:noInline')
  static CameraEmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraEmapInfo>(create);
  static CameraEmapInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get typeIcon => $_getIZ(1);
  @$pb.TagNumber(2)
  set typeIcon($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTypeIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearTypeIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get xCoordinate => $_getIZ(2);
  @$pb.TagNumber(3)
  set xCoordinate($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasXCoordinate() => $_has(2);
  @$pb.TagNumber(3)
  void clearXCoordinate() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get yCoordinate => $_getIZ(3);
  @$pb.TagNumber(4)
  set yCoordinate($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasYCoordinate() => $_has(3);
  @$pb.TagNumber(4)
  void clearYCoordinate() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get cameraEmapInfoId => $_getN(4);
  @$pb.TagNumber(5)
  set cameraEmapInfoId($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCameraEmapInfoId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCameraEmapInfoId() => clearField(5);
}

class EmapInfo extends $pb.GeneratedMessage {
  factory EmapInfo({
    $core.List<$core.int>? emapId,
    $core.String? emapName,
    $core.String? backgroundPath,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    if (emapName != null) {
      $result.emapName = emapName;
    }
    if (backgroundPath != null) {
      $result.backgroundPath = backgroundPath;
    }
    return $result;
  }
  EmapInfo._() : super();
  factory EmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'emapName')
    ..aOS(3, _omitFieldNames ? '' : 'backgroundPath')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmapInfo clone() => EmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmapInfo copyWith(void Function(EmapInfo) updates) => super.copyWith((message) => updates(message as EmapInfo)) as EmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmapInfo create() => EmapInfo._();
  EmapInfo createEmptyInstance() => create();
  static $pb.PbList<EmapInfo> createRepeated() => $pb.PbList<EmapInfo>();
  @$core.pragma('dart2js:noInline')
  static EmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmapInfo>(create);
  static EmapInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get emapName => $_getSZ(1);
  @$pb.TagNumber(2)
  set emapName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmapName() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmapName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get backgroundPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set backgroundPath($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBackgroundPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackgroundPath() => clearField(3);
}

class Profile extends $pb.GeneratedMessage {
  factory Profile({
    $core.String? account,
    $core.String? address,
    $core.bool? isSendEmailEvent,
    $core.Iterable<$core.String>? emailReceive,
    $core.String? displayName,
    $core.bool? cameraRecordOn,
    $core.bool? cameraSdCardFullyOverride,
    $core.bool? cloudRecordOn,
    $core.int? numberDayStorage,
    $core.String? tel,
    $core.String? email,
    $core.bool? changePassDenied,
    $core.bool? addCamDenied,
    $core.String? smeName,
    $core.int? msgUnreadCount,
    $core.bool? onOffBarrier,
    $core.String? startTime,
    $core.String? endTime,
    Profile_Type? userType,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (address != null) {
      $result.address = address;
    }
    if (isSendEmailEvent != null) {
      $result.isSendEmailEvent = isSendEmailEvent;
    }
    if (emailReceive != null) {
      $result.emailReceive.addAll(emailReceive);
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (cameraRecordOn != null) {
      $result.cameraRecordOn = cameraRecordOn;
    }
    if (cameraSdCardFullyOverride != null) {
      $result.cameraSdCardFullyOverride = cameraSdCardFullyOverride;
    }
    if (cloudRecordOn != null) {
      $result.cloudRecordOn = cloudRecordOn;
    }
    if (numberDayStorage != null) {
      $result.numberDayStorage = numberDayStorage;
    }
    if (tel != null) {
      $result.tel = tel;
    }
    if (email != null) {
      $result.email = email;
    }
    if (changePassDenied != null) {
      $result.changePassDenied = changePassDenied;
    }
    if (addCamDenied != null) {
      $result.addCamDenied = addCamDenied;
    }
    if (smeName != null) {
      $result.smeName = smeName;
    }
    if (msgUnreadCount != null) {
      $result.msgUnreadCount = msgUnreadCount;
    }
    if (onOffBarrier != null) {
      $result.onOffBarrier = onOffBarrier;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (userType != null) {
      $result.userType = userType;
    }
    return $result;
  }
  Profile._() : super();
  factory Profile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Profile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Profile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aOB(3, _omitFieldNames ? '' : 'isSendEmailEvent')
    ..pPS(4, _omitFieldNames ? '' : 'emailReceive')
    ..aOS(5, _omitFieldNames ? '' : 'displayName')
    ..aOB(6, _omitFieldNames ? '' : 'cameraRecordOn')
    ..aOB(7, _omitFieldNames ? '' : 'cameraSdCardFullyOverride')
    ..aOB(8, _omitFieldNames ? '' : 'cloudRecordOn')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'numberDayStorage', $pb.PbFieldType.OU3)
    ..aOS(10, _omitFieldNames ? '' : 'tel')
    ..aOS(11, _omitFieldNames ? '' : 'email')
    ..aOB(12, _omitFieldNames ? '' : 'changePassDenied', protoName: 'changePassDenied')
    ..aOB(13, _omitFieldNames ? '' : 'addCamDenied', protoName: 'addCamDenied')
    ..aOS(14, _omitFieldNames ? '' : 'smeName')
    ..a<$core.int>(15, _omitFieldNames ? '' : 'msgUnreadCount', $pb.PbFieldType.OU3)
    ..aOB(16, _omitFieldNames ? '' : 'onOffBarrier')
    ..aOS(17, _omitFieldNames ? '' : 'startTime')
    ..aOS(18, _omitFieldNames ? '' : 'endTime')
    ..e<Profile_Type>(19, _omitFieldNames ? '' : 'userType', $pb.PbFieldType.OE, defaultOrMaker: Profile_Type.USER, valueOf: Profile_Type.valueOf, enumValues: Profile_Type.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Profile clone() => Profile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Profile copyWith(void Function(Profile) updates) => super.copyWith((message) => updates(message as Profile)) as Profile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Profile create() => Profile._();
  Profile createEmptyInstance() => create();
  static $pb.PbList<Profile> createRepeated() => $pb.PbList<Profile>();
  @$core.pragma('dart2js:noInline')
  static Profile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Profile>(create);
  static Profile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSendEmailEvent => $_getBF(2);
  @$pb.TagNumber(3)
  set isSendEmailEvent($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSendEmailEvent() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSendEmailEvent() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get emailReceive => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get displayName => $_getSZ(4);
  @$pb.TagNumber(5)
  set displayName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisplayName() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplayName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get cameraRecordOn => $_getBF(5);
  @$pb.TagNumber(6)
  set cameraRecordOn($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCameraRecordOn() => $_has(5);
  @$pb.TagNumber(6)
  void clearCameraRecordOn() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get cameraSdCardFullyOverride => $_getBF(6);
  @$pb.TagNumber(7)
  set cameraSdCardFullyOverride($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCameraSdCardFullyOverride() => $_has(6);
  @$pb.TagNumber(7)
  void clearCameraSdCardFullyOverride() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get cloudRecordOn => $_getBF(7);
  @$pb.TagNumber(8)
  set cloudRecordOn($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCloudRecordOn() => $_has(7);
  @$pb.TagNumber(8)
  void clearCloudRecordOn() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get numberDayStorage => $_getIZ(8);
  @$pb.TagNumber(9)
  set numberDayStorage($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNumberDayStorage() => $_has(8);
  @$pb.TagNumber(9)
  void clearNumberDayStorage() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get tel => $_getSZ(9);
  @$pb.TagNumber(10)
  set tel($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTel() => $_has(9);
  @$pb.TagNumber(10)
  void clearTel() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get email => $_getSZ(10);
  @$pb.TagNumber(11)
  set email($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasEmail() => $_has(10);
  @$pb.TagNumber(11)
  void clearEmail() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get changePassDenied => $_getBF(11);
  @$pb.TagNumber(12)
  set changePassDenied($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasChangePassDenied() => $_has(11);
  @$pb.TagNumber(12)
  void clearChangePassDenied() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get addCamDenied => $_getBF(12);
  @$pb.TagNumber(13)
  set addCamDenied($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAddCamDenied() => $_has(12);
  @$pb.TagNumber(13)
  void clearAddCamDenied() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get smeName => $_getSZ(13);
  @$pb.TagNumber(14)
  set smeName($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSmeName() => $_has(13);
  @$pb.TagNumber(14)
  void clearSmeName() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get msgUnreadCount => $_getIZ(14);
  @$pb.TagNumber(15)
  set msgUnreadCount($core.int v) { $_setUnsignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasMsgUnreadCount() => $_has(14);
  @$pb.TagNumber(15)
  void clearMsgUnreadCount() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get onOffBarrier => $_getBF(15);
  @$pb.TagNumber(16)
  set onOffBarrier($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasOnOffBarrier() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnOffBarrier() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get startTime => $_getSZ(16);
  @$pb.TagNumber(17)
  set startTime($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasStartTime() => $_has(16);
  @$pb.TagNumber(17)
  void clearStartTime() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get endTime => $_getSZ(17);
  @$pb.TagNumber(18)
  set endTime($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasEndTime() => $_has(17);
  @$pb.TagNumber(18)
  void clearEndTime() => clearField(18);

  @$pb.TagNumber(19)
  Profile_Type get userType => $_getN(18);
  @$pb.TagNumber(19)
  set userType(Profile_Type v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasUserType() => $_has(18);
  @$pb.TagNumber(19)
  void clearUserType() => clearField(19);
}

class BoxInfo extends $pb.GeneratedMessage {
  factory BoxInfo({
    $core.String? boxName,
    $core.String? boxSerialNumber,
    BoxInfo_Box_Type? boxType,
    $core.List<$core.int>? ownerUserId,
    Box_State? boxState,
  }) {
    final $result = create();
    if (boxName != null) {
      $result.boxName = boxName;
    }
    if (boxSerialNumber != null) {
      $result.boxSerialNumber = boxSerialNumber;
    }
    if (boxType != null) {
      $result.boxType = boxType;
    }
    if (ownerUserId != null) {
      $result.ownerUserId = ownerUserId;
    }
    if (boxState != null) {
      $result.boxState = boxState;
    }
    return $result;
  }
  BoxInfo._() : super();
  factory BoxInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoxInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoxInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boxName')
    ..aOS(2, _omitFieldNames ? '' : 'boxSerialNumber')
    ..e<BoxInfo_Box_Type>(3, _omitFieldNames ? '' : 'boxType', $pb.PbFieldType.OE, defaultOrMaker: BoxInfo_Box_Type.BOX_UNDEFINED, valueOf: BoxInfo_Box_Type.valueOf, enumValues: BoxInfo_Box_Type.values)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'ownerUserId', $pb.PbFieldType.OY)
    ..e<Box_State>(5, _omitFieldNames ? '' : 'boxState', $pb.PbFieldType.OE, protoName: 'box_State', defaultOrMaker: Box_State.VBOX_ACTIVE, valueOf: Box_State.valueOf, enumValues: Box_State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoxInfo clone() => BoxInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoxInfo copyWith(void Function(BoxInfo) updates) => super.copyWith((message) => updates(message as BoxInfo)) as BoxInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxInfo create() => BoxInfo._();
  BoxInfo createEmptyInstance() => create();
  static $pb.PbList<BoxInfo> createRepeated() => $pb.PbList<BoxInfo>();
  @$core.pragma('dart2js:noInline')
  static BoxInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoxInfo>(create);
  static BoxInfo? _defaultInstance;

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

  @$pb.TagNumber(3)
  BoxInfo_Box_Type get boxType => $_getN(2);
  @$pb.TagNumber(3)
  set boxType(BoxInfo_Box_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoxType() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoxType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ownerUserId => $_getN(3);
  @$pb.TagNumber(4)
  set ownerUserId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwnerUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerUserId() => clearField(4);

  @$pb.TagNumber(5)
  Box_State get boxState => $_getN(4);
  @$pb.TagNumber(5)
  set boxState(Box_State v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBoxState() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoxState() => clearField(5);
}

class ScheduleTime extends $pb.GeneratedMessage {
  factory ScheduleTime({
    $core.int? startTime,
    $core.int? endTime,
    ScheduleTime_Day? dayRecord,
    $core.bool? scheduleTimeEnable,
  }) {
    final $result = create();
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (dayRecord != null) {
      $result.dayRecord = dayRecord;
    }
    if (scheduleTimeEnable != null) {
      $result.scheduleTimeEnable = scheduleTimeEnable;
    }
    return $result;
  }
  ScheduleTime._() : super();
  factory ScheduleTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduleTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'endTime', $pb.PbFieldType.OU3)
    ..e<ScheduleTime_Day>(3, _omitFieldNames ? '' : 'dayRecord', $pb.PbFieldType.OE, defaultOrMaker: ScheduleTime_Day.CN, valueOf: ScheduleTime_Day.valueOf, enumValues: ScheduleTime_Day.values)
    ..aOB(4, _omitFieldNames ? '' : 'scheduleTimeEnable', protoName: 'schedule_Time_Enable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleTime clone() => ScheduleTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleTime copyWith(void Function(ScheduleTime) updates) => super.copyWith((message) => updates(message as ScheduleTime)) as ScheduleTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleTime create() => ScheduleTime._();
  ScheduleTime createEmptyInstance() => create();
  static $pb.PbList<ScheduleTime> createRepeated() => $pb.PbList<ScheduleTime>();
  @$core.pragma('dart2js:noInline')
  static ScheduleTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleTime>(create);
  static ScheduleTime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get startTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set startTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get endTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set endTime($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => clearField(2);

  @$pb.TagNumber(3)
  ScheduleTime_Day get dayRecord => $_getN(2);
  @$pb.TagNumber(3)
  set dayRecord(ScheduleTime_Day v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDayRecord() => $_has(2);
  @$pb.TagNumber(3)
  void clearDayRecord() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get scheduleTimeEnable => $_getBF(3);
  @$pb.TagNumber(4)
  set scheduleTimeEnable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasScheduleTimeEnable() => $_has(3);
  @$pb.TagNumber(4)
  void clearScheduleTimeEnable() => clearField(4);
}

class Recording extends $pb.GeneratedMessage {
  factory Recording({
    $core.bool? turnOnRecording,
    Recording_TypeSchedule? typeScheduleRecording,
    $core.Iterable<ScheduleTime>? schedules,
    Recording_RecordingForm? recordingForm,
    $core.String? prefixPath,
    $core.String? rtspServerLocal,
    $core.String? rtspServerPublic,
    $core.String? rtspPushUser,
    $core.String? rtspPussPass,
    $core.String? uploadUrlPath,
  }) {
    final $result = create();
    if (turnOnRecording != null) {
      $result.turnOnRecording = turnOnRecording;
    }
    if (typeScheduleRecording != null) {
      $result.typeScheduleRecording = typeScheduleRecording;
    }
    if (schedules != null) {
      $result.schedules.addAll(schedules);
    }
    if (recordingForm != null) {
      $result.recordingForm = recordingForm;
    }
    if (prefixPath != null) {
      $result.prefixPath = prefixPath;
    }
    if (rtspServerLocal != null) {
      $result.rtspServerLocal = rtspServerLocal;
    }
    if (rtspServerPublic != null) {
      $result.rtspServerPublic = rtspServerPublic;
    }
    if (rtspPushUser != null) {
      $result.rtspPushUser = rtspPushUser;
    }
    if (rtspPussPass != null) {
      $result.rtspPussPass = rtspPussPass;
    }
    if (uploadUrlPath != null) {
      $result.uploadUrlPath = uploadUrlPath;
    }
    return $result;
  }
  Recording._() : super();
  factory Recording.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Recording.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Recording', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'turnOnRecording')
    ..e<Recording_TypeSchedule>(2, _omitFieldNames ? '' : 'typeScheduleRecording', $pb.PbFieldType.OE, defaultOrMaker: Recording_TypeSchedule.ALWAY_RECORDING, valueOf: Recording_TypeSchedule.valueOf, enumValues: Recording_TypeSchedule.values)
    ..pc<ScheduleTime>(3, _omitFieldNames ? '' : 'schedules', $pb.PbFieldType.PM, subBuilder: ScheduleTime.create)
    ..e<Recording_RecordingForm>(4, _omitFieldNames ? '' : 'recordingForm', $pb.PbFieldType.OE, protoName: 'recordingForm', defaultOrMaker: Recording_RecordingForm.CLOUD, valueOf: Recording_RecordingForm.valueOf, enumValues: Recording_RecordingForm.values)
    ..aOS(5, _omitFieldNames ? '' : 'prefixPath')
    ..aOS(6, _omitFieldNames ? '' : 'rtspServerLocal')
    ..aOS(7, _omitFieldNames ? '' : 'rtspServerPublic')
    ..aOS(8, _omitFieldNames ? '' : 'rtspPushUser')
    ..aOS(9, _omitFieldNames ? '' : 'rtspPussPass')
    ..aOS(10, _omitFieldNames ? '' : 'uploadUrlPath')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Recording clone() => Recording()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Recording copyWith(void Function(Recording) updates) => super.copyWith((message) => updates(message as Recording)) as Recording;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Recording create() => Recording._();
  Recording createEmptyInstance() => create();
  static $pb.PbList<Recording> createRepeated() => $pb.PbList<Recording>();
  @$core.pragma('dart2js:noInline')
  static Recording getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Recording>(create);
  static Recording? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get turnOnRecording => $_getBF(0);
  @$pb.TagNumber(1)
  set turnOnRecording($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTurnOnRecording() => $_has(0);
  @$pb.TagNumber(1)
  void clearTurnOnRecording() => clearField(1);

  @$pb.TagNumber(2)
  Recording_TypeSchedule get typeScheduleRecording => $_getN(1);
  @$pb.TagNumber(2)
  set typeScheduleRecording(Recording_TypeSchedule v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTypeScheduleRecording() => $_has(1);
  @$pb.TagNumber(2)
  void clearTypeScheduleRecording() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ScheduleTime> get schedules => $_getList(2);

  @$pb.TagNumber(4)
  Recording_RecordingForm get recordingForm => $_getN(3);
  @$pb.TagNumber(4)
  set recordingForm(Recording_RecordingForm v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRecordingForm() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecordingForm() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get prefixPath => $_getSZ(4);
  @$pb.TagNumber(5)
  set prefixPath($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrefixPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrefixPath() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rtspServerLocal => $_getSZ(5);
  @$pb.TagNumber(6)
  set rtspServerLocal($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRtspServerLocal() => $_has(5);
  @$pb.TagNumber(6)
  void clearRtspServerLocal() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get rtspServerPublic => $_getSZ(6);
  @$pb.TagNumber(7)
  set rtspServerPublic($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRtspServerPublic() => $_has(6);
  @$pb.TagNumber(7)
  void clearRtspServerPublic() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get rtspPushUser => $_getSZ(7);
  @$pb.TagNumber(8)
  set rtspPushUser($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRtspPushUser() => $_has(7);
  @$pb.TagNumber(8)
  void clearRtspPushUser() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get rtspPussPass => $_getSZ(8);
  @$pb.TagNumber(9)
  set rtspPussPass($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRtspPussPass() => $_has(8);
  @$pb.TagNumber(9)
  void clearRtspPussPass() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uploadUrlPath => $_getSZ(9);
  @$pb.TagNumber(10)
  set uploadUrlPath($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUploadUrlPath() => $_has(9);
  @$pb.TagNumber(10)
  void clearUploadUrlPath() => clearField(10);
}

class Roi extends $pb.GeneratedMessage {
  factory Roi({
    $core.int? x,
    $core.int? y,
  }) {
    final $result = create();
    if (x != null) {
      $result.x = x;
    }
    if (y != null) {
      $result.y = y;
    }
    return $result;
  }
  Roi._() : super();
  factory Roi.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Roi.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Roi', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Roi clone() => Roi()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Roi copyWith(void Function(Roi) updates) => super.copyWith((message) => updates(message as Roi)) as Roi;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Roi create() => Roi._();
  Roi createEmptyInstance() => create();
  static $pb.PbList<Roi> createRepeated() => $pb.PbList<Roi>();
  @$core.pragma('dart2js:noInline')
  static Roi getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Roi>(create);
  static Roi? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class CamNetwork extends $pb.GeneratedMessage {
  factory CamNetwork({
    NetworkType? type,
    $core.String? ipAddress,
    $core.String? subness,
    $core.String? gateway,
    $core.String? dNS,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (ipAddress != null) {
      $result.ipAddress = ipAddress;
    }
    if (subness != null) {
      $result.subness = subness;
    }
    if (gateway != null) {
      $result.gateway = gateway;
    }
    if (dNS != null) {
      $result.dNS = dNS;
    }
    return $result;
  }
  CamNetwork._() : super();
  factory CamNetwork.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CamNetwork.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CamNetwork', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<NetworkType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NetworkType.DHCP, valueOf: NetworkType.valueOf, enumValues: NetworkType.values)
    ..aOS(3, _omitFieldNames ? '' : 'ipAddress')
    ..aOS(4, _omitFieldNames ? '' : 'subness')
    ..aOS(5, _omitFieldNames ? '' : 'gateway')
    ..aOS(6, _omitFieldNames ? '' : 'DNS', protoName: 'DNS')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CamNetwork clone() => CamNetwork()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CamNetwork copyWith(void Function(CamNetwork) updates) => super.copyWith((message) => updates(message as CamNetwork)) as CamNetwork;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CamNetwork create() => CamNetwork._();
  CamNetwork createEmptyInstance() => create();
  static $pb.PbList<CamNetwork> createRepeated() => $pb.PbList<CamNetwork>();
  @$core.pragma('dart2js:noInline')
  static CamNetwork getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CamNetwork>(create);
  static CamNetwork? _defaultInstance;

  @$pb.TagNumber(2)
  NetworkType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(NetworkType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ipAddress => $_getSZ(1);
  @$pb.TagNumber(3)
  set ipAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasIpAddress() => $_has(1);
  @$pb.TagNumber(3)
  void clearIpAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get subness => $_getSZ(2);
  @$pb.TagNumber(4)
  set subness($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubness() => $_has(2);
  @$pb.TagNumber(4)
  void clearSubness() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gateway => $_getSZ(3);
  @$pb.TagNumber(5)
  set gateway($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasGateway() => $_has(3);
  @$pb.TagNumber(5)
  void clearGateway() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dNS => $_getSZ(4);
  @$pb.TagNumber(6)
  set dNS($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasDNS() => $_has(4);
  @$pb.TagNumber(6)
  void clearDNS() => clearField(6);
}

class KC01_LineCrossing extends $pb.GeneratedMessage {
  factory KC01_LineCrossing({
    $core.bool? lineCrossingEnable,
    $core.int? direction,
    $core.int? width,
    $core.int? height,
    $core.double? startX,
    $core.double? startY,
    $core.double? endX,
    $core.double? endY,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
  }) {
    final $result = create();
    if (lineCrossingEnable != null) {
      $result.lineCrossingEnable = lineCrossingEnable;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (startX != null) {
      $result.startX = startX;
    }
    if (startY != null) {
      $result.startY = startY;
    }
    if (endX != null) {
      $result.endX = endX;
    }
    if (endY != null) {
      $result.endY = endY;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    return $result;
  }
  KC01_LineCrossing._() : super();
  factory KC01_LineCrossing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KC01_LineCrossing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KC01_LineCrossing', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'lineCrossingEnable')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'startX', $pb.PbFieldType.OF, protoName: 'startX')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'startY', $pb.PbFieldType.OF, protoName: 'startY')
    ..a<$core.double>(7, _omitFieldNames ? '' : 'endX', $pb.PbFieldType.OF, protoName: 'endX')
    ..a<$core.double>(8, _omitFieldNames ? '' : 'endY', $pb.PbFieldType.OF, protoName: 'endY')
    ..aOB(9, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(10, _omitFieldNames ? '' : 'isRecord')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KC01_LineCrossing clone() => KC01_LineCrossing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KC01_LineCrossing copyWith(void Function(KC01_LineCrossing) updates) => super.copyWith((message) => updates(message as KC01_LineCrossing)) as KC01_LineCrossing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KC01_LineCrossing create() => KC01_LineCrossing._();
  KC01_LineCrossing createEmptyInstance() => create();
  static $pb.PbList<KC01_LineCrossing> createRepeated() => $pb.PbList<KC01_LineCrossing>();
  @$core.pragma('dart2js:noInline')
  static KC01_LineCrossing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KC01_LineCrossing>(create);
  static KC01_LineCrossing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get lineCrossingEnable => $_getBF(0);
  @$pb.TagNumber(1)
  set lineCrossingEnable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLineCrossingEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearLineCrossingEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get direction => $_getIZ(1);
  @$pb.TagNumber(2)
  set direction($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get startX => $_getN(4);
  @$pb.TagNumber(5)
  set startX($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartX() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartX() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get startY => $_getN(5);
  @$pb.TagNumber(6)
  set startY($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartY() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartY() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get endX => $_getN(6);
  @$pb.TagNumber(7)
  set endX($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndX() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndX() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get endY => $_getN(7);
  @$pb.TagNumber(8)
  set endY($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndY() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndY() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isSendEmail => $_getBF(8);
  @$pb.TagNumber(9)
  set isSendEmail($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsSendEmail() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsSendEmail() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isRecord => $_getBF(9);
  @$pb.TagNumber(10)
  set isRecord($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsRecord() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsRecord() => clearField(10);
}

class KC01_IntrusionDetection extends $pb.GeneratedMessage {
  factory KC01_IntrusionDetection({
    $core.bool? intrusionDetectionEnable,
    $core.int? width,
    $core.int? height,
    $core.double? pX1,
    $core.double? pY1,
    $core.double? pX2,
    $core.double? pY2,
    $core.double? pX3,
    $core.double? pY3,
    $core.double? pX4,
    $core.double? pY4,
    $core.bool? isSendEmail,
    $core.bool? isRecord,
  }) {
    final $result = create();
    if (intrusionDetectionEnable != null) {
      $result.intrusionDetectionEnable = intrusionDetectionEnable;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (pX1 != null) {
      $result.pX1 = pX1;
    }
    if (pY1 != null) {
      $result.pY1 = pY1;
    }
    if (pX2 != null) {
      $result.pX2 = pX2;
    }
    if (pY2 != null) {
      $result.pY2 = pY2;
    }
    if (pX3 != null) {
      $result.pX3 = pX3;
    }
    if (pY3 != null) {
      $result.pY3 = pY3;
    }
    if (pX4 != null) {
      $result.pX4 = pX4;
    }
    if (pY4 != null) {
      $result.pY4 = pY4;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    return $result;
  }
  KC01_IntrusionDetection._() : super();
  factory KC01_IntrusionDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KC01_IntrusionDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KC01_IntrusionDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'intrusionDetectionEnable')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'pX1', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'pY1', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'pX2', $pb.PbFieldType.OF)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'pY2', $pb.PbFieldType.OF)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'pX3', $pb.PbFieldType.OF)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'pY3', $pb.PbFieldType.OF)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'pX4', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'pY4', $pb.PbFieldType.OF)
    ..aOB(12, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(13, _omitFieldNames ? '' : 'isRecord')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KC01_IntrusionDetection clone() => KC01_IntrusionDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KC01_IntrusionDetection copyWith(void Function(KC01_IntrusionDetection) updates) => super.copyWith((message) => updates(message as KC01_IntrusionDetection)) as KC01_IntrusionDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KC01_IntrusionDetection create() => KC01_IntrusionDetection._();
  KC01_IntrusionDetection createEmptyInstance() => create();
  static $pb.PbList<KC01_IntrusionDetection> createRepeated() => $pb.PbList<KC01_IntrusionDetection>();
  @$core.pragma('dart2js:noInline')
  static KC01_IntrusionDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KC01_IntrusionDetection>(create);
  static KC01_IntrusionDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get intrusionDetectionEnable => $_getBF(0);
  @$pb.TagNumber(1)
  set intrusionDetectionEnable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIntrusionDetectionEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntrusionDetectionEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get width => $_getIZ(1);
  @$pb.TagNumber(2)
  set width($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get pX1 => $_getN(3);
  @$pb.TagNumber(4)
  set pX1($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPX1() => $_has(3);
  @$pb.TagNumber(4)
  void clearPX1() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get pY1 => $_getN(4);
  @$pb.TagNumber(5)
  set pY1($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPY1() => $_has(4);
  @$pb.TagNumber(5)
  void clearPY1() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get pX2 => $_getN(5);
  @$pb.TagNumber(6)
  set pX2($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPX2() => $_has(5);
  @$pb.TagNumber(6)
  void clearPX2() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get pY2 => $_getN(6);
  @$pb.TagNumber(7)
  set pY2($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPY2() => $_has(6);
  @$pb.TagNumber(7)
  void clearPY2() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get pX3 => $_getN(7);
  @$pb.TagNumber(8)
  set pX3($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPX3() => $_has(7);
  @$pb.TagNumber(8)
  void clearPX3() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get pY3 => $_getN(8);
  @$pb.TagNumber(9)
  set pY3($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPY3() => $_has(8);
  @$pb.TagNumber(9)
  void clearPY3() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get pX4 => $_getN(9);
  @$pb.TagNumber(10)
  set pX4($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPX4() => $_has(9);
  @$pb.TagNumber(10)
  void clearPX4() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get pY4 => $_getN(10);
  @$pb.TagNumber(11)
  set pY4($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPY4() => $_has(10);
  @$pb.TagNumber(11)
  void clearPY4() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isSendEmail => $_getBF(11);
  @$pb.TagNumber(12)
  set isSendEmail($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsSendEmail() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsSendEmail() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isRecord => $_getBF(12);
  @$pb.TagNumber(13)
  set isRecord($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsRecord() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsRecord() => clearField(13);
}

class KC01_TimeSetting extends $pb.GeneratedMessage {
  factory KC01_TimeSetting({
    $core.bool? is24H,
    $core.bool? isAutoUpdateTime,
    $core.int? cameraTimeZone,
    $core.bool? isEnablerNTP,
    $core.String? ntpServer,
  }) {
    final $result = create();
    if (is24H != null) {
      $result.is24H = is24H;
    }
    if (isAutoUpdateTime != null) {
      $result.isAutoUpdateTime = isAutoUpdateTime;
    }
    if (cameraTimeZone != null) {
      $result.cameraTimeZone = cameraTimeZone;
    }
    if (isEnablerNTP != null) {
      $result.isEnablerNTP = isEnablerNTP;
    }
    if (ntpServer != null) {
      $result.ntpServer = ntpServer;
    }
    return $result;
  }
  KC01_TimeSetting._() : super();
  factory KC01_TimeSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KC01_TimeSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KC01_TimeSetting', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'is24H', protoName: 'is24H')
    ..aOB(2, _omitFieldNames ? '' : 'isAutoUpdateTime', protoName: 'isAutoUpdateTime')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'cameraTimeZone', $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'isEnablerNTP', protoName: 'isEnablerNTP')
    ..aOS(5, _omitFieldNames ? '' : 'ntpServer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KC01_TimeSetting clone() => KC01_TimeSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KC01_TimeSetting copyWith(void Function(KC01_TimeSetting) updates) => super.copyWith((message) => updates(message as KC01_TimeSetting)) as KC01_TimeSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KC01_TimeSetting create() => KC01_TimeSetting._();
  KC01_TimeSetting createEmptyInstance() => create();
  static $pb.PbList<KC01_TimeSetting> createRepeated() => $pb.PbList<KC01_TimeSetting>();
  @$core.pragma('dart2js:noInline')
  static KC01_TimeSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KC01_TimeSetting>(create);
  static KC01_TimeSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get is24H => $_getBF(0);
  @$pb.TagNumber(1)
  set is24H($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIs24H() => $_has(0);
  @$pb.TagNumber(1)
  void clearIs24H() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAutoUpdateTime => $_getBF(1);
  @$pb.TagNumber(2)
  set isAutoUpdateTime($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAutoUpdateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAutoUpdateTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cameraTimeZone => $_getIZ(2);
  @$pb.TagNumber(3)
  set cameraTimeZone($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraTimeZone() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraTimeZone() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isEnablerNTP => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnablerNTP($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEnablerNTP() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnablerNTP() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get ntpServer => $_getSZ(4);
  @$pb.TagNumber(5)
  set ntpServer($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNtpServer() => $_has(4);
  @$pb.TagNumber(5)
  void clearNtpServer() => clearField(5);
}

class PrivacyMask extends $pb.GeneratedMessage {
  factory PrivacyMask({
    $core.bool? privacyMaskEnable,
    $core.double? startPointX,
    $core.double? endPointX,
    $core.double? startPointY,
    $core.double? endPointY,
  }) {
    final $result = create();
    if (privacyMaskEnable != null) {
      $result.privacyMaskEnable = privacyMaskEnable;
    }
    if (startPointX != null) {
      $result.startPointX = startPointX;
    }
    if (endPointX != null) {
      $result.endPointX = endPointX;
    }
    if (startPointY != null) {
      $result.startPointY = startPointY;
    }
    if (endPointY != null) {
      $result.endPointY = endPointY;
    }
    return $result;
  }
  PrivacyMask._() : super();
  factory PrivacyMask.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PrivacyMask.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PrivacyMask', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'privacyMaskEnable', protoName: 'privacyMaskEnable')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'StartPointX', $pb.PbFieldType.OF, protoName: 'StartPointX')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'EndPointX', $pb.PbFieldType.OF, protoName: 'EndPointX')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'StartPointY', $pb.PbFieldType.OF, protoName: 'StartPointY')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'EndPointY', $pb.PbFieldType.OF, protoName: 'EndPointY')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PrivacyMask clone() => PrivacyMask()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PrivacyMask copyWith(void Function(PrivacyMask) updates) => super.copyWith((message) => updates(message as PrivacyMask)) as PrivacyMask;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivacyMask create() => PrivacyMask._();
  PrivacyMask createEmptyInstance() => create();
  static $pb.PbList<PrivacyMask> createRepeated() => $pb.PbList<PrivacyMask>();
  @$core.pragma('dart2js:noInline')
  static PrivacyMask getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrivacyMask>(create);
  static PrivacyMask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get privacyMaskEnable => $_getBF(0);
  @$pb.TagNumber(1)
  set privacyMaskEnable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrivacyMaskEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivacyMaskEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get startPointX => $_getN(1);
  @$pb.TagNumber(2)
  set startPointX($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartPointX() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartPointX() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get endPointX => $_getN(2);
  @$pb.TagNumber(3)
  set endPointX($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndPointX() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndPointX() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get startPointY => $_getN(3);
  @$pb.TagNumber(4)
  set startPointY($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartPointY() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartPointY() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get endPointY => $_getN(4);
  @$pb.TagNumber(5)
  set endPointY($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndPointY() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndPointY() => clearField(5);
}

class ActivityRegion extends $pb.GeneratedMessage {
  factory ActivityRegion({
    $core.bool? activityRegionEnable,
    $core.double? activityRegionWidthMajor,
    $core.double? activityRegionWidthMinor,
    $core.double? activityRegionHeightMajor,
    $core.double? activityRegionHeightMinor,
  }) {
    final $result = create();
    if (activityRegionEnable != null) {
      $result.activityRegionEnable = activityRegionEnable;
    }
    if (activityRegionWidthMajor != null) {
      $result.activityRegionWidthMajor = activityRegionWidthMajor;
    }
    if (activityRegionWidthMinor != null) {
      $result.activityRegionWidthMinor = activityRegionWidthMinor;
    }
    if (activityRegionHeightMajor != null) {
      $result.activityRegionHeightMajor = activityRegionHeightMajor;
    }
    if (activityRegionHeightMinor != null) {
      $result.activityRegionHeightMinor = activityRegionHeightMinor;
    }
    return $result;
  }
  ActivityRegion._() : super();
  factory ActivityRegion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActivityRegion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActivityRegion', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'activityRegionEnable', protoName: 'activityRegionEnable')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'activityRegionWidthMajor', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'activityRegionWidthMinor', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'activityRegionHeightMajor', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'activityRegionHeightMinor', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActivityRegion clone() => ActivityRegion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActivityRegion copyWith(void Function(ActivityRegion) updates) => super.copyWith((message) => updates(message as ActivityRegion)) as ActivityRegion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityRegion create() => ActivityRegion._();
  ActivityRegion createEmptyInstance() => create();
  static $pb.PbList<ActivityRegion> createRepeated() => $pb.PbList<ActivityRegion>();
  @$core.pragma('dart2js:noInline')
  static ActivityRegion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActivityRegion>(create);
  static ActivityRegion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get activityRegionEnable => $_getBF(0);
  @$pb.TagNumber(1)
  set activityRegionEnable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityRegionEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityRegionEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get activityRegionWidthMajor => $_getN(1);
  @$pb.TagNumber(2)
  set activityRegionWidthMajor($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActivityRegionWidthMajor() => $_has(1);
  @$pb.TagNumber(2)
  void clearActivityRegionWidthMajor() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get activityRegionWidthMinor => $_getN(2);
  @$pb.TagNumber(3)
  set activityRegionWidthMinor($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasActivityRegionWidthMinor() => $_has(2);
  @$pb.TagNumber(3)
  void clearActivityRegionWidthMinor() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get activityRegionHeightMajor => $_getN(3);
  @$pb.TagNumber(4)
  set activityRegionHeightMajor($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasActivityRegionHeightMajor() => $_has(3);
  @$pb.TagNumber(4)
  void clearActivityRegionHeightMajor() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get activityRegionHeightMinor => $_getN(4);
  @$pb.TagNumber(5)
  set activityRegionHeightMinor($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActivityRegionHeightMinor() => $_has(4);
  @$pb.TagNumber(5)
  void clearActivityRegionHeightMinor() => clearField(5);
}

class IVAJobRegionMotionDetect extends $pb.GeneratedMessage {
  factory IVAJobRegionMotionDetect({
    $core.String? jobId,
    $core.bool? isRuning,
    IVAJobRegionMotionDetect_Level? level,
    $core.bool? isRegionDetectEnable,
    $core.Iterable<Roi>? rois,
    CameraStream? stream,
    $core.bool? isSendEmail,
    $core.bool? isPushNotification,
    $core.bool? isRecordEvent,
    $core.bool? isActivePackage,
    $core.String? msg,
    $core.bool? soundAlarm,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (isRuning != null) {
      $result.isRuning = isRuning;
    }
    if (level != null) {
      $result.level = level;
    }
    if (isRegionDetectEnable != null) {
      $result.isRegionDetectEnable = isRegionDetectEnable;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (stream != null) {
      $result.stream = stream;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (isRecordEvent != null) {
      $result.isRecordEvent = isRecordEvent;
    }
    if (isActivePackage != null) {
      $result.isActivePackage = isActivePackage;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (soundAlarm != null) {
      $result.soundAlarm = soundAlarm;
    }
    return $result;
  }
  IVAJobRegionMotionDetect._() : super();
  factory IVAJobRegionMotionDetect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAJobRegionMotionDetect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAJobRegionMotionDetect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(3, _omitFieldNames ? '' : 'isRuning', protoName: 'isRuning')
    ..e<IVAJobRegionMotionDetect_Level>(4, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: IVAJobRegionMotionDetect_Level.LOW, valueOf: IVAJobRegionMotionDetect_Level.valueOf, enumValues: IVAJobRegionMotionDetect_Level.values)
    ..aOB(5, _omitFieldNames ? '' : 'isRegionDetectEnable')
    ..pc<Roi>(6, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: Roi.create)
    ..aOM<CameraStream>(7, _omitFieldNames ? '' : 'stream', subBuilder: CameraStream.create)
    ..aOB(8, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(9, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..aOB(10, _omitFieldNames ? '' : 'isRecordEvent')
    ..aOB(11, _omitFieldNames ? '' : 'isActivePackage', protoName: 'isActivePackage')
    ..aOS(12, _omitFieldNames ? '' : 'msg')
    ..aOB(13, _omitFieldNames ? '' : 'soundAlarm', protoName: 'soundAlarm')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAJobRegionMotionDetect clone() => IVAJobRegionMotionDetect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAJobRegionMotionDetect copyWith(void Function(IVAJobRegionMotionDetect) updates) => super.copyWith((message) => updates(message as IVAJobRegionMotionDetect)) as IVAJobRegionMotionDetect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAJobRegionMotionDetect create() => IVAJobRegionMotionDetect._();
  IVAJobRegionMotionDetect createEmptyInstance() => create();
  static $pb.PbList<IVAJobRegionMotionDetect> createRepeated() => $pb.PbList<IVAJobRegionMotionDetect>();
  @$core.pragma('dart2js:noInline')
  static IVAJobRegionMotionDetect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAJobRegionMotionDetect>(create);
  static IVAJobRegionMotionDetect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(3)
  $core.bool get isRuning => $_getBF(1);
  @$pb.TagNumber(3)
  set isRuning($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsRuning() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsRuning() => clearField(3);

  @$pb.TagNumber(4)
  IVAJobRegionMotionDetect_Level get level => $_getN(2);
  @$pb.TagNumber(4)
  set level(IVAJobRegionMotionDetect_Level v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRegionDetectEnable => $_getBF(3);
  @$pb.TagNumber(5)
  set isRegionDetectEnable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRegionDetectEnable() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsRegionDetectEnable() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Roi> get rois => $_getList(4);

  @$pb.TagNumber(7)
  CameraStream get stream => $_getN(5);
  @$pb.TagNumber(7)
  set stream(CameraStream v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStream() => $_has(5);
  @$pb.TagNumber(7)
  void clearStream() => clearField(7);
  @$pb.TagNumber(7)
  CameraStream ensureStream() => $_ensure(5);

  @$pb.TagNumber(8)
  $core.bool get isSendEmail => $_getBF(6);
  @$pb.TagNumber(8)
  set isSendEmail($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsSendEmail() => $_has(6);
  @$pb.TagNumber(8)
  void clearIsSendEmail() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isPushNotification => $_getBF(7);
  @$pb.TagNumber(9)
  set isPushNotification($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsPushNotification() => $_has(7);
  @$pb.TagNumber(9)
  void clearIsPushNotification() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isRecordEvent => $_getBF(8);
  @$pb.TagNumber(10)
  set isRecordEvent($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsRecordEvent() => $_has(8);
  @$pb.TagNumber(10)
  void clearIsRecordEvent() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isActivePackage => $_getBF(9);
  @$pb.TagNumber(11)
  set isActivePackage($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsActivePackage() => $_has(9);
  @$pb.TagNumber(11)
  void clearIsActivePackage() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get msg => $_getSZ(10);
  @$pb.TagNumber(12)
  set msg($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasMsg() => $_has(10);
  @$pb.TagNumber(12)
  void clearMsg() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get soundAlarm => $_getBF(11);
  @$pb.TagNumber(13)
  set soundAlarm($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasSoundAlarm() => $_has(11);
  @$pb.TagNumber(13)
  void clearSoundAlarm() => clearField(13);
}

class IVA_JobLineCrossing_Detect extends $pb.GeneratedMessage {
  factory IVA_JobLineCrossing_Detect({
    $core.String? jobId,
    $core.bool? isRuning,
    $core.bool? isSendEmail,
    $core.bool? isPushNotification,
    $core.bool? isRecordEvent,
    IVA_JobLineCrossing_Detect_Level? level,
    IVA_JobLineCrossing_Detect_DirectionType? direction,
    CameraStream? stream,
    Roi? roiStart,
    Roi? roiEnd,
    $core.bool? isActivePackage,
    $core.String? msg,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (isRuning != null) {
      $result.isRuning = isRuning;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (isRecordEvent != null) {
      $result.isRecordEvent = isRecordEvent;
    }
    if (level != null) {
      $result.level = level;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (stream != null) {
      $result.stream = stream;
    }
    if (roiStart != null) {
      $result.roiStart = roiStart;
    }
    if (roiEnd != null) {
      $result.roiEnd = roiEnd;
    }
    if (isActivePackage != null) {
      $result.isActivePackage = isActivePackage;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  IVA_JobLineCrossing_Detect._() : super();
  factory IVA_JobLineCrossing_Detect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVA_JobLineCrossing_Detect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVA_JobLineCrossing_Detect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'isRuning', protoName: 'isRuning')
    ..aOB(3, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(4, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..aOB(5, _omitFieldNames ? '' : 'isRecordEvent')
    ..e<IVA_JobLineCrossing_Detect_Level>(6, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: IVA_JobLineCrossing_Detect_Level.LOW, valueOf: IVA_JobLineCrossing_Detect_Level.valueOf, enumValues: IVA_JobLineCrossing_Detect_Level.values)
    ..e<IVA_JobLineCrossing_Detect_DirectionType>(7, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: IVA_JobLineCrossing_Detect_DirectionType.A__B, valueOf: IVA_JobLineCrossing_Detect_DirectionType.valueOf, enumValues: IVA_JobLineCrossing_Detect_DirectionType.values)
    ..aOM<CameraStream>(8, _omitFieldNames ? '' : 'stream', subBuilder: CameraStream.create)
    ..aOM<Roi>(9, _omitFieldNames ? '' : 'roiStart', subBuilder: Roi.create)
    ..aOM<Roi>(10, _omitFieldNames ? '' : 'roiEnd', subBuilder: Roi.create)
    ..aOB(11, _omitFieldNames ? '' : 'isActivePackage', protoName: 'isActivePackage')
    ..aOS(12, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVA_JobLineCrossing_Detect clone() => IVA_JobLineCrossing_Detect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVA_JobLineCrossing_Detect copyWith(void Function(IVA_JobLineCrossing_Detect) updates) => super.copyWith((message) => updates(message as IVA_JobLineCrossing_Detect)) as IVA_JobLineCrossing_Detect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVA_JobLineCrossing_Detect create() => IVA_JobLineCrossing_Detect._();
  IVA_JobLineCrossing_Detect createEmptyInstance() => create();
  static $pb.PbList<IVA_JobLineCrossing_Detect> createRepeated() => $pb.PbList<IVA_JobLineCrossing_Detect>();
  @$core.pragma('dart2js:noInline')
  static IVA_JobLineCrossing_Detect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVA_JobLineCrossing_Detect>(create);
  static IVA_JobLineCrossing_Detect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRuning => $_getBF(1);
  @$pb.TagNumber(2)
  set isRuning($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRuning() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRuning() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(3)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSendEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPushNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set isPushNotification($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPushNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPushNotification() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecordEvent => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecordEvent($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecordEvent() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecordEvent() => clearField(5);

  @$pb.TagNumber(6)
  IVA_JobLineCrossing_Detect_Level get level => $_getN(5);
  @$pb.TagNumber(6)
  set level(IVA_JobLineCrossing_Detect_Level v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevel() => clearField(6);

  @$pb.TagNumber(7)
  IVA_JobLineCrossing_Detect_DirectionType get direction => $_getN(6);
  @$pb.TagNumber(7)
  set direction(IVA_JobLineCrossing_Detect_DirectionType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDirection() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirection() => clearField(7);

  @$pb.TagNumber(8)
  CameraStream get stream => $_getN(7);
  @$pb.TagNumber(8)
  set stream(CameraStream v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStream() => $_has(7);
  @$pb.TagNumber(8)
  void clearStream() => clearField(8);
  @$pb.TagNumber(8)
  CameraStream ensureStream() => $_ensure(7);

  @$pb.TagNumber(9)
  Roi get roiStart => $_getN(8);
  @$pb.TagNumber(9)
  set roiStart(Roi v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoiStart() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoiStart() => clearField(9);
  @$pb.TagNumber(9)
  Roi ensureRoiStart() => $_ensure(8);

  @$pb.TagNumber(10)
  Roi get roiEnd => $_getN(9);
  @$pb.TagNumber(10)
  set roiEnd(Roi v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRoiEnd() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoiEnd() => clearField(10);
  @$pb.TagNumber(10)
  Roi ensureRoiEnd() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.bool get isActivePackage => $_getBF(10);
  @$pb.TagNumber(11)
  set isActivePackage($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsActivePackage() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsActivePackage() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get msg => $_getSZ(11);
  @$pb.TagNumber(12)
  set msg($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMsg() => $_has(11);
  @$pb.TagNumber(12)
  void clearMsg() => clearField(12);
}

class IVA_IntrusionDetection_Detect extends $pb.GeneratedMessage {
  factory IVA_IntrusionDetection_Detect({
    $core.String? jobId,
    $core.bool? isRuning,
    $core.bool? isSendEmail,
    $core.bool? isPushNotification,
    $core.bool? isRecordEvent,
    IVA_IntrusionDetection_Detect_Level? level,
    $core.Iterable<Roi>? rois,
    CameraStream? stream,
    $core.bool? isActivePackage,
    $core.String? msg,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (isRuning != null) {
      $result.isRuning = isRuning;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (isRecordEvent != null) {
      $result.isRecordEvent = isRecordEvent;
    }
    if (level != null) {
      $result.level = level;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (stream != null) {
      $result.stream = stream;
    }
    if (isActivePackage != null) {
      $result.isActivePackage = isActivePackage;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  IVA_IntrusionDetection_Detect._() : super();
  factory IVA_IntrusionDetection_Detect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVA_IntrusionDetection_Detect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVA_IntrusionDetection_Detect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'isRuning', protoName: 'isRuning')
    ..aOB(3, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(4, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..aOB(5, _omitFieldNames ? '' : 'isRecordEvent')
    ..e<IVA_IntrusionDetection_Detect_Level>(6, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: IVA_IntrusionDetection_Detect_Level.LOW, valueOf: IVA_IntrusionDetection_Detect_Level.valueOf, enumValues: IVA_IntrusionDetection_Detect_Level.values)
    ..pc<Roi>(7, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: Roi.create)
    ..aOM<CameraStream>(8, _omitFieldNames ? '' : 'stream', subBuilder: CameraStream.create)
    ..aOB(9, _omitFieldNames ? '' : 'isActivePackage', protoName: 'isActivePackage')
    ..aOS(10, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVA_IntrusionDetection_Detect clone() => IVA_IntrusionDetection_Detect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVA_IntrusionDetection_Detect copyWith(void Function(IVA_IntrusionDetection_Detect) updates) => super.copyWith((message) => updates(message as IVA_IntrusionDetection_Detect)) as IVA_IntrusionDetection_Detect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVA_IntrusionDetection_Detect create() => IVA_IntrusionDetection_Detect._();
  IVA_IntrusionDetection_Detect createEmptyInstance() => create();
  static $pb.PbList<IVA_IntrusionDetection_Detect> createRepeated() => $pb.PbList<IVA_IntrusionDetection_Detect>();
  @$core.pragma('dart2js:noInline')
  static IVA_IntrusionDetection_Detect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVA_IntrusionDetection_Detect>(create);
  static IVA_IntrusionDetection_Detect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRuning => $_getBF(1);
  @$pb.TagNumber(2)
  set isRuning($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRuning() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRuning() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(3)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSendEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPushNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set isPushNotification($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPushNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPushNotification() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecordEvent => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecordEvent($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecordEvent() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecordEvent() => clearField(5);

  @$pb.TagNumber(6)
  IVA_IntrusionDetection_Detect_Level get level => $_getN(5);
  @$pb.TagNumber(6)
  set level(IVA_IntrusionDetection_Detect_Level v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Roi> get rois => $_getList(6);

  @$pb.TagNumber(8)
  CameraStream get stream => $_getN(7);
  @$pb.TagNumber(8)
  set stream(CameraStream v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStream() => $_has(7);
  @$pb.TagNumber(8)
  void clearStream() => clearField(8);
  @$pb.TagNumber(8)
  CameraStream ensureStream() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get isActivePackage => $_getBF(8);
  @$pb.TagNumber(9)
  set isActivePackage($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsActivePackage() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsActivePackage() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get msg => $_getSZ(9);
  @$pb.TagNumber(10)
  set msg($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMsg() => $_has(9);
  @$pb.TagNumber(10)
  void clearMsg() => clearField(10);
}

class IVA_Smoke_Detect extends $pb.GeneratedMessage {
  factory IVA_Smoke_Detect({
    $core.String? jobId,
    $core.bool? isRuning,
    $core.bool? isSendEmail,
    $core.bool? isPushNotification,
    $core.bool? isRecordEvent,
    IVA_Smoke_Detect_Level? level,
    $core.Iterable<Roi>? rois,
    CameraStream? stream,
    $core.bool? isActivePackage,
    $core.String? msg,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (isRuning != null) {
      $result.isRuning = isRuning;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (isRecordEvent != null) {
      $result.isRecordEvent = isRecordEvent;
    }
    if (level != null) {
      $result.level = level;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (stream != null) {
      $result.stream = stream;
    }
    if (isActivePackage != null) {
      $result.isActivePackage = isActivePackage;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  IVA_Smoke_Detect._() : super();
  factory IVA_Smoke_Detect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVA_Smoke_Detect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVA_Smoke_Detect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'isRuning', protoName: 'isRuning')
    ..aOB(3, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(4, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..aOB(5, _omitFieldNames ? '' : 'isRecordEvent')
    ..e<IVA_Smoke_Detect_Level>(6, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: IVA_Smoke_Detect_Level.LOW, valueOf: IVA_Smoke_Detect_Level.valueOf, enumValues: IVA_Smoke_Detect_Level.values)
    ..pc<Roi>(7, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: Roi.create)
    ..aOM<CameraStream>(8, _omitFieldNames ? '' : 'stream', subBuilder: CameraStream.create)
    ..aOB(9, _omitFieldNames ? '' : 'isActivePackage', protoName: 'isActivePackage')
    ..aOS(10, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVA_Smoke_Detect clone() => IVA_Smoke_Detect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVA_Smoke_Detect copyWith(void Function(IVA_Smoke_Detect) updates) => super.copyWith((message) => updates(message as IVA_Smoke_Detect)) as IVA_Smoke_Detect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVA_Smoke_Detect create() => IVA_Smoke_Detect._();
  IVA_Smoke_Detect createEmptyInstance() => create();
  static $pb.PbList<IVA_Smoke_Detect> createRepeated() => $pb.PbList<IVA_Smoke_Detect>();
  @$core.pragma('dart2js:noInline')
  static IVA_Smoke_Detect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVA_Smoke_Detect>(create);
  static IVA_Smoke_Detect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRuning => $_getBF(1);
  @$pb.TagNumber(2)
  set isRuning($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRuning() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRuning() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(3)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSendEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPushNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set isPushNotification($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPushNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPushNotification() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecordEvent => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecordEvent($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecordEvent() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecordEvent() => clearField(5);

  @$pb.TagNumber(6)
  IVA_Smoke_Detect_Level get level => $_getN(5);
  @$pb.TagNumber(6)
  set level(IVA_Smoke_Detect_Level v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Roi> get rois => $_getList(6);

  @$pb.TagNumber(8)
  CameraStream get stream => $_getN(7);
  @$pb.TagNumber(8)
  set stream(CameraStream v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStream() => $_has(7);
  @$pb.TagNumber(8)
  void clearStream() => clearField(8);
  @$pb.TagNumber(8)
  CameraStream ensureStream() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get isActivePackage => $_getBF(8);
  @$pb.TagNumber(9)
  set isActivePackage($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsActivePackage() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsActivePackage() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get msg => $_getSZ(9);
  @$pb.TagNumber(10)
  set msg($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMsg() => $_has(9);
  @$pb.TagNumber(10)
  void clearMsg() => clearField(10);
}

class IVA_Face_Detect extends $pb.GeneratedMessage {
  factory IVA_Face_Detect({
    $core.String? jobId,
    $core.bool? isRuning,
    $core.bool? isStrangerDetectNoti,
    $core.bool? isRelativeDetectNoti,
    $core.bool? isRecordEvent,
    $core.Iterable<Roi>? rois,
    $core.bool? isActivePackage,
    $core.String? msg,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (isRuning != null) {
      $result.isRuning = isRuning;
    }
    if (isStrangerDetectNoti != null) {
      $result.isStrangerDetectNoti = isStrangerDetectNoti;
    }
    if (isRelativeDetectNoti != null) {
      $result.isRelativeDetectNoti = isRelativeDetectNoti;
    }
    if (isRecordEvent != null) {
      $result.isRecordEvent = isRecordEvent;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (isActivePackage != null) {
      $result.isActivePackage = isActivePackage;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  IVA_Face_Detect._() : super();
  factory IVA_Face_Detect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVA_Face_Detect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVA_Face_Detect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'isRuning', protoName: 'isRuning')
    ..aOB(3, _omitFieldNames ? '' : 'isStrangerDetectNoti', protoName: 'isStrangerDetectNoti')
    ..aOB(4, _omitFieldNames ? '' : 'isRelativeDetectNoti', protoName: 'isRelativeDetectNoti')
    ..aOB(5, _omitFieldNames ? '' : 'isRecordEvent')
    ..pc<Roi>(6, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: Roi.create)
    ..aOB(7, _omitFieldNames ? '' : 'isActivePackage', protoName: 'isActivePackage')
    ..aOS(8, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVA_Face_Detect clone() => IVA_Face_Detect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVA_Face_Detect copyWith(void Function(IVA_Face_Detect) updates) => super.copyWith((message) => updates(message as IVA_Face_Detect)) as IVA_Face_Detect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVA_Face_Detect create() => IVA_Face_Detect._();
  IVA_Face_Detect createEmptyInstance() => create();
  static $pb.PbList<IVA_Face_Detect> createRepeated() => $pb.PbList<IVA_Face_Detect>();
  @$core.pragma('dart2js:noInline')
  static IVA_Face_Detect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVA_Face_Detect>(create);
  static IVA_Face_Detect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRuning => $_getBF(1);
  @$pb.TagNumber(2)
  set isRuning($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRuning() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRuning() => clearField(2);

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
  $core.bool get isRecordEvent => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecordEvent($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecordEvent() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecordEvent() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Roi> get rois => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get isActivePackage => $_getBF(6);
  @$pb.TagNumber(7)
  set isActivePackage($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsActivePackage() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsActivePackage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get msg => $_getSZ(7);
  @$pb.TagNumber(8)
  set msg($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMsg() => $_has(7);
  @$pb.TagNumber(8)
  void clearMsg() => clearField(8);
}

class IVAALPR extends $pb.GeneratedMessage {
  factory IVAALPR({
    $core.String? jobId,
    $core.bool? isRuning,
    $core.bool? isSendEmail,
    $core.bool? isPushNotification,
    $core.bool? isRecordEvent,
    $core.Iterable<Roi>? rois,
    CameraStream? stream,
    $core.bool? isActivePackage,
    $core.String? msg,
    $core.bool? in_11,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (isRuning != null) {
      $result.isRuning = isRuning;
    }
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (isPushNotification != null) {
      $result.isPushNotification = isPushNotification;
    }
    if (isRecordEvent != null) {
      $result.isRecordEvent = isRecordEvent;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (stream != null) {
      $result.stream = stream;
    }
    if (isActivePackage != null) {
      $result.isActivePackage = isActivePackage;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (in_11 != null) {
      $result.in_11 = in_11;
    }
    return $result;
  }
  IVAALPR._() : super();
  factory IVAALPR.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAALPR.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAALPR', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'isRuning', protoName: 'isRuning')
    ..aOB(3, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..aOB(4, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..aOB(5, _omitFieldNames ? '' : 'isRecordEvent')
    ..pc<Roi>(6, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: Roi.create)
    ..aOM<CameraStream>(8, _omitFieldNames ? '' : 'stream', subBuilder: CameraStream.create)
    ..aOB(9, _omitFieldNames ? '' : 'isActivePackage', protoName: 'isActivePackage')
    ..aOS(10, _omitFieldNames ? '' : 'msg')
    ..aOB(11, _omitFieldNames ? '' : 'in')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAALPR clone() => IVAALPR()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAALPR copyWith(void Function(IVAALPR) updates) => super.copyWith((message) => updates(message as IVAALPR)) as IVAALPR;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAALPR create() => IVAALPR._();
  IVAALPR createEmptyInstance() => create();
  static $pb.PbList<IVAALPR> createRepeated() => $pb.PbList<IVAALPR>();
  @$core.pragma('dart2js:noInline')
  static IVAALPR getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAALPR>(create);
  static IVAALPR? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRuning => $_getBF(1);
  @$pb.TagNumber(2)
  set isRuning($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRuning() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRuning() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSendEmail => $_getBF(2);
  @$pb.TagNumber(3)
  set isSendEmail($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSendEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSendEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPushNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set isPushNotification($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPushNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPushNotification() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRecordEvent => $_getBF(4);
  @$pb.TagNumber(5)
  set isRecordEvent($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRecordEvent() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRecordEvent() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Roi> get rois => $_getList(5);

  @$pb.TagNumber(8)
  CameraStream get stream => $_getN(6);
  @$pb.TagNumber(8)
  set stream(CameraStream v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStream() => $_has(6);
  @$pb.TagNumber(8)
  void clearStream() => clearField(8);
  @$pb.TagNumber(8)
  CameraStream ensureStream() => $_ensure(6);

  @$pb.TagNumber(9)
  $core.bool get isActivePackage => $_getBF(7);
  @$pb.TagNumber(9)
  set isActivePackage($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsActivePackage() => $_has(7);
  @$pb.TagNumber(9)
  void clearIsActivePackage() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get msg => $_getSZ(8);
  @$pb.TagNumber(10)
  set msg($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasMsg() => $_has(8);
  @$pb.TagNumber(10)
  void clearMsg() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get in_11 => $_getBF(9);
  @$pb.TagNumber(11)
  set in_11($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasIn_11() => $_has(9);
  @$pb.TagNumber(11)
  void clearIn_11() => clearField(11);
}

class MapLocation extends $pb.GeneratedMessage {
  factory MapLocation({
    $core.double? lat,
    $core.double? log,
    $core.String? locationDes,
  }) {
    final $result = create();
    if (lat != null) {
      $result.lat = lat;
    }
    if (log != null) {
      $result.log = log;
    }
    if (locationDes != null) {
      $result.locationDes = locationDes;
    }
    return $result;
  }
  MapLocation._() : super();
  factory MapLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MapLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MapLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'log', $pb.PbFieldType.OD)
    ..aOS(3, _omitFieldNames ? '' : 'locationDes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MapLocation clone() => MapLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MapLocation copyWith(void Function(MapLocation) updates) => super.copyWith((message) => updates(message as MapLocation)) as MapLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MapLocation create() => MapLocation._();
  MapLocation createEmptyInstance() => create();
  static $pb.PbList<MapLocation> createRepeated() => $pb.PbList<MapLocation>();
  @$core.pragma('dart2js:noInline')
  static MapLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MapLocation>(create);
  static MapLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get log => $_getN(1);
  @$pb.TagNumber(2)
  set log($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLog() => $_has(1);
  @$pb.TagNumber(2)
  void clearLog() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get locationDes => $_getSZ(2);
  @$pb.TagNumber(3)
  set locationDes($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocationDes() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocationDes() => clearField(3);
}

class HomeVision_Camera_Config extends $pb.GeneratedMessage {
  factory HomeVision_Camera_Config({
    $core.int? deviceType,
    $core.int? volume,
    $core.String? ip,
    $core.String? mac,
    $core.String? pictureURL,
    $core.String? phpServer,
    $core.bool? flip,
    $core.int? totalSd,
    $core.int? sdUse,
    $core.String? vendor,
    $core.int? version,
    $core.String? model,
    $core.int? recordType,
  }) {
    final $result = create();
    if (deviceType != null) {
      $result.deviceType = deviceType;
    }
    if (volume != null) {
      $result.volume = volume;
    }
    if (ip != null) {
      $result.ip = ip;
    }
    if (mac != null) {
      $result.mac = mac;
    }
    if (pictureURL != null) {
      $result.pictureURL = pictureURL;
    }
    if (phpServer != null) {
      $result.phpServer = phpServer;
    }
    if (flip != null) {
      $result.flip = flip;
    }
    if (totalSd != null) {
      $result.totalSd = totalSd;
    }
    if (sdUse != null) {
      $result.sdUse = sdUse;
    }
    if (vendor != null) {
      $result.vendor = vendor;
    }
    if (version != null) {
      $result.version = version;
    }
    if (model != null) {
      $result.model = model;
    }
    if (recordType != null) {
      $result.recordType = recordType;
    }
    return $result;
  }
  HomeVision_Camera_Config._() : super();
  factory HomeVision_Camera_Config.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeVision_Camera_Config.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomeVision_Camera_Config', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'volume', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'ip')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..aOS(5, _omitFieldNames ? '' : 'pictureURL', protoName: 'pictureURL')
    ..aOS(6, _omitFieldNames ? '' : 'phpServer', protoName: 'phpServer')
    ..aOB(7, _omitFieldNames ? '' : 'flip')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'totalSd', $pb.PbFieldType.OU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'sdUse', $pb.PbFieldType.OU3)
    ..aOS(10, _omitFieldNames ? '' : 'vendor')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOS(12, _omitFieldNames ? '' : 'model')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'recordType', $pb.PbFieldType.OU3, protoName: 'recordType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeVision_Camera_Config clone() => HomeVision_Camera_Config()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeVision_Camera_Config copyWith(void Function(HomeVision_Camera_Config) updates) => super.copyWith((message) => updates(message as HomeVision_Camera_Config)) as HomeVision_Camera_Config;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeVision_Camera_Config create() => HomeVision_Camera_Config._();
  HomeVision_Camera_Config createEmptyInstance() => create();
  static $pb.PbList<HomeVision_Camera_Config> createRepeated() => $pb.PbList<HomeVision_Camera_Config>();
  @$core.pragma('dart2js:noInline')
  static HomeVision_Camera_Config getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeVision_Camera_Config>(create);
  static HomeVision_Camera_Config? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deviceType => $_getIZ(0);
  @$pb.TagNumber(1)
  set deviceType($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get volume => $_getIZ(1);
  @$pb.TagNumber(2)
  set volume($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolume() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ip => $_getSZ(2);
  @$pb.TagNumber(3)
  set ip($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIp() => $_has(2);
  @$pb.TagNumber(3)
  void clearIp() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(3);
  @$pb.TagNumber(4)
  set mac($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(3);
  @$pb.TagNumber(4)
  void clearMac() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get pictureURL => $_getSZ(4);
  @$pb.TagNumber(5)
  set pictureURL($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPictureURL() => $_has(4);
  @$pb.TagNumber(5)
  void clearPictureURL() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get phpServer => $_getSZ(5);
  @$pb.TagNumber(6)
  set phpServer($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPhpServer() => $_has(5);
  @$pb.TagNumber(6)
  void clearPhpServer() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get flip => $_getBF(6);
  @$pb.TagNumber(7)
  set flip($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFlip() => $_has(6);
  @$pb.TagNumber(7)
  void clearFlip() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get totalSd => $_getIZ(7);
  @$pb.TagNumber(8)
  set totalSd($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalSd() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalSd() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get sdUse => $_getIZ(8);
  @$pb.TagNumber(9)
  set sdUse($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSdUse() => $_has(8);
  @$pb.TagNumber(9)
  void clearSdUse() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get vendor => $_getSZ(9);
  @$pb.TagNumber(10)
  set vendor($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasVendor() => $_has(9);
  @$pb.TagNumber(10)
  void clearVendor() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get version => $_getIZ(10);
  @$pb.TagNumber(11)
  set version($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasVersion() => $_has(10);
  @$pb.TagNumber(11)
  void clearVersion() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get model => $_getSZ(11);
  @$pb.TagNumber(12)
  set model($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasModel() => $_has(11);
  @$pb.TagNumber(12)
  void clearModel() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get recordType => $_getIZ(12);
  @$pb.TagNumber(13)
  set recordType($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasRecordType() => $_has(12);
  @$pb.TagNumber(13)
  void clearRecordType() => clearField(13);
}

class CameraConfig extends $pb.GeneratedMessage {
  factory CameraConfig({
    $core.bool? nightvision,
    $core.int? brightness,
    $core.bool? flip,
    $core.bool? mirror,
    CameraConfig_Rotate? rotate,
    $core.int? currentMajorVersion,
    $core.int? currentMinorVersion,
    $core.bool? powerCloudStorage,
    CameraConfig_StorageMode? storageMode,
    $core.int? numberDaysStorage,
    $core.String? wifiName,
    $core.String? wifiPassword,
    $core.bool? motionDetection,
    $core.bool? audioDetection,
    $core.bool? fullyOverride,
    Recording? recording,
    $core.bool? isSendEmailEvent,
    $core.bool? isRecord,
    $core.bool? isRegionDetectEnable,
    $core.Iterable<Roi>? rois,
    CameraConfig_Level? mdLevel,
    CamNetwork? network,
    KC01_LineCrossing? lineCrossing,
    KC01_IntrusionDetection? intrusionDetection,
    KC01_TimeSetting? timeSetting,
    Quality? rtspCurrentQuatity,
    PrivacyMask? privacyMask1,
    PrivacyMask? privacyMask2,
    PrivacyMask? privacyMask3,
    $core.bool? kC01MDIsSendMD,
    ActivityRegion? activityRegion,
    $core.bool? useDefaultAccountSetting,
    IVAJobRegionMotionDetect? ivaMd,
    IVA_JobLineCrossing_Detect? ivaLineCrossing,
    IVA_IntrusionDetection_Detect? ivaInsDetection,
    MapLocation? location,
    IVA_Smoke_Detect? ivaSmokeDetection,
    IVA_Face_Detect? ivaFaceDetection,
    HomeVision_Camera_Config? homeVisionCameraConfig,
    $core.int? currentMicroVersion,
    IVAALPR? ivaALPR,
  }) {
    final $result = create();
    if (nightvision != null) {
      $result.nightvision = nightvision;
    }
    if (brightness != null) {
      $result.brightness = brightness;
    }
    if (flip != null) {
      $result.flip = flip;
    }
    if (mirror != null) {
      $result.mirror = mirror;
    }
    if (rotate != null) {
      $result.rotate = rotate;
    }
    if (currentMajorVersion != null) {
      $result.currentMajorVersion = currentMajorVersion;
    }
    if (currentMinorVersion != null) {
      $result.currentMinorVersion = currentMinorVersion;
    }
    if (powerCloudStorage != null) {
      $result.powerCloudStorage = powerCloudStorage;
    }
    if (storageMode != null) {
      $result.storageMode = storageMode;
    }
    if (numberDaysStorage != null) {
      $result.numberDaysStorage = numberDaysStorage;
    }
    if (wifiName != null) {
      $result.wifiName = wifiName;
    }
    if (wifiPassword != null) {
      $result.wifiPassword = wifiPassword;
    }
    if (motionDetection != null) {
      $result.motionDetection = motionDetection;
    }
    if (audioDetection != null) {
      $result.audioDetection = audioDetection;
    }
    if (fullyOverride != null) {
      $result.fullyOverride = fullyOverride;
    }
    if (recording != null) {
      $result.recording = recording;
    }
    if (isSendEmailEvent != null) {
      $result.isSendEmailEvent = isSendEmailEvent;
    }
    if (isRecord != null) {
      $result.isRecord = isRecord;
    }
    if (isRegionDetectEnable != null) {
      $result.isRegionDetectEnable = isRegionDetectEnable;
    }
    if (rois != null) {
      $result.rois.addAll(rois);
    }
    if (mdLevel != null) {
      $result.mdLevel = mdLevel;
    }
    if (network != null) {
      $result.network = network;
    }
    if (lineCrossing != null) {
      $result.lineCrossing = lineCrossing;
    }
    if (intrusionDetection != null) {
      $result.intrusionDetection = intrusionDetection;
    }
    if (timeSetting != null) {
      $result.timeSetting = timeSetting;
    }
    if (rtspCurrentQuatity != null) {
      $result.rtspCurrentQuatity = rtspCurrentQuatity;
    }
    if (privacyMask1 != null) {
      $result.privacyMask1 = privacyMask1;
    }
    if (privacyMask2 != null) {
      $result.privacyMask2 = privacyMask2;
    }
    if (privacyMask3 != null) {
      $result.privacyMask3 = privacyMask3;
    }
    if (kC01MDIsSendMD != null) {
      $result.kC01MDIsSendMD = kC01MDIsSendMD;
    }
    if (activityRegion != null) {
      $result.activityRegion = activityRegion;
    }
    if (useDefaultAccountSetting != null) {
      $result.useDefaultAccountSetting = useDefaultAccountSetting;
    }
    if (ivaMd != null) {
      $result.ivaMd = ivaMd;
    }
    if (ivaLineCrossing != null) {
      $result.ivaLineCrossing = ivaLineCrossing;
    }
    if (ivaInsDetection != null) {
      $result.ivaInsDetection = ivaInsDetection;
    }
    if (location != null) {
      $result.location = location;
    }
    if (ivaSmokeDetection != null) {
      $result.ivaSmokeDetection = ivaSmokeDetection;
    }
    if (ivaFaceDetection != null) {
      $result.ivaFaceDetection = ivaFaceDetection;
    }
    if (homeVisionCameraConfig != null) {
      $result.homeVisionCameraConfig = homeVisionCameraConfig;
    }
    if (currentMicroVersion != null) {
      $result.currentMicroVersion = currentMicroVersion;
    }
    if (ivaALPR != null) {
      $result.ivaALPR = ivaALPR;
    }
    return $result;
  }
  CameraConfig._() : super();
  factory CameraConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'nightvision')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'brightness', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'flip')
    ..aOB(4, _omitFieldNames ? '' : 'mirror')
    ..e<CameraConfig_Rotate>(5, _omitFieldNames ? '' : 'rotate', $pb.PbFieldType.OE, defaultOrMaker: CameraConfig_Rotate.NORMAL, valueOf: CameraConfig_Rotate.valueOf, enumValues: CameraConfig_Rotate.values)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'currentMajorVersion', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'currentMinorVersion', $pb.PbFieldType.OU3)
    ..aOB(8, _omitFieldNames ? '' : 'powerCloudStorage')
    ..e<CameraConfig_StorageMode>(9, _omitFieldNames ? '' : 'storageMode', $pb.PbFieldType.OE, defaultOrMaker: CameraConfig_StorageMode.CLOUD, valueOf: CameraConfig_StorageMode.valueOf, enumValues: CameraConfig_StorageMode.values)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'numberDaysStorage', $pb.PbFieldType.OU3)
    ..aOS(11, _omitFieldNames ? '' : 'wifiName')
    ..aOS(12, _omitFieldNames ? '' : 'wifiPassword')
    ..aOB(13, _omitFieldNames ? '' : 'motionDetection')
    ..aOB(14, _omitFieldNames ? '' : 'audioDetection')
    ..aOB(15, _omitFieldNames ? '' : 'fullyOverride')
    ..aOM<Recording>(16, _omitFieldNames ? '' : 'recording', subBuilder: Recording.create)
    ..aOB(17, _omitFieldNames ? '' : 'isSendEmailEvent')
    ..aOB(18, _omitFieldNames ? '' : 'isRecord')
    ..aOB(19, _omitFieldNames ? '' : 'isRegionDetectEnable')
    ..pc<Roi>(20, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: Roi.create)
    ..e<CameraConfig_Level>(21, _omitFieldNames ? '' : 'mdLevel', $pb.PbFieldType.OE, defaultOrMaker: CameraConfig_Level.LOW, valueOf: CameraConfig_Level.valueOf, enumValues: CameraConfig_Level.values)
    ..aOM<CamNetwork>(22, _omitFieldNames ? '' : 'network', subBuilder: CamNetwork.create)
    ..aOM<KC01_LineCrossing>(23, _omitFieldNames ? '' : 'lineCrossing', protoName: 'lineCrossing', subBuilder: KC01_LineCrossing.create)
    ..aOM<KC01_IntrusionDetection>(24, _omitFieldNames ? '' : 'intrusionDetection', protoName: 'intrusionDetection', subBuilder: KC01_IntrusionDetection.create)
    ..aOM<KC01_TimeSetting>(25, _omitFieldNames ? '' : 'timeSetting', protoName: 'timeSetting', subBuilder: KC01_TimeSetting.create)
    ..e<Quality>(26, _omitFieldNames ? '' : 'rtspCurrentQuatity', $pb.PbFieldType.OE, defaultOrMaker: Quality.AUTO, valueOf: Quality.valueOf, enumValues: Quality.values)
    ..aOM<PrivacyMask>(27, _omitFieldNames ? '' : 'privacyMask1', protoName: 'privacyMask1', subBuilder: PrivacyMask.create)
    ..aOM<PrivacyMask>(28, _omitFieldNames ? '' : 'privacyMask2', protoName: 'privacyMask2', subBuilder: PrivacyMask.create)
    ..aOM<PrivacyMask>(29, _omitFieldNames ? '' : 'privacyMask3', protoName: 'privacyMask3', subBuilder: PrivacyMask.create)
    ..aOB(30, _omitFieldNames ? '' : 'KC01MDIsSendMD', protoName: 'KC01_MD_isSendMD')
    ..aOM<ActivityRegion>(31, _omitFieldNames ? '' : 'activityRegion', protoName: 'activityRegion', subBuilder: ActivityRegion.create)
    ..aOB(32, _omitFieldNames ? '' : 'useDefaultAccountSetting')
    ..aOM<IVAJobRegionMotionDetect>(33, _omitFieldNames ? '' : 'ivaMd', subBuilder: IVAJobRegionMotionDetect.create)
    ..aOM<IVA_JobLineCrossing_Detect>(34, _omitFieldNames ? '' : 'ivaLineCrossing', subBuilder: IVA_JobLineCrossing_Detect.create)
    ..aOM<IVA_IntrusionDetection_Detect>(35, _omitFieldNames ? '' : 'ivaInsDetection', subBuilder: IVA_IntrusionDetection_Detect.create)
    ..aOM<MapLocation>(36, _omitFieldNames ? '' : 'location', subBuilder: MapLocation.create)
    ..aOM<IVA_Smoke_Detect>(37, _omitFieldNames ? '' : 'ivaSmokeDetection', subBuilder: IVA_Smoke_Detect.create)
    ..aOM<IVA_Face_Detect>(38, _omitFieldNames ? '' : 'ivaFaceDetection', subBuilder: IVA_Face_Detect.create)
    ..aOM<HomeVision_Camera_Config>(39, _omitFieldNames ? '' : 'homeVisionCameraConfig', subBuilder: HomeVision_Camera_Config.create)
    ..a<$core.int>(40, _omitFieldNames ? '' : 'currentMicroVersion', $pb.PbFieldType.OU3)
    ..aOM<IVAALPR>(41, _omitFieldNames ? '' : 'ivaALPR', protoName: 'iva_ALPR', subBuilder: IVAALPR.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraConfig clone() => CameraConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraConfig copyWith(void Function(CameraConfig) updates) => super.copyWith((message) => updates(message as CameraConfig)) as CameraConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraConfig create() => CameraConfig._();
  CameraConfig createEmptyInstance() => create();
  static $pb.PbList<CameraConfig> createRepeated() => $pb.PbList<CameraConfig>();
  @$core.pragma('dart2js:noInline')
  static CameraConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraConfig>(create);
  static CameraConfig? _defaultInstance;

  /// config camera
  @$pb.TagNumber(1)
  $core.bool get nightvision => $_getBF(0);
  @$pb.TagNumber(1)
  set nightvision($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNightvision() => $_has(0);
  @$pb.TagNumber(1)
  void clearNightvision() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get brightness => $_getIZ(1);
  @$pb.TagNumber(2)
  set brightness($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBrightness() => $_has(1);
  @$pb.TagNumber(2)
  void clearBrightness() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get flip => $_getBF(2);
  @$pb.TagNumber(3)
  set flip($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFlip() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlip() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get mirror => $_getBF(3);
  @$pb.TagNumber(4)
  set mirror($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMirror() => $_has(3);
  @$pb.TagNumber(4)
  void clearMirror() => clearField(4);

  @$pb.TagNumber(5)
  CameraConfig_Rotate get rotate => $_getN(4);
  @$pb.TagNumber(5)
  set rotate(CameraConfig_Rotate v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRotate() => $_has(4);
  @$pb.TagNumber(5)
  void clearRotate() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get currentMajorVersion => $_getIZ(5);
  @$pb.TagNumber(6)
  set currentMajorVersion($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCurrentMajorVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentMajorVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get currentMinorVersion => $_getIZ(6);
  @$pb.TagNumber(7)
  set currentMinorVersion($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrentMinorVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentMinorVersion() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get powerCloudStorage => $_getBF(7);
  @$pb.TagNumber(8)
  set powerCloudStorage($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPowerCloudStorage() => $_has(7);
  @$pb.TagNumber(8)
  void clearPowerCloudStorage() => clearField(8);

  @$pb.TagNumber(9)
  CameraConfig_StorageMode get storageMode => $_getN(8);
  @$pb.TagNumber(9)
  set storageMode(CameraConfig_StorageMode v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasStorageMode() => $_has(8);
  @$pb.TagNumber(9)
  void clearStorageMode() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get numberDaysStorage => $_getIZ(9);
  @$pb.TagNumber(10)
  set numberDaysStorage($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNumberDaysStorage() => $_has(9);
  @$pb.TagNumber(10)
  void clearNumberDaysStorage() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get wifiName => $_getSZ(10);
  @$pb.TagNumber(11)
  set wifiName($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasWifiName() => $_has(10);
  @$pb.TagNumber(11)
  void clearWifiName() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get wifiPassword => $_getSZ(11);
  @$pb.TagNumber(12)
  set wifiPassword($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasWifiPassword() => $_has(11);
  @$pb.TagNumber(12)
  void clearWifiPassword() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get motionDetection => $_getBF(12);
  @$pb.TagNumber(13)
  set motionDetection($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasMotionDetection() => $_has(12);
  @$pb.TagNumber(13)
  void clearMotionDetection() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get audioDetection => $_getBF(13);
  @$pb.TagNumber(14)
  set audioDetection($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAudioDetection() => $_has(13);
  @$pb.TagNumber(14)
  void clearAudioDetection() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get fullyOverride => $_getBF(14);
  @$pb.TagNumber(15)
  set fullyOverride($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasFullyOverride() => $_has(14);
  @$pb.TagNumber(15)
  void clearFullyOverride() => clearField(15);

  @$pb.TagNumber(16)
  Recording get recording => $_getN(15);
  @$pb.TagNumber(16)
  set recording(Recording v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasRecording() => $_has(15);
  @$pb.TagNumber(16)
  void clearRecording() => clearField(16);
  @$pb.TagNumber(16)
  Recording ensureRecording() => $_ensure(15);

  @$pb.TagNumber(17)
  $core.bool get isSendEmailEvent => $_getBF(16);
  @$pb.TagNumber(17)
  set isSendEmailEvent($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasIsSendEmailEvent() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsSendEmailEvent() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get isRecord => $_getBF(17);
  @$pb.TagNumber(18)
  set isRecord($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasIsRecord() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsRecord() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get isRegionDetectEnable => $_getBF(18);
  @$pb.TagNumber(19)
  set isRegionDetectEnable($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasIsRegionDetectEnable() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsRegionDetectEnable() => clearField(19);

  @$pb.TagNumber(20)
  $core.List<Roi> get rois => $_getList(19);

  @$pb.TagNumber(21)
  CameraConfig_Level get mdLevel => $_getN(20);
  @$pb.TagNumber(21)
  set mdLevel(CameraConfig_Level v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasMdLevel() => $_has(20);
  @$pb.TagNumber(21)
  void clearMdLevel() => clearField(21);

  @$pb.TagNumber(22)
  CamNetwork get network => $_getN(21);
  @$pb.TagNumber(22)
  set network(CamNetwork v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasNetwork() => $_has(21);
  @$pb.TagNumber(22)
  void clearNetwork() => clearField(22);
  @$pb.TagNumber(22)
  CamNetwork ensureNetwork() => $_ensure(21);

  @$pb.TagNumber(23)
  KC01_LineCrossing get lineCrossing => $_getN(22);
  @$pb.TagNumber(23)
  set lineCrossing(KC01_LineCrossing v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasLineCrossing() => $_has(22);
  @$pb.TagNumber(23)
  void clearLineCrossing() => clearField(23);
  @$pb.TagNumber(23)
  KC01_LineCrossing ensureLineCrossing() => $_ensure(22);

  @$pb.TagNumber(24)
  KC01_IntrusionDetection get intrusionDetection => $_getN(23);
  @$pb.TagNumber(24)
  set intrusionDetection(KC01_IntrusionDetection v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasIntrusionDetection() => $_has(23);
  @$pb.TagNumber(24)
  void clearIntrusionDetection() => clearField(24);
  @$pb.TagNumber(24)
  KC01_IntrusionDetection ensureIntrusionDetection() => $_ensure(23);

  @$pb.TagNumber(25)
  KC01_TimeSetting get timeSetting => $_getN(24);
  @$pb.TagNumber(25)
  set timeSetting(KC01_TimeSetting v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasTimeSetting() => $_has(24);
  @$pb.TagNumber(25)
  void clearTimeSetting() => clearField(25);
  @$pb.TagNumber(25)
  KC01_TimeSetting ensureTimeSetting() => $_ensure(24);

  @$pb.TagNumber(26)
  Quality get rtspCurrentQuatity => $_getN(25);
  @$pb.TagNumber(26)
  set rtspCurrentQuatity(Quality v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasRtspCurrentQuatity() => $_has(25);
  @$pb.TagNumber(26)
  void clearRtspCurrentQuatity() => clearField(26);

  @$pb.TagNumber(27)
  PrivacyMask get privacyMask1 => $_getN(26);
  @$pb.TagNumber(27)
  set privacyMask1(PrivacyMask v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasPrivacyMask1() => $_has(26);
  @$pb.TagNumber(27)
  void clearPrivacyMask1() => clearField(27);
  @$pb.TagNumber(27)
  PrivacyMask ensurePrivacyMask1() => $_ensure(26);

  @$pb.TagNumber(28)
  PrivacyMask get privacyMask2 => $_getN(27);
  @$pb.TagNumber(28)
  set privacyMask2(PrivacyMask v) { setField(28, v); }
  @$pb.TagNumber(28)
  $core.bool hasPrivacyMask2() => $_has(27);
  @$pb.TagNumber(28)
  void clearPrivacyMask2() => clearField(28);
  @$pb.TagNumber(28)
  PrivacyMask ensurePrivacyMask2() => $_ensure(27);

  @$pb.TagNumber(29)
  PrivacyMask get privacyMask3 => $_getN(28);
  @$pb.TagNumber(29)
  set privacyMask3(PrivacyMask v) { setField(29, v); }
  @$pb.TagNumber(29)
  $core.bool hasPrivacyMask3() => $_has(28);
  @$pb.TagNumber(29)
  void clearPrivacyMask3() => clearField(29);
  @$pb.TagNumber(29)
  PrivacyMask ensurePrivacyMask3() => $_ensure(28);

  @$pb.TagNumber(30)
  $core.bool get kC01MDIsSendMD => $_getBF(29);
  @$pb.TagNumber(30)
  set kC01MDIsSendMD($core.bool v) { $_setBool(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasKC01MDIsSendMD() => $_has(29);
  @$pb.TagNumber(30)
  void clearKC01MDIsSendMD() => clearField(30);

  @$pb.TagNumber(31)
  ActivityRegion get activityRegion => $_getN(30);
  @$pb.TagNumber(31)
  set activityRegion(ActivityRegion v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasActivityRegion() => $_has(30);
  @$pb.TagNumber(31)
  void clearActivityRegion() => clearField(31);
  @$pb.TagNumber(31)
  ActivityRegion ensureActivityRegion() => $_ensure(30);

  @$pb.TagNumber(32)
  $core.bool get useDefaultAccountSetting => $_getBF(31);
  @$pb.TagNumber(32)
  set useDefaultAccountSetting($core.bool v) { $_setBool(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasUseDefaultAccountSetting() => $_has(31);
  @$pb.TagNumber(32)
  void clearUseDefaultAccountSetting() => clearField(32);

  @$pb.TagNumber(33)
  IVAJobRegionMotionDetect get ivaMd => $_getN(32);
  @$pb.TagNumber(33)
  set ivaMd(IVAJobRegionMotionDetect v) { setField(33, v); }
  @$pb.TagNumber(33)
  $core.bool hasIvaMd() => $_has(32);
  @$pb.TagNumber(33)
  void clearIvaMd() => clearField(33);
  @$pb.TagNumber(33)
  IVAJobRegionMotionDetect ensureIvaMd() => $_ensure(32);

  @$pb.TagNumber(34)
  IVA_JobLineCrossing_Detect get ivaLineCrossing => $_getN(33);
  @$pb.TagNumber(34)
  set ivaLineCrossing(IVA_JobLineCrossing_Detect v) { setField(34, v); }
  @$pb.TagNumber(34)
  $core.bool hasIvaLineCrossing() => $_has(33);
  @$pb.TagNumber(34)
  void clearIvaLineCrossing() => clearField(34);
  @$pb.TagNumber(34)
  IVA_JobLineCrossing_Detect ensureIvaLineCrossing() => $_ensure(33);

  @$pb.TagNumber(35)
  IVA_IntrusionDetection_Detect get ivaInsDetection => $_getN(34);
  @$pb.TagNumber(35)
  set ivaInsDetection(IVA_IntrusionDetection_Detect v) { setField(35, v); }
  @$pb.TagNumber(35)
  $core.bool hasIvaInsDetection() => $_has(34);
  @$pb.TagNumber(35)
  void clearIvaInsDetection() => clearField(35);
  @$pb.TagNumber(35)
  IVA_IntrusionDetection_Detect ensureIvaInsDetection() => $_ensure(34);

  @$pb.TagNumber(36)
  MapLocation get location => $_getN(35);
  @$pb.TagNumber(36)
  set location(MapLocation v) { setField(36, v); }
  @$pb.TagNumber(36)
  $core.bool hasLocation() => $_has(35);
  @$pb.TagNumber(36)
  void clearLocation() => clearField(36);
  @$pb.TagNumber(36)
  MapLocation ensureLocation() => $_ensure(35);

  @$pb.TagNumber(37)
  IVA_Smoke_Detect get ivaSmokeDetection => $_getN(36);
  @$pb.TagNumber(37)
  set ivaSmokeDetection(IVA_Smoke_Detect v) { setField(37, v); }
  @$pb.TagNumber(37)
  $core.bool hasIvaSmokeDetection() => $_has(36);
  @$pb.TagNumber(37)
  void clearIvaSmokeDetection() => clearField(37);
  @$pb.TagNumber(37)
  IVA_Smoke_Detect ensureIvaSmokeDetection() => $_ensure(36);

  @$pb.TagNumber(38)
  IVA_Face_Detect get ivaFaceDetection => $_getN(37);
  @$pb.TagNumber(38)
  set ivaFaceDetection(IVA_Face_Detect v) { setField(38, v); }
  @$pb.TagNumber(38)
  $core.bool hasIvaFaceDetection() => $_has(37);
  @$pb.TagNumber(38)
  void clearIvaFaceDetection() => clearField(38);
  @$pb.TagNumber(38)
  IVA_Face_Detect ensureIvaFaceDetection() => $_ensure(37);

  @$pb.TagNumber(39)
  HomeVision_Camera_Config get homeVisionCameraConfig => $_getN(38);
  @$pb.TagNumber(39)
  set homeVisionCameraConfig(HomeVision_Camera_Config v) { setField(39, v); }
  @$pb.TagNumber(39)
  $core.bool hasHomeVisionCameraConfig() => $_has(38);
  @$pb.TagNumber(39)
  void clearHomeVisionCameraConfig() => clearField(39);
  @$pb.TagNumber(39)
  HomeVision_Camera_Config ensureHomeVisionCameraConfig() => $_ensure(38);

  @$pb.TagNumber(40)
  $core.int get currentMicroVersion => $_getIZ(39);
  @$pb.TagNumber(40)
  set currentMicroVersion($core.int v) { $_setUnsignedInt32(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasCurrentMicroVersion() => $_has(39);
  @$pb.TagNumber(40)
  void clearCurrentMicroVersion() => clearField(40);

  @$pb.TagNumber(41)
  IVAALPR get ivaALPR => $_getN(40);
  @$pb.TagNumber(41)
  set ivaALPR(IVAALPR v) { setField(41, v); }
  @$pb.TagNumber(41)
  $core.bool hasIvaALPR() => $_has(40);
  @$pb.TagNumber(41)
  void clearIvaALPR() => clearField(41);
  @$pb.TagNumber(41)
  IVAALPR ensureIvaALPR() => $_ensure(40);
}

class CameraStream_Resolution extends $pb.GeneratedMessage {
  factory CameraStream_Resolution({
    $core.int? width,
    $core.int? height,
  }) {
    final $result = create();
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  CameraStream_Resolution._() : super();
  factory CameraStream_Resolution.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraStream_Resolution.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraStream.Resolution', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraStream_Resolution clone() => CameraStream_Resolution()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraStream_Resolution copyWith(void Function(CameraStream_Resolution) updates) => super.copyWith((message) => updates(message as CameraStream_Resolution)) as CameraStream_Resolution;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraStream_Resolution create() => CameraStream_Resolution._();
  CameraStream_Resolution createEmptyInstance() => create();
  static $pb.PbList<CameraStream_Resolution> createRepeated() => $pb.PbList<CameraStream_Resolution>();
  @$core.pragma('dart2js:noInline')
  static CameraStream_Resolution getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraStream_Resolution>(create);
  static CameraStream_Resolution? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get width => $_getIZ(0);
  @$pb.TagNumber(1)
  set width($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);
}

class CameraStream_Encoder extends $pb.GeneratedMessage {
  factory CameraStream_Encoder({
    $core.int? quality,
    $core.int? framerate,
    $core.int? bitrate,
    $core.String? encoding,
  }) {
    final $result = create();
    if (quality != null) {
      $result.quality = quality;
    }
    if (framerate != null) {
      $result.framerate = framerate;
    }
    if (bitrate != null) {
      $result.bitrate = bitrate;
    }
    if (encoding != null) {
      $result.encoding = encoding;
    }
    return $result;
  }
  CameraStream_Encoder._() : super();
  factory CameraStream_Encoder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraStream_Encoder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraStream.Encoder', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'quality', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'framerate', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'bitrate', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'encoding')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraStream_Encoder clone() => CameraStream_Encoder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraStream_Encoder copyWith(void Function(CameraStream_Encoder) updates) => super.copyWith((message) => updates(message as CameraStream_Encoder)) as CameraStream_Encoder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraStream_Encoder create() => CameraStream_Encoder._();
  CameraStream_Encoder createEmptyInstance() => create();
  static $pb.PbList<CameraStream_Encoder> createRepeated() => $pb.PbList<CameraStream_Encoder>();
  @$core.pragma('dart2js:noInline')
  static CameraStream_Encoder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraStream_Encoder>(create);
  static CameraStream_Encoder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get quality => $_getIZ(0);
  @$pb.TagNumber(1)
  set quality($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuality() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuality() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get framerate => $_getIZ(1);
  @$pb.TagNumber(2)
  set framerate($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFramerate() => $_has(1);
  @$pb.TagNumber(2)
  void clearFramerate() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get bitrate => $_getIZ(2);
  @$pb.TagNumber(3)
  set bitrate($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBitrate() => $_has(2);
  @$pb.TagNumber(3)
  void clearBitrate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get encoding => $_getSZ(3);
  @$pb.TagNumber(4)
  set encoding($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEncoding() => $_has(3);
  @$pb.TagNumber(4)
  void clearEncoding() => clearField(4);
}

class CameraStream_PtzRange_range extends $pb.GeneratedMessage {
  factory CameraStream_PtzRange_range({
    $core.int? min,
    $core.int? max,
  }) {
    final $result = create();
    if (min != null) {
      $result.min = min;
    }
    if (max != null) {
      $result.max = max;
    }
    return $result;
  }
  CameraStream_PtzRange_range._() : super();
  factory CameraStream_PtzRange_range.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraStream_PtzRange_range.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraStream.PtzRange.range', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'min', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'max', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraStream_PtzRange_range clone() => CameraStream_PtzRange_range()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraStream_PtzRange_range copyWith(void Function(CameraStream_PtzRange_range) updates) => super.copyWith((message) => updates(message as CameraStream_PtzRange_range)) as CameraStream_PtzRange_range;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraStream_PtzRange_range create() => CameraStream_PtzRange_range._();
  CameraStream_PtzRange_range createEmptyInstance() => create();
  static $pb.PbList<CameraStream_PtzRange_range> createRepeated() => $pb.PbList<CameraStream_PtzRange_range>();
  @$core.pragma('dart2js:noInline')
  static CameraStream_PtzRange_range getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraStream_PtzRange_range>(create);
  static CameraStream_PtzRange_range? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get min => $_getIZ(0);
  @$pb.TagNumber(1)
  set min($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get max => $_getIZ(1);
  @$pb.TagNumber(2)
  set max($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearMax() => clearField(2);
}

class CameraStream_PtzRange extends $pb.GeneratedMessage {
  factory CameraStream_PtzRange({
    CameraStream_PtzRange_range? x,
    CameraStream_PtzRange_range? y,
    CameraStream_PtzRange_range? z,
  }) {
    final $result = create();
    if (x != null) {
      $result.x = x;
    }
    if (y != null) {
      $result.y = y;
    }
    if (z != null) {
      $result.z = z;
    }
    return $result;
  }
  CameraStream_PtzRange._() : super();
  factory CameraStream_PtzRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraStream_PtzRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraStream.PtzRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<CameraStream_PtzRange_range>(1, _omitFieldNames ? '' : 'x', subBuilder: CameraStream_PtzRange_range.create)
    ..aOM<CameraStream_PtzRange_range>(2, _omitFieldNames ? '' : 'y', subBuilder: CameraStream_PtzRange_range.create)
    ..aOM<CameraStream_PtzRange_range>(3, _omitFieldNames ? '' : 'z', subBuilder: CameraStream_PtzRange_range.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraStream_PtzRange clone() => CameraStream_PtzRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraStream_PtzRange copyWith(void Function(CameraStream_PtzRange) updates) => super.copyWith((message) => updates(message as CameraStream_PtzRange)) as CameraStream_PtzRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraStream_PtzRange create() => CameraStream_PtzRange._();
  CameraStream_PtzRange createEmptyInstance() => create();
  static $pb.PbList<CameraStream_PtzRange> createRepeated() => $pb.PbList<CameraStream_PtzRange>();
  @$core.pragma('dart2js:noInline')
  static CameraStream_PtzRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraStream_PtzRange>(create);
  static CameraStream_PtzRange? _defaultInstance;

  @$pb.TagNumber(1)
  CameraStream_PtzRange_range get x => $_getN(0);
  @$pb.TagNumber(1)
  set x(CameraStream_PtzRange_range v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);
  @$pb.TagNumber(1)
  CameraStream_PtzRange_range ensureX() => $_ensure(0);

  @$pb.TagNumber(2)
  CameraStream_PtzRange_range get y => $_getN(1);
  @$pb.TagNumber(2)
  set y(CameraStream_PtzRange_range v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
  @$pb.TagNumber(2)
  CameraStream_PtzRange_range ensureY() => $_ensure(1);

  @$pb.TagNumber(3)
  CameraStream_PtzRange_range get z => $_getN(2);
  @$pb.TagNumber(3)
  set z(CameraStream_PtzRange_range v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
  @$pb.TagNumber(3)
  CameraStream_PtzRange_range ensureZ() => $_ensure(2);
}

class CameraStream_UrlStream extends $pb.GeneratedMessage {
  factory CameraStream_UrlStream({
    $core.bool? isDefault,
    $core.String? nameOfStream,
    $core.String? urlOfStream,
    CameraStream_UrlStream_StreamType? stype,
    $core.bool? isMainStream,
    $core.String? originStream,
  }) {
    final $result = create();
    if (isDefault != null) {
      $result.isDefault = isDefault;
    }
    if (nameOfStream != null) {
      $result.nameOfStream = nameOfStream;
    }
    if (urlOfStream != null) {
      $result.urlOfStream = urlOfStream;
    }
    if (stype != null) {
      $result.stype = stype;
    }
    if (isMainStream != null) {
      $result.isMainStream = isMainStream;
    }
    if (originStream != null) {
      $result.originStream = originStream;
    }
    return $result;
  }
  CameraStream_UrlStream._() : super();
  factory CameraStream_UrlStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraStream_UrlStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraStream.UrlStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isDefault', protoName: 'isDefault')
    ..aOS(2, _omitFieldNames ? '' : 'nameOfStream')
    ..aOS(3, _omitFieldNames ? '' : 'urlOfStream')
    ..e<CameraStream_UrlStream_StreamType>(4, _omitFieldNames ? '' : 'stype', $pb.PbFieldType.OE, defaultOrMaker: CameraStream_UrlStream_StreamType.HLS, valueOf: CameraStream_UrlStream_StreamType.valueOf, enumValues: CameraStream_UrlStream_StreamType.values)
    ..aOB(5, _omitFieldNames ? '' : 'isMainStream', protoName: 'isMainStream')
    ..aOS(6, _omitFieldNames ? '' : 'originStream')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraStream_UrlStream clone() => CameraStream_UrlStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraStream_UrlStream copyWith(void Function(CameraStream_UrlStream) updates) => super.copyWith((message) => updates(message as CameraStream_UrlStream)) as CameraStream_UrlStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraStream_UrlStream create() => CameraStream_UrlStream._();
  CameraStream_UrlStream createEmptyInstance() => create();
  static $pb.PbList<CameraStream_UrlStream> createRepeated() => $pb.PbList<CameraStream_UrlStream>();
  @$core.pragma('dart2js:noInline')
  static CameraStream_UrlStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraStream_UrlStream>(create);
  static CameraStream_UrlStream? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isDefault => $_getBF(0);
  @$pb.TagNumber(1)
  set isDefault($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsDefault() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsDefault() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nameOfStream => $_getSZ(1);
  @$pb.TagNumber(2)
  set nameOfStream($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNameOfStream() => $_has(1);
  @$pb.TagNumber(2)
  void clearNameOfStream() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get urlOfStream => $_getSZ(2);
  @$pb.TagNumber(3)
  set urlOfStream($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrlOfStream() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrlOfStream() => clearField(3);

  @$pb.TagNumber(4)
  CameraStream_UrlStream_StreamType get stype => $_getN(3);
  @$pb.TagNumber(4)
  set stype(CameraStream_UrlStream_StreamType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStype() => $_has(3);
  @$pb.TagNumber(4)
  void clearStype() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isMainStream => $_getBF(4);
  @$pb.TagNumber(5)
  set isMainStream($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsMainStream() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsMainStream() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get originStream => $_getSZ(5);
  @$pb.TagNumber(6)
  set originStream($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOriginStream() => $_has(5);
  @$pb.TagNumber(6)
  void clearOriginStream() => clearField(6);
}

class CameraStream extends $pb.GeneratedMessage {
  factory CameraStream({
    $core.String? streamOriginUrl,
    $core.String? streamIvaUrl,
    $core.String? streamName,
    CameraStream_Resolution? res,
    CameraStream_Encoder? encoder,
    CameraStream_PtzRange? ptzRange,
    $core.String? userOriginAddedUrl,
    $core.String? streamHlsUrl,
    CameraStream_DefaultURL? defaultUrl,
    $core.Iterable<CameraStream_UrlStream>? streamLinks,
  }) {
    final $result = create();
    if (streamOriginUrl != null) {
      $result.streamOriginUrl = streamOriginUrl;
    }
    if (streamIvaUrl != null) {
      $result.streamIvaUrl = streamIvaUrl;
    }
    if (streamName != null) {
      $result.streamName = streamName;
    }
    if (res != null) {
      $result.res = res;
    }
    if (encoder != null) {
      $result.encoder = encoder;
    }
    if (ptzRange != null) {
      $result.ptzRange = ptzRange;
    }
    if (userOriginAddedUrl != null) {
      $result.userOriginAddedUrl = userOriginAddedUrl;
    }
    if (streamHlsUrl != null) {
      $result.streamHlsUrl = streamHlsUrl;
    }
    if (defaultUrl != null) {
      $result.defaultUrl = defaultUrl;
    }
    if (streamLinks != null) {
      $result.streamLinks.addAll(streamLinks);
    }
    return $result;
  }
  CameraStream._() : super();
  factory CameraStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'streamOriginUrl')
    ..aOS(2, _omitFieldNames ? '' : 'streamIvaUrl')
    ..aOS(3, _omitFieldNames ? '' : 'streamName')
    ..aOM<CameraStream_Resolution>(4, _omitFieldNames ? '' : 'res', subBuilder: CameraStream_Resolution.create)
    ..aOM<CameraStream_Encoder>(5, _omitFieldNames ? '' : 'encoder', subBuilder: CameraStream_Encoder.create)
    ..aOM<CameraStream_PtzRange>(6, _omitFieldNames ? '' : 'ptzRange', subBuilder: CameraStream_PtzRange.create)
    ..aOS(7, _omitFieldNames ? '' : 'userOriginAddedUrl')
    ..aOS(8, _omitFieldNames ? '' : 'streamHlsUrl')
    ..e<CameraStream_DefaultURL>(9, _omitFieldNames ? '' : 'defaultUrl', $pb.PbFieldType.OE, defaultOrMaker: CameraStream_DefaultURL.HLS, valueOf: CameraStream_DefaultURL.valueOf, enumValues: CameraStream_DefaultURL.values)
    ..pc<CameraStream_UrlStream>(10, _omitFieldNames ? '' : 'streamLinks', $pb.PbFieldType.PM, protoName: 'streamLinks', subBuilder: CameraStream_UrlStream.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraStream clone() => CameraStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraStream copyWith(void Function(CameraStream) updates) => super.copyWith((message) => updates(message as CameraStream)) as CameraStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraStream create() => CameraStream._();
  CameraStream createEmptyInstance() => create();
  static $pb.PbList<CameraStream> createRepeated() => $pb.PbList<CameraStream>();
  @$core.pragma('dart2js:noInline')
  static CameraStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraStream>(create);
  static CameraStream? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get streamOriginUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set streamOriginUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreamOriginUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamOriginUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get streamIvaUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set streamIvaUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStreamIvaUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamIvaUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get streamName => $_getSZ(2);
  @$pb.TagNumber(3)
  set streamName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStreamName() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamName() => clearField(3);

  @$pb.TagNumber(4)
  CameraStream_Resolution get res => $_getN(3);
  @$pb.TagNumber(4)
  set res(CameraStream_Resolution v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRes() => $_has(3);
  @$pb.TagNumber(4)
  void clearRes() => clearField(4);
  @$pb.TagNumber(4)
  CameraStream_Resolution ensureRes() => $_ensure(3);

  @$pb.TagNumber(5)
  CameraStream_Encoder get encoder => $_getN(4);
  @$pb.TagNumber(5)
  set encoder(CameraStream_Encoder v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEncoder() => $_has(4);
  @$pb.TagNumber(5)
  void clearEncoder() => clearField(5);
  @$pb.TagNumber(5)
  CameraStream_Encoder ensureEncoder() => $_ensure(4);

  @$pb.TagNumber(6)
  CameraStream_PtzRange get ptzRange => $_getN(5);
  @$pb.TagNumber(6)
  set ptzRange(CameraStream_PtzRange v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPtzRange() => $_has(5);
  @$pb.TagNumber(6)
  void clearPtzRange() => clearField(6);
  @$pb.TagNumber(6)
  CameraStream_PtzRange ensurePtzRange() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get userOriginAddedUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set userOriginAddedUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUserOriginAddedUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserOriginAddedUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get streamHlsUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set streamHlsUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStreamHlsUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearStreamHlsUrl() => clearField(8);

  @$pb.TagNumber(9)
  CameraStream_DefaultURL get defaultUrl => $_getN(8);
  @$pb.TagNumber(9)
  set defaultUrl(CameraStream_DefaultURL v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDefaultUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearDefaultUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<CameraStream_UrlStream> get streamLinks => $_getList(9);
}

class Onvif extends $pb.GeneratedMessage {
  factory Onvif({
    $core.String? urn,
    $core.String? name,
    $core.String? hardware,
    $core.String? xaddr,
    $core.Iterable<$core.String>? scopes,
    $core.String? onvifRtspUrl,
  }) {
    final $result = create();
    if (urn != null) {
      $result.urn = urn;
    }
    if (name != null) {
      $result.name = name;
    }
    if (hardware != null) {
      $result.hardware = hardware;
    }
    if (xaddr != null) {
      $result.xaddr = xaddr;
    }
    if (scopes != null) {
      $result.scopes.addAll(scopes);
    }
    if (onvifRtspUrl != null) {
      $result.onvifRtspUrl = onvifRtspUrl;
    }
    return $result;
  }
  Onvif._() : super();
  factory Onvif.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'urn')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'hardware')
    ..aOS(4, _omitFieldNames ? '' : 'xaddr')
    ..pPS(5, _omitFieldNames ? '' : 'scopes')
    ..aOS(6, _omitFieldNames ? '' : 'onvifRtspUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif clone() => Onvif()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif copyWith(void Function(Onvif) updates) => super.copyWith((message) => updates(message as Onvif)) as Onvif;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif create() => Onvif._();
  Onvif createEmptyInstance() => create();
  static $pb.PbList<Onvif> createRepeated() => $pb.PbList<Onvif>();
  @$core.pragma('dart2js:noInline')
  static Onvif getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif>(create);
  static Onvif? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get urn => $_getSZ(0);
  @$pb.TagNumber(1)
  set urn($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrn() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hardware => $_getSZ(2);
  @$pb.TagNumber(3)
  set hardware($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHardware() => $_has(2);
  @$pb.TagNumber(3)
  void clearHardware() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get xaddr => $_getSZ(3);
  @$pb.TagNumber(4)
  set xaddr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasXaddr() => $_has(3);
  @$pb.TagNumber(4)
  void clearXaddr() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get scopes => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get onvifRtspUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set onvifRtspUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOnvifRtspUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnvifRtspUrl() => clearField(6);
}

class Camera extends $pb.GeneratedMessage {
  factory Camera({
    $core.List<$core.int>? id,
    $core.String? name,
    $core.String? serialNumber,
    $core.String? password,
    $core.String? username,
    Camera_Type? type,
    Camera_Role? role,
    $core.bool? on,
    CameraConfig? config,
    $core.int? position,
    $fixnum.Int64? timeAdded,
    $core.int? currentMajorVersion,
    $core.int? currentMinorVersion,
    CameraStream? streamUrl,
    Onvif? onvif,
    $core.bool? isOnvif,
    $core.bool? isRTSP,
    $core.String? plaintextPw,
    $core.List<$core.int>? groupOwnerId,
    $core.List<$core.int>? ownerUserId,
    $core.String? groupOwnerName,
    $core.List<$core.int>? boxOwnerId,
    $core.String? camId,
    CameraType? cameraType,
    Camera_Status? status,
    $core.bool? subscribed,
    $core.Iterable<CamTag>? tags,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (password != null) {
      $result.password = password;
    }
    if (username != null) {
      $result.username = username;
    }
    if (type != null) {
      $result.type = type;
    }
    if (role != null) {
      $result.role = role;
    }
    if (on != null) {
      $result.on = on;
    }
    if (config != null) {
      $result.config = config;
    }
    if (position != null) {
      $result.position = position;
    }
    if (timeAdded != null) {
      $result.timeAdded = timeAdded;
    }
    if (currentMajorVersion != null) {
      $result.currentMajorVersion = currentMajorVersion;
    }
    if (currentMinorVersion != null) {
      $result.currentMinorVersion = currentMinorVersion;
    }
    if (streamUrl != null) {
      $result.streamUrl = streamUrl;
    }
    if (onvif != null) {
      $result.onvif = onvif;
    }
    if (isOnvif != null) {
      $result.isOnvif = isOnvif;
    }
    if (isRTSP != null) {
      $result.isRTSP = isRTSP;
    }
    if (plaintextPw != null) {
      $result.plaintextPw = plaintextPw;
    }
    if (groupOwnerId != null) {
      $result.groupOwnerId = groupOwnerId;
    }
    if (ownerUserId != null) {
      $result.ownerUserId = ownerUserId;
    }
    if (groupOwnerName != null) {
      $result.groupOwnerName = groupOwnerName;
    }
    if (boxOwnerId != null) {
      $result.boxOwnerId = boxOwnerId;
    }
    if (camId != null) {
      $result.camId = camId;
    }
    if (cameraType != null) {
      $result.cameraType = cameraType;
    }
    if (status != null) {
      $result.status = status;
    }
    if (subscribed != null) {
      $result.subscribed = subscribed;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  Camera._() : super();
  factory Camera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Camera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Camera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'serialNumber')
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..aOS(5, _omitFieldNames ? '' : 'username')
    ..e<Camera_Type>(6, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Camera_Type.OWNER, valueOf: Camera_Type.valueOf, enumValues: Camera_Type.values)
    ..e<Camera_Role>(7, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Camera_Role.VIEW, valueOf: Camera_Role.valueOf, enumValues: Camera_Role.values)
    ..aOB(8, _omitFieldNames ? '' : 'on')
    ..aOM<CameraConfig>(9, _omitFieldNames ? '' : 'config', subBuilder: CameraConfig.create)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'position', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(11, _omitFieldNames ? '' : 'timeAdded', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'currentMajorVersion', $pb.PbFieldType.OU3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'currentMinorVersion', $pb.PbFieldType.OU3)
    ..aOM<CameraStream>(14, _omitFieldNames ? '' : 'streamUrl', subBuilder: CameraStream.create)
    ..aOM<Onvif>(15, _omitFieldNames ? '' : 'onvif', subBuilder: Onvif.create)
    ..aOB(16, _omitFieldNames ? '' : 'isOnvif', protoName: 'isOnvif')
    ..aOB(17, _omitFieldNames ? '' : 'isRTSP', protoName: 'isRTSP')
    ..aOS(18, _omitFieldNames ? '' : 'plaintextPw')
    ..a<$core.List<$core.int>>(19, _omitFieldNames ? '' : 'groupOwnerId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(20, _omitFieldNames ? '' : 'ownerUserId', $pb.PbFieldType.OY)
    ..aOS(21, _omitFieldNames ? '' : 'groupOwnerName')
    ..a<$core.List<$core.int>>(22, _omitFieldNames ? '' : 'boxOwnerId', $pb.PbFieldType.OY)
    ..aOS(23, _omitFieldNames ? '' : 'camId')
    ..e<CameraType>(24, _omitFieldNames ? '' : 'cameraType', $pb.PbFieldType.OE, protoName: 'cameraType', defaultOrMaker: CameraType.UNKNOW, valueOf: CameraType.valueOf, enumValues: CameraType.values)
    ..e<Camera_Status>(25, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Camera_Status.INACTIVE, valueOf: Camera_Status.valueOf, enumValues: Camera_Status.values)
    ..aOB(26, _omitFieldNames ? '' : 'subscribed')
    ..pc<CamTag>(27, _omitFieldNames ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: CamTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Camera clone() => Camera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Camera copyWith(void Function(Camera) updates) => super.copyWith((message) => updates(message as Camera)) as Camera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Camera create() => Camera._();
  Camera createEmptyInstance() => create();
  static $pb.PbList<Camera> createRepeated() => $pb.PbList<Camera>();
  @$core.pragma('dart2js:noInline')
  static Camera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Camera>(create);
  static Camera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serialNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set serialNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSerialNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearSerialNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get username => $_getSZ(4);
  @$pb.TagNumber(5)
  set username($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearUsername() => clearField(5);

  @$pb.TagNumber(6)
  Camera_Type get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(Camera_Type v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  Camera_Role get role => $_getN(6);
  @$pb.TagNumber(7)
  set role(Camera_Role v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearRole() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get on => $_getBF(7);
  @$pb.TagNumber(8)
  set on($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOn() => $_has(7);
  @$pb.TagNumber(8)
  void clearOn() => clearField(8);

  @$pb.TagNumber(9)
  CameraConfig get config => $_getN(8);
  @$pb.TagNumber(9)
  set config(CameraConfig v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasConfig() => $_has(8);
  @$pb.TagNumber(9)
  void clearConfig() => clearField(9);
  @$pb.TagNumber(9)
  CameraConfig ensureConfig() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get position => $_getIZ(9);
  @$pb.TagNumber(10)
  set position($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPosition() => $_has(9);
  @$pb.TagNumber(10)
  void clearPosition() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get timeAdded => $_getI64(10);
  @$pb.TagNumber(11)
  set timeAdded($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTimeAdded() => $_has(10);
  @$pb.TagNumber(11)
  void clearTimeAdded() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get currentMajorVersion => $_getIZ(11);
  @$pb.TagNumber(12)
  set currentMajorVersion($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCurrentMajorVersion() => $_has(11);
  @$pb.TagNumber(12)
  void clearCurrentMajorVersion() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get currentMinorVersion => $_getIZ(12);
  @$pb.TagNumber(13)
  set currentMinorVersion($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCurrentMinorVersion() => $_has(12);
  @$pb.TagNumber(13)
  void clearCurrentMinorVersion() => clearField(13);

  @$pb.TagNumber(14)
  CameraStream get streamUrl => $_getN(13);
  @$pb.TagNumber(14)
  set streamUrl(CameraStream v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasStreamUrl() => $_has(13);
  @$pb.TagNumber(14)
  void clearStreamUrl() => clearField(14);
  @$pb.TagNumber(14)
  CameraStream ensureStreamUrl() => $_ensure(13);

  @$pb.TagNumber(15)
  Onvif get onvif => $_getN(14);
  @$pb.TagNumber(15)
  set onvif(Onvif v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasOnvif() => $_has(14);
  @$pb.TagNumber(15)
  void clearOnvif() => clearField(15);
  @$pb.TagNumber(15)
  Onvif ensureOnvif() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.bool get isOnvif => $_getBF(15);
  @$pb.TagNumber(16)
  set isOnvif($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasIsOnvif() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsOnvif() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get isRTSP => $_getBF(16);
  @$pb.TagNumber(17)
  set isRTSP($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasIsRTSP() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsRTSP() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get plaintextPw => $_getSZ(17);
  @$pb.TagNumber(18)
  set plaintextPw($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasPlaintextPw() => $_has(17);
  @$pb.TagNumber(18)
  void clearPlaintextPw() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<$core.int> get groupOwnerId => $_getN(18);
  @$pb.TagNumber(19)
  set groupOwnerId($core.List<$core.int> v) { $_setBytes(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasGroupOwnerId() => $_has(18);
  @$pb.TagNumber(19)
  void clearGroupOwnerId() => clearField(19);

  @$pb.TagNumber(20)
  $core.List<$core.int> get ownerUserId => $_getN(19);
  @$pb.TagNumber(20)
  set ownerUserId($core.List<$core.int> v) { $_setBytes(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasOwnerUserId() => $_has(19);
  @$pb.TagNumber(20)
  void clearOwnerUserId() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get groupOwnerName => $_getSZ(20);
  @$pb.TagNumber(21)
  set groupOwnerName($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasGroupOwnerName() => $_has(20);
  @$pb.TagNumber(21)
  void clearGroupOwnerName() => clearField(21);

  @$pb.TagNumber(22)
  $core.List<$core.int> get boxOwnerId => $_getN(21);
  @$pb.TagNumber(22)
  set boxOwnerId($core.List<$core.int> v) { $_setBytes(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasBoxOwnerId() => $_has(21);
  @$pb.TagNumber(22)
  void clearBoxOwnerId() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get camId => $_getSZ(22);
  @$pb.TagNumber(23)
  set camId($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasCamId() => $_has(22);
  @$pb.TagNumber(23)
  void clearCamId() => clearField(23);

  @$pb.TagNumber(24)
  CameraType get cameraType => $_getN(23);
  @$pb.TagNumber(24)
  set cameraType(CameraType v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasCameraType() => $_has(23);
  @$pb.TagNumber(24)
  void clearCameraType() => clearField(24);

  @$pb.TagNumber(25)
  Camera_Status get status => $_getN(24);
  @$pb.TagNumber(25)
  set status(Camera_Status v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasStatus() => $_has(24);
  @$pb.TagNumber(25)
  void clearStatus() => clearField(25);

  @$pb.TagNumber(26)
  $core.bool get subscribed => $_getBF(25);
  @$pb.TagNumber(26)
  set subscribed($core.bool v) { $_setBool(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasSubscribed() => $_has(25);
  @$pb.TagNumber(26)
  void clearSubscribed() => clearField(26);

  @$pb.TagNumber(27)
  $core.List<CamTag> get tags => $_getList(26);
}

class Alarm extends $pb.GeneratedMessage {
  factory Alarm({
    $core.List<$core.int>? id,
    $core.List<$core.int>? cameraId,
    $core.String? cameraName,
    Alarm_Type? type,
    $fixnum.Int64? time,
    $core.String? urlVideo,
    $core.String? urlThumbnail,
    Alarm_Storage? storage,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (type != null) {
      $result.type = type;
    }
    if (time != null) {
      $result.time = time;
    }
    if (urlVideo != null) {
      $result.urlVideo = urlVideo;
    }
    if (urlThumbnail != null) {
      $result.urlThumbnail = urlThumbnail;
    }
    if (storage != null) {
      $result.storage = storage;
    }
    return $result;
  }
  Alarm._() : super();
  factory Alarm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Alarm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Alarm', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'cameraName')
    ..e<Alarm_Type>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Alarm_Type.MOTION_DETECTION, valueOf: Alarm_Type.valueOf, enumValues: Alarm_Type.values)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'urlVideo')
    ..aOS(7, _omitFieldNames ? '' : 'urlThumbnail')
    ..e<Alarm_Storage>(8, _omitFieldNames ? '' : 'storage', $pb.PbFieldType.OE, defaultOrMaker: Alarm_Storage.CLOUD_STORAGE, valueOf: Alarm_Storage.valueOf, enumValues: Alarm_Storage.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Alarm clone() => Alarm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Alarm copyWith(void Function(Alarm) updates) => super.copyWith((message) => updates(message as Alarm)) as Alarm;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Alarm create() => Alarm._();
  Alarm createEmptyInstance() => create();
  static $pb.PbList<Alarm> createRepeated() => $pb.PbList<Alarm>();
  @$core.pragma('dart2js:noInline')
  static Alarm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Alarm>(create);
  static Alarm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cameraName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cameraName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraName() => clearField(3);

  @$pb.TagNumber(4)
  Alarm_Type get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(Alarm_Type v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get urlVideo => $_getSZ(5);
  @$pb.TagNumber(6)
  set urlVideo($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUrlVideo() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrlVideo() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get urlThumbnail => $_getSZ(6);
  @$pb.TagNumber(7)
  set urlThumbnail($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUrlThumbnail() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrlThumbnail() => clearField(7);

  @$pb.TagNumber(8)
  Alarm_Storage get storage => $_getN(7);
  @$pb.TagNumber(8)
  set storage(Alarm_Storage v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStorage() => $_has(7);
  @$pb.TagNumber(8)
  void clearStorage() => clearField(8);
}

class IvaMotionDetection extends $pb.GeneratedMessage {
  factory IvaMotionDetection({
    $core.String? captureImage,
    $core.String? videoRecordUrl,
    $core.String? captureImageThumb,
  }) {
    final $result = create();
    if (captureImage != null) {
      $result.captureImage = captureImage;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    if (captureImageThumb != null) {
      $result.captureImageThumb = captureImageThumb;
    }
    return $result;
  }
  IvaMotionDetection._() : super();
  factory IvaMotionDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IvaMotionDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IvaMotionDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'captureImage')
    ..aOS(2, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(3, _omitFieldNames ? '' : 'captureImageThumb')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IvaMotionDetection clone() => IvaMotionDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IvaMotionDetection copyWith(void Function(IvaMotionDetection) updates) => super.copyWith((message) => updates(message as IvaMotionDetection)) as IvaMotionDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvaMotionDetection create() => IvaMotionDetection._();
  IvaMotionDetection createEmptyInstance() => create();
  static $pb.PbList<IvaMotionDetection> createRepeated() => $pb.PbList<IvaMotionDetection>();
  @$core.pragma('dart2js:noInline')
  static IvaMotionDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvaMotionDetection>(create);
  static IvaMotionDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get captureImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set captureImage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaptureImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaptureImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get videoRecordUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set videoRecordUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoRecordUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoRecordUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get captureImageThumb => $_getSZ(2);
  @$pb.TagNumber(3)
  set captureImageThumb($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaptureImageThumb() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaptureImageThumb() => clearField(3);
}

class IvaIntrusionDetection extends $pb.GeneratedMessage {
  factory IvaIntrusionDetection({
    $core.String? captureImage,
    $core.String? videoRecordUrl,
    $core.String? captureImageThumb,
  }) {
    final $result = create();
    if (captureImage != null) {
      $result.captureImage = captureImage;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    if (captureImageThumb != null) {
      $result.captureImageThumb = captureImageThumb;
    }
    return $result;
  }
  IvaIntrusionDetection._() : super();
  factory IvaIntrusionDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IvaIntrusionDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IvaIntrusionDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'captureImage')
    ..aOS(2, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(3, _omitFieldNames ? '' : 'captureImageThumb')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IvaIntrusionDetection clone() => IvaIntrusionDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IvaIntrusionDetection copyWith(void Function(IvaIntrusionDetection) updates) => super.copyWith((message) => updates(message as IvaIntrusionDetection)) as IvaIntrusionDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvaIntrusionDetection create() => IvaIntrusionDetection._();
  IvaIntrusionDetection createEmptyInstance() => create();
  static $pb.PbList<IvaIntrusionDetection> createRepeated() => $pb.PbList<IvaIntrusionDetection>();
  @$core.pragma('dart2js:noInline')
  static IvaIntrusionDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvaIntrusionDetection>(create);
  static IvaIntrusionDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get captureImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set captureImage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaptureImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaptureImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get videoRecordUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set videoRecordUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoRecordUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoRecordUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get captureImageThumb => $_getSZ(2);
  @$pb.TagNumber(3)
  set captureImageThumb($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaptureImageThumb() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaptureImageThumb() => clearField(3);
}

class IvaLineCrossingDetection extends $pb.GeneratedMessage {
  factory IvaLineCrossingDetection({
    $core.String? captureImage,
    $core.String? videoRecordUrl,
    $core.String? captureImageThumb,
  }) {
    final $result = create();
    if (captureImage != null) {
      $result.captureImage = captureImage;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    if (captureImageThumb != null) {
      $result.captureImageThumb = captureImageThumb;
    }
    return $result;
  }
  IvaLineCrossingDetection._() : super();
  factory IvaLineCrossingDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IvaLineCrossingDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IvaLineCrossingDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'captureImage')
    ..aOS(2, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(3, _omitFieldNames ? '' : 'captureImageThumb')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IvaLineCrossingDetection clone() => IvaLineCrossingDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IvaLineCrossingDetection copyWith(void Function(IvaLineCrossingDetection) updates) => super.copyWith((message) => updates(message as IvaLineCrossingDetection)) as IvaLineCrossingDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvaLineCrossingDetection create() => IvaLineCrossingDetection._();
  IvaLineCrossingDetection createEmptyInstance() => create();
  static $pb.PbList<IvaLineCrossingDetection> createRepeated() => $pb.PbList<IvaLineCrossingDetection>();
  @$core.pragma('dart2js:noInline')
  static IvaLineCrossingDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvaLineCrossingDetection>(create);
  static IvaLineCrossingDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get captureImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set captureImage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaptureImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaptureImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get videoRecordUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set videoRecordUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoRecordUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoRecordUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get captureImageThumb => $_getSZ(2);
  @$pb.TagNumber(3)
  set captureImageThumb($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaptureImageThumb() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaptureImageThumb() => clearField(3);
}

class IvaSmokeDetection extends $pb.GeneratedMessage {
  factory IvaSmokeDetection({
    $core.String? captureImage,
    $core.String? videoRecordUrl,
    $core.String? captureImageThumb,
  }) {
    final $result = create();
    if (captureImage != null) {
      $result.captureImage = captureImage;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    if (captureImageThumb != null) {
      $result.captureImageThumb = captureImageThumb;
    }
    return $result;
  }
  IvaSmokeDetection._() : super();
  factory IvaSmokeDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IvaSmokeDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IvaSmokeDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'captureImage')
    ..aOS(2, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(3, _omitFieldNames ? '' : 'captureImageThumb')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IvaSmokeDetection clone() => IvaSmokeDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IvaSmokeDetection copyWith(void Function(IvaSmokeDetection) updates) => super.copyWith((message) => updates(message as IvaSmokeDetection)) as IvaSmokeDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvaSmokeDetection create() => IvaSmokeDetection._();
  IvaSmokeDetection createEmptyInstance() => create();
  static $pb.PbList<IvaSmokeDetection> createRepeated() => $pb.PbList<IvaSmokeDetection>();
  @$core.pragma('dart2js:noInline')
  static IvaSmokeDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvaSmokeDetection>(create);
  static IvaSmokeDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get captureImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set captureImage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaptureImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaptureImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get videoRecordUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set videoRecordUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoRecordUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoRecordUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get captureImageThumb => $_getSZ(2);
  @$pb.TagNumber(3)
  set captureImageThumb($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaptureImageThumb() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaptureImageThumb() => clearField(3);
}

class FaceDetection extends $pb.GeneratedMessage {
  factory FaceDetection({
    $core.String? displayName,
    $core.String? companyName,
    $core.String? department,
    $core.String? originImage,
    $core.String? captureImage,
    $core.String? faceId,
    FaceDetection_DetectionType? detectionType,
    $core.String? videoRecordUrl,
  }) {
    final $result = create();
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (department != null) {
      $result.department = department;
    }
    if (originImage != null) {
      $result.originImage = originImage;
    }
    if (captureImage != null) {
      $result.captureImage = captureImage;
    }
    if (faceId != null) {
      $result.faceId = faceId;
    }
    if (detectionType != null) {
      $result.detectionType = detectionType;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    return $result;
  }
  FaceDetection._() : super();
  factory FaceDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FaceDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FaceDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'displayName')
    ..aOS(2, _omitFieldNames ? '' : 'companyName')
    ..aOS(3, _omitFieldNames ? '' : 'department')
    ..aOS(4, _omitFieldNames ? '' : 'originImage')
    ..aOS(5, _omitFieldNames ? '' : 'captureImage')
    ..aOS(6, _omitFieldNames ? '' : 'faceId')
    ..e<FaceDetection_DetectionType>(7, _omitFieldNames ? '' : 'detectionType', $pb.PbFieldType.OE, protoName: 'detectionType', defaultOrMaker: FaceDetection_DetectionType.FACE_DETECTION, valueOf: FaceDetection_DetectionType.valueOf, enumValues: FaceDetection_DetectionType.values)
    ..aOS(8, _omitFieldNames ? '' : 'videoRecordUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FaceDetection clone() => FaceDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FaceDetection copyWith(void Function(FaceDetection) updates) => super.copyWith((message) => updates(message as FaceDetection)) as FaceDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FaceDetection create() => FaceDetection._();
  FaceDetection createEmptyInstance() => create();
  static $pb.PbList<FaceDetection> createRepeated() => $pb.PbList<FaceDetection>();
  @$core.pragma('dart2js:noInline')
  static FaceDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FaceDetection>(create);
  static FaceDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get displayName => $_getSZ(0);
  @$pb.TagNumber(1)
  set displayName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisplayName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplayName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get department => $_getSZ(2);
  @$pb.TagNumber(3)
  set department($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDepartment() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepartment() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get originImage => $_getSZ(3);
  @$pb.TagNumber(4)
  set originImage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOriginImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearOriginImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get captureImage => $_getSZ(4);
  @$pb.TagNumber(5)
  set captureImage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCaptureImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearCaptureImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get faceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set faceId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFaceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFaceId() => clearField(6);

  @$pb.TagNumber(7)
  FaceDetection_DetectionType get detectionType => $_getN(6);
  @$pb.TagNumber(7)
  set detectionType(FaceDetection_DetectionType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDetectionType() => $_has(6);
  @$pb.TagNumber(7)
  void clearDetectionType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get videoRecordUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set videoRecordUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVideoRecordUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearVideoRecordUrl() => clearField(8);
}

class IVAALPRDetection extends $pb.GeneratedMessage {
  factory IVAALPRDetection({
    $core.String? vehiclePlateCapture,
    $core.String? imgCapture,
    $core.String? vehiclePlate,
    $core.String? vehicleType,
    $core.String? videoRecordUrl,
    $core.String? imgVehicle,
  }) {
    final $result = create();
    if (vehiclePlateCapture != null) {
      $result.vehiclePlateCapture = vehiclePlateCapture;
    }
    if (imgCapture != null) {
      $result.imgCapture = imgCapture;
    }
    if (vehiclePlate != null) {
      $result.vehiclePlate = vehiclePlate;
    }
    if (vehicleType != null) {
      $result.vehicleType = vehicleType;
    }
    if (videoRecordUrl != null) {
      $result.videoRecordUrl = videoRecordUrl;
    }
    if (imgVehicle != null) {
      $result.imgVehicle = imgVehicle;
    }
    return $result;
  }
  IVAALPRDetection._() : super();
  factory IVAALPRDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IVAALPRDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IVAALPRDetection', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'vehiclePlateCapture')
    ..aOS(2, _omitFieldNames ? '' : 'imgCapture')
    ..aOS(3, _omitFieldNames ? '' : 'vehiclePlate')
    ..aOS(4, _omitFieldNames ? '' : 'vehicleType')
    ..aOS(5, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(6, _omitFieldNames ? '' : 'imgVehicle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IVAALPRDetection clone() => IVAALPRDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IVAALPRDetection copyWith(void Function(IVAALPRDetection) updates) => super.copyWith((message) => updates(message as IVAALPRDetection)) as IVAALPRDetection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IVAALPRDetection create() => IVAALPRDetection._();
  IVAALPRDetection createEmptyInstance() => create();
  static $pb.PbList<IVAALPRDetection> createRepeated() => $pb.PbList<IVAALPRDetection>();
  @$core.pragma('dart2js:noInline')
  static IVAALPRDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IVAALPRDetection>(create);
  static IVAALPRDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get vehiclePlateCapture => $_getSZ(0);
  @$pb.TagNumber(1)
  set vehiclePlateCapture($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVehiclePlateCapture() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehiclePlateCapture() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get imgCapture => $_getSZ(1);
  @$pb.TagNumber(2)
  set imgCapture($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImgCapture() => $_has(1);
  @$pb.TagNumber(2)
  void clearImgCapture() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get vehiclePlate => $_getSZ(2);
  @$pb.TagNumber(3)
  set vehiclePlate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVehiclePlate() => $_has(2);
  @$pb.TagNumber(3)
  void clearVehiclePlate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get vehicleType => $_getSZ(3);
  @$pb.TagNumber(4)
  set vehicleType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVehicleType() => $_has(3);
  @$pb.TagNumber(4)
  void clearVehicleType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get videoRecordUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set videoRecordUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVideoRecordUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideoRecordUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get imgVehicle => $_getSZ(5);
  @$pb.TagNumber(6)
  set imgVehicle($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImgVehicle() => $_has(5);
  @$pb.TagNumber(6)
  void clearImgVehicle() => clearField(6);
}

class Vehicle extends $pb.GeneratedMessage {
  factory Vehicle({
    $core.List<$core.int>? vehicleId,
    $core.String? vehiclePlate,
    Vehicle_Type? vehicleType,
    $core.String? owner,
  }) {
    final $result = create();
    if (vehicleId != null) {
      $result.vehicleId = vehicleId;
    }
    if (vehiclePlate != null) {
      $result.vehiclePlate = vehiclePlate;
    }
    if (vehicleType != null) {
      $result.vehicleType = vehicleType;
    }
    if (owner != null) {
      $result.owner = owner;
    }
    return $result;
  }
  Vehicle._() : super();
  factory Vehicle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vehicle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Vehicle', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'vehicleId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'vehiclePlate')
    ..e<Vehicle_Type>(3, _omitFieldNames ? '' : 'vehicleType', $pb.PbFieldType.OE, defaultOrMaker: Vehicle_Type.CAR, valueOf: Vehicle_Type.valueOf, enumValues: Vehicle_Type.values)
    ..aOS(4, _omitFieldNames ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Vehicle clone() => Vehicle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Vehicle copyWith(void Function(Vehicle) updates) => super.copyWith((message) => updates(message as Vehicle)) as Vehicle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Vehicle create() => Vehicle._();
  Vehicle createEmptyInstance() => create();
  static $pb.PbList<Vehicle> createRepeated() => $pb.PbList<Vehicle>();
  @$core.pragma('dart2js:noInline')
  static Vehicle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vehicle>(create);
  static Vehicle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get vehicleId => $_getN(0);
  @$pb.TagNumber(1)
  set vehicleId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVehicleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get vehiclePlate => $_getSZ(1);
  @$pb.TagNumber(2)
  set vehiclePlate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVehiclePlate() => $_has(1);
  @$pb.TagNumber(2)
  void clearVehiclePlate() => clearField(2);

  @$pb.TagNumber(3)
  Vehicle_Type get vehicleType => $_getN(2);
  @$pb.TagNumber(3)
  set vehicleType(Vehicle_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasVehicleType() => $_has(2);
  @$pb.TagNumber(3)
  void clearVehicleType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get owner => $_getSZ(3);
  @$pb.TagNumber(4)
  set owner($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwner() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwner() => clearField(4);
}

class Event extends $pb.GeneratedMessage {
  factory Event({
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? time,
    $core.String? cameraName,
    EventType? type,
    $0.Any? eventMetadata,
    $core.List<$core.int>? eventId,
    $core.String? captureImage,
    $core.String? videoRecordUrl,
    $core.String? captureImageThumb,
    $core.String? description,
    $core.bool? hasVideoRecordUrl_11,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (time != null) {
      $result.time = time;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (type != null) {
      $result.type = type;
    }
    if (eventMetadata != null) {
      $result.eventMetadata = eventMetadata;
    }
    if (eventId != null) {
      $result.eventId = eventId;
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
    if (hasVideoRecordUrl_11 != null) {
      $result.hasVideoRecordUrl_11 = hasVideoRecordUrl_11;
    }
    return $result;
  }
  Event._() : super();
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Event', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'cameraName')
    ..e<EventType>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: EventType.MOTION_DETECTION, valueOf: EventType.valueOf, enumValues: EventType.values)
    ..aOM<$0.Any>(5, _omitFieldNames ? '' : 'eventMetadata', subBuilder: $0.Any.create)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'eventId', $pb.PbFieldType.OY)
    ..aOS(7, _omitFieldNames ? '' : 'captureImage')
    ..aOS(8, _omitFieldNames ? '' : 'videoRecordUrl')
    ..aOS(9, _omitFieldNames ? '' : 'captureImageThumb')
    ..aOS(10, _omitFieldNames ? '' : 'description')
    ..aOB(11, _omitFieldNames ? '' : 'hasVideoRecordUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cameraName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cameraName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraName() => clearField(3);

  @$pb.TagNumber(4)
  EventType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(EventType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

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
  $core.List<$core.int> get eventId => $_getN(5);
  @$pb.TagNumber(6)
  set eventId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEventId() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get captureImage => $_getSZ(6);
  @$pb.TagNumber(7)
  set captureImage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCaptureImage() => $_has(6);
  @$pb.TagNumber(7)
  void clearCaptureImage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get videoRecordUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set videoRecordUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVideoRecordUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearVideoRecordUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get captureImageThumb => $_getSZ(8);
  @$pb.TagNumber(9)
  set captureImageThumb($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCaptureImageThumb() => $_has(8);
  @$pb.TagNumber(9)
  void clearCaptureImageThumb() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get description => $_getSZ(9);
  @$pb.TagNumber(10)
  set description($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDescription() => $_has(9);
  @$pb.TagNumber(10)
  void clearDescription() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get hasVideoRecordUrl_11 => $_getBF(10);
  @$pb.TagNumber(11)
  set hasVideoRecordUrl_11($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasHasVideoRecordUrl_11() => $_has(10);
  @$pb.TagNumber(11)
  void clearHasVideoRecordUrl_11() => clearField(11);
}

class DeviceGroup extends $pb.GeneratedMessage {
  factory DeviceGroup({
    $core.String? name,
    $core.List<$core.int>? parentGroupId,
    DeviceGroup_Status? status,
    $core.int? level,
    $fixnum.Int64? createdDate,
    $fixnum.Int64? lastUpdate,
    $core.List<$core.int>? userCreated,
    $core.Iterable<DeviceGroup>? groups,
    $core.List<$core.int>? groupId,
    DeviceGroup_Type? groupType,
    DeviceGroup_Role? groupRole,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (parentGroupId != null) {
      $result.parentGroupId = parentGroupId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (level != null) {
      $result.level = level;
    }
    if (createdDate != null) {
      $result.createdDate = createdDate;
    }
    if (lastUpdate != null) {
      $result.lastUpdate = lastUpdate;
    }
    if (userCreated != null) {
      $result.userCreated = userCreated;
    }
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (groupType != null) {
      $result.groupType = groupType;
    }
    if (groupRole != null) {
      $result.groupRole = groupRole;
    }
    return $result;
  }
  DeviceGroup._() : super();
  factory DeviceGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'parentGroupId', $pb.PbFieldType.OY)
    ..e<DeviceGroup_Status>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: DeviceGroup_Status.INACTIVE, valueOf: DeviceGroup_Status.valueOf, enumValues: DeviceGroup_Status.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'createdDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'lastUpdate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'userCreated', $pb.PbFieldType.OY)
    ..pc<DeviceGroup>(8, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: DeviceGroup.create)
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..e<DeviceGroup_Type>(11, _omitFieldNames ? '' : 'groupType', $pb.PbFieldType.OE, defaultOrMaker: DeviceGroup_Type.OWNER, valueOf: DeviceGroup_Type.valueOf, enumValues: DeviceGroup_Type.values)
    ..e<DeviceGroup_Role>(12, _omitFieldNames ? '' : 'groupRole', $pb.PbFieldType.OE, defaultOrMaker: DeviceGroup_Role.FULL, valueOf: DeviceGroup_Role.valueOf, enumValues: DeviceGroup_Role.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceGroup clone() => DeviceGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceGroup copyWith(void Function(DeviceGroup) updates) => super.copyWith((message) => updates(message as DeviceGroup)) as DeviceGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceGroup create() => DeviceGroup._();
  DeviceGroup createEmptyInstance() => create();
  static $pb.PbList<DeviceGroup> createRepeated() => $pb.PbList<DeviceGroup>();
  @$core.pragma('dart2js:noInline')
  static DeviceGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceGroup>(create);
  static DeviceGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get parentGroupId => $_getN(1);
  @$pb.TagNumber(2)
  set parentGroupId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentGroupId() => clearField(2);

  @$pb.TagNumber(3)
  DeviceGroup_Status get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(DeviceGroup_Status v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createdDate => $_getI64(4);
  @$pb.TagNumber(5)
  set createdDate($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedDate() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastUpdate => $_getI64(5);
  @$pb.TagNumber(6)
  set lastUpdate($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastUpdate() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdate() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get userCreated => $_getN(6);
  @$pb.TagNumber(7)
  set userCreated($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUserCreated() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserCreated() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<DeviceGroup> get groups => $_getList(7);

  @$pb.TagNumber(10)
  $core.List<$core.int> get groupId => $_getN(8);
  @$pb.TagNumber(10)
  set groupId($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasGroupId() => $_has(8);
  @$pb.TagNumber(10)
  void clearGroupId() => clearField(10);

  @$pb.TagNumber(11)
  DeviceGroup_Type get groupType => $_getN(9);
  @$pb.TagNumber(11)
  set groupType(DeviceGroup_Type v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasGroupType() => $_has(9);
  @$pb.TagNumber(11)
  void clearGroupType() => clearField(11);

  @$pb.TagNumber(12)
  DeviceGroup_Role get groupRole => $_getN(10);
  @$pb.TagNumber(12)
  set groupRole(DeviceGroup_Role v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasGroupRole() => $_has(10);
  @$pb.TagNumber(12)
  void clearGroupRole() => clearField(12);
}

class LiveViewPosition extends $pb.GeneratedMessage {
  factory LiveViewPosition({
    $core.int? index,
    $core.List<$core.int>? cameraId,
    Camera? camera,
  }) {
    final $result = create();
    if (index != null) {
      $result.index = index;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    return $result;
  }
  LiveViewPosition._() : super();
  factory LiveViewPosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LiveViewPosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LiveViewPosition', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<Camera>(3, _omitFieldNames ? '' : 'camera', subBuilder: Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LiveViewPosition clone() => LiveViewPosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LiveViewPosition copyWith(void Function(LiveViewPosition) updates) => super.copyWith((message) => updates(message as LiveViewPosition)) as LiveViewPosition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LiveViewPosition create() => LiveViewPosition._();
  LiveViewPosition createEmptyInstance() => create();
  static $pb.PbList<LiveViewPosition> createRepeated() => $pb.PbList<LiveViewPosition>();
  @$core.pragma('dart2js:noInline')
  static LiveViewPosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LiveViewPosition>(create);
  static LiveViewPosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);

  @$pb.TagNumber(3)
  Camera get camera => $_getN(2);
  @$pb.TagNumber(3)
  set camera(Camera v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCamera() => $_has(2);
  @$pb.TagNumber(3)
  void clearCamera() => clearField(3);
  @$pb.TagNumber(3)
  Camera ensureCamera() => $_ensure(2);
}

class CustomLiveView extends $pb.GeneratedMessage {
  factory CustomLiveView({
    $core.List<$core.int>? id,
    Base_View? base,
    $core.Iterable<LiveViewPosition>? postision,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (base != null) {
      $result.base = base;
    }
    if (postision != null) {
      $result.postision.addAll(postision);
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  CustomLiveView._() : super();
  factory CustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..e<Base_View>(2, _omitFieldNames ? '' : 'base', $pb.PbFieldType.OE, defaultOrMaker: Base_View.V_1X1, valueOf: Base_View.valueOf, enumValues: Base_View.values)
    ..pc<LiveViewPosition>(3, _omitFieldNames ? '' : 'postision', $pb.PbFieldType.PM, subBuilder: LiveViewPosition.create)
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomLiveView clone() => CustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomLiveView copyWith(void Function(CustomLiveView) updates) => super.copyWith((message) => updates(message as CustomLiveView)) as CustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomLiveView create() => CustomLiveView._();
  CustomLiveView createEmptyInstance() => create();
  static $pb.PbList<CustomLiveView> createRepeated() => $pb.PbList<CustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static CustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomLiveView>(create);
  static CustomLiveView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Base_View get base => $_getN(1);
  @$pb.TagNumber(2)
  set base(Base_View v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBase() => $_has(1);
  @$pb.TagNumber(2)
  void clearBase() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<LiveViewPosition> get postision => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);
}

class InviteMessage extends $pb.GeneratedMessage {
  factory InviteMessage({
    $core.List<$core.int>? cameraId,
    InviteMessage_Role? role,
    InviteMessage_Status? status,
    Profile? accountShare,
    Profile? accountShared,
    $fixnum.Int64? lastUpdate,
    $core.List<$core.int>? accountShareId,
    $core.List<$core.int>? accountSharedId,
    $fixnum.Int64? timeShare,
    InviteMessage_ShareType? shareType,
    $core.List<$core.int>? groupId,
    InviteMessage_GroupShareRole? groupShareRole,
    $core.List<$core.int>? inviteMsgId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (status != null) {
      $result.status = status;
    }
    if (accountShare != null) {
      $result.accountShare = accountShare;
    }
    if (accountShared != null) {
      $result.accountShared = accountShared;
    }
    if (lastUpdate != null) {
      $result.lastUpdate = lastUpdate;
    }
    if (accountShareId != null) {
      $result.accountShareId = accountShareId;
    }
    if (accountSharedId != null) {
      $result.accountSharedId = accountSharedId;
    }
    if (timeShare != null) {
      $result.timeShare = timeShare;
    }
    if (shareType != null) {
      $result.shareType = shareType;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (groupShareRole != null) {
      $result.groupShareRole = groupShareRole;
    }
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    return $result;
  }
  InviteMessage._() : super();
  factory InviteMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InviteMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InviteMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<InviteMessage_Role>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: InviteMessage_Role.VIEW, valueOf: InviteMessage_Role.valueOf, enumValues: InviteMessage_Role.values)
    ..e<InviteMessage_Status>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: InviteMessage_Status.PENDING, valueOf: InviteMessage_Status.valueOf, enumValues: InviteMessage_Status.values)
    ..aOM<Profile>(4, _omitFieldNames ? '' : 'accountShare', subBuilder: Profile.create)
    ..aOM<Profile>(5, _omitFieldNames ? '' : 'accountShared', subBuilder: Profile.create)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'lastUpdate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'accountShareId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'accountSharedId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'timeShare', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<InviteMessage_ShareType>(10, _omitFieldNames ? '' : 'shareType', $pb.PbFieldType.OE, protoName: 'shareType', defaultOrMaker: InviteMessage_ShareType.CAMERA, valueOf: InviteMessage_ShareType.valueOf, enumValues: InviteMessage_ShareType.values)
    ..a<$core.List<$core.int>>(11, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..e<InviteMessage_GroupShareRole>(12, _omitFieldNames ? '' : 'groupShareRole', $pb.PbFieldType.OE, protoName: 'groupShareRole', defaultOrMaker: InviteMessage_GroupShareRole.GFULL, valueOf: InviteMessage_GroupShareRole.valueOf, enumValues: InviteMessage_GroupShareRole.values)
    ..a<$core.List<$core.int>>(13, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InviteMessage clone() => InviteMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InviteMessage copyWith(void Function(InviteMessage) updates) => super.copyWith((message) => updates(message as InviteMessage)) as InviteMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteMessage create() => InviteMessage._();
  InviteMessage createEmptyInstance() => create();
  static $pb.PbList<InviteMessage> createRepeated() => $pb.PbList<InviteMessage>();
  @$core.pragma('dart2js:noInline')
  static InviteMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InviteMessage>(create);
  static InviteMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  InviteMessage_Role get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(InviteMessage_Role v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  InviteMessage_Status get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(InviteMessage_Status v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  Profile get accountShare => $_getN(3);
  @$pb.TagNumber(4)
  set accountShare(Profile v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAccountShare() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccountShare() => clearField(4);
  @$pb.TagNumber(4)
  Profile ensureAccountShare() => $_ensure(3);

  @$pb.TagNumber(5)
  Profile get accountShared => $_getN(4);
  @$pb.TagNumber(5)
  set accountShared(Profile v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAccountShared() => $_has(4);
  @$pb.TagNumber(5)
  void clearAccountShared() => clearField(5);
  @$pb.TagNumber(5)
  Profile ensureAccountShared() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastUpdate => $_getI64(5);
  @$pb.TagNumber(6)
  set lastUpdate($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastUpdate() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdate() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get accountShareId => $_getN(6);
  @$pb.TagNumber(7)
  set accountShareId($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAccountShareId() => $_has(6);
  @$pb.TagNumber(7)
  void clearAccountShareId() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get accountSharedId => $_getN(7);
  @$pb.TagNumber(8)
  set accountSharedId($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAccountSharedId() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccountSharedId() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get timeShare => $_getI64(8);
  @$pb.TagNumber(9)
  set timeShare($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTimeShare() => $_has(8);
  @$pb.TagNumber(9)
  void clearTimeShare() => clearField(9);

  /// // SHARE GROUP
  @$pb.TagNumber(10)
  InviteMessage_ShareType get shareType => $_getN(9);
  @$pb.TagNumber(10)
  set shareType(InviteMessage_ShareType v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasShareType() => $_has(9);
  @$pb.TagNumber(10)
  void clearShareType() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get groupId => $_getN(10);
  @$pb.TagNumber(11)
  set groupId($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasGroupId() => $_has(10);
  @$pb.TagNumber(11)
  void clearGroupId() => clearField(11);

  @$pb.TagNumber(12)
  InviteMessage_GroupShareRole get groupShareRole => $_getN(11);
  @$pb.TagNumber(12)
  set groupShareRole(InviteMessage_GroupShareRole v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasGroupShareRole() => $_has(11);
  @$pb.TagNumber(12)
  void clearGroupShareRole() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.int> get inviteMsgId => $_getN(12);
  @$pb.TagNumber(13)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasInviteMsgId() => $_has(12);
  @$pb.TagNumber(13)
  void clearInviteMsgId() => clearField(13);
}

class Vbox extends $pb.GeneratedMessage {
  factory Vbox({
    $core.List<$core.int>? boxId,
    $core.String? boxName,
    $core.String? boxSerialNumber,
    Box_Type? boxType,
    Box_State? boxState,
    $core.List<$core.int>? ownerUserId,
    $fixnum.Int64? timeAdded,
    $fixnum.Int64? lastUpdate,
    $core.String? boxIdStr,
    $core.bool? isBoxOnline,
    $core.int? cameraCount,
    $core.String? boxLocalIp,
    $core.String? boxPublicIp,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    if (boxName != null) {
      $result.boxName = boxName;
    }
    if (boxSerialNumber != null) {
      $result.boxSerialNumber = boxSerialNumber;
    }
    if (boxType != null) {
      $result.boxType = boxType;
    }
    if (boxState != null) {
      $result.boxState = boxState;
    }
    if (ownerUserId != null) {
      $result.ownerUserId = ownerUserId;
    }
    if (timeAdded != null) {
      $result.timeAdded = timeAdded;
    }
    if (lastUpdate != null) {
      $result.lastUpdate = lastUpdate;
    }
    if (boxIdStr != null) {
      $result.boxIdStr = boxIdStr;
    }
    if (isBoxOnline != null) {
      $result.isBoxOnline = isBoxOnline;
    }
    if (cameraCount != null) {
      $result.cameraCount = cameraCount;
    }
    if (boxLocalIp != null) {
      $result.boxLocalIp = boxLocalIp;
    }
    if (boxPublicIp != null) {
      $result.boxPublicIp = boxPublicIp;
    }
    return $result;
  }
  Vbox._() : super();
  factory Vbox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vbox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Vbox', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'boxName')
    ..aOS(3, _omitFieldNames ? '' : 'boxSerialNumber')
    ..e<Box_Type>(4, _omitFieldNames ? '' : 'boxType', $pb.PbFieldType.OE, defaultOrMaker: Box_Type.BOX_UNDEFINED, valueOf: Box_Type.valueOf, enumValues: Box_Type.values)
    ..e<Box_State>(5, _omitFieldNames ? '' : 'boxState', $pb.PbFieldType.OE, protoName: 'box_State', defaultOrMaker: Box_State.VBOX_ACTIVE, valueOf: Box_State.valueOf, enumValues: Box_State.values)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'ownerUserId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'timeAdded', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'lastUpdate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : 'boxIdStr')
    ..aOB(10, _omitFieldNames ? '' : 'isBoxOnline', protoName: 'isBoxOnline')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'cameraCount', $pb.PbFieldType.OU3)
    ..aOS(23, _omitFieldNames ? '' : 'boxLocalIp')
    ..aOS(24, _omitFieldNames ? '' : 'boxPublicIp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Vbox clone() => Vbox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Vbox copyWith(void Function(Vbox) updates) => super.copyWith((message) => updates(message as Vbox)) as Vbox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Vbox create() => Vbox._();
  Vbox createEmptyInstance() => create();
  static $pb.PbList<Vbox> createRepeated() => $pb.PbList<Vbox>();
  @$core.pragma('dart2js:noInline')
  static Vbox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vbox>(create);
  static Vbox? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boxName => $_getSZ(1);
  @$pb.TagNumber(2)
  set boxName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoxName() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoxName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boxSerialNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set boxSerialNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoxSerialNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoxSerialNumber() => clearField(3);

  @$pb.TagNumber(4)
  Box_Type get boxType => $_getN(3);
  @$pb.TagNumber(4)
  set boxType(Box_Type v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoxType() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoxType() => clearField(4);

  @$pb.TagNumber(5)
  Box_State get boxState => $_getN(4);
  @$pb.TagNumber(5)
  set boxState(Box_State v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBoxState() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoxState() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get ownerUserId => $_getN(5);
  @$pb.TagNumber(6)
  set ownerUserId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOwnerUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwnerUserId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get timeAdded => $_getI64(6);
  @$pb.TagNumber(7)
  set timeAdded($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimeAdded() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimeAdded() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastUpdate => $_getI64(7);
  @$pb.TagNumber(8)
  set lastUpdate($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastUpdate() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastUpdate() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get boxIdStr => $_getSZ(8);
  @$pb.TagNumber(9)
  set boxIdStr($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBoxIdStr() => $_has(8);
  @$pb.TagNumber(9)
  void clearBoxIdStr() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isBoxOnline => $_getBF(9);
  @$pb.TagNumber(10)
  set isBoxOnline($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsBoxOnline() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsBoxOnline() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get cameraCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set cameraCount($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCameraCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearCameraCount() => clearField(11);

  @$pb.TagNumber(23)
  $core.String get boxLocalIp => $_getSZ(11);
  @$pb.TagNumber(23)
  set boxLocalIp($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(23)
  $core.bool hasBoxLocalIp() => $_has(11);
  @$pb.TagNumber(23)
  void clearBoxLocalIp() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get boxPublicIp => $_getSZ(12);
  @$pb.TagNumber(24)
  set boxPublicIp($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(24)
  $core.bool hasBoxPublicIp() => $_has(12);
  @$pb.TagNumber(24)
  void clearBoxPublicIp() => clearField(24);
}

class Ack_for extends $pb.GeneratedMessage {
  factory Ack_for({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? sessionId,
    $core.List<$core.int>? connectionId,
    $fixnum.Int64? messageId,
    $core.int? requestID,
    $fixnum.Int64? timeRequest,
    $0.Any? metadata,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (connectionId != null) {
      $result.connectionId = connectionId;
    }
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (requestID != null) {
      $result.requestID = requestID;
    }
    if (timeRequest != null) {
      $result.timeRequest = timeRequest;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  Ack_for._() : super();
  factory Ack_for.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ack_for.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ack_for', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'connectionId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'messageId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'requestID', $pb.PbFieldType.OU3, protoName: 'request_ID')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'timeRequest', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(7, _omitFieldNames ? '' : 'metadata', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ack_for clone() => Ack_for()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ack_for copyWith(void Function(Ack_for) updates) => super.copyWith((message) => updates(message as Ack_for)) as Ack_for;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ack_for create() => Ack_for._();
  Ack_for createEmptyInstance() => create();
  static $pb.PbList<Ack_for> createRepeated() => $pb.PbList<Ack_for>();
  @$core.pragma('dart2js:noInline')
  static Ack_for getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ack_for>(create);
  static Ack_for? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get sessionId => $_getN(1);
  @$pb.TagNumber(2)
  set sessionId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get connectionId => $_getN(2);
  @$pb.TagNumber(3)
  set connectionId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get messageId => $_getI64(3);
  @$pb.TagNumber(4)
  set messageId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get requestID => $_getIZ(4);
  @$pb.TagNumber(5)
  set requestID($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequestID() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequestID() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get timeRequest => $_getI64(5);
  @$pb.TagNumber(6)
  set timeRequest($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimeRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimeRequest() => clearField(6);

  @$pb.TagNumber(7)
  $0.Any get metadata => $_getN(6);
  @$pb.TagNumber(7)
  set metadata($0.Any v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => clearField(7);
  @$pb.TagNumber(7)
  $0.Any ensureMetadata() => $_ensure(6);
}

class License_profile extends $pb.GeneratedMessage {
  factory License_profile({
    License_profile_ISON? iva,
    License_profile_ISON? motionDetection,
    License_profile_ISON? instrumentDetection,
    License_profile_ISON? lineCrossingDetection,
    License_profile_ISON? smokeDetection,
    License_profile_ISON? faceDetection,
    License_profile_ISON? adminManagement,
    License_profile_ISON? optVerify,
    License_profile_ISON? serviceManagement,
    License_profile_ISON? forgotPassword,
    License_profile_ISON? registerForm,
    License_profile_ISON? playback,
    License_profile_ISON? notification,
    License_profile_ISON? emap,
    License_profile_ISON? userEditMdLog,
    License_profile_ISON? settingDefaultStorage,
    License_profile_ISON? useCamBox,
    License_profile_ISON? addRtspCam,
    License_profile_ISON? addOnvifCam,
    License_profile_ISON? alprDetection,
    License_profile_ISON? mailConfig,
    License_profile_ISON? scanOnvif,
    License_profile_ISON? vehicleManagement,
  }) {
    final $result = create();
    if (iva != null) {
      $result.iva = iva;
    }
    if (motionDetection != null) {
      $result.motionDetection = motionDetection;
    }
    if (instrumentDetection != null) {
      $result.instrumentDetection = instrumentDetection;
    }
    if (lineCrossingDetection != null) {
      $result.lineCrossingDetection = lineCrossingDetection;
    }
    if (smokeDetection != null) {
      $result.smokeDetection = smokeDetection;
    }
    if (faceDetection != null) {
      $result.faceDetection = faceDetection;
    }
    if (adminManagement != null) {
      $result.adminManagement = adminManagement;
    }
    if (optVerify != null) {
      $result.optVerify = optVerify;
    }
    if (serviceManagement != null) {
      $result.serviceManagement = serviceManagement;
    }
    if (forgotPassword != null) {
      $result.forgotPassword = forgotPassword;
    }
    if (registerForm != null) {
      $result.registerForm = registerForm;
    }
    if (playback != null) {
      $result.playback = playback;
    }
    if (notification != null) {
      $result.notification = notification;
    }
    if (emap != null) {
      $result.emap = emap;
    }
    if (userEditMdLog != null) {
      $result.userEditMdLog = userEditMdLog;
    }
    if (settingDefaultStorage != null) {
      $result.settingDefaultStorage = settingDefaultStorage;
    }
    if (useCamBox != null) {
      $result.useCamBox = useCamBox;
    }
    if (addRtspCam != null) {
      $result.addRtspCam = addRtspCam;
    }
    if (addOnvifCam != null) {
      $result.addOnvifCam = addOnvifCam;
    }
    if (alprDetection != null) {
      $result.alprDetection = alprDetection;
    }
    if (mailConfig != null) {
      $result.mailConfig = mailConfig;
    }
    if (scanOnvif != null) {
      $result.scanOnvif = scanOnvif;
    }
    if (vehicleManagement != null) {
      $result.vehicleManagement = vehicleManagement;
    }
    return $result;
  }
  License_profile._() : super();
  factory License_profile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory License_profile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'License_profile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<License_profile_ISON>(1, _omitFieldNames ? '' : 'iva', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(2, _omitFieldNames ? '' : 'motionDetection', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(3, _omitFieldNames ? '' : 'instrumentDetection', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(4, _omitFieldNames ? '' : 'lineCrossingDetection', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(5, _omitFieldNames ? '' : 'smokeDetection', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(6, _omitFieldNames ? '' : 'faceDetection', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(7, _omitFieldNames ? '' : 'adminManagement', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(8, _omitFieldNames ? '' : 'optVerify', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(9, _omitFieldNames ? '' : 'serviceManagement', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(10, _omitFieldNames ? '' : 'forgotPassword', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(11, _omitFieldNames ? '' : 'registerForm', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(12, _omitFieldNames ? '' : 'playback', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(13, _omitFieldNames ? '' : 'notification', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(14, _omitFieldNames ? '' : 'emap', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(15, _omitFieldNames ? '' : 'userEditMdLog', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(16, _omitFieldNames ? '' : 'settingDefaultStorage', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(17, _omitFieldNames ? '' : 'useCamBox', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(18, _omitFieldNames ? '' : 'addRtspCam', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(19, _omitFieldNames ? '' : 'addOnvifCam', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(20, _omitFieldNames ? '' : 'alprDetection', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(21, _omitFieldNames ? '' : 'mailConfig', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(22, _omitFieldNames ? '' : 'scanOnvif', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..e<License_profile_ISON>(23, _omitFieldNames ? '' : 'vehicleManagement', $pb.PbFieldType.OE, defaultOrMaker: License_profile_ISON.OFF, valueOf: License_profile_ISON.valueOf, enumValues: License_profile_ISON.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  License_profile clone() => License_profile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  License_profile copyWith(void Function(License_profile) updates) => super.copyWith((message) => updates(message as License_profile)) as License_profile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static License_profile create() => License_profile._();
  License_profile createEmptyInstance() => create();
  static $pb.PbList<License_profile> createRepeated() => $pb.PbList<License_profile>();
  @$core.pragma('dart2js:noInline')
  static License_profile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<License_profile>(create);
  static License_profile? _defaultInstance;

  @$pb.TagNumber(1)
  License_profile_ISON get iva => $_getN(0);
  @$pb.TagNumber(1)
  set iva(License_profile_ISON v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasIva() => $_has(0);
  @$pb.TagNumber(1)
  void clearIva() => clearField(1);

  @$pb.TagNumber(2)
  License_profile_ISON get motionDetection => $_getN(1);
  @$pb.TagNumber(2)
  set motionDetection(License_profile_ISON v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotionDetection() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotionDetection() => clearField(2);

  @$pb.TagNumber(3)
  License_profile_ISON get instrumentDetection => $_getN(2);
  @$pb.TagNumber(3)
  set instrumentDetection(License_profile_ISON v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasInstrumentDetection() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstrumentDetection() => clearField(3);

  @$pb.TagNumber(4)
  License_profile_ISON get lineCrossingDetection => $_getN(3);
  @$pb.TagNumber(4)
  set lineCrossingDetection(License_profile_ISON v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLineCrossingDetection() => $_has(3);
  @$pb.TagNumber(4)
  void clearLineCrossingDetection() => clearField(4);

  @$pb.TagNumber(5)
  License_profile_ISON get smokeDetection => $_getN(4);
  @$pb.TagNumber(5)
  set smokeDetection(License_profile_ISON v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSmokeDetection() => $_has(4);
  @$pb.TagNumber(5)
  void clearSmokeDetection() => clearField(5);

  @$pb.TagNumber(6)
  License_profile_ISON get faceDetection => $_getN(5);
  @$pb.TagNumber(6)
  set faceDetection(License_profile_ISON v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFaceDetection() => $_has(5);
  @$pb.TagNumber(6)
  void clearFaceDetection() => clearField(6);

  @$pb.TagNumber(7)
  License_profile_ISON get adminManagement => $_getN(6);
  @$pb.TagNumber(7)
  set adminManagement(License_profile_ISON v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAdminManagement() => $_has(6);
  @$pb.TagNumber(7)
  void clearAdminManagement() => clearField(7);

  @$pb.TagNumber(8)
  License_profile_ISON get optVerify => $_getN(7);
  @$pb.TagNumber(8)
  set optVerify(License_profile_ISON v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasOptVerify() => $_has(7);
  @$pb.TagNumber(8)
  void clearOptVerify() => clearField(8);

  @$pb.TagNumber(9)
  License_profile_ISON get serviceManagement => $_getN(8);
  @$pb.TagNumber(9)
  set serviceManagement(License_profile_ISON v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasServiceManagement() => $_has(8);
  @$pb.TagNumber(9)
  void clearServiceManagement() => clearField(9);

  @$pb.TagNumber(10)
  License_profile_ISON get forgotPassword => $_getN(9);
  @$pb.TagNumber(10)
  set forgotPassword(License_profile_ISON v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasForgotPassword() => $_has(9);
  @$pb.TagNumber(10)
  void clearForgotPassword() => clearField(10);

  @$pb.TagNumber(11)
  License_profile_ISON get registerForm => $_getN(10);
  @$pb.TagNumber(11)
  set registerForm(License_profile_ISON v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRegisterForm() => $_has(10);
  @$pb.TagNumber(11)
  void clearRegisterForm() => clearField(11);

  @$pb.TagNumber(12)
  License_profile_ISON get playback => $_getN(11);
  @$pb.TagNumber(12)
  set playback(License_profile_ISON v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasPlayback() => $_has(11);
  @$pb.TagNumber(12)
  void clearPlayback() => clearField(12);

  @$pb.TagNumber(13)
  License_profile_ISON get notification => $_getN(12);
  @$pb.TagNumber(13)
  set notification(License_profile_ISON v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasNotification() => $_has(12);
  @$pb.TagNumber(13)
  void clearNotification() => clearField(13);

  @$pb.TagNumber(14)
  License_profile_ISON get emap => $_getN(13);
  @$pb.TagNumber(14)
  set emap(License_profile_ISON v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasEmap() => $_has(13);
  @$pb.TagNumber(14)
  void clearEmap() => clearField(14);

  @$pb.TagNumber(15)
  License_profile_ISON get userEditMdLog => $_getN(14);
  @$pb.TagNumber(15)
  set userEditMdLog(License_profile_ISON v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasUserEditMdLog() => $_has(14);
  @$pb.TagNumber(15)
  void clearUserEditMdLog() => clearField(15);

  @$pb.TagNumber(16)
  License_profile_ISON get settingDefaultStorage => $_getN(15);
  @$pb.TagNumber(16)
  set settingDefaultStorage(License_profile_ISON v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasSettingDefaultStorage() => $_has(15);
  @$pb.TagNumber(16)
  void clearSettingDefaultStorage() => clearField(16);

  @$pb.TagNumber(17)
  License_profile_ISON get useCamBox => $_getN(16);
  @$pb.TagNumber(17)
  set useCamBox(License_profile_ISON v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasUseCamBox() => $_has(16);
  @$pb.TagNumber(17)
  void clearUseCamBox() => clearField(17);

  @$pb.TagNumber(18)
  License_profile_ISON get addRtspCam => $_getN(17);
  @$pb.TagNumber(18)
  set addRtspCam(License_profile_ISON v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasAddRtspCam() => $_has(17);
  @$pb.TagNumber(18)
  void clearAddRtspCam() => clearField(18);

  @$pb.TagNumber(19)
  License_profile_ISON get addOnvifCam => $_getN(18);
  @$pb.TagNumber(19)
  set addOnvifCam(License_profile_ISON v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasAddOnvifCam() => $_has(18);
  @$pb.TagNumber(19)
  void clearAddOnvifCam() => clearField(19);

  @$pb.TagNumber(20)
  License_profile_ISON get alprDetection => $_getN(19);
  @$pb.TagNumber(20)
  set alprDetection(License_profile_ISON v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasAlprDetection() => $_has(19);
  @$pb.TagNumber(20)
  void clearAlprDetection() => clearField(20);

  @$pb.TagNumber(21)
  License_profile_ISON get mailConfig => $_getN(20);
  @$pb.TagNumber(21)
  set mailConfig(License_profile_ISON v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasMailConfig() => $_has(20);
  @$pb.TagNumber(21)
  void clearMailConfig() => clearField(21);

  @$pb.TagNumber(22)
  License_profile_ISON get scanOnvif => $_getN(21);
  @$pb.TagNumber(22)
  set scanOnvif(License_profile_ISON v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasScanOnvif() => $_has(21);
  @$pb.TagNumber(22)
  void clearScanOnvif() => clearField(22);

  @$pb.TagNumber(23)
  License_profile_ISON get vehicleManagement => $_getN(22);
  @$pb.TagNumber(23)
  set vehicleManagement(License_profile_ISON v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasVehicleManagement() => $_has(22);
  @$pb.TagNumber(23)
  void clearVehicleManagement() => clearField(23);
}

class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? account,
    $core.String? emailAddress,
    $core.String? telNumber,
    $core.String? password,
    User_Status? status,
    $fixnum.Int64? lastUpdate,
    User_Type? type,
    $fixnum.Int64? createAt,
    $core.String? desc,
    $core.String? fullName,
    $core.List<$core.int>? id,
    $core.bool? changePassDenied,
    $core.bool? addCamDenied,
    $core.int? msgUnreadCount,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (emailAddress != null) {
      $result.emailAddress = emailAddress;
    }
    if (telNumber != null) {
      $result.telNumber = telNumber;
    }
    if (password != null) {
      $result.password = password;
    }
    if (status != null) {
      $result.status = status;
    }
    if (lastUpdate != null) {
      $result.lastUpdate = lastUpdate;
    }
    if (type != null) {
      $result.type = type;
    }
    if (createAt != null) {
      $result.createAt = createAt;
    }
    if (desc != null) {
      $result.desc = desc;
    }
    if (fullName != null) {
      $result.fullName = fullName;
    }
    if (id != null) {
      $result.id = id;
    }
    if (changePassDenied != null) {
      $result.changePassDenied = changePassDenied;
    }
    if (addCamDenied != null) {
      $result.addCamDenied = addCamDenied;
    }
    if (msgUnreadCount != null) {
      $result.msgUnreadCount = msgUnreadCount;
    }
    return $result;
  }
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'emailAddress')
    ..aOS(3, _omitFieldNames ? '' : 'telNumber')
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..e<User_Status>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: User_Status.INACTIVE, valueOf: User_Status.valueOf, enumValues: User_Status.values)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'lastUpdate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<User_Type>(7, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: User_Type.USER, valueOf: User_Type.valueOf, enumValues: User_Type.values)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'createAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(12, _omitFieldNames ? '' : 'desc')
    ..aOS(13, _omitFieldNames ? '' : 'fullName')
    ..a<$core.List<$core.int>>(14, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOB(15, _omitFieldNames ? '' : 'changePassDenied', protoName: 'changePassDenied')
    ..aOB(16, _omitFieldNames ? '' : 'addCamDenied', protoName: 'addCamDenied')
    ..a<$core.int>(17, _omitFieldNames ? '' : 'msgUnreadCount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get emailAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set emailAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmailAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmailAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get telNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set telNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTelNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearTelNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);

  @$pb.TagNumber(5)
  User_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(User_Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastUpdate => $_getI64(5);
  @$pb.TagNumber(6)
  set lastUpdate($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastUpdate() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdate() => clearField(6);

  @$pb.TagNumber(7)
  User_Type get type => $_getN(6);
  @$pb.TagNumber(7)
  set type(User_Type v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(9)
  $fixnum.Int64 get createAt => $_getI64(7);
  @$pb.TagNumber(9)
  set createAt($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreateAt() => $_has(7);
  @$pb.TagNumber(9)
  void clearCreateAt() => clearField(9);

  @$pb.TagNumber(12)
  $core.String get desc => $_getSZ(8);
  @$pb.TagNumber(12)
  set desc($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(12)
  $core.bool hasDesc() => $_has(8);
  @$pb.TagNumber(12)
  void clearDesc() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get fullName => $_getSZ(9);
  @$pb.TagNumber(13)
  set fullName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(13)
  $core.bool hasFullName() => $_has(9);
  @$pb.TagNumber(13)
  void clearFullName() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$core.int> get id => $_getN(10);
  @$pb.TagNumber(14)
  set id($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(14)
  $core.bool hasId() => $_has(10);
  @$pb.TagNumber(14)
  void clearId() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get changePassDenied => $_getBF(11);
  @$pb.TagNumber(15)
  set changePassDenied($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(15)
  $core.bool hasChangePassDenied() => $_has(11);
  @$pb.TagNumber(15)
  void clearChangePassDenied() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get addCamDenied => $_getBF(12);
  @$pb.TagNumber(16)
  set addCamDenied($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(16)
  $core.bool hasAddCamDenied() => $_has(12);
  @$pb.TagNumber(16)
  void clearAddCamDenied() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get msgUnreadCount => $_getIZ(13);
  @$pb.TagNumber(17)
  set msgUnreadCount($core.int v) { $_setUnsignedInt32(13, v); }
  @$pb.TagNumber(17)
  $core.bool hasMsgUnreadCount() => $_has(13);
  @$pb.TagNumber(17)
  void clearMsgUnreadCount() => clearField(17);
}

class RtspServerSetting extends $pb.GeneratedMessage {
  factory RtspServerSetting({
    $core.int? maxCamera,
    $core.int? currentCamera,
    $core.String? serverHost,
    $core.String? serverLocalHost,
    $core.int? serverPort,
    $core.String? publicUser,
    $core.String? publicPass,
    $core.String? readUser,
    $core.String? readPass,
    $core.String? svName,
  }) {
    final $result = create();
    if (maxCamera != null) {
      $result.maxCamera = maxCamera;
    }
    if (currentCamera != null) {
      $result.currentCamera = currentCamera;
    }
    if (serverHost != null) {
      $result.serverHost = serverHost;
    }
    if (serverLocalHost != null) {
      $result.serverLocalHost = serverLocalHost;
    }
    if (serverPort != null) {
      $result.serverPort = serverPort;
    }
    if (publicUser != null) {
      $result.publicUser = publicUser;
    }
    if (publicPass != null) {
      $result.publicPass = publicPass;
    }
    if (readUser != null) {
      $result.readUser = readUser;
    }
    if (readPass != null) {
      $result.readPass = readPass;
    }
    if (svName != null) {
      $result.svName = svName;
    }
    return $result;
  }
  RtspServerSetting._() : super();
  factory RtspServerSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RtspServerSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RtspServerSetting', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'maxCamera', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'currentCamera', $pb.PbFieldType.OU3, protoName: 'current_Camera')
    ..aOS(3, _omitFieldNames ? '' : 'serverHost')
    ..aOS(4, _omitFieldNames ? '' : 'serverLocalHost')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'serverPort', $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'publicUser')
    ..aOS(7, _omitFieldNames ? '' : 'publicPass')
    ..aOS(8, _omitFieldNames ? '' : 'readUser')
    ..aOS(9, _omitFieldNames ? '' : 'readPass')
    ..aOS(10, _omitFieldNames ? '' : 'svName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RtspServerSetting clone() => RtspServerSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RtspServerSetting copyWith(void Function(RtspServerSetting) updates) => super.copyWith((message) => updates(message as RtspServerSetting)) as RtspServerSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtspServerSetting create() => RtspServerSetting._();
  RtspServerSetting createEmptyInstance() => create();
  static $pb.PbList<RtspServerSetting> createRepeated() => $pb.PbList<RtspServerSetting>();
  @$core.pragma('dart2js:noInline')
  static RtspServerSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RtspServerSetting>(create);
  static RtspServerSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxCamera => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxCamera($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxCamera() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentCamera => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentCamera($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentCamera() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentCamera() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serverHost => $_getSZ(2);
  @$pb.TagNumber(3)
  set serverHost($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServerHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerHost() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get serverLocalHost => $_getSZ(3);
  @$pb.TagNumber(4)
  set serverLocalHost($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServerLocalHost() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerLocalHost() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get serverPort => $_getIZ(4);
  @$pb.TagNumber(5)
  set serverPort($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasServerPort() => $_has(4);
  @$pb.TagNumber(5)
  void clearServerPort() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get publicUser => $_getSZ(5);
  @$pb.TagNumber(6)
  set publicUser($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPublicUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublicUser() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get publicPass => $_getSZ(6);
  @$pb.TagNumber(7)
  set publicPass($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPublicPass() => $_has(6);
  @$pb.TagNumber(7)
  void clearPublicPass() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get readUser => $_getSZ(7);
  @$pb.TagNumber(8)
  set readUser($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasReadUser() => $_has(7);
  @$pb.TagNumber(8)
  void clearReadUser() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get readPass => $_getSZ(8);
  @$pb.TagNumber(9)
  set readPass($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasReadPass() => $_has(8);
  @$pb.TagNumber(9)
  void clearReadPass() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get svName => $_getSZ(9);
  @$pb.TagNumber(10)
  set svName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSvName() => $_has(9);
  @$pb.TagNumber(10)
  void clearSvName() => clearField(10);
}

/// / CR010
class NotificationMsg extends $pb.GeneratedMessage {
  factory NotificationMsg({
    $core.List<$core.int>? msgId,
    $core.String? titleMsg,
    $core.String? shortDes,
    $core.String? des,
    $core.bool? isRead,
    $fixnum.Int64? time,
    NotificationMsg_MsgType? msgType,
    $0.Any? data,
  }) {
    final $result = create();
    if (msgId != null) {
      $result.msgId = msgId;
    }
    if (titleMsg != null) {
      $result.titleMsg = titleMsg;
    }
    if (shortDes != null) {
      $result.shortDes = shortDes;
    }
    if (des != null) {
      $result.des = des;
    }
    if (isRead != null) {
      $result.isRead = isRead;
    }
    if (time != null) {
      $result.time = time;
    }
    if (msgType != null) {
      $result.msgType = msgType;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  NotificationMsg._() : super();
  factory NotificationMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationMsg', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'msgId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'titleMsg')
    ..aOS(3, _omitFieldNames ? '' : 'shortDes')
    ..aOS(4, _omitFieldNames ? '' : 'des')
    ..aOB(5, _omitFieldNames ? '' : 'isRead', protoName: 'isRead')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<NotificationMsg_MsgType>(7, _omitFieldNames ? '' : 'msgType', $pb.PbFieldType.OE, protoName: 'msgType', defaultOrMaker: NotificationMsg_MsgType.GENERIC, valueOf: NotificationMsg_MsgType.valueOf, enumValues: NotificationMsg_MsgType.values)
    ..aOM<$0.Any>(8, _omitFieldNames ? '' : 'data', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationMsg clone() => NotificationMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationMsg copyWith(void Function(NotificationMsg) updates) => super.copyWith((message) => updates(message as NotificationMsg)) as NotificationMsg;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationMsg create() => NotificationMsg._();
  NotificationMsg createEmptyInstance() => create();
  static $pb.PbList<NotificationMsg> createRepeated() => $pb.PbList<NotificationMsg>();
  @$core.pragma('dart2js:noInline')
  static NotificationMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationMsg>(create);
  static NotificationMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get msgId => $_getN(0);
  @$pb.TagNumber(1)
  set msgId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get titleMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set titleMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitleMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitleMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get shortDes => $_getSZ(2);
  @$pb.TagNumber(3)
  set shortDes($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShortDes() => $_has(2);
  @$pb.TagNumber(3)
  void clearShortDes() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get des => $_getSZ(3);
  @$pb.TagNumber(4)
  set des($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDes() => $_has(3);
  @$pb.TagNumber(4)
  void clearDes() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRead => $_getBF(4);
  @$pb.TagNumber(5)
  set isRead($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRead() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRead() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get time => $_getI64(5);
  @$pb.TagNumber(6)
  set time($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTime() => clearField(6);

  @$pb.TagNumber(7)
  NotificationMsg_MsgType get msgType => $_getN(6);
  @$pb.TagNumber(7)
  set msgType(NotificationMsg_MsgType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMsgType() => $_has(6);
  @$pb.TagNumber(7)
  void clearMsgType() => clearField(7);

  @$pb.TagNumber(8)
  $0.Any get data => $_getN(7);
  @$pb.TagNumber(8)
  set data($0.Any v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasData() => $_has(7);
  @$pb.TagNumber(8)
  void clearData() => clearField(8);
  @$pb.TagNumber(8)
  $0.Any ensureData() => $_ensure(7);
}

class SDCardFiles_File extends $pb.GeneratedMessage {
  factory SDCardFiles_File({
    $core.int? videoFileTime,
    $core.String? fileName,
    $core.int? playTotalTime,
  }) {
    final $result = create();
    if (videoFileTime != null) {
      $result.videoFileTime = videoFileTime;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (playTotalTime != null) {
      $result.playTotalTime = playTotalTime;
    }
    return $result;
  }
  SDCardFiles_File._() : super();
  factory SDCardFiles_File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SDCardFiles_File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SDCardFiles.File', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'videoFileTime', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'playTotalTime', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SDCardFiles_File clone() => SDCardFiles_File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SDCardFiles_File copyWith(void Function(SDCardFiles_File) updates) => super.copyWith((message) => updates(message as SDCardFiles_File)) as SDCardFiles_File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SDCardFiles_File create() => SDCardFiles_File._();
  SDCardFiles_File createEmptyInstance() => create();
  static $pb.PbList<SDCardFiles_File> createRepeated() => $pb.PbList<SDCardFiles_File>();
  @$core.pragma('dart2js:noInline')
  static SDCardFiles_File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SDCardFiles_File>(create);
  static SDCardFiles_File? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get videoFileTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set videoFileTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVideoFileTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearVideoFileTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get playTotalTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set playTotalTime($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayTotalTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayTotalTime() => clearField(3);
}

class SDCardFiles extends $pb.GeneratedMessage {
  factory SDCardFiles({
    $core.bool? isEnd,
    $core.Iterable<SDCardFiles_File>? files,
  }) {
    final $result = create();
    if (isEnd != null) {
      $result.isEnd = isEnd;
    }
    if (files != null) {
      $result.files.addAll(files);
    }
    return $result;
  }
  SDCardFiles._() : super();
  factory SDCardFiles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SDCardFiles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SDCardFiles', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnd', protoName: 'isEnd')
    ..pc<SDCardFiles_File>(2, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: SDCardFiles_File.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SDCardFiles clone() => SDCardFiles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SDCardFiles copyWith(void Function(SDCardFiles) updates) => super.copyWith((message) => updates(message as SDCardFiles)) as SDCardFiles;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SDCardFiles create() => SDCardFiles._();
  SDCardFiles createEmptyInstance() => create();
  static $pb.PbList<SDCardFiles> createRepeated() => $pb.PbList<SDCardFiles>();
  @$core.pragma('dart2js:noInline')
  static SDCardFiles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SDCardFiles>(create);
  static SDCardFiles? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnd => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnd($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnd() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SDCardFiles_File> get files => $_getList(1);
}

class ConfigBarrier extends $pb.GeneratedMessage {
  factory ConfigBarrier({
    $core.bool? on,
    $core.String? startTime,
    $core.String? endTime,
    $core.int? parkingLots,
    $core.int? usedLots,
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
    if (parkingLots != null) {
      $result.parkingLots = parkingLots;
    }
    if (usedLots != null) {
      $result.usedLots = usedLots;
    }
    return $result;
  }
  ConfigBarrier._() : super();
  factory ConfigBarrier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigBarrier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigBarrier', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOS(2, _omitFieldNames ? '' : 'startTime')
    ..aOS(3, _omitFieldNames ? '' : 'endTime')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'parkingLots', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'usedLots', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigBarrier clone() => ConfigBarrier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigBarrier copyWith(void Function(ConfigBarrier) updates) => super.copyWith((message) => updates(message as ConfigBarrier)) as ConfigBarrier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigBarrier create() => ConfigBarrier._();
  ConfigBarrier createEmptyInstance() => create();
  static $pb.PbList<ConfigBarrier> createRepeated() => $pb.PbList<ConfigBarrier>();
  @$core.pragma('dart2js:noInline')
  static ConfigBarrier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigBarrier>(create);
  static ConfigBarrier? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get parkingLots => $_getIZ(3);
  @$pb.TagNumber(4)
  set parkingLots($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParkingLots() => $_has(3);
  @$pb.TagNumber(4)
  void clearParkingLots() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get usedLots => $_getIZ(4);
  @$pb.TagNumber(5)
  set usedLots($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUsedLots() => $_has(4);
  @$pb.TagNumber(5)
  void clearUsedLots() => clearField(5);
}

class InOutCam extends $pb.GeneratedMessage {
  factory InOutCam({
    $core.List<$core.int>? in_1,
    $core.List<$core.int>? out,
    InOutCam_VehicleType? type,
  }) {
    final $result = create();
    if (in_1 != null) {
      $result.in_1 = in_1;
    }
    if (out != null) {
      $result.out = out;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  InOutCam._() : super();
  factory InOutCam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InOutCam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InOutCam', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'in', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'out', $pb.PbFieldType.OY)
    ..e<InOutCam_VehicleType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: InOutCam_VehicleType.CAR, valueOf: InOutCam_VehicleType.valueOf, enumValues: InOutCam_VehicleType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InOutCam clone() => InOutCam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InOutCam copyWith(void Function(InOutCam) updates) => super.copyWith((message) => updates(message as InOutCam)) as InOutCam;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InOutCam create() => InOutCam._();
  InOutCam createEmptyInstance() => create();
  static $pb.PbList<InOutCam> createRepeated() => $pb.PbList<InOutCam>();
  @$core.pragma('dart2js:noInline')
  static InOutCam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InOutCam>(create);
  static InOutCam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get in_1 => $_getN(0);
  @$pb.TagNumber(1)
  set in_1($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIn_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearIn_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get out => $_getN(1);
  @$pb.TagNumber(2)
  set out($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearOut() => clearField(2);

  @$pb.TagNumber(3)
  InOutCam_VehicleType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(InOutCam_VehicleType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class CamTag extends $pb.GeneratedMessage {
  factory CamTag({
    $core.List<$core.int>? tagId,
    $core.String? tagName,
    $core.String? tagColor,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (tagName != null) {
      $result.tagName = tagName;
    }
    if (tagColor != null) {
      $result.tagColor = tagColor;
    }
    return $result;
  }
  CamTag._() : super();
  factory CamTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CamTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CamTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'tagName')
    ..aOS(3, _omitFieldNames ? '' : 'tagColor')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CamTag clone() => CamTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CamTag copyWith(void Function(CamTag) updates) => super.copyWith((message) => updates(message as CamTag)) as CamTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CamTag create() => CamTag._();
  CamTag createEmptyInstance() => create();
  static $pb.PbList<CamTag> createRepeated() => $pb.PbList<CamTag>();
  @$core.pragma('dart2js:noInline')
  static CamTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CamTag>(create);
  static CamTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get tagId => $_getN(0);
  @$pb.TagNumber(1)
  set tagId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tagColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagColor($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTagColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagColor() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
