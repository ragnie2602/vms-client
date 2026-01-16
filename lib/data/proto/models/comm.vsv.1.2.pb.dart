//
//  Generated code. Do not modify.
//  source: comm.vsv.1.2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'comm.model.pb.dart' as $0;
import 'comm.model.pbenum.dart' as $0;

export 'comm.vsv.1.2.pbenum.dart';

class ListTag_Request extends $pb.GeneratedMessage {
  factory ListTag_Request() => create();
  ListTag_Request._() : super();
  factory ListTag_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTag_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTag.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTag_Request clone() => ListTag_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTag_Request copyWith(void Function(ListTag_Request) updates) => super.copyWith((message) => updates(message as ListTag_Request)) as ListTag_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTag_Request create() => ListTag_Request._();
  ListTag_Request createEmptyInstance() => create();
  static $pb.PbList<ListTag_Request> createRepeated() => $pb.PbList<ListTag_Request>();
  @$core.pragma('dart2js:noInline')
  static ListTag_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTag_Request>(create);
  static ListTag_Request? _defaultInstance;
}

class ListTag_Reply extends $pb.GeneratedMessage {
  factory ListTag_Reply({
    $core.Iterable<$0.CamTag>? tags,
  }) {
    final $result = create();
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  ListTag_Reply._() : super();
  factory ListTag_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTag_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTag.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$0.CamTag>(1, _omitFieldNames ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: $0.CamTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTag_Reply clone() => ListTag_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTag_Reply copyWith(void Function(ListTag_Reply) updates) => super.copyWith((message) => updates(message as ListTag_Reply)) as ListTag_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTag_Reply create() => ListTag_Reply._();
  ListTag_Reply createEmptyInstance() => create();
  static $pb.PbList<ListTag_Reply> createRepeated() => $pb.PbList<ListTag_Reply>();
  @$core.pragma('dart2js:noInline')
  static ListTag_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTag_Reply>(create);
  static ListTag_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.CamTag> get tags => $_getList(0);
}

class ListTag extends $pb.GeneratedMessage {
  factory ListTag({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ListTag._() : super();
  factory ListTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2000, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTag clone() => ListTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTag copyWith(void Function(ListTag) updates) => super.copyWith((message) => updates(message as ListTag)) as ListTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTag create() => ListTag._();
  ListTag createEmptyInstance() => create();
  static $pb.PbList<ListTag> createRepeated() => $pb.PbList<ListTag>();
  @$core.pragma('dart2js:noInline')
  static ListTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTag>(create);
  static ListTag? _defaultInstance;

  @$pb.TagNumber(2000)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2000)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2000)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2000)
  void clearID() => clearField(2000);
}

class AddTag_Request extends $pb.GeneratedMessage {
  factory AddTag_Request({
    $0.CamTag? tag,
  }) {
    final $result = create();
    if (tag != null) {
      $result.tag = tag;
    }
    return $result;
  }
  AddTag_Request._() : super();
  factory AddTag_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTag_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTag.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.CamTag>(1, _omitFieldNames ? '' : 'tag', subBuilder: $0.CamTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTag_Request clone() => AddTag_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTag_Request copyWith(void Function(AddTag_Request) updates) => super.copyWith((message) => updates(message as AddTag_Request)) as AddTag_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTag_Request create() => AddTag_Request._();
  AddTag_Request createEmptyInstance() => create();
  static $pb.PbList<AddTag_Request> createRepeated() => $pb.PbList<AddTag_Request>();
  @$core.pragma('dart2js:noInline')
  static AddTag_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTag_Request>(create);
  static AddTag_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CamTag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($0.CamTag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  $0.CamTag ensureTag() => $_ensure(0);
}

class AddTag_Reply extends $pb.GeneratedMessage {
  factory AddTag_Reply({
    $0.CamTag? tag,
  }) {
    final $result = create();
    if (tag != null) {
      $result.tag = tag;
    }
    return $result;
  }
  AddTag_Reply._() : super();
  factory AddTag_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTag_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTag.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.CamTag>(1, _omitFieldNames ? '' : 'tag', subBuilder: $0.CamTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTag_Reply clone() => AddTag_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTag_Reply copyWith(void Function(AddTag_Reply) updates) => super.copyWith((message) => updates(message as AddTag_Reply)) as AddTag_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTag_Reply create() => AddTag_Reply._();
  AddTag_Reply createEmptyInstance() => create();
  static $pb.PbList<AddTag_Reply> createRepeated() => $pb.PbList<AddTag_Reply>();
  @$core.pragma('dart2js:noInline')
  static AddTag_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTag_Reply>(create);
  static AddTag_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CamTag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($0.CamTag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  $0.CamTag ensureTag() => $_ensure(0);
}

class AddTag extends $pb.GeneratedMessage {
  factory AddTag({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  AddTag._() : super();
  factory AddTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2001, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTag clone() => AddTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTag copyWith(void Function(AddTag) updates) => super.copyWith((message) => updates(message as AddTag)) as AddTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTag create() => AddTag._();
  AddTag createEmptyInstance() => create();
  static $pb.PbList<AddTag> createRepeated() => $pb.PbList<AddTag>();
  @$core.pragma('dart2js:noInline')
  static AddTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTag>(create);
  static AddTag? _defaultInstance;

  @$pb.TagNumber(2001)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2001)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2001)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2001)
  void clearID() => clearField(2001);
}

class DelTag_Request extends $pb.GeneratedMessage {
  factory DelTag_Request({
    $core.List<$core.int>? tagId,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    return $result;
  }
  DelTag_Request._() : super();
  factory DelTag_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelTag_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelTag.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelTag_Request clone() => DelTag_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelTag_Request copyWith(void Function(DelTag_Request) updates) => super.copyWith((message) => updates(message as DelTag_Request)) as DelTag_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelTag_Request create() => DelTag_Request._();
  DelTag_Request createEmptyInstance() => create();
  static $pb.PbList<DelTag_Request> createRepeated() => $pb.PbList<DelTag_Request>();
  @$core.pragma('dart2js:noInline')
  static DelTag_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelTag_Request>(create);
  static DelTag_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get tagId => $_getN(0);
  @$pb.TagNumber(1)
  set tagId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);
}

class DelTag_Reply extends $pb.GeneratedMessage {
  factory DelTag_Reply() => create();
  DelTag_Reply._() : super();
  factory DelTag_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelTag_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelTag.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelTag_Reply clone() => DelTag_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelTag_Reply copyWith(void Function(DelTag_Reply) updates) => super.copyWith((message) => updates(message as DelTag_Reply)) as DelTag_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelTag_Reply create() => DelTag_Reply._();
  DelTag_Reply createEmptyInstance() => create();
  static $pb.PbList<DelTag_Reply> createRepeated() => $pb.PbList<DelTag_Reply>();
  @$core.pragma('dart2js:noInline')
  static DelTag_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelTag_Reply>(create);
  static DelTag_Reply? _defaultInstance;
}

class DelTag extends $pb.GeneratedMessage {
  factory DelTag({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  DelTag._() : super();
  factory DelTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2002, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelTag clone() => DelTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelTag copyWith(void Function(DelTag) updates) => super.copyWith((message) => updates(message as DelTag)) as DelTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelTag create() => DelTag._();
  DelTag createEmptyInstance() => create();
  static $pb.PbList<DelTag> createRepeated() => $pb.PbList<DelTag>();
  @$core.pragma('dart2js:noInline')
  static DelTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelTag>(create);
  static DelTag? _defaultInstance;

  @$pb.TagNumber(2002)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2002)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2002)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2002)
  void clearID() => clearField(2002);
}

class UpdateTag_Request extends $pb.GeneratedMessage {
  factory UpdateTag_Request({
    $0.CamTag? tag,
  }) {
    final $result = create();
    if (tag != null) {
      $result.tag = tag;
    }
    return $result;
  }
  UpdateTag_Request._() : super();
  factory UpdateTag_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTag_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTag.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.CamTag>(1, _omitFieldNames ? '' : 'tag', subBuilder: $0.CamTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTag_Request clone() => UpdateTag_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTag_Request copyWith(void Function(UpdateTag_Request) updates) => super.copyWith((message) => updates(message as UpdateTag_Request)) as UpdateTag_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTag_Request create() => UpdateTag_Request._();
  UpdateTag_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateTag_Request> createRepeated() => $pb.PbList<UpdateTag_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateTag_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTag_Request>(create);
  static UpdateTag_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CamTag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($0.CamTag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  $0.CamTag ensureTag() => $_ensure(0);
}

class UpdateTag_Reply extends $pb.GeneratedMessage {
  factory UpdateTag_Reply({
    $0.CamTag? tag,
  }) {
    final $result = create();
    if (tag != null) {
      $result.tag = tag;
    }
    return $result;
  }
  UpdateTag_Reply._() : super();
  factory UpdateTag_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTag_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTag.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.CamTag>(1, _omitFieldNames ? '' : 'tag', subBuilder: $0.CamTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTag_Reply clone() => UpdateTag_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTag_Reply copyWith(void Function(UpdateTag_Reply) updates) => super.copyWith((message) => updates(message as UpdateTag_Reply)) as UpdateTag_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTag_Reply create() => UpdateTag_Reply._();
  UpdateTag_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateTag_Reply> createRepeated() => $pb.PbList<UpdateTag_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateTag_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTag_Reply>(create);
  static UpdateTag_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CamTag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($0.CamTag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  $0.CamTag ensureTag() => $_ensure(0);
}

class UpdateTag extends $pb.GeneratedMessage {
  factory UpdateTag({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateTag._() : super();
  factory UpdateTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2003, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTag clone() => UpdateTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTag copyWith(void Function(UpdateTag) updates) => super.copyWith((message) => updates(message as UpdateTag)) as UpdateTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTag create() => UpdateTag._();
  UpdateTag createEmptyInstance() => create();
  static $pb.PbList<UpdateTag> createRepeated() => $pb.PbList<UpdateTag>();
  @$core.pragma('dart2js:noInline')
  static UpdateTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTag>(create);
  static UpdateTag? _defaultInstance;

  @$pb.TagNumber(2003)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2003)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2003)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2003)
  void clearID() => clearField(2003);
}

class ImportCamera_ImportCell extends $pb.GeneratedMessage {
  factory ImportCamera_ImportCell({
    $core.int? indexNumer,
    $0.CameraType? cameraType,
    $core.String? cameraName,
    $core.String? onvifXaadr,
    $core.String? userName,
    $core.String? password,
    $core.String? mainStream,
    $core.String? subStream,
    $core.int? error,
  }) {
    final $result = create();
    if (indexNumer != null) {
      $result.indexNumer = indexNumer;
    }
    if (cameraType != null) {
      $result.cameraType = cameraType;
    }
    if (cameraName != null) {
      $result.cameraName = cameraName;
    }
    if (onvifXaadr != null) {
      $result.onvifXaadr = onvifXaadr;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (password != null) {
      $result.password = password;
    }
    if (mainStream != null) {
      $result.mainStream = mainStream;
    }
    if (subStream != null) {
      $result.subStream = subStream;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  ImportCamera_ImportCell._() : super();
  factory ImportCamera_ImportCell.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImportCamera_ImportCell.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImportCamera.ImportCell', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'indexNumer', $pb.PbFieldType.OU3)
    ..e<$0.CameraType>(2, _omitFieldNames ? '' : 'cameraType', $pb.PbFieldType.OE, defaultOrMaker: $0.CameraType.UNKNOW, valueOf: $0.CameraType.valueOf, enumValues: $0.CameraType.values)
    ..aOS(3, _omitFieldNames ? '' : 'cameraName')
    ..aOS(4, _omitFieldNames ? '' : 'onvifXaadr')
    ..aOS(5, _omitFieldNames ? '' : 'userName')
    ..aOS(6, _omitFieldNames ? '' : 'password')
    ..aOS(7, _omitFieldNames ? '' : 'mainStream')
    ..aOS(8, _omitFieldNames ? '' : 'subStream')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImportCamera_ImportCell clone() => ImportCamera_ImportCell()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImportCamera_ImportCell copyWith(void Function(ImportCamera_ImportCell) updates) => super.copyWith((message) => updates(message as ImportCamera_ImportCell)) as ImportCamera_ImportCell;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImportCamera_ImportCell create() => ImportCamera_ImportCell._();
  ImportCamera_ImportCell createEmptyInstance() => create();
  static $pb.PbList<ImportCamera_ImportCell> createRepeated() => $pb.PbList<ImportCamera_ImportCell>();
  @$core.pragma('dart2js:noInline')
  static ImportCamera_ImportCell getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImportCamera_ImportCell>(create);
  static ImportCamera_ImportCell? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexNumer => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexNumer($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexNumer() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexNumer() => clearField(1);

  @$pb.TagNumber(2)
  $0.CameraType get cameraType => $_getN(1);
  @$pb.TagNumber(2)
  set cameraType($0.CameraType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cameraName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cameraName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get onvifXaadr => $_getSZ(3);
  @$pb.TagNumber(4)
  set onvifXaadr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOnvifXaadr() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnvifXaadr() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userName => $_getSZ(4);
  @$pb.TagNumber(5)
  set userName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserName() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get mainStream => $_getSZ(6);
  @$pb.TagNumber(7)
  set mainStream($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMainStream() => $_has(6);
  @$pb.TagNumber(7)
  void clearMainStream() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get subStream => $_getSZ(7);
  @$pb.TagNumber(8)
  set subStream($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSubStream() => $_has(7);
  @$pb.TagNumber(8)
  void clearSubStream() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get error => $_getIZ(8);
  @$pb.TagNumber(9)
  set error($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasError() => $_has(8);
  @$pb.TagNumber(9)
  void clearError() => clearField(9);
}

class ImportCamera_Request extends $pb.GeneratedMessage {
  factory ImportCamera_Request({
    $core.Iterable<ImportCamera_ImportCell>? cameras,
  }) {
    final $result = create();
    if (cameras != null) {
      $result.cameras.addAll(cameras);
    }
    return $result;
  }
  ImportCamera_Request._() : super();
  factory ImportCamera_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImportCamera_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImportCamera.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<ImportCamera_ImportCell>(1, _omitFieldNames ? '' : 'cameras', $pb.PbFieldType.PM, subBuilder: ImportCamera_ImportCell.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImportCamera_Request clone() => ImportCamera_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImportCamera_Request copyWith(void Function(ImportCamera_Request) updates) => super.copyWith((message) => updates(message as ImportCamera_Request)) as ImportCamera_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImportCamera_Request create() => ImportCamera_Request._();
  ImportCamera_Request createEmptyInstance() => create();
  static $pb.PbList<ImportCamera_Request> createRepeated() => $pb.PbList<ImportCamera_Request>();
  @$core.pragma('dart2js:noInline')
  static ImportCamera_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImportCamera_Request>(create);
  static ImportCamera_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImportCamera_ImportCell> get cameras => $_getList(0);
}

class ImportCamera_Reply extends $pb.GeneratedMessage {
  factory ImportCamera_Reply({
    $core.Iterable<$0.Camera>? caneras,
    $core.Iterable<ImportCamera_ImportCell>? cameraError,
  }) {
    final $result = create();
    if (caneras != null) {
      $result.caneras.addAll(caneras);
    }
    if (cameraError != null) {
      $result.cameraError.addAll(cameraError);
    }
    return $result;
  }
  ImportCamera_Reply._() : super();
  factory ImportCamera_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImportCamera_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImportCamera.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pc<$0.Camera>(1, _omitFieldNames ? '' : 'caneras', $pb.PbFieldType.PM, subBuilder: $0.Camera.create)
    ..pc<ImportCamera_ImportCell>(2, _omitFieldNames ? '' : 'cameraError', $pb.PbFieldType.PM, subBuilder: ImportCamera_ImportCell.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImportCamera_Reply clone() => ImportCamera_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImportCamera_Reply copyWith(void Function(ImportCamera_Reply) updates) => super.copyWith((message) => updates(message as ImportCamera_Reply)) as ImportCamera_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImportCamera_Reply create() => ImportCamera_Reply._();
  ImportCamera_Reply createEmptyInstance() => create();
  static $pb.PbList<ImportCamera_Reply> createRepeated() => $pb.PbList<ImportCamera_Reply>();
  @$core.pragma('dart2js:noInline')
  static ImportCamera_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImportCamera_Reply>(create);
  static ImportCamera_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Camera> get caneras => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ImportCamera_ImportCell> get cameraError => $_getList(1);
}

class ImportCamera extends $pb.GeneratedMessage {
  factory ImportCamera({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ImportCamera._() : super();
  factory ImportCamera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImportCamera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImportCamera', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2005, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImportCamera clone() => ImportCamera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImportCamera copyWith(void Function(ImportCamera) updates) => super.copyWith((message) => updates(message as ImportCamera)) as ImportCamera;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImportCamera create() => ImportCamera._();
  ImportCamera createEmptyInstance() => create();
  static $pb.PbList<ImportCamera> createRepeated() => $pb.PbList<ImportCamera>();
  @$core.pragma('dart2js:noInline')
  static ImportCamera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImportCamera>(create);
  static ImportCamera? _defaultInstance;

  @$pb.TagNumber(2005)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2005)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2005)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2005)
  void clearID() => clearField(2005);
}

class GetCameraInfo_Request extends $pb.GeneratedMessage {
  factory GetCameraInfo_Request({
    $core.List<$core.int>? camerasId,
  }) {
    final $result = create();
    if (camerasId != null) {
      $result.camerasId = camerasId;
    }
    return $result;
  }
  GetCameraInfo_Request._() : super();
  factory GetCameraInfo_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCameraInfo_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCameraInfo.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'camerasId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCameraInfo_Request clone() => GetCameraInfo_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCameraInfo_Request copyWith(void Function(GetCameraInfo_Request) updates) => super.copyWith((message) => updates(message as GetCameraInfo_Request)) as GetCameraInfo_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCameraInfo_Request create() => GetCameraInfo_Request._();
  GetCameraInfo_Request createEmptyInstance() => create();
  static $pb.PbList<GetCameraInfo_Request> createRepeated() => $pb.PbList<GetCameraInfo_Request>();
  @$core.pragma('dart2js:noInline')
  static GetCameraInfo_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCameraInfo_Request>(create);
  static GetCameraInfo_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get camerasId => $_getN(0);
  @$pb.TagNumber(1)
  set camerasId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCamerasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCamerasId() => clearField(1);
}

class GetCameraInfo_Reply extends $pb.GeneratedMessage {
  factory GetCameraInfo_Reply({
    $core.Iterable<$core.String>? infoData,
    $core.Iterable<$core.String>? valueData,
  }) {
    final $result = create();
    if (infoData != null) {
      $result.infoData.addAll(infoData);
    }
    if (valueData != null) {
      $result.valueData.addAll(valueData);
    }
    return $result;
  }
  GetCameraInfo_Reply._() : super();
  factory GetCameraInfo_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCameraInfo_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCameraInfo.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'infoData')
    ..pPS(2, _omitFieldNames ? '' : 'valueData')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCameraInfo_Reply clone() => GetCameraInfo_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCameraInfo_Reply copyWith(void Function(GetCameraInfo_Reply) updates) => super.copyWith((message) => updates(message as GetCameraInfo_Reply)) as GetCameraInfo_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCameraInfo_Reply create() => GetCameraInfo_Reply._();
  GetCameraInfo_Reply createEmptyInstance() => create();
  static $pb.PbList<GetCameraInfo_Reply> createRepeated() => $pb.PbList<GetCameraInfo_Reply>();
  @$core.pragma('dart2js:noInline')
  static GetCameraInfo_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCameraInfo_Reply>(create);
  static GetCameraInfo_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get infoData => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get valueData => $_getList(1);
}

class GetCameraInfo extends $pb.GeneratedMessage {
  factory GetCameraInfo({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  GetCameraInfo._() : super();
  factory GetCameraInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCameraInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCameraInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(2006, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCameraInfo clone() => GetCameraInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCameraInfo copyWith(void Function(GetCameraInfo) updates) => super.copyWith((message) => updates(message as GetCameraInfo)) as GetCameraInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCameraInfo create() => GetCameraInfo._();
  GetCameraInfo createEmptyInstance() => create();
  static $pb.PbList<GetCameraInfo> createRepeated() => $pb.PbList<GetCameraInfo>();
  @$core.pragma('dart2js:noInline')
  static GetCameraInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCameraInfo>(create);
  static GetCameraInfo? _defaultInstance;

  @$pb.TagNumber(2006)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(2006)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(2006)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(2006)
  void clearID() => clearField(2006);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
