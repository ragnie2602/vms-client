//
//  Generated code. Do not modify.
//  source: comm.command2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'comm.command2.pbenum.dart';
import 'comm.model.pb.dart' as $1;
import 'comm.model.pbenum.dart' as $1;

export 'comm.command2.pbenum.dart';

class ListAlarm_Request extends $pb.GeneratedMessage {
  factory ListAlarm_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? lastId,
    $core.int? count,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (lastId != null) {
      $result.lastId = lastId;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  ListAlarm_Request._() : super();
  factory ListAlarm_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAlarm_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAlarm.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAlarm_Request clone() => ListAlarm_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAlarm_Request copyWith(void Function(ListAlarm_Request) updates) => super.copyWith((message) => updates(message as ListAlarm_Request)) as ListAlarm_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAlarm_Request create() => ListAlarm_Request._();
  ListAlarm_Request createEmptyInstance() => create();
  static $pb.PbList<ListAlarm_Request> createRepeated() => $pb.PbList<ListAlarm_Request>();
  @$core.pragma('dart2js:noInline')
  static ListAlarm_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAlarm_Request>(create);
  static ListAlarm_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get lastId => $_getN(1);
  @$pb.TagNumber(2)
  set lastId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class ListAlarm_Reply extends $pb.GeneratedMessage {
  factory ListAlarm_Reply({
    $core.Iterable<$1.Alarm>? alarms,
    $core.bool? end,
  }) {
    final $result = create();
    if (alarms != null) {
      $result.alarms.addAll(alarms);
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  ListAlarm_Reply._() : super();
  factory ListAlarm_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAlarm_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAlarm.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Alarm>(1, _omitFieldNames ? '' : 'alarms', $pb.PbFieldType.PM, subBuilder: $1.Alarm.create)
    ..aOB(2, _omitFieldNames ? '' : 'end')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAlarm_Reply clone() => ListAlarm_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAlarm_Reply copyWith(void Function(ListAlarm_Reply) updates) => super.copyWith((message) => updates(message as ListAlarm_Reply)) as ListAlarm_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAlarm_Reply create() => ListAlarm_Reply._();
  ListAlarm_Reply createEmptyInstance() => create();
  static $pb.PbList<ListAlarm_Reply> createRepeated() => $pb.PbList<ListAlarm_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListAlarm_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAlarm_Reply>(create);
  static ListAlarm_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Alarm> get alarms => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get end => $_getBF(1);
  @$pb.TagNumber(2)
  set end($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
}

/// -------------NHOM CHUC NANG QUAN LY SU KIEN---------------
class ListAlarm extends $pb.GeneratedMessage {
  factory ListAlarm({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListAlarm._() : super();
  factory ListAlarm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAlarm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAlarm', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(159, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAlarm clone() => ListAlarm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAlarm copyWith(void Function(ListAlarm) updates) => super.copyWith((message) => updates(message as ListAlarm)) as ListAlarm;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAlarm create() => ListAlarm._();
  ListAlarm createEmptyInstance() => create();
  static $pb.PbList<ListAlarm> createRepeated() => $pb.PbList<ListAlarm>();
  @$core.pragma('dart2js:noInline')
  static ListAlarm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAlarm>(create);
  static ListAlarm? _defaultInstance;

  @$pb.TagNumber(159)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(159)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(159)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(159)
  void clearID() => clearField(159);
}

class DeleteAlarmCamera_Request extends $pb.GeneratedMessage {
  factory DeleteAlarmCamera_Request({
    $core.List<$core.int>? cameraId,
    $core.Iterable<$core.List<$core.int>>? alarms,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (alarms != null) {
      $result.alarms.addAll(alarms);
    }
    return $result;
  }
  DeleteAlarmCamera_Request._() : super();
  factory DeleteAlarmCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAlarmCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAlarmCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'alarms', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAlarmCamera_Request clone() => DeleteAlarmCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAlarmCamera_Request copyWith(void Function(DeleteAlarmCamera_Request) updates) => super.copyWith((message) => updates(message as DeleteAlarmCamera_Request)) as DeleteAlarmCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAlarmCamera_Request create() => DeleteAlarmCamera_Request._();
  DeleteAlarmCamera_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteAlarmCamera_Request> createRepeated() => $pb.PbList<DeleteAlarmCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteAlarmCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAlarmCamera_Request>(create);
  static DeleteAlarmCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get alarms => $_getList(1);
}

class DeleteAlarmCamera_Reply extends $pb.GeneratedMessage {
  factory DeleteAlarmCamera_Reply({
    $core.Iterable<$core.List<$core.int>>? alarms,
  }) {
    final $result = create();
    if (alarms != null) {
      $result.alarms.addAll(alarms);
    }
    return $result;
  }
  DeleteAlarmCamera_Reply._() : super();
  factory DeleteAlarmCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAlarmCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAlarmCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'alarms', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAlarmCamera_Reply clone() => DeleteAlarmCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAlarmCamera_Reply copyWith(void Function(DeleteAlarmCamera_Reply) updates) => super.copyWith((message) => updates(message as DeleteAlarmCamera_Reply)) as DeleteAlarmCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAlarmCamera_Reply create() => DeleteAlarmCamera_Reply._();
  DeleteAlarmCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteAlarmCamera_Reply> createRepeated() => $pb.PbList<DeleteAlarmCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteAlarmCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAlarmCamera_Reply>(create);
  static DeleteAlarmCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get alarms => $_getList(0);
}

class DeleteAlarmCamera extends $pb.GeneratedMessage {
  factory DeleteAlarmCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteAlarmCamera._() : super();
  factory DeleteAlarmCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAlarmCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAlarmCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(160, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAlarmCamera clone() => DeleteAlarmCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAlarmCamera copyWith(void Function(DeleteAlarmCamera) updates) => super.copyWith((message) => updates(message as DeleteAlarmCamera)) as DeleteAlarmCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAlarmCamera create() => DeleteAlarmCamera._();
  DeleteAlarmCamera createEmptyInstance() => create();
  static $pb.PbList<DeleteAlarmCamera> createRepeated() => $pb.PbList<DeleteAlarmCamera>();
  @$core.pragma('dart2js:noInline')
  static DeleteAlarmCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAlarmCamera>(create);
  static DeleteAlarmCamera? _defaultInstance;

  @$pb.TagNumber(160)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(160)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(160)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(160)
  void clearID() => clearField(160);
}

class FilterAlarmCamera_Request extends $pb.GeneratedMessage {
  factory FilterAlarmCamera_Request({
    $fixnum.Int64? fromDate,
    $fixnum.Int64? toDate,
    $core.Iterable<$core.List<$core.int>>? cameras,
    FilterAlarmCamera_Type? type,
    $core.List<$core.int>? lastId,
    $core.int? count,
  }) {
    final $result = create();
    if (fromDate != null) {
      $result.fromDate = fromDate;
    }
    if (toDate != null) {
      $result.toDate = toDate;
    }
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    if (type != null) {
      $result.type = type;
    }
    if (lastId != null) {
      $result.lastId = lastId;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  FilterAlarmCamera_Request._() : super();
  factory FilterAlarmCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterAlarmCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterAlarmCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'fromDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'toDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PY)
    ..e<FilterAlarmCamera_Type>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: FilterAlarmCamera_Type.DETECT_MOTION, valueOf: FilterAlarmCamera_Type.valueOf, enumValues: FilterAlarmCamera_Type.values)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.OY)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterAlarmCamera_Request clone() => FilterAlarmCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterAlarmCamera_Request copyWith(void Function(FilterAlarmCamera_Request) updates) => super.copyWith((message) => updates(message as FilterAlarmCamera_Request)) as FilterAlarmCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterAlarmCamera_Request create() => FilterAlarmCamera_Request._();
  FilterAlarmCamera_Request createEmptyInstance() => create();
  static $pb.PbList<FilterAlarmCamera_Request> createRepeated() => $pb.PbList<FilterAlarmCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static FilterAlarmCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterAlarmCamera_Request>(create);
  static FilterAlarmCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fromDate => $_getI64(0);
  @$pb.TagNumber(1)
  set fromDate($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromDate() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toDate => $_getI64(1);
  @$pb.TagNumber(2)
  set toDate($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearToDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get cameras => $_getList(2);

  @$pb.TagNumber(4)
  FilterAlarmCamera_Type get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(FilterAlarmCamera_Type v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get lastId => $_getN(4);
  @$pb.TagNumber(5)
  set lastId($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastId() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => clearField(6);
}

class FilterAlarmCamera_Reply extends $pb.GeneratedMessage {
  factory FilterAlarmCamera_Reply({
    $core.Iterable<$1.Alarm>? alarms,
    $core.bool? end,
  }) {
    final $result = create();
    if (alarms != null) {
      $result.alarms.addAll(alarms);
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  FilterAlarmCamera_Reply._() : super();
  factory FilterAlarmCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterAlarmCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterAlarmCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Alarm>(1, _omitFieldNames ? '' : 'alarms', $pb.PbFieldType.PM, subBuilder: $1.Alarm.create)
    ..aOB(2, _omitFieldNames ? '' : 'end')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterAlarmCamera_Reply clone() => FilterAlarmCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterAlarmCamera_Reply copyWith(void Function(FilterAlarmCamera_Reply) updates) => super.copyWith((message) => updates(message as FilterAlarmCamera_Reply)) as FilterAlarmCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterAlarmCamera_Reply create() => FilterAlarmCamera_Reply._();
  FilterAlarmCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<FilterAlarmCamera_Reply> createRepeated() => $pb.PbList<FilterAlarmCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static FilterAlarmCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterAlarmCamera_Reply>(create);
  static FilterAlarmCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Alarm> get alarms => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get end => $_getBF(1);
  @$pb.TagNumber(2)
  set end($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
}

class FilterAlarmCamera extends $pb.GeneratedMessage {
  factory FilterAlarmCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  FilterAlarmCamera._() : super();
  factory FilterAlarmCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterAlarmCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterAlarmCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(161, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterAlarmCamera clone() => FilterAlarmCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterAlarmCamera copyWith(void Function(FilterAlarmCamera) updates) => super.copyWith((message) => updates(message as FilterAlarmCamera)) as FilterAlarmCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterAlarmCamera create() => FilterAlarmCamera._();
  FilterAlarmCamera createEmptyInstance() => create();
  static $pb.PbList<FilterAlarmCamera> createRepeated() => $pb.PbList<FilterAlarmCamera>();
  @$core.pragma('dart2js:noInline')
  static FilterAlarmCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterAlarmCamera>(create);
  static FilterAlarmCamera? _defaultInstance;

  @$pb.TagNumber(161)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(161)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(161)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(161)
  void clearID() => clearField(161);
}

class FilterVideoImageCamera_Request extends $pb.GeneratedMessage {
  factory FilterVideoImageCamera_Request({
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? fromDate,
    $fixnum.Int64? toDate,
    FilterVideoImageCamera_Type? type,
    FilterVideoImageCamera_Storage? storage,
    $core.String? fileId,
    $core.int? count,
    $core.List<$core.int>? lastId,
    $1.EventType? eventType,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (fromDate != null) {
      $result.fromDate = fromDate;
    }
    if (toDate != null) {
      $result.toDate = toDate;
    }
    if (type != null) {
      $result.type = type;
    }
    if (storage != null) {
      $result.storage = storage;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (count != null) {
      $result.count = count;
    }
    if (lastId != null) {
      $result.lastId = lastId;
    }
    if (eventType != null) {
      $result.eventType = eventType;
    }
    return $result;
  }
  FilterVideoImageCamera_Request._() : super();
  factory FilterVideoImageCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterVideoImageCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterVideoImageCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'fromDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'toDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<FilterVideoImageCamera_Type>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: FilterVideoImageCamera_Type.VIDEO, valueOf: FilterVideoImageCamera_Type.valueOf, enumValues: FilterVideoImageCamera_Type.values)
    ..e<FilterVideoImageCamera_Storage>(5, _omitFieldNames ? '' : 'storage', $pb.PbFieldType.OE, defaultOrMaker: FilterVideoImageCamera_Storage.CLOUD_STORAGE, valueOf: FilterVideoImageCamera_Storage.valueOf, enumValues: FilterVideoImageCamera_Storage.values)
    ..aOS(6, _omitFieldNames ? '' : 'fileId')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.OY)
    ..e<$1.EventType>(9, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: $1.EventType.MOTION_DETECTION, valueOf: $1.EventType.valueOf, enumValues: $1.EventType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterVideoImageCamera_Request clone() => FilterVideoImageCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterVideoImageCamera_Request copyWith(void Function(FilterVideoImageCamera_Request) updates) => super.copyWith((message) => updates(message as FilterVideoImageCamera_Request)) as FilterVideoImageCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterVideoImageCamera_Request create() => FilterVideoImageCamera_Request._();
  FilterVideoImageCamera_Request createEmptyInstance() => create();
  static $pb.PbList<FilterVideoImageCamera_Request> createRepeated() => $pb.PbList<FilterVideoImageCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static FilterVideoImageCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterVideoImageCamera_Request>(create);
  static FilterVideoImageCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fromDate => $_getI64(1);
  @$pb.TagNumber(2)
  set fromDate($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromDate() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get toDate => $_getI64(2);
  @$pb.TagNumber(3)
  set toDate($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearToDate() => clearField(3);

  @$pb.TagNumber(4)
  FilterVideoImageCamera_Type get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(FilterVideoImageCamera_Type v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  FilterVideoImageCamera_Storage get storage => $_getN(4);
  @$pb.TagNumber(5)
  set storage(FilterVideoImageCamera_Storage v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStorage() => $_has(4);
  @$pb.TagNumber(5)
  void clearStorage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileId => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get count => $_getIZ(6);
  @$pb.TagNumber(7)
  set count($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get lastId => $_getN(7);
  @$pb.TagNumber(8)
  set lastId($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastId() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastId() => clearField(8);

  @$pb.TagNumber(9)
  $1.EventType get eventType => $_getN(8);
  @$pb.TagNumber(9)
  set eventType($1.EventType v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEventType() => $_has(8);
  @$pb.TagNumber(9)
  void clearEventType() => clearField(9);
}

class FilterVideoImageCamera_Reply extends $pb.GeneratedMessage {
  factory FilterVideoImageCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  FilterVideoImageCamera_Reply._() : super();
  factory FilterVideoImageCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterVideoImageCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterVideoImageCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterVideoImageCamera_Reply clone() => FilterVideoImageCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterVideoImageCamera_Reply copyWith(void Function(FilterVideoImageCamera_Reply) updates) => super.copyWith((message) => updates(message as FilterVideoImageCamera_Reply)) as FilterVideoImageCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterVideoImageCamera_Reply create() => FilterVideoImageCamera_Reply._();
  FilterVideoImageCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<FilterVideoImageCamera_Reply> createRepeated() => $pb.PbList<FilterVideoImageCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static FilterVideoImageCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterVideoImageCamera_Reply>(create);
  static FilterVideoImageCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class FilterVideoImageCamera extends $pb.GeneratedMessage {
  factory FilterVideoImageCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  FilterVideoImageCamera._() : super();
  factory FilterVideoImageCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterVideoImageCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterVideoImageCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(163, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterVideoImageCamera clone() => FilterVideoImageCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterVideoImageCamera copyWith(void Function(FilterVideoImageCamera) updates) => super.copyWith((message) => updates(message as FilterVideoImageCamera)) as FilterVideoImageCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterVideoImageCamera create() => FilterVideoImageCamera._();
  FilterVideoImageCamera createEmptyInstance() => create();
  static $pb.PbList<FilterVideoImageCamera> createRepeated() => $pb.PbList<FilterVideoImageCamera>();
  @$core.pragma('dart2js:noInline')
  static FilterVideoImageCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterVideoImageCamera>(create);
  static FilterVideoImageCamera? _defaultInstance;

  @$pb.TagNumber(163)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(163)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(163)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(163)
  void clearID() => clearField(163);
}

class GetConfigCamera_Request extends $pb.GeneratedMessage {
  factory GetConfigCamera_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  GetConfigCamera_Request._() : super();
  factory GetConfigCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConfigCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetConfigCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConfigCamera_Request clone() => GetConfigCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConfigCamera_Request copyWith(void Function(GetConfigCamera_Request) updates) => super.copyWith((message) => updates(message as GetConfigCamera_Request)) as GetConfigCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConfigCamera_Request create() => GetConfigCamera_Request._();
  GetConfigCamera_Request createEmptyInstance() => create();
  static $pb.PbList<GetConfigCamera_Request> createRepeated() => $pb.PbList<GetConfigCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static GetConfigCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConfigCamera_Request>(create);
  static GetConfigCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class GetConfigCamera_Reply extends $pb.GeneratedMessage {
  factory GetConfigCamera_Reply({
    $1.CameraConfig? config,
  }) {
    final $result = create();
    if (config != null) {
      $result.config = config;
    }
    return $result;
  }
  GetConfigCamera_Reply._() : super();
  factory GetConfigCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConfigCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetConfigCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CameraConfig>(1, _omitFieldNames ? '' : 'config', subBuilder: $1.CameraConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConfigCamera_Reply clone() => GetConfigCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConfigCamera_Reply copyWith(void Function(GetConfigCamera_Reply) updates) => super.copyWith((message) => updates(message as GetConfigCamera_Reply)) as GetConfigCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConfigCamera_Reply create() => GetConfigCamera_Reply._();
  GetConfigCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<GetConfigCamera_Reply> createRepeated() => $pb.PbList<GetConfigCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetConfigCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConfigCamera_Reply>(create);
  static GetConfigCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CameraConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config($1.CameraConfig v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  $1.CameraConfig ensureConfig() => $_ensure(0);
}

class GetConfigCamera extends $pb.GeneratedMessage {
  factory GetConfigCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetConfigCamera._() : super();
  factory GetConfigCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConfigCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetConfigCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(173, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConfigCamera clone() => GetConfigCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConfigCamera copyWith(void Function(GetConfigCamera) updates) => super.copyWith((message) => updates(message as GetConfigCamera)) as GetConfigCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConfigCamera create() => GetConfigCamera._();
  GetConfigCamera createEmptyInstance() => create();
  static $pb.PbList<GetConfigCamera> createRepeated() => $pb.PbList<GetConfigCamera>();
  @$core.pragma('dart2js:noInline')
  static GetConfigCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConfigCamera>(create);
  static GetConfigCamera? _defaultInstance;

  @$pb.TagNumber(173)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(173)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(173)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(173)
  void clearID() => clearField(173);
}

class ResponseShareCamera_Request extends $pb.GeneratedMessage {
  factory ResponseShareCamera_Request({
    ResponseShareCamera_Action? action,
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
  ResponseShareCamera_Request._() : super();
  factory ResponseShareCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseShareCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseShareCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<ResponseShareCamera_Action>(1, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: ResponseShareCamera_Action.ACCEPT, valueOf: ResponseShareCamera_Action.valueOf, enumValues: ResponseShareCamera_Action.values)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseShareCamera_Request clone() => ResponseShareCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseShareCamera_Request copyWith(void Function(ResponseShareCamera_Request) updates) => super.copyWith((message) => updates(message as ResponseShareCamera_Request)) as ResponseShareCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseShareCamera_Request create() => ResponseShareCamera_Request._();
  ResponseShareCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ResponseShareCamera_Request> createRepeated() => $pb.PbList<ResponseShareCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ResponseShareCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseShareCamera_Request>(create);
  static ResponseShareCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  ResponseShareCamera_Action get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(ResponseShareCamera_Action v) { setField(1, v); }
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
}

class ResponseShareCamera_Reply extends $pb.GeneratedMessage {
  factory ResponseShareCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ResponseShareCamera_Reply._() : super();
  factory ResponseShareCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseShareCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseShareCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseShareCamera_Reply clone() => ResponseShareCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseShareCamera_Reply copyWith(void Function(ResponseShareCamera_Reply) updates) => super.copyWith((message) => updates(message as ResponseShareCamera_Reply)) as ResponseShareCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseShareCamera_Reply create() => ResponseShareCamera_Reply._();
  ResponseShareCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ResponseShareCamera_Reply> createRepeated() => $pb.PbList<ResponseShareCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ResponseShareCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseShareCamera_Reply>(create);
  static ResponseShareCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ResponseShareCamera extends $pb.GeneratedMessage {
  factory ResponseShareCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ResponseShareCamera._() : super();
  factory ResponseShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(176, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseShareCamera clone() => ResponseShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseShareCamera copyWith(void Function(ResponseShareCamera) updates) => super.copyWith((message) => updates(message as ResponseShareCamera)) as ResponseShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseShareCamera create() => ResponseShareCamera._();
  ResponseShareCamera createEmptyInstance() => create();
  static $pb.PbList<ResponseShareCamera> createRepeated() => $pb.PbList<ResponseShareCamera>();
  @$core.pragma('dart2js:noInline')
  static ResponseShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseShareCamera>(create);
  static ResponseShareCamera? _defaultInstance;

  @$pb.TagNumber(176)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(176)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(176)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(176)
  void clearID() => clearField(176);
}

class ListShareCamera_Request extends $pb.GeneratedMessage {
  factory ListShareCamera_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ListShareCamera_Request._() : super();
  factory ListShareCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListShareCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListShareCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListShareCamera_Request clone() => ListShareCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListShareCamera_Request copyWith(void Function(ListShareCamera_Request) updates) => super.copyWith((message) => updates(message as ListShareCamera_Request)) as ListShareCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShareCamera_Request create() => ListShareCamera_Request._();
  ListShareCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ListShareCamera_Request> createRepeated() => $pb.PbList<ListShareCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ListShareCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListShareCamera_Request>(create);
  static ListShareCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ListShareCamera_Reply extends $pb.GeneratedMessage {
  factory ListShareCamera_Reply({
    $core.Iterable<$1.InviteMessage>? sharingRecords,
  }) {
    final $result = create();
    if (sharingRecords != null) {
      $result.sharingRecords.addAll(sharingRecords);
    }
    return $result;
  }
  ListShareCamera_Reply._() : super();
  factory ListShareCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListShareCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListShareCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.InviteMessage>(1, _omitFieldNames ? '' : 'sharingRecords', $pb.PbFieldType.PM, subBuilder: $1.InviteMessage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListShareCamera_Reply clone() => ListShareCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListShareCamera_Reply copyWith(void Function(ListShareCamera_Reply) updates) => super.copyWith((message) => updates(message as ListShareCamera_Reply)) as ListShareCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShareCamera_Reply create() => ListShareCamera_Reply._();
  ListShareCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ListShareCamera_Reply> createRepeated() => $pb.PbList<ListShareCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListShareCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListShareCamera_Reply>(create);
  static ListShareCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.InviteMessage> get sharingRecords => $_getList(0);
}

class ListShareCamera extends $pb.GeneratedMessage {
  factory ListShareCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListShareCamera._() : super();
  factory ListShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(178, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListShareCamera clone() => ListShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListShareCamera copyWith(void Function(ListShareCamera) updates) => super.copyWith((message) => updates(message as ListShareCamera)) as ListShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShareCamera create() => ListShareCamera._();
  ListShareCamera createEmptyInstance() => create();
  static $pb.PbList<ListShareCamera> createRepeated() => $pb.PbList<ListShareCamera>();
  @$core.pragma('dart2js:noInline')
  static ListShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListShareCamera>(create);
  static ListShareCamera? _defaultInstance;

  @$pb.TagNumber(178)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(178)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(178)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(178)
  void clearID() => clearField(178);
}

class UpdateShareCamera_Request extends $pb.GeneratedMessage {
  factory UpdateShareCamera_Request({
    $core.List<$core.int>? cameraId,
    UpdateShareCamera_Role? role,
    $core.String? accountB,
    $core.List<$core.int>? inviteMsgId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    return $result;
  }
  UpdateShareCamera_Request._() : super();
  factory UpdateShareCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateShareCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateShareCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..e<UpdateShareCamera_Role>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: UpdateShareCamera_Role.VIEW, valueOf: UpdateShareCamera_Role.valueOf, enumValues: UpdateShareCamera_Role.values)
    ..aOS(3, _omitFieldNames ? '' : 'accountB')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateShareCamera_Request clone() => UpdateShareCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateShareCamera_Request copyWith(void Function(UpdateShareCamera_Request) updates) => super.copyWith((message) => updates(message as UpdateShareCamera_Request)) as UpdateShareCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateShareCamera_Request create() => UpdateShareCamera_Request._();
  UpdateShareCamera_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateShareCamera_Request> createRepeated() => $pb.PbList<UpdateShareCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateShareCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateShareCamera_Request>(create);
  static UpdateShareCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  UpdateShareCamera_Role get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(UpdateShareCamera_Role v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountB => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountB($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountB() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountB() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get inviteMsgId => $_getN(3);
  @$pb.TagNumber(4)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInviteMsgId() => $_has(3);
  @$pb.TagNumber(4)
  void clearInviteMsgId() => clearField(4);
}

class UpdateShareCamera_Reply extends $pb.GeneratedMessage {
  factory UpdateShareCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  UpdateShareCamera_Reply._() : super();
  factory UpdateShareCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateShareCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateShareCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateShareCamera_Reply clone() => UpdateShareCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateShareCamera_Reply copyWith(void Function(UpdateShareCamera_Reply) updates) => super.copyWith((message) => updates(message as UpdateShareCamera_Reply)) as UpdateShareCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateShareCamera_Reply create() => UpdateShareCamera_Reply._();
  UpdateShareCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateShareCamera_Reply> createRepeated() => $pb.PbList<UpdateShareCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateShareCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateShareCamera_Reply>(create);
  static UpdateShareCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class UpdateShareCamera extends $pb.GeneratedMessage {
  factory UpdateShareCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateShareCamera._() : super();
  factory UpdateShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(179, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateShareCamera clone() => UpdateShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateShareCamera copyWith(void Function(UpdateShareCamera) updates) => super.copyWith((message) => updates(message as UpdateShareCamera)) as UpdateShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateShareCamera create() => UpdateShareCamera._();
  UpdateShareCamera createEmptyInstance() => create();
  static $pb.PbList<UpdateShareCamera> createRepeated() => $pb.PbList<UpdateShareCamera>();
  @$core.pragma('dart2js:noInline')
  static UpdateShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateShareCamera>(create);
  static UpdateShareCamera? _defaultInstance;

  @$pb.TagNumber(179)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(179)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(179)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(179)
  void clearID() => clearField(179);
}

class DeleteShareCamera_Request extends $pb.GeneratedMessage {
  factory DeleteShareCamera_Request({
    $core.List<$core.int>? cameraId,
    $core.String? accountB,
    $core.List<$core.int>? shareId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (shareId != null) {
      $result.shareId = shareId;
    }
    return $result;
  }
  DeleteShareCamera_Request._() : super();
  factory DeleteShareCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteShareCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteShareCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'accountB')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'shareId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteShareCamera_Request clone() => DeleteShareCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteShareCamera_Request copyWith(void Function(DeleteShareCamera_Request) updates) => super.copyWith((message) => updates(message as DeleteShareCamera_Request)) as DeleteShareCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShareCamera_Request create() => DeleteShareCamera_Request._();
  DeleteShareCamera_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteShareCamera_Request> createRepeated() => $pb.PbList<DeleteShareCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteShareCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteShareCamera_Request>(create);
  static DeleteShareCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountB => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountB($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountB() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountB() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get shareId => $_getN(2);
  @$pb.TagNumber(3)
  set shareId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearShareId() => clearField(3);
}

class DeleteShareCamera_Reply extends $pb.GeneratedMessage {
  factory DeleteShareCamera_Reply({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? shareId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (shareId != null) {
      $result.shareId = shareId;
    }
    return $result;
  }
  DeleteShareCamera_Reply._() : super();
  factory DeleteShareCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteShareCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteShareCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'shareId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteShareCamera_Reply clone() => DeleteShareCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteShareCamera_Reply copyWith(void Function(DeleteShareCamera_Reply) updates) => super.copyWith((message) => updates(message as DeleteShareCamera_Reply)) as DeleteShareCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShareCamera_Reply create() => DeleteShareCamera_Reply._();
  DeleteShareCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteShareCamera_Reply> createRepeated() => $pb.PbList<DeleteShareCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteShareCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteShareCamera_Reply>(create);
  static DeleteShareCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get shareId => $_getN(1);
  @$pb.TagNumber(2)
  set shareId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearShareId() => clearField(2);
}

class DeleteShareCamera extends $pb.GeneratedMessage {
  factory DeleteShareCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteShareCamera._() : super();
  factory DeleteShareCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteShareCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteShareCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(180, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteShareCamera clone() => DeleteShareCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteShareCamera copyWith(void Function(DeleteShareCamera) updates) => super.copyWith((message) => updates(message as DeleteShareCamera)) as DeleteShareCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShareCamera create() => DeleteShareCamera._();
  DeleteShareCamera createEmptyInstance() => create();
  static $pb.PbList<DeleteShareCamera> createRepeated() => $pb.PbList<DeleteShareCamera>();
  @$core.pragma('dart2js:noInline')
  static DeleteShareCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteShareCamera>(create);
  static DeleteShareCamera? _defaultInstance;

  @$pb.TagNumber(180)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(180)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(180)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(180)
  void clearID() => clearField(180);
}

class ListSharedCamera_ShareData extends $pb.GeneratedMessage {
  factory ListSharedCamera_ShareData({
    $core.List<$core.int>? cameraId,
    $core.String? cameraName,
    ListSharedCamera_Role? role,
    ListSharedCamera_Status? status,
    $fixnum.Int64? time,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (role != null) {
      $result.role = role;
    }
    if (status != null) {
      $result.status = status;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }
  ListSharedCamera_ShareData._() : super();
  factory ListSharedCamera_ShareData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSharedCamera_ShareData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSharedCamera.ShareData', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'cameraName')
    ..e<ListSharedCamera_Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ListSharedCamera_Role.VIEW, valueOf: ListSharedCamera_Role.valueOf, enumValues: ListSharedCamera_Role.values)
    ..e<ListSharedCamera_Status>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ListSharedCamera_Status.PENDING, valueOf: ListSharedCamera_Status.valueOf, enumValues: ListSharedCamera_Status.values)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSharedCamera_ShareData clone() => ListSharedCamera_ShareData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSharedCamera_ShareData copyWith(void Function(ListSharedCamera_ShareData) updates) => super.copyWith((message) => updates(message as ListSharedCamera_ShareData)) as ListSharedCamera_ShareData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_ShareData create() => ListSharedCamera_ShareData._();
  ListSharedCamera_ShareData createEmptyInstance() => create();
  static $pb.PbList<ListSharedCamera_ShareData> createRepeated() => $pb.PbList<ListSharedCamera_ShareData>();
  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_ShareData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSharedCamera_ShareData>(create);
  static ListSharedCamera_ShareData? _defaultInstance;

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
  ListSharedCamera_Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(ListSharedCamera_Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  ListSharedCamera_Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(ListSharedCamera_Status v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class ListSharedCamera_ShareGroupData extends $pb.GeneratedMessage {
  factory ListSharedCamera_ShareGroupData({
    $core.List<$core.int>? groupId,
    $core.String? groupName,
    ListSharedCamera_GroupShareRole? role,
    ListSharedCamera_Status? status,
    $fixnum.Int64? time,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (groupName != null) {
      $result.groupName = groupName;
    }
    if (role != null) {
      $result.role = role;
    }
    if (status != null) {
      $result.status = status;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }
  ListSharedCamera_ShareGroupData._() : super();
  factory ListSharedCamera_ShareGroupData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSharedCamera_ShareGroupData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSharedCamera.ShareGroupData', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..e<ListSharedCamera_GroupShareRole>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: ListSharedCamera_GroupShareRole.NOT_USE_, valueOf: ListSharedCamera_GroupShareRole.valueOf, enumValues: ListSharedCamera_GroupShareRole.values)
    ..e<ListSharedCamera_Status>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ListSharedCamera_Status.PENDING, valueOf: ListSharedCamera_Status.valueOf, enumValues: ListSharedCamera_Status.values)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSharedCamera_ShareGroupData clone() => ListSharedCamera_ShareGroupData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSharedCamera_ShareGroupData copyWith(void Function(ListSharedCamera_ShareGroupData) updates) => super.copyWith((message) => updates(message as ListSharedCamera_ShareGroupData)) as ListSharedCamera_ShareGroupData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_ShareGroupData create() => ListSharedCamera_ShareGroupData._();
  ListSharedCamera_ShareGroupData createEmptyInstance() => create();
  static $pb.PbList<ListSharedCamera_ShareGroupData> createRepeated() => $pb.PbList<ListSharedCamera_ShareGroupData>();
  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_ShareGroupData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSharedCamera_ShareGroupData>(create);
  static ListSharedCamera_ShareGroupData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  ListSharedCamera_GroupShareRole get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(ListSharedCamera_GroupShareRole v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  ListSharedCamera_Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(ListSharedCamera_Status v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class ListSharedCamera_SharingRecord extends $pb.GeneratedMessage {
  factory ListSharedCamera_SharingRecord({
    $1.Profile? accountA,
    $1.Profile? accountB,
    ListSharedCamera_ShareData? shareData,
    $core.List<$core.int>? inviteMsgId,
    ListSharedCamera_SharingRecord_ShareType? shareType,
    ListSharedCamera_ShareGroupData? shareGroupData,
  }) {
    final $result = create();
    if (accountA != null) {
      $result.accountA = accountA;
    }
    if (accountB != null) {
      $result.accountB = accountB;
    }
    if (shareData != null) {
      $result.shareData = shareData;
    }
    if (inviteMsgId != null) {
      $result.inviteMsgId = inviteMsgId;
    }
    if (shareType != null) {
      $result.shareType = shareType;
    }
    if (shareGroupData != null) {
      $result.shareGroupData = shareGroupData;
    }
    return $result;
  }
  ListSharedCamera_SharingRecord._() : super();
  factory ListSharedCamera_SharingRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSharedCamera_SharingRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSharedCamera.SharingRecord', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Profile>(1, _omitFieldNames ? '' : 'accountA', subBuilder: $1.Profile.create)
    ..aOM<$1.Profile>(2, _omitFieldNames ? '' : 'accountB', subBuilder: $1.Profile.create)
    ..aOM<ListSharedCamera_ShareData>(3, _omitFieldNames ? '' : 'shareData', subBuilder: ListSharedCamera_ShareData.create)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'inviteMsgId', $pb.PbFieldType.OY)
    ..e<ListSharedCamera_SharingRecord_ShareType>(5, _omitFieldNames ? '' : 'shareType', $pb.PbFieldType.OE, protoName: 'shareType', defaultOrMaker: ListSharedCamera_SharingRecord_ShareType.CAMERA, valueOf: ListSharedCamera_SharingRecord_ShareType.valueOf, enumValues: ListSharedCamera_SharingRecord_ShareType.values)
    ..aOM<ListSharedCamera_ShareGroupData>(6, _omitFieldNames ? '' : 'shareGroupData', subBuilder: ListSharedCamera_ShareGroupData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSharedCamera_SharingRecord clone() => ListSharedCamera_SharingRecord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSharedCamera_SharingRecord copyWith(void Function(ListSharedCamera_SharingRecord) updates) => super.copyWith((message) => updates(message as ListSharedCamera_SharingRecord)) as ListSharedCamera_SharingRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_SharingRecord create() => ListSharedCamera_SharingRecord._();
  ListSharedCamera_SharingRecord createEmptyInstance() => create();
  static $pb.PbList<ListSharedCamera_SharingRecord> createRepeated() => $pb.PbList<ListSharedCamera_SharingRecord>();
  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_SharingRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSharedCamera_SharingRecord>(create);
  static ListSharedCamera_SharingRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Profile get accountA => $_getN(0);
  @$pb.TagNumber(1)
  set accountA($1.Profile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountA() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountA() => clearField(1);
  @$pb.TagNumber(1)
  $1.Profile ensureAccountA() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Profile get accountB => $_getN(1);
  @$pb.TagNumber(2)
  set accountB($1.Profile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountB() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountB() => clearField(2);
  @$pb.TagNumber(2)
  $1.Profile ensureAccountB() => $_ensure(1);

  @$pb.TagNumber(3)
  ListSharedCamera_ShareData get shareData => $_getN(2);
  @$pb.TagNumber(3)
  set shareData(ListSharedCamera_ShareData v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasShareData() => $_has(2);
  @$pb.TagNumber(3)
  void clearShareData() => clearField(3);
  @$pb.TagNumber(3)
  ListSharedCamera_ShareData ensureShareData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get inviteMsgId => $_getN(3);
  @$pb.TagNumber(4)
  set inviteMsgId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInviteMsgId() => $_has(3);
  @$pb.TagNumber(4)
  void clearInviteMsgId() => clearField(4);

  @$pb.TagNumber(5)
  ListSharedCamera_SharingRecord_ShareType get shareType => $_getN(4);
  @$pb.TagNumber(5)
  set shareType(ListSharedCamera_SharingRecord_ShareType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasShareType() => $_has(4);
  @$pb.TagNumber(5)
  void clearShareType() => clearField(5);

  @$pb.TagNumber(6)
  ListSharedCamera_ShareGroupData get shareGroupData => $_getN(5);
  @$pb.TagNumber(6)
  set shareGroupData(ListSharedCamera_ShareGroupData v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasShareGroupData() => $_has(5);
  @$pb.TagNumber(6)
  void clearShareGroupData() => clearField(6);
  @$pb.TagNumber(6)
  ListSharedCamera_ShareGroupData ensureShareGroupData() => $_ensure(5);
}

class ListSharedCamera_Request extends $pb.GeneratedMessage {
  factory ListSharedCamera_Request({
    $core.bool? loadGroupShare,
  }) {
    final $result = create();
    if (loadGroupShare != null) {
      $result.loadGroupShare = loadGroupShare;
    }
    return $result;
  }
  ListSharedCamera_Request._() : super();
  factory ListSharedCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSharedCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSharedCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'loadGroupShare', protoName: 'loadGroupShare')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSharedCamera_Request clone() => ListSharedCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSharedCamera_Request copyWith(void Function(ListSharedCamera_Request) updates) => super.copyWith((message) => updates(message as ListSharedCamera_Request)) as ListSharedCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_Request create() => ListSharedCamera_Request._();
  ListSharedCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ListSharedCamera_Request> createRepeated() => $pb.PbList<ListSharedCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSharedCamera_Request>(create);
  static ListSharedCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get loadGroupShare => $_getBF(0);
  @$pb.TagNumber(1)
  set loadGroupShare($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLoadGroupShare() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoadGroupShare() => clearField(1);
}

class ListSharedCamera_Reply extends $pb.GeneratedMessage {
  factory ListSharedCamera_Reply({
    $core.Iterable<ListSharedCamera_SharingRecord>? sharingRecords,
  }) {
    final $result = create();
    if (sharingRecords != null) {
      $result.sharingRecords.addAll(sharingRecords);
    }
    return $result;
  }
  ListSharedCamera_Reply._() : super();
  factory ListSharedCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSharedCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSharedCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<ListSharedCamera_SharingRecord>(1, _omitFieldNames ? '' : 'sharingRecords', $pb.PbFieldType.PM, subBuilder: ListSharedCamera_SharingRecord.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSharedCamera_Reply clone() => ListSharedCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSharedCamera_Reply copyWith(void Function(ListSharedCamera_Reply) updates) => super.copyWith((message) => updates(message as ListSharedCamera_Reply)) as ListSharedCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_Reply create() => ListSharedCamera_Reply._();
  ListSharedCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ListSharedCamera_Reply> createRepeated() => $pb.PbList<ListSharedCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListSharedCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSharedCamera_Reply>(create);
  static ListSharedCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListSharedCamera_SharingRecord> get sharingRecords => $_getList(0);
}

class ListSharedCamera extends $pb.GeneratedMessage {
  factory ListSharedCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListSharedCamera._() : super();
  factory ListSharedCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSharedCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSharedCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(181, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSharedCamera clone() => ListSharedCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSharedCamera copyWith(void Function(ListSharedCamera) updates) => super.copyWith((message) => updates(message as ListSharedCamera)) as ListSharedCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSharedCamera create() => ListSharedCamera._();
  ListSharedCamera createEmptyInstance() => create();
  static $pb.PbList<ListSharedCamera> createRepeated() => $pb.PbList<ListSharedCamera>();
  @$core.pragma('dart2js:noInline')
  static ListSharedCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSharedCamera>(create);
  static ListSharedCamera? _defaultInstance;

  @$pb.TagNumber(181)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(181)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(181)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(181)
  void clearID() => clearField(181);
}

class GetTimeShiftVideoCloudCamera_PlaybackVideo extends $pb.GeneratedMessage {
  factory GetTimeShiftVideoCloudCamera_PlaybackVideo({
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
  GetTimeShiftVideoCloudCamera_PlaybackVideo._() : super();
  factory GetTimeShiftVideoCloudCamera_PlaybackVideo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTimeShiftVideoCloudCamera_PlaybackVideo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTimeShiftVideoCloudCamera.PlaybackVideo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
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
  GetTimeShiftVideoCloudCamera_PlaybackVideo clone() => GetTimeShiftVideoCloudCamera_PlaybackVideo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera_PlaybackVideo copyWith(void Function(GetTimeShiftVideoCloudCamera_PlaybackVideo) updates) => super.copyWith((message) => updates(message as GetTimeShiftVideoCloudCamera_PlaybackVideo)) as GetTimeShiftVideoCloudCamera_PlaybackVideo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera_PlaybackVideo create() => GetTimeShiftVideoCloudCamera_PlaybackVideo._();
  GetTimeShiftVideoCloudCamera_PlaybackVideo createEmptyInstance() => create();
  static $pb.PbList<GetTimeShiftVideoCloudCamera_PlaybackVideo> createRepeated() => $pb.PbList<GetTimeShiftVideoCloudCamera_PlaybackVideo>();
  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera_PlaybackVideo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTimeShiftVideoCloudCamera_PlaybackVideo>(create);
  static GetTimeShiftVideoCloudCamera_PlaybackVideo? _defaultInstance;

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

class GetTimeShiftVideoCloudCamera_Request extends $pb.GeneratedMessage {
  factory GetTimeShiftVideoCloudCamera_Request({
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? currentTime,
    $core.int? timeZone,
    $core.Iterable<$core.List<$core.int>>? cameraIdList,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (currentTime != null) {
      $result.currentTime = currentTime;
    }
    if (timeZone != null) {
      $result.timeZone = timeZone;
    }
    if (cameraIdList != null) {
      $result.cameraIdList.addAll(cameraIdList);
    }
    return $result;
  }
  GetTimeShiftVideoCloudCamera_Request._() : super();
  factory GetTimeShiftVideoCloudCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTimeShiftVideoCloudCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTimeShiftVideoCloudCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'currentTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'timeZone', $pb.PbFieldType.OU3)
    ..p<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'cameraIdList', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera_Request clone() => GetTimeShiftVideoCloudCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera_Request copyWith(void Function(GetTimeShiftVideoCloudCamera_Request) updates) => super.copyWith((message) => updates(message as GetTimeShiftVideoCloudCamera_Request)) as GetTimeShiftVideoCloudCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera_Request create() => GetTimeShiftVideoCloudCamera_Request._();
  GetTimeShiftVideoCloudCamera_Request createEmptyInstance() => create();
  static $pb.PbList<GetTimeShiftVideoCloudCamera_Request> createRepeated() => $pb.PbList<GetTimeShiftVideoCloudCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTimeShiftVideoCloudCamera_Request>(create);
  static GetTimeShiftVideoCloudCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get currentTime => $_getI64(1);
  @$pb.TagNumber(2)
  set currentTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get timeZone => $_getIZ(2);
  @$pb.TagNumber(3)
  set timeZone($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimeZone() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimeZone() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.List<$core.int>> get cameraIdList => $_getList(3);
}

class GetTimeShiftVideoCloudCamera_Reply extends $pb.GeneratedMessage {
  factory GetTimeShiftVideoCloudCamera_Reply({
    $core.Iterable<GetTimeShiftVideoCloudCamera_PlaybackVideo>? videos,
    $core.Iterable<$1.Event>? events,
  }) {
    final $result = create();
    if (videos != null) {
      $result.videos.addAll(videos);
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  GetTimeShiftVideoCloudCamera_Reply._() : super();
  factory GetTimeShiftVideoCloudCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTimeShiftVideoCloudCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTimeShiftVideoCloudCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<GetTimeShiftVideoCloudCamera_PlaybackVideo>(1, _omitFieldNames ? '' : 'videos', $pb.PbFieldType.PM, subBuilder: GetTimeShiftVideoCloudCamera_PlaybackVideo.create)
    ..pc<$1.Event>(2, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: $1.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera_Reply clone() => GetTimeShiftVideoCloudCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera_Reply copyWith(void Function(GetTimeShiftVideoCloudCamera_Reply) updates) => super.copyWith((message) => updates(message as GetTimeShiftVideoCloudCamera_Reply)) as GetTimeShiftVideoCloudCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera_Reply create() => GetTimeShiftVideoCloudCamera_Reply._();
  GetTimeShiftVideoCloudCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<GetTimeShiftVideoCloudCamera_Reply> createRepeated() => $pb.PbList<GetTimeShiftVideoCloudCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTimeShiftVideoCloudCamera_Reply>(create);
  static GetTimeShiftVideoCloudCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetTimeShiftVideoCloudCamera_PlaybackVideo> get videos => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$1.Event> get events => $_getList(1);
}

class GetTimeShiftVideoCloudCamera extends $pb.GeneratedMessage {
  factory GetTimeShiftVideoCloudCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetTimeShiftVideoCloudCamera._() : super();
  factory GetTimeShiftVideoCloudCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTimeShiftVideoCloudCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTimeShiftVideoCloudCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(182, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera clone() => GetTimeShiftVideoCloudCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTimeShiftVideoCloudCamera copyWith(void Function(GetTimeShiftVideoCloudCamera) updates) => super.copyWith((message) => updates(message as GetTimeShiftVideoCloudCamera)) as GetTimeShiftVideoCloudCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera create() => GetTimeShiftVideoCloudCamera._();
  GetTimeShiftVideoCloudCamera createEmptyInstance() => create();
  static $pb.PbList<GetTimeShiftVideoCloudCamera> createRepeated() => $pb.PbList<GetTimeShiftVideoCloudCamera>();
  @$core.pragma('dart2js:noInline')
  static GetTimeShiftVideoCloudCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTimeShiftVideoCloudCamera>(create);
  static GetTimeShiftVideoCloudCamera? _defaultInstance;

  @$pb.TagNumber(182)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(182)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(182)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(182)
  void clearID() => clearField(182);
}

class SettingCloudStorage_Request extends $pb.GeneratedMessage {
  factory SettingCloudStorage_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? power,
    SettingCloudStorage_StorageMode? storageMode,
    $core.int? numberDays,
    $core.bool? useDefaultAccountSetting,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (power != null) {
      $result.power = power;
    }
    if (storageMode != null) {
      $result.storageMode = storageMode;
    }
    if (numberDays != null) {
      $result.numberDays = numberDays;
    }
    if (useDefaultAccountSetting != null) {
      $result.useDefaultAccountSetting = useDefaultAccountSetting;
    }
    return $result;
  }
  SettingCloudStorage_Request._() : super();
  factory SettingCloudStorage_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingCloudStorage_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SettingCloudStorage.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'power')
    ..e<SettingCloudStorage_StorageMode>(3, _omitFieldNames ? '' : 'storageMode', $pb.PbFieldType.OE, defaultOrMaker: SettingCloudStorage_StorageMode.CLOUD, valueOf: SettingCloudStorage_StorageMode.valueOf, enumValues: SettingCloudStorage_StorageMode.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'numberDays', $pb.PbFieldType.OU3)
    ..aOB(5, _omitFieldNames ? '' : 'useDefaultAccountSetting')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingCloudStorage_Request clone() => SettingCloudStorage_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingCloudStorage_Request copyWith(void Function(SettingCloudStorage_Request) updates) => super.copyWith((message) => updates(message as SettingCloudStorage_Request)) as SettingCloudStorage_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettingCloudStorage_Request create() => SettingCloudStorage_Request._();
  SettingCloudStorage_Request createEmptyInstance() => create();
  static $pb.PbList<SettingCloudStorage_Request> createRepeated() => $pb.PbList<SettingCloudStorage_Request>();
  @$core.pragma('dart2js:noInline')
  static SettingCloudStorage_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingCloudStorage_Request>(create);
  static SettingCloudStorage_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get power => $_getBF(1);
  @$pb.TagNumber(2)
  set power($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPower() => $_has(1);
  @$pb.TagNumber(2)
  void clearPower() => clearField(2);

  @$pb.TagNumber(3)
  SettingCloudStorage_StorageMode get storageMode => $_getN(2);
  @$pb.TagNumber(3)
  set storageMode(SettingCloudStorage_StorageMode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStorageMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearStorageMode() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get numberDays => $_getIZ(3);
  @$pb.TagNumber(4)
  set numberDays($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNumberDays() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumberDays() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get useDefaultAccountSetting => $_getBF(4);
  @$pb.TagNumber(5)
  set useDefaultAccountSetting($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUseDefaultAccountSetting() => $_has(4);
  @$pb.TagNumber(5)
  void clearUseDefaultAccountSetting() => clearField(5);
}

class SettingCloudStorage_Reply extends $pb.GeneratedMessage {
  factory SettingCloudStorage_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  SettingCloudStorage_Reply._() : super();
  factory SettingCloudStorage_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingCloudStorage_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SettingCloudStorage.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingCloudStorage_Reply clone() => SettingCloudStorage_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingCloudStorage_Reply copyWith(void Function(SettingCloudStorage_Reply) updates) => super.copyWith((message) => updates(message as SettingCloudStorage_Reply)) as SettingCloudStorage_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettingCloudStorage_Reply create() => SettingCloudStorage_Reply._();
  SettingCloudStorage_Reply createEmptyInstance() => create();
  static $pb.PbList<SettingCloudStorage_Reply> createRepeated() => $pb.PbList<SettingCloudStorage_Reply>();
  @$core.pragma('dart2js:noInline')
  static SettingCloudStorage_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingCloudStorage_Reply>(create);
  static SettingCloudStorage_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class SettingCloudStorage extends $pb.GeneratedMessage {
  factory SettingCloudStorage({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  SettingCloudStorage._() : super();
  factory SettingCloudStorage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingCloudStorage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SettingCloudStorage', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(183, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingCloudStorage clone() => SettingCloudStorage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingCloudStorage copyWith(void Function(SettingCloudStorage) updates) => super.copyWith((message) => updates(message as SettingCloudStorage)) as SettingCloudStorage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettingCloudStorage create() => SettingCloudStorage._();
  SettingCloudStorage createEmptyInstance() => create();
  static $pb.PbList<SettingCloudStorage> createRepeated() => $pb.PbList<SettingCloudStorage>();
  @$core.pragma('dart2js:noInline')
  static SettingCloudStorage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingCloudStorage>(create);
  static SettingCloudStorage? _defaultInstance;

  @$pb.TagNumber(183)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(183)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(183)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(183)
  void clearID() => clearField(183);
}

class UpdateCameraPosition_CamPosition extends $pb.GeneratedMessage {
  factory UpdateCameraPosition_CamPosition({
    $core.List<$core.int>? cameraId,
    $core.int? position,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (position != null) {
      $result.position = position;
    }
    return $result;
  }
  UpdateCameraPosition_CamPosition._() : super();
  factory UpdateCameraPosition_CamPosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCameraPosition_CamPosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCameraPosition.CamPosition', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'position', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition_CamPosition clone() => UpdateCameraPosition_CamPosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition_CamPosition copyWith(void Function(UpdateCameraPosition_CamPosition) updates) => super.copyWith((message) => updates(message as UpdateCameraPosition_CamPosition)) as UpdateCameraPosition_CamPosition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition_CamPosition create() => UpdateCameraPosition_CamPosition._();
  UpdateCameraPosition_CamPosition createEmptyInstance() => create();
  static $pb.PbList<UpdateCameraPosition_CamPosition> createRepeated() => $pb.PbList<UpdateCameraPosition_CamPosition>();
  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition_CamPosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCameraPosition_CamPosition>(create);
  static UpdateCameraPosition_CamPosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
}

class UpdateCameraPosition_Request extends $pb.GeneratedMessage {
  factory UpdateCameraPosition_Request({
    $core.Iterable<UpdateCameraPosition_CamPosition>? camPosition,
  }) {
    final $result = create();
    if (camPosition != null) {
      $result.camPosition.addAll(camPosition);
    }
    return $result;
  }
  UpdateCameraPosition_Request._() : super();
  factory UpdateCameraPosition_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCameraPosition_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCameraPosition.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<UpdateCameraPosition_CamPosition>(1, _omitFieldNames ? '' : 'camPosition', $pb.PbFieldType.PM, subBuilder: UpdateCameraPosition_CamPosition.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition_Request clone() => UpdateCameraPosition_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition_Request copyWith(void Function(UpdateCameraPosition_Request) updates) => super.copyWith((message) => updates(message as UpdateCameraPosition_Request)) as UpdateCameraPosition_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition_Request create() => UpdateCameraPosition_Request._();
  UpdateCameraPosition_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateCameraPosition_Request> createRepeated() => $pb.PbList<UpdateCameraPosition_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCameraPosition_Request>(create);
  static UpdateCameraPosition_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UpdateCameraPosition_CamPosition> get camPosition => $_getList(0);
}

class UpdateCameraPosition_Reply extends $pb.GeneratedMessage {
  factory UpdateCameraPosition_Reply({
    $core.Iterable<$1.Camera>? cameras,
  }) {
    final $result = create();
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    return $result;
  }
  UpdateCameraPosition_Reply._() : super();
  factory UpdateCameraPosition_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCameraPosition_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCameraPosition.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition_Reply clone() => UpdateCameraPosition_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition_Reply copyWith(void Function(UpdateCameraPosition_Reply) updates) => super.copyWith((message) => updates(message as UpdateCameraPosition_Reply)) as UpdateCameraPosition_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition_Reply create() => UpdateCameraPosition_Reply._();
  UpdateCameraPosition_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateCameraPosition_Reply> createRepeated() => $pb.PbList<UpdateCameraPosition_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCameraPosition_Reply>(create);
  static UpdateCameraPosition_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get cameras => $_getList(0);
}

class UpdateCameraPosition extends $pb.GeneratedMessage {
  factory UpdateCameraPosition({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateCameraPosition._() : super();
  factory UpdateCameraPosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCameraPosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCameraPosition', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(185, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition clone() => UpdateCameraPosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCameraPosition copyWith(void Function(UpdateCameraPosition) updates) => super.copyWith((message) => updates(message as UpdateCameraPosition)) as UpdateCameraPosition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition create() => UpdateCameraPosition._();
  UpdateCameraPosition createEmptyInstance() => create();
  static $pb.PbList<UpdateCameraPosition> createRepeated() => $pb.PbList<UpdateCameraPosition>();
  @$core.pragma('dart2js:noInline')
  static UpdateCameraPosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCameraPosition>(create);
  static UpdateCameraPosition? _defaultInstance;

  @$pb.TagNumber(185)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(185)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(185)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(185)
  void clearID() => clearField(185);
}

class AddCameraRTSP_Request extends $pb.GeneratedMessage {
  factory AddCameraRTSP_Request({
    $core.String? name,
    $core.String? username,
    $core.String? password,
    $core.String? rtspUrl,
    $1.MapLocation? location,
    $core.List<$core.int>? boxId,
    $core.List<$core.int>? groupId,
    $core.Iterable<$core.String>? subStreamUrls,
    $core.Iterable<$core.List<$core.int>>? tagsetId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (rtspUrl != null) {
      $result.rtspUrl = rtspUrl;
    }
    if (location != null) {
      $result.location = location;
    }
    if (boxId != null) {
      $result.boxId = boxId;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (subStreamUrls != null) {
      $result.subStreamUrls.addAll(subStreamUrls);
    }
    if (tagsetId != null) {
      $result.tagsetId.addAll(tagsetId);
    }
    return $result;
  }
  AddCameraRTSP_Request._() : super();
  factory AddCameraRTSP_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraRTSP_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraRTSP.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'rtspUrl')
    ..aOM<$1.MapLocation>(5, _omitFieldNames ? '' : 'location', subBuilder: $1.MapLocation.create)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..pPS(8, _omitFieldNames ? '' : 'subStreamUrls')
    ..p<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'tagsetId', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraRTSP_Request clone() => AddCameraRTSP_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraRTSP_Request copyWith(void Function(AddCameraRTSP_Request) updates) => super.copyWith((message) => updates(message as AddCameraRTSP_Request)) as AddCameraRTSP_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraRTSP_Request create() => AddCameraRTSP_Request._();
  AddCameraRTSP_Request createEmptyInstance() => create();
  static $pb.PbList<AddCameraRTSP_Request> createRepeated() => $pb.PbList<AddCameraRTSP_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCameraRTSP_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraRTSP_Request>(create);
  static AddCameraRTSP_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rtspUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set rtspUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRtspUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearRtspUrl() => clearField(4);

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
  $core.List<$core.int> get boxId => $_getN(5);
  @$pb.TagNumber(6)
  set boxId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBoxId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBoxId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get groupId => $_getN(6);
  @$pb.TagNumber(7)
  set groupId($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGroupId() => $_has(6);
  @$pb.TagNumber(7)
  void clearGroupId() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get subStreamUrls => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.List<$core.int>> get tagsetId => $_getList(8);
}

class AddCameraRTSP_Reply extends $pb.GeneratedMessage {
  factory AddCameraRTSP_Reply({
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
  AddCameraRTSP_Reply._() : super();
  factory AddCameraRTSP_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraRTSP_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraRTSP.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraRTSP_Reply clone() => AddCameraRTSP_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraRTSP_Reply copyWith(void Function(AddCameraRTSP_Reply) updates) => super.copyWith((message) => updates(message as AddCameraRTSP_Reply)) as AddCameraRTSP_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraRTSP_Reply create() => AddCameraRTSP_Reply._();
  AddCameraRTSP_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCameraRTSP_Reply> createRepeated() => $pb.PbList<AddCameraRTSP_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCameraRTSP_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraRTSP_Reply>(create);
  static AddCameraRTSP_Reply? _defaultInstance;

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

class AddCameraRTSP extends $pb.GeneratedMessage {
  factory AddCameraRTSP({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCameraRTSP._() : super();
  factory AddCameraRTSP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraRTSP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraRTSP', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(192, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraRTSP clone() => AddCameraRTSP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraRTSP copyWith(void Function(AddCameraRTSP) updates) => super.copyWith((message) => updates(message as AddCameraRTSP)) as AddCameraRTSP;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraRTSP create() => AddCameraRTSP._();
  AddCameraRTSP createEmptyInstance() => create();
  static $pb.PbList<AddCameraRTSP> createRepeated() => $pb.PbList<AddCameraRTSP>();
  @$core.pragma('dart2js:noInline')
  static AddCameraRTSP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraRTSP>(create);
  static AddCameraRTSP? _defaultInstance;

  @$pb.TagNumber(192)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(192)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(192)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(192)
  void clearID() => clearField(192);
}

class AddCameraOnVif_Request extends $pb.GeneratedMessage {
  factory AddCameraOnVif_Request({
    $core.String? name,
    $core.String? username,
    $core.String? password,
    $core.String? onvifDeviceIp,
    $core.String? rtspUrl,
    $core.String? serialNumber,
    $1.MapLocation? location,
    $core.List<$core.int>? boxId,
    $core.List<$core.int>? groupId,
    $core.String? urn,
    $core.Iterable<$core.String>? subStreamUrls,
    $core.Iterable<$core.List<$core.int>>? tagsetId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (onvifDeviceIp != null) {
      $result.onvifDeviceIp = onvifDeviceIp;
    }
    if (rtspUrl != null) {
      $result.rtspUrl = rtspUrl;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (location != null) {
      $result.location = location;
    }
    if (boxId != null) {
      $result.boxId = boxId;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (urn != null) {
      $result.urn = urn;
    }
    if (subStreamUrls != null) {
      $result.subStreamUrls.addAll(subStreamUrls);
    }
    if (tagsetId != null) {
      $result.tagsetId.addAll(tagsetId);
    }
    return $result;
  }
  AddCameraOnVif_Request._() : super();
  factory AddCameraOnVif_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraOnVif_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraOnVif.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'onvifDeviceIp')
    ..aOS(5, _omitFieldNames ? '' : 'rtspUrl')
    ..aOS(6, _omitFieldNames ? '' : 'serialNumber', protoName: 'serialNumber')
    ..aOM<$1.MapLocation>(7, _omitFieldNames ? '' : 'location', subBuilder: $1.MapLocation.create)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..aOS(10, _omitFieldNames ? '' : 'urn')
    ..pPS(11, _omitFieldNames ? '' : 'subStreamUrls')
    ..p<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'tagsetId', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraOnVif_Request clone() => AddCameraOnVif_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraOnVif_Request copyWith(void Function(AddCameraOnVif_Request) updates) => super.copyWith((message) => updates(message as AddCameraOnVif_Request)) as AddCameraOnVif_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraOnVif_Request create() => AddCameraOnVif_Request._();
  AddCameraOnVif_Request createEmptyInstance() => create();
  static $pb.PbList<AddCameraOnVif_Request> createRepeated() => $pb.PbList<AddCameraOnVif_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCameraOnVif_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraOnVif_Request>(create);
  static AddCameraOnVif_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get onvifDeviceIp => $_getSZ(3);
  @$pb.TagNumber(4)
  set onvifDeviceIp($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOnvifDeviceIp() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnvifDeviceIp() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rtspUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set rtspUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRtspUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearRtspUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get serialNumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set serialNumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSerialNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearSerialNumber() => clearField(6);

  @$pb.TagNumber(7)
  $1.MapLocation get location => $_getN(6);
  @$pb.TagNumber(7)
  set location($1.MapLocation v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLocation() => $_has(6);
  @$pb.TagNumber(7)
  void clearLocation() => clearField(7);
  @$pb.TagNumber(7)
  $1.MapLocation ensureLocation() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get boxId => $_getN(7);
  @$pb.TagNumber(8)
  set boxId($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoxId() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoxId() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get groupId => $_getN(8);
  @$pb.TagNumber(9)
  set groupId($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasGroupId() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroupId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get urn => $_getSZ(9);
  @$pb.TagNumber(10)
  set urn($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUrn() => $_has(9);
  @$pb.TagNumber(10)
  void clearUrn() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.String> get subStreamUrls => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<$core.List<$core.int>> get tagsetId => $_getList(11);
}

class AddCameraOnVif_Reply extends $pb.GeneratedMessage {
  factory AddCameraOnVif_Reply({
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
  AddCameraOnVif_Reply._() : super();
  factory AddCameraOnVif_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraOnVif_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraOnVif.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraOnVif_Reply clone() => AddCameraOnVif_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraOnVif_Reply copyWith(void Function(AddCameraOnVif_Reply) updates) => super.copyWith((message) => updates(message as AddCameraOnVif_Reply)) as AddCameraOnVif_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraOnVif_Reply create() => AddCameraOnVif_Reply._();
  AddCameraOnVif_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCameraOnVif_Reply> createRepeated() => $pb.PbList<AddCameraOnVif_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCameraOnVif_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraOnVif_Reply>(create);
  static AddCameraOnVif_Reply? _defaultInstance;

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

class AddCameraOnVif extends $pb.GeneratedMessage {
  factory AddCameraOnVif({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCameraOnVif._() : super();
  factory AddCameraOnVif.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraOnVif.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraOnVif', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(199, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraOnVif clone() => AddCameraOnVif()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraOnVif copyWith(void Function(AddCameraOnVif) updates) => super.copyWith((message) => updates(message as AddCameraOnVif)) as AddCameraOnVif;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraOnVif create() => AddCameraOnVif._();
  AddCameraOnVif createEmptyInstance() => create();
  static $pb.PbList<AddCameraOnVif> createRepeated() => $pb.PbList<AddCameraOnVif>();
  @$core.pragma('dart2js:noInline')
  static AddCameraOnVif getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraOnVif>(create);
  static AddCameraOnVif? _defaultInstance;

  @$pb.TagNumber(199)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(199)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(199)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(199)
  void clearID() => clearField(199);
}

class GetCloudRecordPlayback_PlaybackVideo extends $pb.GeneratedMessage {
  factory GetCloudRecordPlayback_PlaybackVideo({
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
  GetCloudRecordPlayback_PlaybackVideo._() : super();
  factory GetCloudRecordPlayback_PlaybackVideo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCloudRecordPlayback_PlaybackVideo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCloudRecordPlayback.PlaybackVideo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
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
  GetCloudRecordPlayback_PlaybackVideo clone() => GetCloudRecordPlayback_PlaybackVideo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback_PlaybackVideo copyWith(void Function(GetCloudRecordPlayback_PlaybackVideo) updates) => super.copyWith((message) => updates(message as GetCloudRecordPlayback_PlaybackVideo)) as GetCloudRecordPlayback_PlaybackVideo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback_PlaybackVideo create() => GetCloudRecordPlayback_PlaybackVideo._();
  GetCloudRecordPlayback_PlaybackVideo createEmptyInstance() => create();
  static $pb.PbList<GetCloudRecordPlayback_PlaybackVideo> createRepeated() => $pb.PbList<GetCloudRecordPlayback_PlaybackVideo>();
  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback_PlaybackVideo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCloudRecordPlayback_PlaybackVideo>(create);
  static GetCloudRecordPlayback_PlaybackVideo? _defaultInstance;

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

class GetCloudRecordPlayback_Request extends $pb.GeneratedMessage {
  factory GetCloudRecordPlayback_Request({
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.int? count,
    $core.List<$core.int>? lastPlaybackVideoID,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (count != null) {
      $result.count = count;
    }
    if (lastPlaybackVideoID != null) {
      $result.lastPlaybackVideoID = lastPlaybackVideoID;
    }
    return $result;
  }
  GetCloudRecordPlayback_Request._() : super();
  factory GetCloudRecordPlayback_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCloudRecordPlayback_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCloudRecordPlayback.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'endTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'lastPlaybackVideoID', $pb.PbFieldType.OY, protoName: 'lastPlaybackVideoID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback_Request clone() => GetCloudRecordPlayback_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback_Request copyWith(void Function(GetCloudRecordPlayback_Request) updates) => super.copyWith((message) => updates(message as GetCloudRecordPlayback_Request)) as GetCloudRecordPlayback_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback_Request create() => GetCloudRecordPlayback_Request._();
  GetCloudRecordPlayback_Request createEmptyInstance() => create();
  static $pb.PbList<GetCloudRecordPlayback_Request> createRepeated() => $pb.PbList<GetCloudRecordPlayback_Request>();
  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCloudRecordPlayback_Request>(create);
  static GetCloudRecordPlayback_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get lastPlaybackVideoID => $_getN(4);
  @$pb.TagNumber(5)
  set lastPlaybackVideoID($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastPlaybackVideoID() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastPlaybackVideoID() => clearField(5);
}

class GetCloudRecordPlayback_Reply extends $pb.GeneratedMessage {
  factory GetCloudRecordPlayback_Reply({
    $core.List<$core.int>? cameraId,
    $core.int? numberDayOfRecord,
    $core.Iterable<GetCloudRecordPlayback_PlaybackVideo>? videos,
    $core.bool? isEnd,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (numberDayOfRecord != null) {
      $result.numberDayOfRecord = numberDayOfRecord;
    }
    if (videos != null) {
      $result.videos.addAll(videos);
    }
    if (isEnd != null) {
      $result.isEnd = isEnd;
    }
    return $result;
  }
  GetCloudRecordPlayback_Reply._() : super();
  factory GetCloudRecordPlayback_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCloudRecordPlayback_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCloudRecordPlayback.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'numberDayOfRecord', $pb.PbFieldType.OU3)
    ..pc<GetCloudRecordPlayback_PlaybackVideo>(3, _omitFieldNames ? '' : 'videos', $pb.PbFieldType.PM, subBuilder: GetCloudRecordPlayback_PlaybackVideo.create)
    ..aOB(4, _omitFieldNames ? '' : 'isEnd', protoName: 'isEnd')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback_Reply clone() => GetCloudRecordPlayback_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback_Reply copyWith(void Function(GetCloudRecordPlayback_Reply) updates) => super.copyWith((message) => updates(message as GetCloudRecordPlayback_Reply)) as GetCloudRecordPlayback_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback_Reply create() => GetCloudRecordPlayback_Reply._();
  GetCloudRecordPlayback_Reply createEmptyInstance() => create();
  static $pb.PbList<GetCloudRecordPlayback_Reply> createRepeated() => $pb.PbList<GetCloudRecordPlayback_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCloudRecordPlayback_Reply>(create);
  static GetCloudRecordPlayback_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get numberDayOfRecord => $_getIZ(1);
  @$pb.TagNumber(2)
  set numberDayOfRecord($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumberDayOfRecord() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumberDayOfRecord() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<GetCloudRecordPlayback_PlaybackVideo> get videos => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get isEnd => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnd($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnd() => clearField(4);
}

class GetCloudRecordPlayback extends $pb.GeneratedMessage {
  factory GetCloudRecordPlayback({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetCloudRecordPlayback._() : super();
  factory GetCloudRecordPlayback.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCloudRecordPlayback.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCloudRecordPlayback', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(193, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback clone() => GetCloudRecordPlayback()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCloudRecordPlayback copyWith(void Function(GetCloudRecordPlayback) updates) => super.copyWith((message) => updates(message as GetCloudRecordPlayback)) as GetCloudRecordPlayback;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback create() => GetCloudRecordPlayback._();
  GetCloudRecordPlayback createEmptyInstance() => create();
  static $pb.PbList<GetCloudRecordPlayback> createRepeated() => $pb.PbList<GetCloudRecordPlayback>();
  @$core.pragma('dart2js:noInline')
  static GetCloudRecordPlayback getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCloudRecordPlayback>(create);
  static GetCloudRecordPlayback? _defaultInstance;

  @$pb.TagNumber(193)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(193)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(193)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(193)
  void clearID() => clearField(193);
}

class GetEventCloud_Request extends $pb.GeneratedMessage {
  factory GetEventCloud_Request({
    $core.Iterable<$core.List<$core.int>>? cameraId,
    $core.Iterable<$1.EventType>? types,
    $fixnum.Int64? fromDate,
    $fixnum.Int64? toDate,
    $core.List<$core.int>? lastId,
    $core.int? count,
    GetEventCloud_ALPR_Vehicle_Type? vehicleType,
    $core.String? vehiclePlate,
    $core.bool? isExportExcel,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId.addAll(cameraId);
    }
    if (types != null) {
      $result.types.addAll(types);
    }
    if (fromDate != null) {
      $result.fromDate = fromDate;
    }
    if (toDate != null) {
      $result.toDate = toDate;
    }
    if (lastId != null) {
      $result.lastId = lastId;
    }
    if (count != null) {
      $result.count = count;
    }
    if (vehicleType != null) {
      $result.vehicleType = vehicleType;
    }
    if (vehiclePlate != null) {
      $result.vehiclePlate = vehiclePlate;
    }
    if (isExportExcel != null) {
      $result.isExportExcel = isExportExcel;
    }
    return $result;
  }
  GetEventCloud_Request._() : super();
  factory GetEventCloud_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventCloud_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventCloud.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.PY)
    ..pc<$1.EventType>(2, _omitFieldNames ? '' : 'types', $pb.PbFieldType.KE, valueOf: $1.EventType.valueOf, enumValues: $1.EventType.values, defaultEnumValue: $1.EventType.MOTION_DETECTION)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fromDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'toDate', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.OY)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..e<GetEventCloud_ALPR_Vehicle_Type>(7, _omitFieldNames ? '' : 'vehicleType', $pb.PbFieldType.OE, protoName: 'vehicle_Type', defaultOrMaker: GetEventCloud_ALPR_Vehicle_Type.ALL, valueOf: GetEventCloud_ALPR_Vehicle_Type.valueOf, enumValues: GetEventCloud_ALPR_Vehicle_Type.values)
    ..aOS(8, _omitFieldNames ? '' : 'vehiclePlate')
    ..aOB(9, _omitFieldNames ? '' : 'isExportExcel', protoName: 'isExportExcel')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventCloud_Request clone() => GetEventCloud_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventCloud_Request copyWith(void Function(GetEventCloud_Request) updates) => super.copyWith((message) => updates(message as GetEventCloud_Request)) as GetEventCloud_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventCloud_Request create() => GetEventCloud_Request._();
  GetEventCloud_Request createEmptyInstance() => create();
  static $pb.PbList<GetEventCloud_Request> createRepeated() => $pb.PbList<GetEventCloud_Request>();
  @$core.pragma('dart2js:noInline')
  static GetEventCloud_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventCloud_Request>(create);
  static GetEventCloud_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get cameraId => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$1.EventType> get types => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get fromDate => $_getI64(2);
  @$pb.TagNumber(3)
  set fromDate($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFromDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromDate() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get toDate => $_getI64(3);
  @$pb.TagNumber(4)
  set toDate($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearToDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get lastId => $_getN(4);
  @$pb.TagNumber(5)
  set lastId($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastId() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => clearField(6);

  @$pb.TagNumber(7)
  GetEventCloud_ALPR_Vehicle_Type get vehicleType => $_getN(6);
  @$pb.TagNumber(7)
  set vehicleType(GetEventCloud_ALPR_Vehicle_Type v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasVehicleType() => $_has(6);
  @$pb.TagNumber(7)
  void clearVehicleType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get vehiclePlate => $_getSZ(7);
  @$pb.TagNumber(8)
  set vehiclePlate($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVehiclePlate() => $_has(7);
  @$pb.TagNumber(8)
  void clearVehiclePlate() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isExportExcel => $_getBF(8);
  @$pb.TagNumber(9)
  set isExportExcel($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsExportExcel() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsExportExcel() => clearField(9);
}

class GetEventCloud_Reply extends $pb.GeneratedMessage {
  factory GetEventCloud_Reply({
    $core.bool? isEnd,
    $core.Iterable<$1.Event>? events,
    $core.String? xlsxUrl,
  }) {
    final $result = create();
    if (isEnd != null) {
      $result.isEnd = isEnd;
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    if (xlsxUrl != null) {
      $result.xlsxUrl = xlsxUrl;
    }
    return $result;
  }
  GetEventCloud_Reply._() : super();
  factory GetEventCloud_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventCloud_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventCloud.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnd', protoName: 'isEnd')
    ..pc<$1.Event>(2, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: $1.Event.create)
    ..aOS(3, _omitFieldNames ? '' : 'xlsxUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventCloud_Reply clone() => GetEventCloud_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventCloud_Reply copyWith(void Function(GetEventCloud_Reply) updates) => super.copyWith((message) => updates(message as GetEventCloud_Reply)) as GetEventCloud_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventCloud_Reply create() => GetEventCloud_Reply._();
  GetEventCloud_Reply createEmptyInstance() => create();
  static $pb.PbList<GetEventCloud_Reply> createRepeated() => $pb.PbList<GetEventCloud_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetEventCloud_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventCloud_Reply>(create);
  static GetEventCloud_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnd => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnd($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnd() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.Event> get events => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get xlsxUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set xlsxUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasXlsxUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearXlsxUrl() => clearField(3);
}

class GetEventCloud extends $pb.GeneratedMessage {
  factory GetEventCloud({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetEventCloud._() : super();
  factory GetEventCloud.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventCloud.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventCloud', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(194, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventCloud clone() => GetEventCloud()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventCloud copyWith(void Function(GetEventCloud) updates) => super.copyWith((message) => updates(message as GetEventCloud)) as GetEventCloud;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventCloud create() => GetEventCloud._();
  GetEventCloud createEmptyInstance() => create();
  static $pb.PbList<GetEventCloud> createRepeated() => $pb.PbList<GetEventCloud>();
  @$core.pragma('dart2js:noInline')
  static GetEventCloud getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventCloud>(create);
  static GetEventCloud? _defaultInstance;

  @$pb.TagNumber(194)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(194)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(194)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(194)
  void clearID() => clearField(194);
}

class OnvifDiscoveryCamera_OnvifDevice extends $pb.GeneratedMessage {
  factory OnvifDiscoveryCamera_OnvifDevice({
    $core.String? urn,
    $core.String? name,
    $core.String? hardware,
    $core.String? xaddr,
    $core.Iterable<$core.String>? scopes,
    $core.String? ipAddress,
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
    if (ipAddress != null) {
      $result.ipAddress = ipAddress;
    }
    return $result;
  }
  OnvifDiscoveryCamera_OnvifDevice._() : super();
  factory OnvifDiscoveryCamera_OnvifDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnvifDiscoveryCamera_OnvifDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnvifDiscoveryCamera.OnvifDevice', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'urn')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'hardware')
    ..aOS(4, _omitFieldNames ? '' : 'xaddr')
    ..pPS(5, _omitFieldNames ? '' : 'scopes')
    ..aOS(6, _omitFieldNames ? '' : 'ipAddress')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera_OnvifDevice clone() => OnvifDiscoveryCamera_OnvifDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera_OnvifDevice copyWith(void Function(OnvifDiscoveryCamera_OnvifDevice) updates) => super.copyWith((message) => updates(message as OnvifDiscoveryCamera_OnvifDevice)) as OnvifDiscoveryCamera_OnvifDevice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera_OnvifDevice create() => OnvifDiscoveryCamera_OnvifDevice._();
  OnvifDiscoveryCamera_OnvifDevice createEmptyInstance() => create();
  static $pb.PbList<OnvifDiscoveryCamera_OnvifDevice> createRepeated() => $pb.PbList<OnvifDiscoveryCamera_OnvifDevice>();
  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera_OnvifDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnvifDiscoveryCamera_OnvifDevice>(create);
  static OnvifDiscoveryCamera_OnvifDevice? _defaultInstance;

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
  $core.String get ipAddress => $_getSZ(5);
  @$pb.TagNumber(6)
  set ipAddress($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIpAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearIpAddress() => clearField(6);
}

class OnvifDiscoveryCamera_Request extends $pb.GeneratedMessage {
  factory OnvifDiscoveryCamera_Request({
    $core.List<$core.int>? boxId,
  }) {
    final $result = create();
    if (boxId != null) {
      $result.boxId = boxId;
    }
    return $result;
  }
  OnvifDiscoveryCamera_Request._() : super();
  factory OnvifDiscoveryCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnvifDiscoveryCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnvifDiscoveryCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'boxId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera_Request clone() => OnvifDiscoveryCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera_Request copyWith(void Function(OnvifDiscoveryCamera_Request) updates) => super.copyWith((message) => updates(message as OnvifDiscoveryCamera_Request)) as OnvifDiscoveryCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera_Request create() => OnvifDiscoveryCamera_Request._();
  OnvifDiscoveryCamera_Request createEmptyInstance() => create();
  static $pb.PbList<OnvifDiscoveryCamera_Request> createRepeated() => $pb.PbList<OnvifDiscoveryCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnvifDiscoveryCamera_Request>(create);
  static OnvifDiscoveryCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get boxId => $_getN(0);
  @$pb.TagNumber(1)
  set boxId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);
}

class OnvifDiscoveryCamera_Reply extends $pb.GeneratedMessage {
  factory OnvifDiscoveryCamera_Reply({
    $core.Iterable<OnvifDiscoveryCamera_OnvifDevice>? devices,
  }) {
    final $result = create();
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    return $result;
  }
  OnvifDiscoveryCamera_Reply._() : super();
  factory OnvifDiscoveryCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnvifDiscoveryCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnvifDiscoveryCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<OnvifDiscoveryCamera_OnvifDevice>(1, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: OnvifDiscoveryCamera_OnvifDevice.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera_Reply clone() => OnvifDiscoveryCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera_Reply copyWith(void Function(OnvifDiscoveryCamera_Reply) updates) => super.copyWith((message) => updates(message as OnvifDiscoveryCamera_Reply)) as OnvifDiscoveryCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera_Reply create() => OnvifDiscoveryCamera_Reply._();
  OnvifDiscoveryCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<OnvifDiscoveryCamera_Reply> createRepeated() => $pb.PbList<OnvifDiscoveryCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnvifDiscoveryCamera_Reply>(create);
  static OnvifDiscoveryCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<OnvifDiscoveryCamera_OnvifDevice> get devices => $_getList(0);
}

class OnvifDiscoveryCamera extends $pb.GeneratedMessage {
  factory OnvifDiscoveryCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  OnvifDiscoveryCamera._() : super();
  factory OnvifDiscoveryCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnvifDiscoveryCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnvifDiscoveryCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(195, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera clone() => OnvifDiscoveryCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnvifDiscoveryCamera copyWith(void Function(OnvifDiscoveryCamera) updates) => super.copyWith((message) => updates(message as OnvifDiscoveryCamera)) as OnvifDiscoveryCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera create() => OnvifDiscoveryCamera._();
  OnvifDiscoveryCamera createEmptyInstance() => create();
  static $pb.PbList<OnvifDiscoveryCamera> createRepeated() => $pb.PbList<OnvifDiscoveryCamera>();
  @$core.pragma('dart2js:noInline')
  static OnvifDiscoveryCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnvifDiscoveryCamera>(create);
  static OnvifDiscoveryCamera? _defaultInstance;

  @$pb.TagNumber(195)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(195)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(195)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(195)
  void clearID() => clearField(195);
}

class Onvif_PTZ_Pan_Request extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Pan_Request({
    $core.double? pan,
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (pan != null) {
      $result.pan = pan;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  Onvif_PTZ_Pan_Request._() : super();
  factory Onvif_PTZ_Pan_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Pan_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Pan.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'pan', $pb.PbFieldType.OF)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Pan_Request clone() => Onvif_PTZ_Pan_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Pan_Request copyWith(void Function(Onvif_PTZ_Pan_Request) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Pan_Request)) as Onvif_PTZ_Pan_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Pan_Request create() => Onvif_PTZ_Pan_Request._();
  Onvif_PTZ_Pan_Request createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Pan_Request> createRepeated() => $pb.PbList<Onvif_PTZ_Pan_Request>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Pan_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Pan_Request>(create);
  static Onvif_PTZ_Pan_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get pan => $_getN(0);
  @$pb.TagNumber(1)
  set pan($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPan() => $_has(0);
  @$pb.TagNumber(1)
  void clearPan() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);
}

class Onvif_PTZ_Pan_Reply extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Pan_Reply() => create();
  Onvif_PTZ_Pan_Reply._() : super();
  factory Onvif_PTZ_Pan_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Pan_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Pan.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Pan_Reply clone() => Onvif_PTZ_Pan_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Pan_Reply copyWith(void Function(Onvif_PTZ_Pan_Reply) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Pan_Reply)) as Onvif_PTZ_Pan_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Pan_Reply create() => Onvif_PTZ_Pan_Reply._();
  Onvif_PTZ_Pan_Reply createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Pan_Reply> createRepeated() => $pb.PbList<Onvif_PTZ_Pan_Reply>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Pan_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Pan_Reply>(create);
  static Onvif_PTZ_Pan_Reply? _defaultInstance;
}

class Onvif_PTZ_Pan extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Pan({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Onvif_PTZ_Pan._() : super();
  factory Onvif_PTZ_Pan.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Pan.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Pan', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(196, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Pan clone() => Onvif_PTZ_Pan()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Pan copyWith(void Function(Onvif_PTZ_Pan) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Pan)) as Onvif_PTZ_Pan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Pan create() => Onvif_PTZ_Pan._();
  Onvif_PTZ_Pan createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Pan> createRepeated() => $pb.PbList<Onvif_PTZ_Pan>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Pan getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Pan>(create);
  static Onvif_PTZ_Pan? _defaultInstance;

  @$pb.TagNumber(196)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(196)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(196)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(196)
  void clearID() => clearField(196);
}

class Onvif_PTZ_Tilt_Request extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Tilt_Request({
    $core.double? tilt,
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (tilt != null) {
      $result.tilt = tilt;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  Onvif_PTZ_Tilt_Request._() : super();
  factory Onvif_PTZ_Tilt_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Tilt_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Tilt.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'tilt', $pb.PbFieldType.OF)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Tilt_Request clone() => Onvif_PTZ_Tilt_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Tilt_Request copyWith(void Function(Onvif_PTZ_Tilt_Request) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Tilt_Request)) as Onvif_PTZ_Tilt_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Tilt_Request create() => Onvif_PTZ_Tilt_Request._();
  Onvif_PTZ_Tilt_Request createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Tilt_Request> createRepeated() => $pb.PbList<Onvif_PTZ_Tilt_Request>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Tilt_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Tilt_Request>(create);
  static Onvif_PTZ_Tilt_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get tilt => $_getN(0);
  @$pb.TagNumber(1)
  set tilt($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTilt() => $_has(0);
  @$pb.TagNumber(1)
  void clearTilt() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);
}

class Onvif_PTZ_Tilt_Reply extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Tilt_Reply() => create();
  Onvif_PTZ_Tilt_Reply._() : super();
  factory Onvif_PTZ_Tilt_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Tilt_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Tilt.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Tilt_Reply clone() => Onvif_PTZ_Tilt_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Tilt_Reply copyWith(void Function(Onvif_PTZ_Tilt_Reply) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Tilt_Reply)) as Onvif_PTZ_Tilt_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Tilt_Reply create() => Onvif_PTZ_Tilt_Reply._();
  Onvif_PTZ_Tilt_Reply createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Tilt_Reply> createRepeated() => $pb.PbList<Onvif_PTZ_Tilt_Reply>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Tilt_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Tilt_Reply>(create);
  static Onvif_PTZ_Tilt_Reply? _defaultInstance;
}

class Onvif_PTZ_Tilt extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Tilt({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Onvif_PTZ_Tilt._() : super();
  factory Onvif_PTZ_Tilt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Tilt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Tilt', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(197, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Tilt clone() => Onvif_PTZ_Tilt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Tilt copyWith(void Function(Onvif_PTZ_Tilt) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Tilt)) as Onvif_PTZ_Tilt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Tilt create() => Onvif_PTZ_Tilt._();
  Onvif_PTZ_Tilt createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Tilt> createRepeated() => $pb.PbList<Onvif_PTZ_Tilt>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Tilt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Tilt>(create);
  static Onvif_PTZ_Tilt? _defaultInstance;

  @$pb.TagNumber(197)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(197)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(197)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(197)
  void clearID() => clearField(197);
}

class Onvif_PTZ_Zoom_Request extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Zoom_Request({
    $core.double? zoom,
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (zoom != null) {
      $result.zoom = zoom;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  Onvif_PTZ_Zoom_Request._() : super();
  factory Onvif_PTZ_Zoom_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Zoom_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Zoom.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'zoom', $pb.PbFieldType.OF)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Request clone() => Onvif_PTZ_Zoom_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Request copyWith(void Function(Onvif_PTZ_Zoom_Request) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Zoom_Request)) as Onvif_PTZ_Zoom_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Request create() => Onvif_PTZ_Zoom_Request._();
  Onvif_PTZ_Zoom_Request createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Zoom_Request> createRepeated() => $pb.PbList<Onvif_PTZ_Zoom_Request>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Zoom_Request>(create);
  static Onvif_PTZ_Zoom_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get zoom => $_getN(0);
  @$pb.TagNumber(1)
  set zoom($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasZoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearZoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);
}

class Onvif_PTZ_Zoom_Reply extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Zoom_Reply() => create();
  Onvif_PTZ_Zoom_Reply._() : super();
  factory Onvif_PTZ_Zoom_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Zoom_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Zoom.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reply clone() => Onvif_PTZ_Zoom_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reply copyWith(void Function(Onvif_PTZ_Zoom_Reply) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Zoom_Reply)) as Onvif_PTZ_Zoom_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reply create() => Onvif_PTZ_Zoom_Reply._();
  Onvif_PTZ_Zoom_Reply createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Zoom_Reply> createRepeated() => $pb.PbList<Onvif_PTZ_Zoom_Reply>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Zoom_Reply>(create);
  static Onvif_PTZ_Zoom_Reply? _defaultInstance;
}

class Onvif_PTZ_Zoom extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Zoom({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Onvif_PTZ_Zoom._() : super();
  factory Onvif_PTZ_Zoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Zoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Zoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(198, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom clone() => Onvif_PTZ_Zoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom copyWith(void Function(Onvif_PTZ_Zoom) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Zoom)) as Onvif_PTZ_Zoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom create() => Onvif_PTZ_Zoom._();
  Onvif_PTZ_Zoom createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Zoom> createRepeated() => $pb.PbList<Onvif_PTZ_Zoom>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Zoom>(create);
  static Onvif_PTZ_Zoom? _defaultInstance;

  @$pb.TagNumber(198)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(198)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(198)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(198)
  void clearID() => clearField(198);
}

class Onvif_Get_RTSP_URL_Request extends $pb.GeneratedMessage {
  factory Onvif_Get_RTSP_URL_Request({
    $core.String? ipAddress,
    $core.String? cameraUserName,
    $core.String? cameraPassword,
  }) {
    final $result = create();
    if (ipAddress != null) {
      $result.ipAddress = ipAddress;
    }
    if (cameraUserName != null) {
      $result.cameraUserName = cameraUserName;
    }
    if (cameraPassword != null) {
      $result.cameraPassword = cameraPassword;
    }
    return $result;
  }
  Onvif_Get_RTSP_URL_Request._() : super();
  factory Onvif_Get_RTSP_URL_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_Get_RTSP_URL_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_Get_RTSP_URL.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ipAddress')
    ..aOS(2, _omitFieldNames ? '' : 'cameraUserName')
    ..aOS(3, _omitFieldNames ? '' : 'cameraPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_Get_RTSP_URL_Request clone() => Onvif_Get_RTSP_URL_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_Get_RTSP_URL_Request copyWith(void Function(Onvif_Get_RTSP_URL_Request) updates) => super.copyWith((message) => updates(message as Onvif_Get_RTSP_URL_Request)) as Onvif_Get_RTSP_URL_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_Get_RTSP_URL_Request create() => Onvif_Get_RTSP_URL_Request._();
  Onvif_Get_RTSP_URL_Request createEmptyInstance() => create();
  static $pb.PbList<Onvif_Get_RTSP_URL_Request> createRepeated() => $pb.PbList<Onvif_Get_RTSP_URL_Request>();
  @$core.pragma('dart2js:noInline')
  static Onvif_Get_RTSP_URL_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_Get_RTSP_URL_Request>(create);
  static Onvif_Get_RTSP_URL_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ipAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ipAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIpAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearIpAddress() => clearField(1);

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
}

class Onvif_Get_RTSP_URL_Reply extends $pb.GeneratedMessage {
  factory Onvif_Get_RTSP_URL_Reply({
    $core.String? rtspUrlStream,
  }) {
    final $result = create();
    if (rtspUrlStream != null) {
      $result.rtspUrlStream = rtspUrlStream;
    }
    return $result;
  }
  Onvif_Get_RTSP_URL_Reply._() : super();
  factory Onvif_Get_RTSP_URL_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_Get_RTSP_URL_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_Get_RTSP_URL.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rtspUrlStream')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_Get_RTSP_URL_Reply clone() => Onvif_Get_RTSP_URL_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_Get_RTSP_URL_Reply copyWith(void Function(Onvif_Get_RTSP_URL_Reply) updates) => super.copyWith((message) => updates(message as Onvif_Get_RTSP_URL_Reply)) as Onvif_Get_RTSP_URL_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_Get_RTSP_URL_Reply create() => Onvif_Get_RTSP_URL_Reply._();
  Onvif_Get_RTSP_URL_Reply createEmptyInstance() => create();
  static $pb.PbList<Onvif_Get_RTSP_URL_Reply> createRepeated() => $pb.PbList<Onvif_Get_RTSP_URL_Reply>();
  @$core.pragma('dart2js:noInline')
  static Onvif_Get_RTSP_URL_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_Get_RTSP_URL_Reply>(create);
  static Onvif_Get_RTSP_URL_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rtspUrlStream => $_getSZ(0);
  @$pb.TagNumber(1)
  set rtspUrlStream($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRtspUrlStream() => $_has(0);
  @$pb.TagNumber(1)
  void clearRtspUrlStream() => clearField(1);
}

class Onvif_Get_RTSP_URL extends $pb.GeneratedMessage {
  factory Onvif_Get_RTSP_URL({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Onvif_Get_RTSP_URL._() : super();
  factory Onvif_Get_RTSP_URL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_Get_RTSP_URL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_Get_RTSP_URL', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(200, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_Get_RTSP_URL clone() => Onvif_Get_RTSP_URL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_Get_RTSP_URL copyWith(void Function(Onvif_Get_RTSP_URL) updates) => super.copyWith((message) => updates(message as Onvif_Get_RTSP_URL)) as Onvif_Get_RTSP_URL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_Get_RTSP_URL create() => Onvif_Get_RTSP_URL._();
  Onvif_Get_RTSP_URL createEmptyInstance() => create();
  static $pb.PbList<Onvif_Get_RTSP_URL> createRepeated() => $pb.PbList<Onvif_Get_RTSP_URL>();
  @$core.pragma('dart2js:noInline')
  static Onvif_Get_RTSP_URL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_Get_RTSP_URL>(create);
  static Onvif_Get_RTSP_URL? _defaultInstance;

  @$pb.TagNumber(200)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(200)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(200)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(200)
  void clearID() => clearField(200);
}

class Onvif_PTZ_Zoom_Reset_Request extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Zoom_Reset_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  Onvif_PTZ_Zoom_Reset_Request._() : super();
  factory Onvif_PTZ_Zoom_Reset_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Zoom_Reset_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Zoom_Reset.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reset_Request clone() => Onvif_PTZ_Zoom_Reset_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reset_Request copyWith(void Function(Onvif_PTZ_Zoom_Reset_Request) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Zoom_Reset_Request)) as Onvif_PTZ_Zoom_Reset_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reset_Request create() => Onvif_PTZ_Zoom_Reset_Request._();
  Onvif_PTZ_Zoom_Reset_Request createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Zoom_Reset_Request> createRepeated() => $pb.PbList<Onvif_PTZ_Zoom_Reset_Request>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reset_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Zoom_Reset_Request>(create);
  static Onvif_PTZ_Zoom_Reset_Request? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);
}

class Onvif_PTZ_Zoom_Reset_Reply extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Zoom_Reset_Reply() => create();
  Onvif_PTZ_Zoom_Reset_Reply._() : super();
  factory Onvif_PTZ_Zoom_Reset_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Zoom_Reset_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Zoom_Reset.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reset_Reply clone() => Onvif_PTZ_Zoom_Reset_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reset_Reply copyWith(void Function(Onvif_PTZ_Zoom_Reset_Reply) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Zoom_Reset_Reply)) as Onvif_PTZ_Zoom_Reset_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reset_Reply create() => Onvif_PTZ_Zoom_Reset_Reply._();
  Onvif_PTZ_Zoom_Reset_Reply createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Zoom_Reset_Reply> createRepeated() => $pb.PbList<Onvif_PTZ_Zoom_Reset_Reply>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reset_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Zoom_Reset_Reply>(create);
  static Onvif_PTZ_Zoom_Reset_Reply? _defaultInstance;
}

class Onvif_PTZ_Zoom_Reset extends $pb.GeneratedMessage {
  factory Onvif_PTZ_Zoom_Reset({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Onvif_PTZ_Zoom_Reset._() : super();
  factory Onvif_PTZ_Zoom_Reset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Onvif_PTZ_Zoom_Reset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Onvif_PTZ_Zoom_Reset', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(201, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reset clone() => Onvif_PTZ_Zoom_Reset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Onvif_PTZ_Zoom_Reset copyWith(void Function(Onvif_PTZ_Zoom_Reset) updates) => super.copyWith((message) => updates(message as Onvif_PTZ_Zoom_Reset)) as Onvif_PTZ_Zoom_Reset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reset create() => Onvif_PTZ_Zoom_Reset._();
  Onvif_PTZ_Zoom_Reset createEmptyInstance() => create();
  static $pb.PbList<Onvif_PTZ_Zoom_Reset> createRepeated() => $pb.PbList<Onvif_PTZ_Zoom_Reset>();
  @$core.pragma('dart2js:noInline')
  static Onvif_PTZ_Zoom_Reset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Onvif_PTZ_Zoom_Reset>(create);
  static Onvif_PTZ_Zoom_Reset? _defaultInstance;

  @$pb.TagNumber(201)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(201)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(201)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(201)
  void clearID() => clearField(201);
}

class updateUserAddress_Request extends $pb.GeneratedMessage {
  factory updateUserAddress_Request({
    $core.String? newAddress,
    $core.String? newDisplayName,
    $core.String? email,
    $core.String? tel,
  }) {
    final $result = create();
    if (newAddress != null) {
      $result.newAddress = newAddress;
    }
    if (newDisplayName != null) {
      $result.newDisplayName = newDisplayName;
    }
    if (email != null) {
      $result.email = email;
    }
    if (tel != null) {
      $result.tel = tel;
    }
    return $result;
  }
  updateUserAddress_Request._() : super();
  factory updateUserAddress_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateUserAddress_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateUserAddress.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'newAddress', protoName: 'newAddress')
    ..aOS(2, _omitFieldNames ? '' : 'newDisplayName', protoName: 'newDisplayName')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'tel')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateUserAddress_Request clone() => updateUserAddress_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateUserAddress_Request copyWith(void Function(updateUserAddress_Request) updates) => super.copyWith((message) => updates(message as updateUserAddress_Request)) as updateUserAddress_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateUserAddress_Request create() => updateUserAddress_Request._();
  updateUserAddress_Request createEmptyInstance() => create();
  static $pb.PbList<updateUserAddress_Request> createRepeated() => $pb.PbList<updateUserAddress_Request>();
  @$core.pragma('dart2js:noInline')
  static updateUserAddress_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateUserAddress_Request>(create);
  static updateUserAddress_Request? _defaultInstance;

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
}

class updateUserAddress_Reply extends $pb.GeneratedMessage {
  factory updateUserAddress_Reply() => create();
  updateUserAddress_Reply._() : super();
  factory updateUserAddress_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateUserAddress_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateUserAddress.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateUserAddress_Reply clone() => updateUserAddress_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateUserAddress_Reply copyWith(void Function(updateUserAddress_Reply) updates) => super.copyWith((message) => updates(message as updateUserAddress_Reply)) as updateUserAddress_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateUserAddress_Reply create() => updateUserAddress_Reply._();
  updateUserAddress_Reply createEmptyInstance() => create();
  static $pb.PbList<updateUserAddress_Reply> createRepeated() => $pb.PbList<updateUserAddress_Reply>();
  @$core.pragma('dart2js:noInline')
  static updateUserAddress_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateUserAddress_Reply>(create);
  static updateUserAddress_Reply? _defaultInstance;
}

class updateUserAddress extends $pb.GeneratedMessage {
  factory updateUserAddress({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  updateUserAddress._() : super();
  factory updateUserAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateUserAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateUserAddress', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(202, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateUserAddress clone() => updateUserAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateUserAddress copyWith(void Function(updateUserAddress) updates) => super.copyWith((message) => updates(message as updateUserAddress)) as updateUserAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateUserAddress create() => updateUserAddress._();
  updateUserAddress createEmptyInstance() => create();
  static $pb.PbList<updateUserAddress> createRepeated() => $pb.PbList<updateUserAddress>();
  @$core.pragma('dart2js:noInline')
  static updateUserAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateUserAddress>(create);
  static updateUserAddress? _defaultInstance;

  @$pb.TagNumber(202)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(202)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(202)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(202)
  void clearID() => clearField(202);
}

class AddGroupCamera_Request extends $pb.GeneratedMessage {
  factory AddGroupCamera_Request({
    $core.String? groupName,
    $core.List<$core.int>? parentGroupId,
  }) {
    final $result = create();
    if (groupName != null) {
      $result.groupName = groupName;
    }
    if (parentGroupId != null) {
      $result.parentGroupId = parentGroupId;
    }
    return $result;
  }
  AddGroupCamera_Request._() : super();
  factory AddGroupCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddGroupCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddGroupCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupName')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'parentGroupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddGroupCamera_Request clone() => AddGroupCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddGroupCamera_Request copyWith(void Function(AddGroupCamera_Request) updates) => super.copyWith((message) => updates(message as AddGroupCamera_Request)) as AddGroupCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddGroupCamera_Request create() => AddGroupCamera_Request._();
  AddGroupCamera_Request createEmptyInstance() => create();
  static $pb.PbList<AddGroupCamera_Request> createRepeated() => $pb.PbList<AddGroupCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static AddGroupCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddGroupCamera_Request>(create);
  static AddGroupCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get parentGroupId => $_getN(1);
  @$pb.TagNumber(2)
  set parentGroupId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentGroupId() => clearField(2);
}

class AddGroupCamera_Reply extends $pb.GeneratedMessage {
  factory AddGroupCamera_Reply({
    $core.Iterable<$1.DeviceGroup>? groups,
  }) {
    final $result = create();
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    return $result;
  }
  AddGroupCamera_Reply._() : super();
  factory AddGroupCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddGroupCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddGroupCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.DeviceGroup>(1, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddGroupCamera_Reply clone() => AddGroupCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddGroupCamera_Reply copyWith(void Function(AddGroupCamera_Reply) updates) => super.copyWith((message) => updates(message as AddGroupCamera_Reply)) as AddGroupCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddGroupCamera_Reply create() => AddGroupCamera_Reply._();
  AddGroupCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<AddGroupCamera_Reply> createRepeated() => $pb.PbList<AddGroupCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddGroupCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddGroupCamera_Reply>(create);
  static AddGroupCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.DeviceGroup> get groups => $_getList(0);
}

class AddGroupCamera extends $pb.GeneratedMessage {
  factory AddGroupCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddGroupCamera._() : super();
  factory AddGroupCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddGroupCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddGroupCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(203, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddGroupCamera clone() => AddGroupCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddGroupCamera copyWith(void Function(AddGroupCamera) updates) => super.copyWith((message) => updates(message as AddGroupCamera)) as AddGroupCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddGroupCamera create() => AddGroupCamera._();
  AddGroupCamera createEmptyInstance() => create();
  static $pb.PbList<AddGroupCamera> createRepeated() => $pb.PbList<AddGroupCamera>();
  @$core.pragma('dart2js:noInline')
  static AddGroupCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddGroupCamera>(create);
  static AddGroupCamera? _defaultInstance;

  @$pb.TagNumber(203)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(203)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(203)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(203)
  void clearID() => clearField(203);
}

class RemoveGroupCamera_Request extends $pb.GeneratedMessage {
  factory RemoveGroupCamera_Request({
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  RemoveGroupCamera_Request._() : super();
  factory RemoveGroupCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveGroupCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveGroupCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveGroupCamera_Request clone() => RemoveGroupCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveGroupCamera_Request copyWith(void Function(RemoveGroupCamera_Request) updates) => super.copyWith((message) => updates(message as RemoveGroupCamera_Request)) as RemoveGroupCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveGroupCamera_Request create() => RemoveGroupCamera_Request._();
  RemoveGroupCamera_Request createEmptyInstance() => create();
  static $pb.PbList<RemoveGroupCamera_Request> createRepeated() => $pb.PbList<RemoveGroupCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static RemoveGroupCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveGroupCamera_Request>(create);
  static RemoveGroupCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);
}

class RemoveGroupCamera_Reply extends $pb.GeneratedMessage {
  factory RemoveGroupCamera_Reply({
    $core.Iterable<$1.DeviceGroup>? groups,
  }) {
    final $result = create();
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    return $result;
  }
  RemoveGroupCamera_Reply._() : super();
  factory RemoveGroupCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveGroupCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveGroupCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.DeviceGroup>(1, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveGroupCamera_Reply clone() => RemoveGroupCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveGroupCamera_Reply copyWith(void Function(RemoveGroupCamera_Reply) updates) => super.copyWith((message) => updates(message as RemoveGroupCamera_Reply)) as RemoveGroupCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveGroupCamera_Reply create() => RemoveGroupCamera_Reply._();
  RemoveGroupCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<RemoveGroupCamera_Reply> createRepeated() => $pb.PbList<RemoveGroupCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static RemoveGroupCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveGroupCamera_Reply>(create);
  static RemoveGroupCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.DeviceGroup> get groups => $_getList(0);
}

class RemoveGroupCamera extends $pb.GeneratedMessage {
  factory RemoveGroupCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RemoveGroupCamera._() : super();
  factory RemoveGroupCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveGroupCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveGroupCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(204, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveGroupCamera clone() => RemoveGroupCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveGroupCamera copyWith(void Function(RemoveGroupCamera) updates) => super.copyWith((message) => updates(message as RemoveGroupCamera)) as RemoveGroupCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveGroupCamera create() => RemoveGroupCamera._();
  RemoveGroupCamera createEmptyInstance() => create();
  static $pb.PbList<RemoveGroupCamera> createRepeated() => $pb.PbList<RemoveGroupCamera>();
  @$core.pragma('dart2js:noInline')
  static RemoveGroupCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveGroupCamera>(create);
  static RemoveGroupCamera? _defaultInstance;

  @$pb.TagNumber(204)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(204)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(204)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(204)
  void clearID() => clearField(204);
}

class AddCameraToGroup_Request extends $pb.GeneratedMessage {
  factory AddCameraToGroup_Request({
    $core.Iterable<$core.List<$core.int>>? cameraId,
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId.addAll(cameraId);
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  AddCameraToGroup_Request._() : super();
  factory AddCameraToGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraToGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraToGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraToGroup_Request clone() => AddCameraToGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraToGroup_Request copyWith(void Function(AddCameraToGroup_Request) updates) => super.copyWith((message) => updates(message as AddCameraToGroup_Request)) as AddCameraToGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraToGroup_Request create() => AddCameraToGroup_Request._();
  AddCameraToGroup_Request createEmptyInstance() => create();
  static $pb.PbList<AddCameraToGroup_Request> createRepeated() => $pb.PbList<AddCameraToGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCameraToGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraToGroup_Request>(create);
  static AddCameraToGroup_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get cameraId => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get groupId => $_getN(1);
  @$pb.TagNumber(2)
  set groupId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);
}

class AddCameraToGroup_Reply extends $pb.GeneratedMessage {
  factory AddCameraToGroup_Reply({
    $core.Iterable<$1.Camera>? camera,
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera.addAll(camera);
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  AddCameraToGroup_Reply._() : super();
  factory AddCameraToGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraToGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraToGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'camera', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraToGroup_Reply clone() => AddCameraToGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraToGroup_Reply copyWith(void Function(AddCameraToGroup_Reply) updates) => super.copyWith((message) => updates(message as AddCameraToGroup_Reply)) as AddCameraToGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraToGroup_Reply create() => AddCameraToGroup_Reply._();
  AddCameraToGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCameraToGroup_Reply> createRepeated() => $pb.PbList<AddCameraToGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCameraToGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraToGroup_Reply>(create);
  static AddCameraToGroup_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get camera => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get groupId => $_getN(1);
  @$pb.TagNumber(2)
  set groupId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);
}

class AddCameraToGroup extends $pb.GeneratedMessage {
  factory AddCameraToGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCameraToGroup._() : super();
  factory AddCameraToGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraToGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraToGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(205, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraToGroup clone() => AddCameraToGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraToGroup copyWith(void Function(AddCameraToGroup) updates) => super.copyWith((message) => updates(message as AddCameraToGroup)) as AddCameraToGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraToGroup create() => AddCameraToGroup._();
  AddCameraToGroup createEmptyInstance() => create();
  static $pb.PbList<AddCameraToGroup> createRepeated() => $pb.PbList<AddCameraToGroup>();
  @$core.pragma('dart2js:noInline')
  static AddCameraToGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraToGroup>(create);
  static AddCameraToGroup? _defaultInstance;

  @$pb.TagNumber(205)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(205)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(205)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(205)
  void clearID() => clearField(205);
}

class ReceiveAddCameraToGroup extends $pb.GeneratedMessage {
  factory ReceiveAddCameraToGroup({
    $core.List<$core.int>? groupId,
    $core.Iterable<$1.Camera>? camera,
    $core.int? rECEIVEADDCAMERATOGROUP,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (camera != null) {
      $result.camera.addAll(camera);
    }
    if (rECEIVEADDCAMERATOGROUP != null) {
      $result.rECEIVEADDCAMERATOGROUP = rECEIVEADDCAMERATOGROUP;
    }
    return $result;
  }
  ReceiveAddCameraToGroup._() : super();
  factory ReceiveAddCameraToGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveAddCameraToGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveAddCameraToGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..pc<$1.Camera>(2, _omitFieldNames ? '' : 'camera', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..a<$core.int>(69, _omitFieldNames ? '' : 'RECEIVEADDCAMERATOGROUP', $pb.PbFieldType.OU3, protoName: 'RECEIVE_ADD_CAMERA_TO_GROUP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveAddCameraToGroup clone() => ReceiveAddCameraToGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveAddCameraToGroup copyWith(void Function(ReceiveAddCameraToGroup) updates) => super.copyWith((message) => updates(message as ReceiveAddCameraToGroup)) as ReceiveAddCameraToGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveAddCameraToGroup create() => ReceiveAddCameraToGroup._();
  ReceiveAddCameraToGroup createEmptyInstance() => create();
  static $pb.PbList<ReceiveAddCameraToGroup> createRepeated() => $pb.PbList<ReceiveAddCameraToGroup>();
  @$core.pragma('dart2js:noInline')
  static ReceiveAddCameraToGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveAddCameraToGroup>(create);
  static ReceiveAddCameraToGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.Camera> get camera => $_getList(1);

  @$pb.TagNumber(69)
  $core.int get rECEIVEADDCAMERATOGROUP => $_getIZ(2);
  @$pb.TagNumber(69)
  set rECEIVEADDCAMERATOGROUP($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(69)
  $core.bool hasRECEIVEADDCAMERATOGROUP() => $_has(2);
  @$pb.TagNumber(69)
  void clearRECEIVEADDCAMERATOGROUP() => clearField(69);
}

class RemoveCameraFormGroup_Request extends $pb.GeneratedMessage {
  factory RemoveCameraFormGroup_Request({
    $core.List<$core.int>? cameraId,
    $core.List<$core.int>? groupId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  RemoveCameraFormGroup_Request._() : super();
  factory RemoveCameraFormGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveCameraFormGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveCameraFormGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveCameraFormGroup_Request clone() => RemoveCameraFormGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveCameraFormGroup_Request copyWith(void Function(RemoveCameraFormGroup_Request) updates) => super.copyWith((message) => updates(message as RemoveCameraFormGroup_Request)) as RemoveCameraFormGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveCameraFormGroup_Request create() => RemoveCameraFormGroup_Request._();
  RemoveCameraFormGroup_Request createEmptyInstance() => create();
  static $pb.PbList<RemoveCameraFormGroup_Request> createRepeated() => $pb.PbList<RemoveCameraFormGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static RemoveCameraFormGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveCameraFormGroup_Request>(create);
  static RemoveCameraFormGroup_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get groupId => $_getN(1);
  @$pb.TagNumber(2)
  set groupId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);
}

class RemoveCameraFormGroup_Reply extends $pb.GeneratedMessage {
  factory RemoveCameraFormGroup_Reply({
    $core.List<$core.int>? groupId,
    $core.List<$core.int>? cameraId,
    $core.int? groupLevel,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (groupLevel != null) {
      $result.groupLevel = groupLevel;
    }
    return $result;
  }
  RemoveCameraFormGroup_Reply._() : super();
  factory RemoveCameraFormGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveCameraFormGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveCameraFormGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'groupLevel', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveCameraFormGroup_Reply clone() => RemoveCameraFormGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveCameraFormGroup_Reply copyWith(void Function(RemoveCameraFormGroup_Reply) updates) => super.copyWith((message) => updates(message as RemoveCameraFormGroup_Reply)) as RemoveCameraFormGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveCameraFormGroup_Reply create() => RemoveCameraFormGroup_Reply._();
  RemoveCameraFormGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<RemoveCameraFormGroup_Reply> createRepeated() => $pb.PbList<RemoveCameraFormGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static RemoveCameraFormGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveCameraFormGroup_Reply>(create);
  static RemoveCameraFormGroup_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupLevel($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupLevel() => clearField(3);
}

class RemoveCameraFormGroup extends $pb.GeneratedMessage {
  factory RemoveCameraFormGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RemoveCameraFormGroup._() : super();
  factory RemoveCameraFormGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveCameraFormGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveCameraFormGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(206, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveCameraFormGroup clone() => RemoveCameraFormGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveCameraFormGroup copyWith(void Function(RemoveCameraFormGroup) updates) => super.copyWith((message) => updates(message as RemoveCameraFormGroup)) as RemoveCameraFormGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveCameraFormGroup create() => RemoveCameraFormGroup._();
  RemoveCameraFormGroup createEmptyInstance() => create();
  static $pb.PbList<RemoveCameraFormGroup> createRepeated() => $pb.PbList<RemoveCameraFormGroup>();
  @$core.pragma('dart2js:noInline')
  static RemoveCameraFormGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveCameraFormGroup>(create);
  static RemoveCameraFormGroup? _defaultInstance;

  @$pb.TagNumber(206)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(206)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(206)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(206)
  void clearID() => clearField(206);
}

class ReceiveRemoveCameraFormGroup extends $pb.GeneratedMessage {
  factory ReceiveRemoveCameraFormGroup({
    $core.List<$core.int>? groupId,
    $core.List<$core.int>? cameraId,
    $core.int? groupLevel,
    $1.Camera? camera,
    $core.int? rECEIVEREMOVECAMERAFORMGROUP,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (groupLevel != null) {
      $result.groupLevel = groupLevel;
    }
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVEREMOVECAMERAFORMGROUP != null) {
      $result.rECEIVEREMOVECAMERAFORMGROUP = rECEIVEREMOVECAMERAFORMGROUP;
    }
    return $result;
  }
  ReceiveRemoveCameraFormGroup._() : super();
  factory ReceiveRemoveCameraFormGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveRemoveCameraFormGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveRemoveCameraFormGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'groupLevel', $pb.PbFieldType.OU3)
    ..aOM<$1.Camera>(4, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(70, _omitFieldNames ? '' : 'RECEIVEREMOVECAMERAFORMGROUP', $pb.PbFieldType.OU3, protoName: 'RECEIVE_REMOVE_CAMERA_FORM_GROUP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveRemoveCameraFormGroup clone() => ReceiveRemoveCameraFormGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveRemoveCameraFormGroup copyWith(void Function(ReceiveRemoveCameraFormGroup) updates) => super.copyWith((message) => updates(message as ReceiveRemoveCameraFormGroup)) as ReceiveRemoveCameraFormGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveRemoveCameraFormGroup create() => ReceiveRemoveCameraFormGroup._();
  ReceiveRemoveCameraFormGroup createEmptyInstance() => create();
  static $pb.PbList<ReceiveRemoveCameraFormGroup> createRepeated() => $pb.PbList<ReceiveRemoveCameraFormGroup>();
  @$core.pragma('dart2js:noInline')
  static ReceiveRemoveCameraFormGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveRemoveCameraFormGroup>(create);
  static ReceiveRemoveCameraFormGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cameraId => $_getN(1);
  @$pb.TagNumber(2)
  set cameraId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupLevel($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupLevel() => clearField(3);

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

  @$pb.TagNumber(70)
  $core.int get rECEIVEREMOVECAMERAFORMGROUP => $_getIZ(4);
  @$pb.TagNumber(70)
  set rECEIVEREMOVECAMERAFORMGROUP($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(70)
  $core.bool hasRECEIVEREMOVECAMERAFORMGROUP() => $_has(4);
  @$pb.TagNumber(70)
  void clearRECEIVEREMOVECAMERAFORMGROUP() => clearField(70);
}

class GetCameraInGroup_Request extends $pb.GeneratedMessage {
  factory GetCameraInGroup_Request({
    $core.List<$core.int>? groupId,
    $core.bool? isRecursive,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (isRecursive != null) {
      $result.isRecursive = isRecursive;
    }
    return $result;
  }
  GetCameraInGroup_Request._() : super();
  factory GetCameraInGroup_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCameraInGroup_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCameraInGroup.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isRecursive')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCameraInGroup_Request clone() => GetCameraInGroup_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCameraInGroup_Request copyWith(void Function(GetCameraInGroup_Request) updates) => super.copyWith((message) => updates(message as GetCameraInGroup_Request)) as GetCameraInGroup_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCameraInGroup_Request create() => GetCameraInGroup_Request._();
  GetCameraInGroup_Request createEmptyInstance() => create();
  static $pb.PbList<GetCameraInGroup_Request> createRepeated() => $pb.PbList<GetCameraInGroup_Request>();
  @$core.pragma('dart2js:noInline')
  static GetCameraInGroup_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCameraInGroup_Request>(create);
  static GetCameraInGroup_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRecursive => $_getBF(1);
  @$pb.TagNumber(2)
  set isRecursive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRecursive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRecursive() => clearField(2);
}

class GetCameraInGroup_Reply extends $pb.GeneratedMessage {
  factory GetCameraInGroup_Reply({
    $core.Iterable<$1.Camera>? cameras,
  }) {
    final $result = create();
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    return $result;
  }
  GetCameraInGroup_Reply._() : super();
  factory GetCameraInGroup_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCameraInGroup_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCameraInGroup.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.Camera>(1, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PM, subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCameraInGroup_Reply clone() => GetCameraInGroup_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCameraInGroup_Reply copyWith(void Function(GetCameraInGroup_Reply) updates) => super.copyWith((message) => updates(message as GetCameraInGroup_Reply)) as GetCameraInGroup_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCameraInGroup_Reply create() => GetCameraInGroup_Reply._();
  GetCameraInGroup_Reply createEmptyInstance() => create();
  static $pb.PbList<GetCameraInGroup_Reply> createRepeated() => $pb.PbList<GetCameraInGroup_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetCameraInGroup_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCameraInGroup_Reply>(create);
  static GetCameraInGroup_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Camera> get cameras => $_getList(0);
}

class GetCameraInGroup extends $pb.GeneratedMessage {
  factory GetCameraInGroup({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetCameraInGroup._() : super();
  factory GetCameraInGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCameraInGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCameraInGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(207, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCameraInGroup clone() => GetCameraInGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCameraInGroup copyWith(void Function(GetCameraInGroup) updates) => super.copyWith((message) => updates(message as GetCameraInGroup)) as GetCameraInGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCameraInGroup create() => GetCameraInGroup._();
  GetCameraInGroup createEmptyInstance() => create();
  static $pb.PbList<GetCameraInGroup> createRepeated() => $pb.PbList<GetCameraInGroup>();
  @$core.pragma('dart2js:noInline')
  static GetCameraInGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCameraInGroup>(create);
  static GetCameraInGroup? _defaultInstance;

  @$pb.TagNumber(207)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(207)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(207)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(207)
  void clearID() => clearField(207);
}

class UpdateGroupDevice_Request extends $pb.GeneratedMessage {
  factory UpdateGroupDevice_Request({
    $core.List<$core.int>? groupId,
    $core.List<$core.int>? parentGroup,
    $core.String? groupName,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (parentGroup != null) {
      $result.parentGroup = parentGroup;
    }
    if (groupName != null) {
      $result.groupName = groupName;
    }
    return $result;
  }
  UpdateGroupDevice_Request._() : super();
  factory UpdateGroupDevice_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGroupDevice_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGroupDevice.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'parentGroup', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'groupName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGroupDevice_Request clone() => UpdateGroupDevice_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGroupDevice_Request copyWith(void Function(UpdateGroupDevice_Request) updates) => super.copyWith((message) => updates(message as UpdateGroupDevice_Request)) as UpdateGroupDevice_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGroupDevice_Request create() => UpdateGroupDevice_Request._();
  UpdateGroupDevice_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateGroupDevice_Request> createRepeated() => $pb.PbList<UpdateGroupDevice_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateGroupDevice_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGroupDevice_Request>(create);
  static UpdateGroupDevice_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get groupId => $_getN(0);
  @$pb.TagNumber(1)
  set groupId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get parentGroup => $_getN(1);
  @$pb.TagNumber(2)
  set parentGroup($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentGroup() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupName => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupName() => clearField(3);
}

class UpdateGroupDevice_Reply extends $pb.GeneratedMessage {
  factory UpdateGroupDevice_Reply({
    $core.Iterable<$1.DeviceGroup>? groups,
  }) {
    final $result = create();
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    return $result;
  }
  UpdateGroupDevice_Reply._() : super();
  factory UpdateGroupDevice_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGroupDevice_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGroupDevice.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.DeviceGroup>(1, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: $1.DeviceGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGroupDevice_Reply clone() => UpdateGroupDevice_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGroupDevice_Reply copyWith(void Function(UpdateGroupDevice_Reply) updates) => super.copyWith((message) => updates(message as UpdateGroupDevice_Reply)) as UpdateGroupDevice_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGroupDevice_Reply create() => UpdateGroupDevice_Reply._();
  UpdateGroupDevice_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateGroupDevice_Reply> createRepeated() => $pb.PbList<UpdateGroupDevice_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateGroupDevice_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGroupDevice_Reply>(create);
  static UpdateGroupDevice_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.DeviceGroup> get groups => $_getList(0);
}

class UpdateGroupDevice extends $pb.GeneratedMessage {
  factory UpdateGroupDevice({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateGroupDevice._() : super();
  factory UpdateGroupDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGroupDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGroupDevice', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(208, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGroupDevice clone() => UpdateGroupDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGroupDevice copyWith(void Function(UpdateGroupDevice) updates) => super.copyWith((message) => updates(message as UpdateGroupDevice)) as UpdateGroupDevice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGroupDevice create() => UpdateGroupDevice._();
  UpdateGroupDevice createEmptyInstance() => create();
  static $pb.PbList<UpdateGroupDevice> createRepeated() => $pb.PbList<UpdateGroupDevice>();
  @$core.pragma('dart2js:noInline')
  static UpdateGroupDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGroupDevice>(create);
  static UpdateGroupDevice? _defaultInstance;

  @$pb.TagNumber(208)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(208)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(208)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(208)
  void clearID() => clearField(208);
}

class ConfigSendEmail_Request extends $pb.GeneratedMessage {
  factory ConfigSendEmail_Request({
    $core.bool? isSendEmail,
    $core.Iterable<$core.String>? emailReceive,
  }) {
    final $result = create();
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (emailReceive != null) {
      $result.emailReceive.addAll(emailReceive);
    }
    return $result;
  }
  ConfigSendEmail_Request._() : super();
  factory ConfigSendEmail_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigSendEmail_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigSendEmail.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(2, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..pPS(3, _omitFieldNames ? '' : 'emailReceive')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigSendEmail_Request clone() => ConfigSendEmail_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigSendEmail_Request copyWith(void Function(ConfigSendEmail_Request) updates) => super.copyWith((message) => updates(message as ConfigSendEmail_Request)) as ConfigSendEmail_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSendEmail_Request create() => ConfigSendEmail_Request._();
  ConfigSendEmail_Request createEmptyInstance() => create();
  static $pb.PbList<ConfigSendEmail_Request> createRepeated() => $pb.PbList<ConfigSendEmail_Request>();
  @$core.pragma('dart2js:noInline')
  static ConfigSendEmail_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigSendEmail_Request>(create);
  static ConfigSendEmail_Request? _defaultInstance;

  @$pb.TagNumber(2)
  $core.bool get isSendEmail => $_getBF(0);
  @$pb.TagNumber(2)
  set isSendEmail($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsSendEmail() => $_has(0);
  @$pb.TagNumber(2)
  void clearIsSendEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get emailReceive => $_getList(1);
}

class ConfigSendEmail_Reply extends $pb.GeneratedMessage {
  factory ConfigSendEmail_Reply() => create();
  ConfigSendEmail_Reply._() : super();
  factory ConfigSendEmail_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigSendEmail_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigSendEmail.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigSendEmail_Reply clone() => ConfigSendEmail_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigSendEmail_Reply copyWith(void Function(ConfigSendEmail_Reply) updates) => super.copyWith((message) => updates(message as ConfigSendEmail_Reply)) as ConfigSendEmail_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSendEmail_Reply create() => ConfigSendEmail_Reply._();
  ConfigSendEmail_Reply createEmptyInstance() => create();
  static $pb.PbList<ConfigSendEmail_Reply> createRepeated() => $pb.PbList<ConfigSendEmail_Reply>();
  @$core.pragma('dart2js:noInline')
  static ConfigSendEmail_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigSendEmail_Reply>(create);
  static ConfigSendEmail_Reply? _defaultInstance;
}

class ConfigSendEmail extends $pb.GeneratedMessage {
  factory ConfigSendEmail({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ConfigSendEmail._() : super();
  factory ConfigSendEmail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigSendEmail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigSendEmail', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(209, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigSendEmail clone() => ConfigSendEmail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigSendEmail copyWith(void Function(ConfigSendEmail) updates) => super.copyWith((message) => updates(message as ConfigSendEmail)) as ConfigSendEmail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSendEmail create() => ConfigSendEmail._();
  ConfigSendEmail createEmptyInstance() => create();
  static $pb.PbList<ConfigSendEmail> createRepeated() => $pb.PbList<ConfigSendEmail>();
  @$core.pragma('dart2js:noInline')
  static ConfigSendEmail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigSendEmail>(create);
  static ConfigSendEmail? _defaultInstance;

  @$pb.TagNumber(209)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(209)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(209)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(209)
  void clearID() => clearField(209);
}

class ReceiveConfigSendEmail extends $pb.GeneratedMessage {
  factory ReceiveConfigSendEmail({
    $core.bool? isSendEmail,
    $core.Iterable<$core.String>? emailReceive,
    $core.int? rECEIVECONFIGSENDEMAIL,
  }) {
    final $result = create();
    if (isSendEmail != null) {
      $result.isSendEmail = isSendEmail;
    }
    if (emailReceive != null) {
      $result.emailReceive.addAll(emailReceive);
    }
    if (rECEIVECONFIGSENDEMAIL != null) {
      $result.rECEIVECONFIGSENDEMAIL = rECEIVECONFIGSENDEMAIL;
    }
    return $result;
  }
  ReceiveConfigSendEmail._() : super();
  factory ReceiveConfigSendEmail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveConfigSendEmail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveConfigSendEmail', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(2, _omitFieldNames ? '' : 'isSendEmail', protoName: 'isSendEmail')
    ..pPS(3, _omitFieldNames ? '' : 'emailReceive')
    ..a<$core.int>(72, _omitFieldNames ? '' : 'RECEIVECONFIGSENDEMAIL', $pb.PbFieldType.OU3, protoName: 'RECEIVE_CONFIG_SEND_EMAIL')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveConfigSendEmail clone() => ReceiveConfigSendEmail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveConfigSendEmail copyWith(void Function(ReceiveConfigSendEmail) updates) => super.copyWith((message) => updates(message as ReceiveConfigSendEmail)) as ReceiveConfigSendEmail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveConfigSendEmail create() => ReceiveConfigSendEmail._();
  ReceiveConfigSendEmail createEmptyInstance() => create();
  static $pb.PbList<ReceiveConfigSendEmail> createRepeated() => $pb.PbList<ReceiveConfigSendEmail>();
  @$core.pragma('dart2js:noInline')
  static ReceiveConfigSendEmail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveConfigSendEmail>(create);
  static ReceiveConfigSendEmail? _defaultInstance;

  @$pb.TagNumber(2)
  $core.bool get isSendEmail => $_getBF(0);
  @$pb.TagNumber(2)
  set isSendEmail($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsSendEmail() => $_has(0);
  @$pb.TagNumber(2)
  void clearIsSendEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get emailReceive => $_getList(1);

  @$pb.TagNumber(72)
  $core.int get rECEIVECONFIGSENDEMAIL => $_getIZ(2);
  @$pb.TagNumber(72)
  set rECEIVECONFIGSENDEMAIL($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(72)
  $core.bool hasRECEIVECONFIGSENDEMAIL() => $_has(2);
  @$pb.TagNumber(72)
  void clearRECEIVECONFIGSENDEMAIL() => clearField(72);
}

class Config_RTSP_ONVIF_Motion_Detect_Request extends $pb.GeneratedMessage {
  factory Config_RTSP_ONVIF_Motion_Detect_Request({
    $core.List<$core.int>? cameraId,
    $core.bool? isEnableMd,
    Config_RTSP_ONVIF_Motion_Detect_Level? level,
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
    if (isEnableMd != null) {
      $result.isEnableMd = isEnableMd;
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
  Config_RTSP_ONVIF_Motion_Detect_Request._() : super();
  factory Config_RTSP_ONVIF_Motion_Detect_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Config_RTSP_ONVIF_Motion_Detect_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Config_RTSP_ONVIF_Motion_Detect.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'isEnableMd', protoName: 'isEnable_md')
    ..e<Config_RTSP_ONVIF_Motion_Detect_Level>(3, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: Config_RTSP_ONVIF_Motion_Detect_Level.LOW, valueOf: Config_RTSP_ONVIF_Motion_Detect_Level.valueOf, enumValues: Config_RTSP_ONVIF_Motion_Detect_Level.values)
    ..aOB(4, _omitFieldNames ? '' : 'isSendEmail')
    ..aOB(5, _omitFieldNames ? '' : 'isRecord')
    ..aOB(6, _omitFieldNames ? '' : 'isPushNotification', protoName: 'isPushNotification')
    ..pc<$1.Roi>(7, _omitFieldNames ? '' : 'rois', $pb.PbFieldType.PM, subBuilder: $1.Roi.create)
    ..aOB(8, _omitFieldNames ? '' : 'soundAlarm', protoName: 'soundAlarm')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Config_RTSP_ONVIF_Motion_Detect_Request clone() => Config_RTSP_ONVIF_Motion_Detect_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Config_RTSP_ONVIF_Motion_Detect_Request copyWith(void Function(Config_RTSP_ONVIF_Motion_Detect_Request) updates) => super.copyWith((message) => updates(message as Config_RTSP_ONVIF_Motion_Detect_Request)) as Config_RTSP_ONVIF_Motion_Detect_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Config_RTSP_ONVIF_Motion_Detect_Request create() => Config_RTSP_ONVIF_Motion_Detect_Request._();
  Config_RTSP_ONVIF_Motion_Detect_Request createEmptyInstance() => create();
  static $pb.PbList<Config_RTSP_ONVIF_Motion_Detect_Request> createRepeated() => $pb.PbList<Config_RTSP_ONVIF_Motion_Detect_Request>();
  @$core.pragma('dart2js:noInline')
  static Config_RTSP_ONVIF_Motion_Detect_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config_RTSP_ONVIF_Motion_Detect_Request>(create);
  static Config_RTSP_ONVIF_Motion_Detect_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isEnableMd => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnableMd($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnableMd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnableMd() => clearField(2);

  @$pb.TagNumber(3)
  Config_RTSP_ONVIF_Motion_Detect_Level get level => $_getN(2);
  @$pb.TagNumber(3)
  set level(Config_RTSP_ONVIF_Motion_Detect_Level v) { setField(3, v); }
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

class Config_RTSP_ONVIF_Motion_Detect_Reply extends $pb.GeneratedMessage {
  factory Config_RTSP_ONVIF_Motion_Detect_Reply({
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
  Config_RTSP_ONVIF_Motion_Detect_Reply._() : super();
  factory Config_RTSP_ONVIF_Motion_Detect_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Config_RTSP_ONVIF_Motion_Detect_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Config_RTSP_ONVIF_Motion_Detect.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..aOM<$1.Camera>(2, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Config_RTSP_ONVIF_Motion_Detect_Reply clone() => Config_RTSP_ONVIF_Motion_Detect_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Config_RTSP_ONVIF_Motion_Detect_Reply copyWith(void Function(Config_RTSP_ONVIF_Motion_Detect_Reply) updates) => super.copyWith((message) => updates(message as Config_RTSP_ONVIF_Motion_Detect_Reply)) as Config_RTSP_ONVIF_Motion_Detect_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Config_RTSP_ONVIF_Motion_Detect_Reply create() => Config_RTSP_ONVIF_Motion_Detect_Reply._();
  Config_RTSP_ONVIF_Motion_Detect_Reply createEmptyInstance() => create();
  static $pb.PbList<Config_RTSP_ONVIF_Motion_Detect_Reply> createRepeated() => $pb.PbList<Config_RTSP_ONVIF_Motion_Detect_Reply>();
  @$core.pragma('dart2js:noInline')
  static Config_RTSP_ONVIF_Motion_Detect_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config_RTSP_ONVIF_Motion_Detect_Reply>(create);
  static Config_RTSP_ONVIF_Motion_Detect_Reply? _defaultInstance;

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

class Config_RTSP_ONVIF_Motion_Detect extends $pb.GeneratedMessage {
  factory Config_RTSP_ONVIF_Motion_Detect({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Config_RTSP_ONVIF_Motion_Detect._() : super();
  factory Config_RTSP_ONVIF_Motion_Detect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Config_RTSP_ONVIF_Motion_Detect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Config_RTSP_ONVIF_Motion_Detect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(210, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Config_RTSP_ONVIF_Motion_Detect clone() => Config_RTSP_ONVIF_Motion_Detect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Config_RTSP_ONVIF_Motion_Detect copyWith(void Function(Config_RTSP_ONVIF_Motion_Detect) updates) => super.copyWith((message) => updates(message as Config_RTSP_ONVIF_Motion_Detect)) as Config_RTSP_ONVIF_Motion_Detect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Config_RTSP_ONVIF_Motion_Detect create() => Config_RTSP_ONVIF_Motion_Detect._();
  Config_RTSP_ONVIF_Motion_Detect createEmptyInstance() => create();
  static $pb.PbList<Config_RTSP_ONVIF_Motion_Detect> createRepeated() => $pb.PbList<Config_RTSP_ONVIF_Motion_Detect>();
  @$core.pragma('dart2js:noInline')
  static Config_RTSP_ONVIF_Motion_Detect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config_RTSP_ONVIF_Motion_Detect>(create);
  static Config_RTSP_ONVIF_Motion_Detect? _defaultInstance;

  @$pb.TagNumber(210)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(210)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(210)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(210)
  void clearID() => clearField(210);
}

class ReceiveConfig_RTSP_ONVIF_Motion_Detect extends $pb.GeneratedMessage {
  factory ReceiveConfig_RTSP_ONVIF_Motion_Detect({
    $1.Camera? camera,
    $core.int? rECEIVECONFIGRTSPONVIFMD,
  }) {
    final $result = create();
    if (camera != null) {
      $result.camera = camera;
    }
    if (rECEIVECONFIGRTSPONVIFMD != null) {
      $result.rECEIVECONFIGRTSPONVIFMD = rECEIVECONFIGRTSPONVIFMD;
    }
    return $result;
  }
  ReceiveConfig_RTSP_ONVIF_Motion_Detect._() : super();
  factory ReceiveConfig_RTSP_ONVIF_Motion_Detect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveConfig_RTSP_ONVIF_Motion_Detect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveConfig_RTSP_ONVIF_Motion_Detect', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.Camera>(8, _omitFieldNames ? '' : 'camera', subBuilder: $1.Camera.create)
    ..a<$core.int>(73, _omitFieldNames ? '' : 'RECEIVECONFIGRTSPONVIFMD', $pb.PbFieldType.OU3, protoName: 'RECEIVE_CONFIG_RTSP_ONVIF_MD')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveConfig_RTSP_ONVIF_Motion_Detect clone() => ReceiveConfig_RTSP_ONVIF_Motion_Detect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveConfig_RTSP_ONVIF_Motion_Detect copyWith(void Function(ReceiveConfig_RTSP_ONVIF_Motion_Detect) updates) => super.copyWith((message) => updates(message as ReceiveConfig_RTSP_ONVIF_Motion_Detect)) as ReceiveConfig_RTSP_ONVIF_Motion_Detect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveConfig_RTSP_ONVIF_Motion_Detect create() => ReceiveConfig_RTSP_ONVIF_Motion_Detect._();
  ReceiveConfig_RTSP_ONVIF_Motion_Detect createEmptyInstance() => create();
  static $pb.PbList<ReceiveConfig_RTSP_ONVIF_Motion_Detect> createRepeated() => $pb.PbList<ReceiveConfig_RTSP_ONVIF_Motion_Detect>();
  @$core.pragma('dart2js:noInline')
  static ReceiveConfig_RTSP_ONVIF_Motion_Detect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveConfig_RTSP_ONVIF_Motion_Detect>(create);
  static ReceiveConfig_RTSP_ONVIF_Motion_Detect? _defaultInstance;

  @$pb.TagNumber(8)
  $1.Camera get camera => $_getN(0);
  @$pb.TagNumber(8)
  set camera($1.Camera v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCamera() => $_has(0);
  @$pb.TagNumber(8)
  void clearCamera() => clearField(8);
  @$pb.TagNumber(8)
  $1.Camera ensureCamera() => $_ensure(0);

  @$pb.TagNumber(73)
  $core.int get rECEIVECONFIGRTSPONVIFMD => $_getIZ(1);
  @$pb.TagNumber(73)
  set rECEIVECONFIGRTSPONVIFMD($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(73)
  $core.bool hasRECEIVECONFIGRTSPONVIFMD() => $_has(1);
  @$pb.TagNumber(73)
  void clearRECEIVECONFIGRTSPONVIFMD() => clearField(73);
}

class PostEmap_Request extends $pb.GeneratedMessage {
  factory PostEmap_Request({
    $1.EmapInfo? emapInfo,
    $core.List<$core.int>? userId,
  }) {
    final $result = create();
    if (emapInfo != null) {
      $result.emapInfo = emapInfo;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  PostEmap_Request._() : super();
  factory PostEmap_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostEmap_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostEmap.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.EmapInfo>(1, _omitFieldNames ? '' : 'emapInfo', subBuilder: $1.EmapInfo.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostEmap_Request clone() => PostEmap_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostEmap_Request copyWith(void Function(PostEmap_Request) updates) => super.copyWith((message) => updates(message as PostEmap_Request)) as PostEmap_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostEmap_Request create() => PostEmap_Request._();
  PostEmap_Request createEmptyInstance() => create();
  static $pb.PbList<PostEmap_Request> createRepeated() => $pb.PbList<PostEmap_Request>();
  @$core.pragma('dart2js:noInline')
  static PostEmap_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostEmap_Request>(create);
  static PostEmap_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $1.EmapInfo get emapInfo => $_getN(0);
  @$pb.TagNumber(1)
  set emapInfo($1.EmapInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.EmapInfo ensureEmapInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class PostEmap_Reply extends $pb.GeneratedMessage {
  factory PostEmap_Reply({
    $1.EmapInfo? emapInfo,
  }) {
    final $result = create();
    if (emapInfo != null) {
      $result.emapInfo = emapInfo;
    }
    return $result;
  }
  PostEmap_Reply._() : super();
  factory PostEmap_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostEmap_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostEmap.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.EmapInfo>(1, _omitFieldNames ? '' : 'emapInfo', subBuilder: $1.EmapInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostEmap_Reply clone() => PostEmap_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostEmap_Reply copyWith(void Function(PostEmap_Reply) updates) => super.copyWith((message) => updates(message as PostEmap_Reply)) as PostEmap_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostEmap_Reply create() => PostEmap_Reply._();
  PostEmap_Reply createEmptyInstance() => create();
  static $pb.PbList<PostEmap_Reply> createRepeated() => $pb.PbList<PostEmap_Reply>();
  @$core.pragma('dart2js:noInline')
  static PostEmap_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostEmap_Reply>(create);
  static PostEmap_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.EmapInfo get emapInfo => $_getN(0);
  @$pb.TagNumber(1)
  set emapInfo($1.EmapInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.EmapInfo ensureEmapInfo() => $_ensure(0);
}

class PostEmap extends $pb.GeneratedMessage {
  factory PostEmap({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  PostEmap._() : super();
  factory PostEmap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostEmap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostEmap', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(215, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostEmap clone() => PostEmap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostEmap copyWith(void Function(PostEmap) updates) => super.copyWith((message) => updates(message as PostEmap)) as PostEmap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostEmap create() => PostEmap._();
  PostEmap createEmptyInstance() => create();
  static $pb.PbList<PostEmap> createRepeated() => $pb.PbList<PostEmap>();
  @$core.pragma('dart2js:noInline')
  static PostEmap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostEmap>(create);
  static PostEmap? _defaultInstance;

  @$pb.TagNumber(215)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(215)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(215)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(215)
  void clearID() => clearField(215);
}

class ReceivePostEmap extends $pb.GeneratedMessage {
  factory ReceivePostEmap({
    $1.EmapInfo? emapInfo,
    $core.int? rECEIVEPOSTEMAP,
  }) {
    final $result = create();
    if (emapInfo != null) {
      $result.emapInfo = emapInfo;
    }
    if (rECEIVEPOSTEMAP != null) {
      $result.rECEIVEPOSTEMAP = rECEIVEPOSTEMAP;
    }
    return $result;
  }
  ReceivePostEmap._() : super();
  factory ReceivePostEmap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceivePostEmap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceivePostEmap', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.EmapInfo>(1, _omitFieldNames ? '' : 'emapInfo', protoName: 'emapInfo', subBuilder: $1.EmapInfo.create)
    ..a<$core.int>(75, _omitFieldNames ? '' : 'RECEIVEPOSTEMAP', $pb.PbFieldType.OU3, protoName: 'RECEIVE_POST_EMAP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceivePostEmap clone() => ReceivePostEmap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceivePostEmap copyWith(void Function(ReceivePostEmap) updates) => super.copyWith((message) => updates(message as ReceivePostEmap)) as ReceivePostEmap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceivePostEmap create() => ReceivePostEmap._();
  ReceivePostEmap createEmptyInstance() => create();
  static $pb.PbList<ReceivePostEmap> createRepeated() => $pb.PbList<ReceivePostEmap>();
  @$core.pragma('dart2js:noInline')
  static ReceivePostEmap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceivePostEmap>(create);
  static ReceivePostEmap? _defaultInstance;

  @$pb.TagNumber(1)
  $1.EmapInfo get emapInfo => $_getN(0);
  @$pb.TagNumber(1)
  set emapInfo($1.EmapInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.EmapInfo ensureEmapInfo() => $_ensure(0);

  @$pb.TagNumber(75)
  $core.int get rECEIVEPOSTEMAP => $_getIZ(1);
  @$pb.TagNumber(75)
  set rECEIVEPOSTEMAP($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(75)
  $core.bool hasRECEIVEPOSTEMAP() => $_has(1);
  @$pb.TagNumber(75)
  void clearRECEIVEPOSTEMAP() => clearField(75);
}

class ListEmap_Request extends $pb.GeneratedMessage {
  factory ListEmap_Request() => create();
  ListEmap_Request._() : super();
  factory ListEmap_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEmap_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEmap.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEmap_Request clone() => ListEmap_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEmap_Request copyWith(void Function(ListEmap_Request) updates) => super.copyWith((message) => updates(message as ListEmap_Request)) as ListEmap_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmap_Request create() => ListEmap_Request._();
  ListEmap_Request createEmptyInstance() => create();
  static $pb.PbList<ListEmap_Request> createRepeated() => $pb.PbList<ListEmap_Request>();
  @$core.pragma('dart2js:noInline')
  static ListEmap_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEmap_Request>(create);
  static ListEmap_Request? _defaultInstance;
}

class ListEmap_Reply extends $pb.GeneratedMessage {
  factory ListEmap_Reply({
    $core.Iterable<$1.EmapInfo>? emapInfos,
  }) {
    final $result = create();
    if (emapInfos != null) {
      $result.emapInfos.addAll(emapInfos);
    }
    return $result;
  }
  ListEmap_Reply._() : super();
  factory ListEmap_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEmap_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEmap.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.EmapInfo>(1, _omitFieldNames ? '' : 'emapInfos', $pb.PbFieldType.PM, subBuilder: $1.EmapInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEmap_Reply clone() => ListEmap_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEmap_Reply copyWith(void Function(ListEmap_Reply) updates) => super.copyWith((message) => updates(message as ListEmap_Reply)) as ListEmap_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmap_Reply create() => ListEmap_Reply._();
  ListEmap_Reply createEmptyInstance() => create();
  static $pb.PbList<ListEmap_Reply> createRepeated() => $pb.PbList<ListEmap_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListEmap_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEmap_Reply>(create);
  static ListEmap_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.EmapInfo> get emapInfos => $_getList(0);
}

class ListEmap extends $pb.GeneratedMessage {
  factory ListEmap({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListEmap._() : super();
  factory ListEmap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEmap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEmap', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(216, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEmap clone() => ListEmap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEmap copyWith(void Function(ListEmap) updates) => super.copyWith((message) => updates(message as ListEmap)) as ListEmap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmap create() => ListEmap._();
  ListEmap createEmptyInstance() => create();
  static $pb.PbList<ListEmap> createRepeated() => $pb.PbList<ListEmap>();
  @$core.pragma('dart2js:noInline')
  static ListEmap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEmap>(create);
  static ListEmap? _defaultInstance;

  @$pb.TagNumber(216)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(216)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(216)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(216)
  void clearID() => clearField(216);
}

class RemoveEmap_Request extends $pb.GeneratedMessage {
  factory RemoveEmap_Request({
    $core.List<$core.int>? emapId,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    return $result;
  }
  RemoveEmap_Request._() : super();
  factory RemoveEmap_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveEmap_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveEmap.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveEmap_Request clone() => RemoveEmap_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveEmap_Request copyWith(void Function(RemoveEmap_Request) updates) => super.copyWith((message) => updates(message as RemoveEmap_Request)) as RemoveEmap_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveEmap_Request create() => RemoveEmap_Request._();
  RemoveEmap_Request createEmptyInstance() => create();
  static $pb.PbList<RemoveEmap_Request> createRepeated() => $pb.PbList<RemoveEmap_Request>();
  @$core.pragma('dart2js:noInline')
  static RemoveEmap_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveEmap_Request>(create);
  static RemoveEmap_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);
}

class RemoveEmap_Reply extends $pb.GeneratedMessage {
  factory RemoveEmap_Reply({
    $core.List<$core.int>? emapId,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    return $result;
  }
  RemoveEmap_Reply._() : super();
  factory RemoveEmap_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveEmap_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveEmap.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveEmap_Reply clone() => RemoveEmap_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveEmap_Reply copyWith(void Function(RemoveEmap_Reply) updates) => super.copyWith((message) => updates(message as RemoveEmap_Reply)) as RemoveEmap_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveEmap_Reply create() => RemoveEmap_Reply._();
  RemoveEmap_Reply createEmptyInstance() => create();
  static $pb.PbList<RemoveEmap_Reply> createRepeated() => $pb.PbList<RemoveEmap_Reply>();
  @$core.pragma('dart2js:noInline')
  static RemoveEmap_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveEmap_Reply>(create);
  static RemoveEmap_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);
}

class RemoveEmap extends $pb.GeneratedMessage {
  factory RemoveEmap({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RemoveEmap._() : super();
  factory RemoveEmap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveEmap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveEmap', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(217, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveEmap clone() => RemoveEmap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveEmap copyWith(void Function(RemoveEmap) updates) => super.copyWith((message) => updates(message as RemoveEmap)) as RemoveEmap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveEmap create() => RemoveEmap._();
  RemoveEmap createEmptyInstance() => create();
  static $pb.PbList<RemoveEmap> createRepeated() => $pb.PbList<RemoveEmap>();
  @$core.pragma('dart2js:noInline')
  static RemoveEmap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveEmap>(create);
  static RemoveEmap? _defaultInstance;

  @$pb.TagNumber(217)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(217)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(217)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(217)
  void clearID() => clearField(217);
}

class ReceiveDeleteEmap extends $pb.GeneratedMessage {
  factory ReceiveDeleteEmap({
    $core.List<$core.int>? emapId,
    $core.int? rECEIVEDELETEEMAP,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    if (rECEIVEDELETEEMAP != null) {
      $result.rECEIVEDELETEEMAP = rECEIVEDELETEEMAP;
    }
    return $result;
  }
  ReceiveDeleteEmap._() : super();
  factory ReceiveDeleteEmap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveDeleteEmap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveDeleteEmap', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..a<$core.int>(76, _omitFieldNames ? '' : 'RECEIVEDELETEEMAP', $pb.PbFieldType.OU3, protoName: 'RECEIVE_DELETE_EMAP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveDeleteEmap clone() => ReceiveDeleteEmap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveDeleteEmap copyWith(void Function(ReceiveDeleteEmap) updates) => super.copyWith((message) => updates(message as ReceiveDeleteEmap)) as ReceiveDeleteEmap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteEmap create() => ReceiveDeleteEmap._();
  ReceiveDeleteEmap createEmptyInstance() => create();
  static $pb.PbList<ReceiveDeleteEmap> createRepeated() => $pb.PbList<ReceiveDeleteEmap>();
  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteEmap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveDeleteEmap>(create);
  static ReceiveDeleteEmap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);

  @$pb.TagNumber(76)
  $core.int get rECEIVEDELETEEMAP => $_getIZ(1);
  @$pb.TagNumber(76)
  set rECEIVEDELETEEMAP($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(76)
  $core.bool hasRECEIVEDELETEEMAP() => $_has(1);
  @$pb.TagNumber(76)
  void clearRECEIVEDELETEEMAP() => clearField(76);
}

class AddCameraEmapInfo_Request extends $pb.GeneratedMessage {
  factory AddCameraEmapInfo_Request({
    $core.List<$core.int>? emapId,
    $1.CameraEmapInfo? info,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    if (info != null) {
      $result.info = info;
    }
    return $result;
  }
  AddCameraEmapInfo_Request._() : super();
  factory AddCameraEmapInfo_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraEmapInfo_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraEmapInfo.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..aOM<$1.CameraEmapInfo>(2, _omitFieldNames ? '' : 'info', subBuilder: $1.CameraEmapInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraEmapInfo_Request clone() => AddCameraEmapInfo_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraEmapInfo_Request copyWith(void Function(AddCameraEmapInfo_Request) updates) => super.copyWith((message) => updates(message as AddCameraEmapInfo_Request)) as AddCameraEmapInfo_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraEmapInfo_Request create() => AddCameraEmapInfo_Request._();
  AddCameraEmapInfo_Request createEmptyInstance() => create();
  static $pb.PbList<AddCameraEmapInfo_Request> createRepeated() => $pb.PbList<AddCameraEmapInfo_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCameraEmapInfo_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraEmapInfo_Request>(create);
  static AddCameraEmapInfo_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);

  @$pb.TagNumber(2)
  $1.CameraEmapInfo get info => $_getN(1);
  @$pb.TagNumber(2)
  set info($1.CameraEmapInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => clearField(2);
  @$pb.TagNumber(2)
  $1.CameraEmapInfo ensureInfo() => $_ensure(1);
}

class AddCameraEmapInfo_Reply extends $pb.GeneratedMessage {
  factory AddCameraEmapInfo_Reply({
    $1.CameraEmapInfo? info,
  }) {
    final $result = create();
    if (info != null) {
      $result.info = info;
    }
    return $result;
  }
  AddCameraEmapInfo_Reply._() : super();
  factory AddCameraEmapInfo_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraEmapInfo_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraEmapInfo.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CameraEmapInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: $1.CameraEmapInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraEmapInfo_Reply clone() => AddCameraEmapInfo_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraEmapInfo_Reply copyWith(void Function(AddCameraEmapInfo_Reply) updates) => super.copyWith((message) => updates(message as AddCameraEmapInfo_Reply)) as AddCameraEmapInfo_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraEmapInfo_Reply create() => AddCameraEmapInfo_Reply._();
  AddCameraEmapInfo_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCameraEmapInfo_Reply> createRepeated() => $pb.PbList<AddCameraEmapInfo_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCameraEmapInfo_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraEmapInfo_Reply>(create);
  static AddCameraEmapInfo_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CameraEmapInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info($1.CameraEmapInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.CameraEmapInfo ensureInfo() => $_ensure(0);
}

class AddCameraEmapInfo extends $pb.GeneratedMessage {
  factory AddCameraEmapInfo({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCameraEmapInfo._() : super();
  factory AddCameraEmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCameraEmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCameraEmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(219, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCameraEmapInfo clone() => AddCameraEmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCameraEmapInfo copyWith(void Function(AddCameraEmapInfo) updates) => super.copyWith((message) => updates(message as AddCameraEmapInfo)) as AddCameraEmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCameraEmapInfo create() => AddCameraEmapInfo._();
  AddCameraEmapInfo createEmptyInstance() => create();
  static $pb.PbList<AddCameraEmapInfo> createRepeated() => $pb.PbList<AddCameraEmapInfo>();
  @$core.pragma('dart2js:noInline')
  static AddCameraEmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCameraEmapInfo>(create);
  static AddCameraEmapInfo? _defaultInstance;

  @$pb.TagNumber(219)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(219)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(219)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(219)
  void clearID() => clearField(219);
}

class ReceiveAddCameraEmapInfo extends $pb.GeneratedMessage {
  factory ReceiveAddCameraEmapInfo({
    $1.CameraEmapInfo? info,
    $core.int? rECEIVEADDRECEIVEINFO,
  }) {
    final $result = create();
    if (info != null) {
      $result.info = info;
    }
    if (rECEIVEADDRECEIVEINFO != null) {
      $result.rECEIVEADDRECEIVEINFO = rECEIVEADDRECEIVEINFO;
    }
    return $result;
  }
  ReceiveAddCameraEmapInfo._() : super();
  factory ReceiveAddCameraEmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveAddCameraEmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveAddCameraEmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CameraEmapInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: $1.CameraEmapInfo.create)
    ..a<$core.int>(78, _omitFieldNames ? '' : 'RECEIVEADDRECEIVEINFO', $pb.PbFieldType.OU3, protoName: 'RECEIVE_ADD_RECEIVE_INFO')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveAddCameraEmapInfo clone() => ReceiveAddCameraEmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveAddCameraEmapInfo copyWith(void Function(ReceiveAddCameraEmapInfo) updates) => super.copyWith((message) => updates(message as ReceiveAddCameraEmapInfo)) as ReceiveAddCameraEmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveAddCameraEmapInfo create() => ReceiveAddCameraEmapInfo._();
  ReceiveAddCameraEmapInfo createEmptyInstance() => create();
  static $pb.PbList<ReceiveAddCameraEmapInfo> createRepeated() => $pb.PbList<ReceiveAddCameraEmapInfo>();
  @$core.pragma('dart2js:noInline')
  static ReceiveAddCameraEmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveAddCameraEmapInfo>(create);
  static ReceiveAddCameraEmapInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CameraEmapInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info($1.CameraEmapInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.CameraEmapInfo ensureInfo() => $_ensure(0);

  @$pb.TagNumber(78)
  $core.int get rECEIVEADDRECEIVEINFO => $_getIZ(1);
  @$pb.TagNumber(78)
  set rECEIVEADDRECEIVEINFO($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(78)
  $core.bool hasRECEIVEADDRECEIVEINFO() => $_has(1);
  @$pb.TagNumber(78)
  void clearRECEIVEADDRECEIVEINFO() => clearField(78);
}

class ListCameraEmapInfo_Request extends $pb.GeneratedMessage {
  factory ListCameraEmapInfo_Request({
    $core.List<$core.int>? emapId,
  }) {
    final $result = create();
    if (emapId != null) {
      $result.emapId = emapId;
    }
    return $result;
  }
  ListCameraEmapInfo_Request._() : super();
  factory ListCameraEmapInfo_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCameraEmapInfo_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCameraEmapInfo.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'emapId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCameraEmapInfo_Request clone() => ListCameraEmapInfo_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCameraEmapInfo_Request copyWith(void Function(ListCameraEmapInfo_Request) updates) => super.copyWith((message) => updates(message as ListCameraEmapInfo_Request)) as ListCameraEmapInfo_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCameraEmapInfo_Request create() => ListCameraEmapInfo_Request._();
  ListCameraEmapInfo_Request createEmptyInstance() => create();
  static $pb.PbList<ListCameraEmapInfo_Request> createRepeated() => $pb.PbList<ListCameraEmapInfo_Request>();
  @$core.pragma('dart2js:noInline')
  static ListCameraEmapInfo_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCameraEmapInfo_Request>(create);
  static ListCameraEmapInfo_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get emapId => $_getN(0);
  @$pb.TagNumber(1)
  set emapId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmapId() => clearField(1);
}

class ListCameraEmapInfo_Reply extends $pb.GeneratedMessage {
  factory ListCameraEmapInfo_Reply({
    $core.Iterable<$1.CameraEmapInfo>? emapInfos,
  }) {
    final $result = create();
    if (emapInfos != null) {
      $result.emapInfos.addAll(emapInfos);
    }
    return $result;
  }
  ListCameraEmapInfo_Reply._() : super();
  factory ListCameraEmapInfo_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCameraEmapInfo_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCameraEmapInfo.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.CameraEmapInfo>(1, _omitFieldNames ? '' : 'emapInfos', $pb.PbFieldType.PM, subBuilder: $1.CameraEmapInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCameraEmapInfo_Reply clone() => ListCameraEmapInfo_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCameraEmapInfo_Reply copyWith(void Function(ListCameraEmapInfo_Reply) updates) => super.copyWith((message) => updates(message as ListCameraEmapInfo_Reply)) as ListCameraEmapInfo_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCameraEmapInfo_Reply create() => ListCameraEmapInfo_Reply._();
  ListCameraEmapInfo_Reply createEmptyInstance() => create();
  static $pb.PbList<ListCameraEmapInfo_Reply> createRepeated() => $pb.PbList<ListCameraEmapInfo_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListCameraEmapInfo_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCameraEmapInfo_Reply>(create);
  static ListCameraEmapInfo_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.CameraEmapInfo> get emapInfos => $_getList(0);
}

class ListCameraEmapInfo extends $pb.GeneratedMessage {
  factory ListCameraEmapInfo({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListCameraEmapInfo._() : super();
  factory ListCameraEmapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCameraEmapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCameraEmapInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(220, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCameraEmapInfo clone() => ListCameraEmapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCameraEmapInfo copyWith(void Function(ListCameraEmapInfo) updates) => super.copyWith((message) => updates(message as ListCameraEmapInfo)) as ListCameraEmapInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCameraEmapInfo create() => ListCameraEmapInfo._();
  ListCameraEmapInfo createEmptyInstance() => create();
  static $pb.PbList<ListCameraEmapInfo> createRepeated() => $pb.PbList<ListCameraEmapInfo>();
  @$core.pragma('dart2js:noInline')
  static ListCameraEmapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCameraEmapInfo>(create);
  static ListCameraEmapInfo? _defaultInstance;

  @$pb.TagNumber(220)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(220)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(220)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(220)
  void clearID() => clearField(220);
}

class GetListCustomLiveView_Request extends $pb.GeneratedMessage {
  factory GetListCustomLiveView_Request() => create();
  GetListCustomLiveView_Request._() : super();
  factory GetListCustomLiveView_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListCustomLiveView_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListCustomLiveView.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListCustomLiveView_Request clone() => GetListCustomLiveView_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListCustomLiveView_Request copyWith(void Function(GetListCustomLiveView_Request) updates) => super.copyWith((message) => updates(message as GetListCustomLiveView_Request)) as GetListCustomLiveView_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListCustomLiveView_Request create() => GetListCustomLiveView_Request._();
  GetListCustomLiveView_Request createEmptyInstance() => create();
  static $pb.PbList<GetListCustomLiveView_Request> createRepeated() => $pb.PbList<GetListCustomLiveView_Request>();
  @$core.pragma('dart2js:noInline')
  static GetListCustomLiveView_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListCustomLiveView_Request>(create);
  static GetListCustomLiveView_Request? _defaultInstance;
}

class GetListCustomLiveView_Reply extends $pb.GeneratedMessage {
  factory GetListCustomLiveView_Reply({
    $core.Iterable<$1.CustomLiveView>? customs,
  }) {
    final $result = create();
    if (customs != null) {
      $result.customs.addAll(customs);
    }
    return $result;
  }
  GetListCustomLiveView_Reply._() : super();
  factory GetListCustomLiveView_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListCustomLiveView_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListCustomLiveView.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.CustomLiveView>(1, _omitFieldNames ? '' : 'customs', $pb.PbFieldType.PM, subBuilder: $1.CustomLiveView.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListCustomLiveView_Reply clone() => GetListCustomLiveView_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListCustomLiveView_Reply copyWith(void Function(GetListCustomLiveView_Reply) updates) => super.copyWith((message) => updates(message as GetListCustomLiveView_Reply)) as GetListCustomLiveView_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListCustomLiveView_Reply create() => GetListCustomLiveView_Reply._();
  GetListCustomLiveView_Reply createEmptyInstance() => create();
  static $pb.PbList<GetListCustomLiveView_Reply> createRepeated() => $pb.PbList<GetListCustomLiveView_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetListCustomLiveView_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListCustomLiveView_Reply>(create);
  static GetListCustomLiveView_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.CustomLiveView> get customs => $_getList(0);
}

class GetListCustomLiveView extends $pb.GeneratedMessage {
  factory GetListCustomLiveView({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetListCustomLiveView._() : super();
  factory GetListCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(227, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListCustomLiveView clone() => GetListCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListCustomLiveView copyWith(void Function(GetListCustomLiveView) updates) => super.copyWith((message) => updates(message as GetListCustomLiveView)) as GetListCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListCustomLiveView create() => GetListCustomLiveView._();
  GetListCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<GetListCustomLiveView> createRepeated() => $pb.PbList<GetListCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static GetListCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListCustomLiveView>(create);
  static GetListCustomLiveView? _defaultInstance;

  @$pb.TagNumber(227)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(227)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(227)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(227)
  void clearID() => clearField(227);
}

class AddCustomLiveView_Request extends $pb.GeneratedMessage {
  factory AddCustomLiveView_Request({
    $1.Base_View? baseView,
    $core.Iterable<$1.LiveViewPosition>? position,
    $core.String? name,
  }) {
    final $result = create();
    if (baseView != null) {
      $result.baseView = baseView;
    }
    if (position != null) {
      $result.position.addAll(position);
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  AddCustomLiveView_Request._() : super();
  factory AddCustomLiveView_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCustomLiveView_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCustomLiveView.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<$1.Base_View>(1, _omitFieldNames ? '' : 'baseView', $pb.PbFieldType.OE, protoName: 'baseView', defaultOrMaker: $1.Base_View.V_1X1, valueOf: $1.Base_View.valueOf, enumValues: $1.Base_View.values)
    ..pc<$1.LiveViewPosition>(2, _omitFieldNames ? '' : 'position', $pb.PbFieldType.PM, subBuilder: $1.LiveViewPosition.create)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCustomLiveView_Request clone() => AddCustomLiveView_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCustomLiveView_Request copyWith(void Function(AddCustomLiveView_Request) updates) => super.copyWith((message) => updates(message as AddCustomLiveView_Request)) as AddCustomLiveView_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCustomLiveView_Request create() => AddCustomLiveView_Request._();
  AddCustomLiveView_Request createEmptyInstance() => create();
  static $pb.PbList<AddCustomLiveView_Request> createRepeated() => $pb.PbList<AddCustomLiveView_Request>();
  @$core.pragma('dart2js:noInline')
  static AddCustomLiveView_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCustomLiveView_Request>(create);
  static AddCustomLiveView_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Base_View get baseView => $_getN(0);
  @$pb.TagNumber(1)
  set baseView($1.Base_View v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseView() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseView() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.LiveViewPosition> get position => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class AddCustomLiveView_Reply extends $pb.GeneratedMessage {
  factory AddCustomLiveView_Reply({
    $1.CustomLiveView? customs,
  }) {
    final $result = create();
    if (customs != null) {
      $result.customs = customs;
    }
    return $result;
  }
  AddCustomLiveView_Reply._() : super();
  factory AddCustomLiveView_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCustomLiveView_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCustomLiveView.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CustomLiveView>(1, _omitFieldNames ? '' : 'customs', subBuilder: $1.CustomLiveView.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCustomLiveView_Reply clone() => AddCustomLiveView_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCustomLiveView_Reply copyWith(void Function(AddCustomLiveView_Reply) updates) => super.copyWith((message) => updates(message as AddCustomLiveView_Reply)) as AddCustomLiveView_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCustomLiveView_Reply create() => AddCustomLiveView_Reply._();
  AddCustomLiveView_Reply createEmptyInstance() => create();
  static $pb.PbList<AddCustomLiveView_Reply> createRepeated() => $pb.PbList<AddCustomLiveView_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddCustomLiveView_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCustomLiveView_Reply>(create);
  static AddCustomLiveView_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CustomLiveView get customs => $_getN(0);
  @$pb.TagNumber(1)
  set customs($1.CustomLiveView v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustoms() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustoms() => clearField(1);
  @$pb.TagNumber(1)
  $1.CustomLiveView ensureCustoms() => $_ensure(0);
}

class AddCustomLiveView extends $pb.GeneratedMessage {
  factory AddCustomLiveView({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddCustomLiveView._() : super();
  factory AddCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(228, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCustomLiveView clone() => AddCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCustomLiveView copyWith(void Function(AddCustomLiveView) updates) => super.copyWith((message) => updates(message as AddCustomLiveView)) as AddCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCustomLiveView create() => AddCustomLiveView._();
  AddCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<AddCustomLiveView> createRepeated() => $pb.PbList<AddCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static AddCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCustomLiveView>(create);
  static AddCustomLiveView? _defaultInstance;

  @$pb.TagNumber(228)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(228)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(228)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(228)
  void clearID() => clearField(228);
}

class ReceiveAddCustomLiveView extends $pb.GeneratedMessage {
  factory ReceiveAddCustomLiveView({
    $1.CustomLiveView? customs,
    $core.int? rECEIVEADDCUSTOMLIVEVIEW,
  }) {
    final $result = create();
    if (customs != null) {
      $result.customs = customs;
    }
    if (rECEIVEADDCUSTOMLIVEVIEW != null) {
      $result.rECEIVEADDCUSTOMLIVEVIEW = rECEIVEADDCUSTOMLIVEVIEW;
    }
    return $result;
  }
  ReceiveAddCustomLiveView._() : super();
  factory ReceiveAddCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveAddCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveAddCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CustomLiveView>(1, _omitFieldNames ? '' : 'customs', subBuilder: $1.CustomLiveView.create)
    ..a<$core.int>(86, _omitFieldNames ? '' : 'RECEIVEADDCUSTOMLIVEVIEW', $pb.PbFieldType.OU3, protoName: 'RECEIVE_ADD_CUSTOM_LIVE_VIEW')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveAddCustomLiveView clone() => ReceiveAddCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveAddCustomLiveView copyWith(void Function(ReceiveAddCustomLiveView) updates) => super.copyWith((message) => updates(message as ReceiveAddCustomLiveView)) as ReceiveAddCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveAddCustomLiveView create() => ReceiveAddCustomLiveView._();
  ReceiveAddCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<ReceiveAddCustomLiveView> createRepeated() => $pb.PbList<ReceiveAddCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static ReceiveAddCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveAddCustomLiveView>(create);
  static ReceiveAddCustomLiveView? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CustomLiveView get customs => $_getN(0);
  @$pb.TagNumber(1)
  set customs($1.CustomLiveView v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustoms() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustoms() => clearField(1);
  @$pb.TagNumber(1)
  $1.CustomLiveView ensureCustoms() => $_ensure(0);

  @$pb.TagNumber(86)
  $core.int get rECEIVEADDCUSTOMLIVEVIEW => $_getIZ(1);
  @$pb.TagNumber(86)
  set rECEIVEADDCUSTOMLIVEVIEW($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(86)
  $core.bool hasRECEIVEADDCUSTOMLIVEVIEW() => $_has(1);
  @$pb.TagNumber(86)
  void clearRECEIVEADDCUSTOMLIVEVIEW() => clearField(86);
}

class UpdateCustomLiveView_Request extends $pb.GeneratedMessage {
  factory UpdateCustomLiveView_Request({
    $1.CustomLiveView? customs,
  }) {
    final $result = create();
    if (customs != null) {
      $result.customs = customs;
    }
    return $result;
  }
  UpdateCustomLiveView_Request._() : super();
  factory UpdateCustomLiveView_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCustomLiveView_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCustomLiveView.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CustomLiveView>(1, _omitFieldNames ? '' : 'customs', subBuilder: $1.CustomLiveView.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCustomLiveView_Request clone() => UpdateCustomLiveView_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCustomLiveView_Request copyWith(void Function(UpdateCustomLiveView_Request) updates) => super.copyWith((message) => updates(message as UpdateCustomLiveView_Request)) as UpdateCustomLiveView_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCustomLiveView_Request create() => UpdateCustomLiveView_Request._();
  UpdateCustomLiveView_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateCustomLiveView_Request> createRepeated() => $pb.PbList<UpdateCustomLiveView_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateCustomLiveView_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCustomLiveView_Request>(create);
  static UpdateCustomLiveView_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CustomLiveView get customs => $_getN(0);
  @$pb.TagNumber(1)
  set customs($1.CustomLiveView v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustoms() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustoms() => clearField(1);
  @$pb.TagNumber(1)
  $1.CustomLiveView ensureCustoms() => $_ensure(0);
}

class UpdateCustomLiveView_Reply extends $pb.GeneratedMessage {
  factory UpdateCustomLiveView_Reply({
    $1.CustomLiveView? customs,
  }) {
    final $result = create();
    if (customs != null) {
      $result.customs = customs;
    }
    return $result;
  }
  UpdateCustomLiveView_Reply._() : super();
  factory UpdateCustomLiveView_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCustomLiveView_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCustomLiveView.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CustomLiveView>(1, _omitFieldNames ? '' : 'customs', subBuilder: $1.CustomLiveView.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCustomLiveView_Reply clone() => UpdateCustomLiveView_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCustomLiveView_Reply copyWith(void Function(UpdateCustomLiveView_Reply) updates) => super.copyWith((message) => updates(message as UpdateCustomLiveView_Reply)) as UpdateCustomLiveView_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCustomLiveView_Reply create() => UpdateCustomLiveView_Reply._();
  UpdateCustomLiveView_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateCustomLiveView_Reply> createRepeated() => $pb.PbList<UpdateCustomLiveView_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateCustomLiveView_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCustomLiveView_Reply>(create);
  static UpdateCustomLiveView_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CustomLiveView get customs => $_getN(0);
  @$pb.TagNumber(1)
  set customs($1.CustomLiveView v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustoms() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustoms() => clearField(1);
  @$pb.TagNumber(1)
  $1.CustomLiveView ensureCustoms() => $_ensure(0);
}

class UpdateCustomLiveView extends $pb.GeneratedMessage {
  factory UpdateCustomLiveView({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateCustomLiveView._() : super();
  factory UpdateCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(229, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCustomLiveView clone() => UpdateCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCustomLiveView copyWith(void Function(UpdateCustomLiveView) updates) => super.copyWith((message) => updates(message as UpdateCustomLiveView)) as UpdateCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCustomLiveView create() => UpdateCustomLiveView._();
  UpdateCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<UpdateCustomLiveView> createRepeated() => $pb.PbList<UpdateCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static UpdateCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCustomLiveView>(create);
  static UpdateCustomLiveView? _defaultInstance;

  @$pb.TagNumber(229)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(229)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(229)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(229)
  void clearID() => clearField(229);
}

class ReceiveUpdateCustomLiveView extends $pb.GeneratedMessage {
  factory ReceiveUpdateCustomLiveView({
    $1.CustomLiveView? customs,
    $core.int? rECEIVEUPDATECUSTOMLIVEVIEW,
  }) {
    final $result = create();
    if (customs != null) {
      $result.customs = customs;
    }
    if (rECEIVEUPDATECUSTOMLIVEVIEW != null) {
      $result.rECEIVEUPDATECUSTOMLIVEVIEW = rECEIVEUPDATECUSTOMLIVEVIEW;
    }
    return $result;
  }
  ReceiveUpdateCustomLiveView._() : super();
  factory ReceiveUpdateCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveUpdateCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveUpdateCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$1.CustomLiveView>(1, _omitFieldNames ? '' : 'customs', subBuilder: $1.CustomLiveView.create)
    ..a<$core.int>(87, _omitFieldNames ? '' : 'RECEIVEUPDATECUSTOMLIVEVIEW', $pb.PbFieldType.OU3, protoName: 'RECEIVE_UPDATE_CUSTOM_LIVE_VIEW')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveUpdateCustomLiveView clone() => ReceiveUpdateCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveUpdateCustomLiveView copyWith(void Function(ReceiveUpdateCustomLiveView) updates) => super.copyWith((message) => updates(message as ReceiveUpdateCustomLiveView)) as ReceiveUpdateCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateCustomLiveView create() => ReceiveUpdateCustomLiveView._();
  ReceiveUpdateCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<ReceiveUpdateCustomLiveView> createRepeated() => $pb.PbList<ReceiveUpdateCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static ReceiveUpdateCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveUpdateCustomLiveView>(create);
  static ReceiveUpdateCustomLiveView? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CustomLiveView get customs => $_getN(0);
  @$pb.TagNumber(1)
  set customs($1.CustomLiveView v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustoms() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustoms() => clearField(1);
  @$pb.TagNumber(1)
  $1.CustomLiveView ensureCustoms() => $_ensure(0);

  @$pb.TagNumber(87)
  $core.int get rECEIVEUPDATECUSTOMLIVEVIEW => $_getIZ(1);
  @$pb.TagNumber(87)
  set rECEIVEUPDATECUSTOMLIVEVIEW($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(87)
  $core.bool hasRECEIVEUPDATECUSTOMLIVEVIEW() => $_has(1);
  @$pb.TagNumber(87)
  void clearRECEIVEUPDATECUSTOMLIVEVIEW() => clearField(87);
}

class DeleteCustomLiveView_Request extends $pb.GeneratedMessage {
  factory DeleteCustomLiveView_Request({
    $core.List<$core.int>? customsId,
  }) {
    final $result = create();
    if (customsId != null) {
      $result.customsId = customsId;
    }
    return $result;
  }
  DeleteCustomLiveView_Request._() : super();
  factory DeleteCustomLiveView_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCustomLiveView_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCustomLiveView.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'customsId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCustomLiveView_Request clone() => DeleteCustomLiveView_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCustomLiveView_Request copyWith(void Function(DeleteCustomLiveView_Request) updates) => super.copyWith((message) => updates(message as DeleteCustomLiveView_Request)) as DeleteCustomLiveView_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCustomLiveView_Request create() => DeleteCustomLiveView_Request._();
  DeleteCustomLiveView_Request createEmptyInstance() => create();
  static $pb.PbList<DeleteCustomLiveView_Request> createRepeated() => $pb.PbList<DeleteCustomLiveView_Request>();
  @$core.pragma('dart2js:noInline')
  static DeleteCustomLiveView_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCustomLiveView_Request>(create);
  static DeleteCustomLiveView_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get customsId => $_getN(0);
  @$pb.TagNumber(1)
  set customsId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustomsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomsId() => clearField(1);
}

class DeleteCustomLiveView_Reply extends $pb.GeneratedMessage {
  factory DeleteCustomLiveView_Reply({
    $core.List<$core.int>? customsId,
  }) {
    final $result = create();
    if (customsId != null) {
      $result.customsId = customsId;
    }
    return $result;
  }
  DeleteCustomLiveView_Reply._() : super();
  factory DeleteCustomLiveView_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCustomLiveView_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCustomLiveView.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'customsId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCustomLiveView_Reply clone() => DeleteCustomLiveView_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCustomLiveView_Reply copyWith(void Function(DeleteCustomLiveView_Reply) updates) => super.copyWith((message) => updates(message as DeleteCustomLiveView_Reply)) as DeleteCustomLiveView_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCustomLiveView_Reply create() => DeleteCustomLiveView_Reply._();
  DeleteCustomLiveView_Reply createEmptyInstance() => create();
  static $pb.PbList<DeleteCustomLiveView_Reply> createRepeated() => $pb.PbList<DeleteCustomLiveView_Reply>();
  @$core.pragma('dart2js:noInline')
  static DeleteCustomLiveView_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCustomLiveView_Reply>(create);
  static DeleteCustomLiveView_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get customsId => $_getN(0);
  @$pb.TagNumber(1)
  set customsId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustomsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomsId() => clearField(1);
}

class DeleteCustomLiveView extends $pb.GeneratedMessage {
  factory DeleteCustomLiveView({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DeleteCustomLiveView._() : super();
  factory DeleteCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(230, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCustomLiveView clone() => DeleteCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCustomLiveView copyWith(void Function(DeleteCustomLiveView) updates) => super.copyWith((message) => updates(message as DeleteCustomLiveView)) as DeleteCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCustomLiveView create() => DeleteCustomLiveView._();
  DeleteCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<DeleteCustomLiveView> createRepeated() => $pb.PbList<DeleteCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static DeleteCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCustomLiveView>(create);
  static DeleteCustomLiveView? _defaultInstance;

  @$pb.TagNumber(230)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(230)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(230)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(230)
  void clearID() => clearField(230);
}

class ReceiveDeleteCustomLiveView extends $pb.GeneratedMessage {
  factory ReceiveDeleteCustomLiveView({
    $core.List<$core.int>? customsId,
    $core.int? rECEIVEDELETECUSTOMLIVEVIEW,
  }) {
    final $result = create();
    if (customsId != null) {
      $result.customsId = customsId;
    }
    if (rECEIVEDELETECUSTOMLIVEVIEW != null) {
      $result.rECEIVEDELETECUSTOMLIVEVIEW = rECEIVEDELETECUSTOMLIVEVIEW;
    }
    return $result;
  }
  ReceiveDeleteCustomLiveView._() : super();
  factory ReceiveDeleteCustomLiveView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveDeleteCustomLiveView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveDeleteCustomLiveView', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'customsId', $pb.PbFieldType.OY)
    ..a<$core.int>(88, _omitFieldNames ? '' : 'RECEIVEDELETECUSTOMLIVEVIEW', $pb.PbFieldType.OU3, protoName: 'RECEIVE_DELETE_CUSTOM_LIVE_VIEW')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveDeleteCustomLiveView clone() => ReceiveDeleteCustomLiveView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveDeleteCustomLiveView copyWith(void Function(ReceiveDeleteCustomLiveView) updates) => super.copyWith((message) => updates(message as ReceiveDeleteCustomLiveView)) as ReceiveDeleteCustomLiveView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteCustomLiveView create() => ReceiveDeleteCustomLiveView._();
  ReceiveDeleteCustomLiveView createEmptyInstance() => create();
  static $pb.PbList<ReceiveDeleteCustomLiveView> createRepeated() => $pb.PbList<ReceiveDeleteCustomLiveView>();
  @$core.pragma('dart2js:noInline')
  static ReceiveDeleteCustomLiveView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveDeleteCustomLiveView>(create);
  static ReceiveDeleteCustomLiveView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get customsId => $_getN(0);
  @$pb.TagNumber(1)
  set customsId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustomsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomsId() => clearField(1);

  @$pb.TagNumber(88)
  $core.int get rECEIVEDELETECUSTOMLIVEVIEW => $_getIZ(1);
  @$pb.TagNumber(88)
  set rECEIVEDELETECUSTOMLIVEVIEW($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(88)
  $core.bool hasRECEIVEDELETECUSTOMLIVEVIEW() => $_has(1);
  @$pb.TagNumber(88)
  void clearRECEIVEDELETECUSTOMLIVEVIEW() => clearField(88);
}

class RequestURLDownload_Request extends $pb.GeneratedMessage {
  factory RequestURLDownload_Request({
    $core.List<$core.int>? cameraId,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.List<$core.int>? playbackId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (playbackId != null) {
      $result.playbackId = playbackId;
    }
    return $result;
  }
  RequestURLDownload_Request._() : super();
  factory RequestURLDownload_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestURLDownload_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestURLDownload.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'endTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'playbackId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestURLDownload_Request clone() => RequestURLDownload_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestURLDownload_Request copyWith(void Function(RequestURLDownload_Request) updates) => super.copyWith((message) => updates(message as RequestURLDownload_Request)) as RequestURLDownload_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestURLDownload_Request create() => RequestURLDownload_Request._();
  RequestURLDownload_Request createEmptyInstance() => create();
  static $pb.PbList<RequestURLDownload_Request> createRepeated() => $pb.PbList<RequestURLDownload_Request>();
  @$core.pragma('dart2js:noInline')
  static RequestURLDownload_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestURLDownload_Request>(create);
  static RequestURLDownload_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get playbackId => $_getN(3);
  @$pb.TagNumber(4)
  set playbackId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlaybackId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlaybackId() => clearField(4);
}

class RequestURLDownload_Reply extends $pb.GeneratedMessage {
  factory RequestURLDownload_Reply({
    $core.Iterable<$core.String>? urlDownload,
  }) {
    final $result = create();
    if (urlDownload != null) {
      $result.urlDownload.addAll(urlDownload);
    }
    return $result;
  }
  RequestURLDownload_Reply._() : super();
  factory RequestURLDownload_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestURLDownload_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestURLDownload.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'urlDownload')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestURLDownload_Reply clone() => RequestURLDownload_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestURLDownload_Reply copyWith(void Function(RequestURLDownload_Reply) updates) => super.copyWith((message) => updates(message as RequestURLDownload_Reply)) as RequestURLDownload_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestURLDownload_Reply create() => RequestURLDownload_Reply._();
  RequestURLDownload_Reply createEmptyInstance() => create();
  static $pb.PbList<RequestURLDownload_Reply> createRepeated() => $pb.PbList<RequestURLDownload_Reply>();
  @$core.pragma('dart2js:noInline')
  static RequestURLDownload_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestURLDownload_Reply>(create);
  static RequestURLDownload_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get urlDownload => $_getList(0);
}

class RequestURLDownload extends $pb.GeneratedMessage {
  factory RequestURLDownload({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RequestURLDownload._() : super();
  factory RequestURLDownload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestURLDownload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestURLDownload', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(231, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestURLDownload clone() => RequestURLDownload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestURLDownload copyWith(void Function(RequestURLDownload) updates) => super.copyWith((message) => updates(message as RequestURLDownload)) as RequestURLDownload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestURLDownload create() => RequestURLDownload._();
  RequestURLDownload createEmptyInstance() => create();
  static $pb.PbList<RequestURLDownload> createRepeated() => $pb.PbList<RequestURLDownload>();
  @$core.pragma('dart2js:noInline')
  static RequestURLDownload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestURLDownload>(create);
  static RequestURLDownload? _defaultInstance;

  @$pb.TagNumber(231)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(231)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(231)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(231)
  void clearID() => clearField(231);
}

class ResetOnvifCamera_Request extends $pb.GeneratedMessage {
  factory ResetOnvifCamera_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ResetOnvifCamera_Request._() : super();
  factory ResetOnvifCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetOnvifCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetOnvifCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetOnvifCamera_Request clone() => ResetOnvifCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetOnvifCamera_Request copyWith(void Function(ResetOnvifCamera_Request) updates) => super.copyWith((message) => updates(message as ResetOnvifCamera_Request)) as ResetOnvifCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetOnvifCamera_Request create() => ResetOnvifCamera_Request._();
  ResetOnvifCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ResetOnvifCamera_Request> createRepeated() => $pb.PbList<ResetOnvifCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ResetOnvifCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetOnvifCamera_Request>(create);
  static ResetOnvifCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ResetOnvifCamera_Reply extends $pb.GeneratedMessage {
  factory ResetOnvifCamera_Reply({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  ResetOnvifCamera_Reply._() : super();
  factory ResetOnvifCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetOnvifCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetOnvifCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetOnvifCamera_Reply clone() => ResetOnvifCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetOnvifCamera_Reply copyWith(void Function(ResetOnvifCamera_Reply) updates) => super.copyWith((message) => updates(message as ResetOnvifCamera_Reply)) as ResetOnvifCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetOnvifCamera_Reply create() => ResetOnvifCamera_Reply._();
  ResetOnvifCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ResetOnvifCamera_Reply> createRepeated() => $pb.PbList<ResetOnvifCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ResetOnvifCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetOnvifCamera_Reply>(create);
  static ResetOnvifCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class ResetOnvifCamera extends $pb.GeneratedMessage {
  factory ResetOnvifCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ResetOnvifCamera._() : super();
  factory ResetOnvifCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetOnvifCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetOnvifCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(232, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetOnvifCamera clone() => ResetOnvifCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetOnvifCamera copyWith(void Function(ResetOnvifCamera) updates) => super.copyWith((message) => updates(message as ResetOnvifCamera)) as ResetOnvifCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetOnvifCamera create() => ResetOnvifCamera._();
  ResetOnvifCamera createEmptyInstance() => create();
  static $pb.PbList<ResetOnvifCamera> createRepeated() => $pb.PbList<ResetOnvifCamera>();
  @$core.pragma('dart2js:noInline')
  static ResetOnvifCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetOnvifCamera>(create);
  static ResetOnvifCamera? _defaultInstance;

  @$pb.TagNumber(232)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(232)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(232)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(232)
  void clearID() => clearField(232);
}

class GetListStreamOnvifCamera_Request extends $pb.GeneratedMessage {
  factory GetListStreamOnvifCamera_Request({
    $core.List<$core.int>? cameraId,
  }) {
    final $result = create();
    if (cameraId != null) {
      $result.cameraId = cameraId;
    }
    return $result;
  }
  GetListStreamOnvifCamera_Request._() : super();
  factory GetListStreamOnvifCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListStreamOnvifCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListStreamOnvifCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cameraId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListStreamOnvifCamera_Request clone() => GetListStreamOnvifCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListStreamOnvifCamera_Request copyWith(void Function(GetListStreamOnvifCamera_Request) updates) => super.copyWith((message) => updates(message as GetListStreamOnvifCamera_Request)) as GetListStreamOnvifCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListStreamOnvifCamera_Request create() => GetListStreamOnvifCamera_Request._();
  GetListStreamOnvifCamera_Request createEmptyInstance() => create();
  static $pb.PbList<GetListStreamOnvifCamera_Request> createRepeated() => $pb.PbList<GetListStreamOnvifCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static GetListStreamOnvifCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListStreamOnvifCamera_Request>(create);
  static GetListStreamOnvifCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cameraId => $_getN(0);
  @$pb.TagNumber(1)
  set cameraId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraId() => clearField(1);
}

class GetListStreamOnvifCamera_Reply extends $pb.GeneratedMessage {
  factory GetListStreamOnvifCamera_Reply({
    $core.Iterable<$1.CameraStream>? stream,
  }) {
    final $result = create();
    if (stream != null) {
      $result.stream.addAll(stream);
    }
    return $result;
  }
  GetListStreamOnvifCamera_Reply._() : super();
  factory GetListStreamOnvifCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListStreamOnvifCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListStreamOnvifCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$1.CameraStream>(1, _omitFieldNames ? '' : 'stream', $pb.PbFieldType.PM, subBuilder: $1.CameraStream.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListStreamOnvifCamera_Reply clone() => GetListStreamOnvifCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListStreamOnvifCamera_Reply copyWith(void Function(GetListStreamOnvifCamera_Reply) updates) => super.copyWith((message) => updates(message as GetListStreamOnvifCamera_Reply)) as GetListStreamOnvifCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListStreamOnvifCamera_Reply create() => GetListStreamOnvifCamera_Reply._();
  GetListStreamOnvifCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<GetListStreamOnvifCamera_Reply> createRepeated() => $pb.PbList<GetListStreamOnvifCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetListStreamOnvifCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListStreamOnvifCamera_Reply>(create);
  static GetListStreamOnvifCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.CameraStream> get stream => $_getList(0);
}

class GetListStreamOnvifCamera extends $pb.GeneratedMessage {
  factory GetListStreamOnvifCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetListStreamOnvifCamera._() : super();
  factory GetListStreamOnvifCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListStreamOnvifCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListStreamOnvifCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(233, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListStreamOnvifCamera clone() => GetListStreamOnvifCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListStreamOnvifCamera copyWith(void Function(GetListStreamOnvifCamera) updates) => super.copyWith((message) => updates(message as GetListStreamOnvifCamera)) as GetListStreamOnvifCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListStreamOnvifCamera create() => GetListStreamOnvifCamera._();
  GetListStreamOnvifCamera createEmptyInstance() => create();
  static $pb.PbList<GetListStreamOnvifCamera> createRepeated() => $pb.PbList<GetListStreamOnvifCamera>();
  @$core.pragma('dart2js:noInline')
  static GetListStreamOnvifCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListStreamOnvifCamera>(create);
  static GetListStreamOnvifCamera? _defaultInstance;

  @$pb.TagNumber(233)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(233)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(233)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(233)
  void clearID() => clearField(233);
}

class GetNumberNotify_Request extends $pb.GeneratedMessage {
  factory GetNumberNotify_Request() => create();
  GetNumberNotify_Request._() : super();
  factory GetNumberNotify_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNumberNotify_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNumberNotify.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNumberNotify_Request clone() => GetNumberNotify_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNumberNotify_Request copyWith(void Function(GetNumberNotify_Request) updates) => super.copyWith((message) => updates(message as GetNumberNotify_Request)) as GetNumberNotify_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNumberNotify_Request create() => GetNumberNotify_Request._();
  GetNumberNotify_Request createEmptyInstance() => create();
  static $pb.PbList<GetNumberNotify_Request> createRepeated() => $pb.PbList<GetNumberNotify_Request>();
  @$core.pragma('dart2js:noInline')
  static GetNumberNotify_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNumberNotify_Request>(create);
  static GetNumberNotify_Request? _defaultInstance;
}

class GetNumberNotify_Reply extends $pb.GeneratedMessage {
  factory GetNumberNotify_Reply({
    $core.int? numberNotify,
  }) {
    final $result = create();
    if (numberNotify != null) {
      $result.numberNotify = numberNotify;
    }
    return $result;
  }
  GetNumberNotify_Reply._() : super();
  factory GetNumberNotify_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNumberNotify_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNumberNotify.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'numberNotify', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNumberNotify_Reply clone() => GetNumberNotify_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNumberNotify_Reply copyWith(void Function(GetNumberNotify_Reply) updates) => super.copyWith((message) => updates(message as GetNumberNotify_Reply)) as GetNumberNotify_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNumberNotify_Reply create() => GetNumberNotify_Reply._();
  GetNumberNotify_Reply createEmptyInstance() => create();
  static $pb.PbList<GetNumberNotify_Reply> createRepeated() => $pb.PbList<GetNumberNotify_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetNumberNotify_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNumberNotify_Reply>(create);
  static GetNumberNotify_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numberNotify => $_getIZ(0);
  @$pb.TagNumber(1)
  set numberNotify($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumberNotify() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumberNotify() => clearField(1);
}

class GetNumberNotify extends $pb.GeneratedMessage {
  factory GetNumberNotify({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetNumberNotify._() : super();
  factory GetNumberNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNumberNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNumberNotify', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(249, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNumberNotify clone() => GetNumberNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNumberNotify copyWith(void Function(GetNumberNotify) updates) => super.copyWith((message) => updates(message as GetNumberNotify)) as GetNumberNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNumberNotify create() => GetNumberNotify._();
  GetNumberNotify createEmptyInstance() => create();
  static $pb.PbList<GetNumberNotify> createRepeated() => $pb.PbList<GetNumberNotify>();
  @$core.pragma('dart2js:noInline')
  static GetNumberNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNumberNotify>(create);
  static GetNumberNotify? _defaultInstance;

  @$pb.TagNumber(249)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(249)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(249)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(249)
  void clearID() => clearField(249);
}

class checkQuotaAddCamera_Request extends $pb.GeneratedMessage {
  factory checkQuotaAddCamera_Request() => create();
  checkQuotaAddCamera_Request._() : super();
  factory checkQuotaAddCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory checkQuotaAddCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'checkQuotaAddCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  checkQuotaAddCamera_Request clone() => checkQuotaAddCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  checkQuotaAddCamera_Request copyWith(void Function(checkQuotaAddCamera_Request) updates) => super.copyWith((message) => updates(message as checkQuotaAddCamera_Request)) as checkQuotaAddCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static checkQuotaAddCamera_Request create() => checkQuotaAddCamera_Request._();
  checkQuotaAddCamera_Request createEmptyInstance() => create();
  static $pb.PbList<checkQuotaAddCamera_Request> createRepeated() => $pb.PbList<checkQuotaAddCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static checkQuotaAddCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<checkQuotaAddCamera_Request>(create);
  static checkQuotaAddCamera_Request? _defaultInstance;
}

class checkQuotaAddCamera_Reply extends $pb.GeneratedMessage {
  factory checkQuotaAddCamera_Reply({
    $core.bool? overQuota,
    $core.int? remainCamNumber,
  }) {
    final $result = create();
    if (overQuota != null) {
      $result.overQuota = overQuota;
    }
    if (remainCamNumber != null) {
      $result.remainCamNumber = remainCamNumber;
    }
    return $result;
  }
  checkQuotaAddCamera_Reply._() : super();
  factory checkQuotaAddCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory checkQuotaAddCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'checkQuotaAddCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'overQuota', protoName: 'overQuota')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'remainCamNumber', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  checkQuotaAddCamera_Reply clone() => checkQuotaAddCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  checkQuotaAddCamera_Reply copyWith(void Function(checkQuotaAddCamera_Reply) updates) => super.copyWith((message) => updates(message as checkQuotaAddCamera_Reply)) as checkQuotaAddCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static checkQuotaAddCamera_Reply create() => checkQuotaAddCamera_Reply._();
  checkQuotaAddCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<checkQuotaAddCamera_Reply> createRepeated() => $pb.PbList<checkQuotaAddCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static checkQuotaAddCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<checkQuotaAddCamera_Reply>(create);
  static checkQuotaAddCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get overQuota => $_getBF(0);
  @$pb.TagNumber(1)
  set overQuota($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOverQuota() => $_has(0);
  @$pb.TagNumber(1)
  void clearOverQuota() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get remainCamNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set remainCamNumber($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemainCamNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainCamNumber() => clearField(2);
}

class checkQuotaAddCamera extends $pb.GeneratedMessage {
  factory checkQuotaAddCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  checkQuotaAddCamera._() : super();
  factory checkQuotaAddCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory checkQuotaAddCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'checkQuotaAddCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(262, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  checkQuotaAddCamera clone() => checkQuotaAddCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  checkQuotaAddCamera copyWith(void Function(checkQuotaAddCamera) updates) => super.copyWith((message) => updates(message as checkQuotaAddCamera)) as checkQuotaAddCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static checkQuotaAddCamera create() => checkQuotaAddCamera._();
  checkQuotaAddCamera createEmptyInstance() => create();
  static $pb.PbList<checkQuotaAddCamera> createRepeated() => $pb.PbList<checkQuotaAddCamera>();
  @$core.pragma('dart2js:noInline')
  static checkQuotaAddCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<checkQuotaAddCamera>(create);
  static checkQuotaAddCamera? _defaultInstance;

  @$pb.TagNumber(262)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(262)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(262)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(262)
  void clearID() => clearField(262);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
