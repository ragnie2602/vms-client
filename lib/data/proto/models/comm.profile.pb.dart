//
//  Generated code. Do not modify.
//  source: comm.profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'comm.model.pb.dart' as $0;
import 'comm.model.pbenum.dart' as $0;
import 'comm.profile.pbenum.dart';

export 'comm.profile.pbenum.dart';

class ReceiveProfile extends $pb.GeneratedMessage {
  factory ReceiveProfile({
    $core.int? type,
    $0.Profile? profile,
    $core.int? rECEIVEPROFILE,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (rECEIVEPROFILE != null) {
      $result.rECEIVEPROFILE = rECEIVEPROFILE;
    }
    return $result;
  }
  ReceiveProfile._() : super();
  factory ReceiveProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OU3)
    ..aOM<$0.Profile>(2, _omitFieldNames ? '' : 'profile', subBuilder: $0.Profile.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'RECEIVEPROFILE', $pb.PbFieldType.OU3, protoName: 'RECEIVE_PROFILE')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveProfile clone() => ReceiveProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveProfile copyWith(void Function(ReceiveProfile) updates) => super.copyWith((message) => updates(message as ReceiveProfile)) as ReceiveProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveProfile create() => ReceiveProfile._();
  ReceiveProfile createEmptyInstance() => create();
  static $pb.PbList<ReceiveProfile> createRepeated() => $pb.PbList<ReceiveProfile>();
  @$core.pragma('dart2js:noInline')
  static ReceiveProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveProfile>(create);
  static ReceiveProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $0.Profile get profile => $_getN(1);
  @$pb.TagNumber(2)
  set profile($0.Profile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfile() => clearField(2);
  @$pb.TagNumber(2)
  $0.Profile ensureProfile() => $_ensure(1);

  @$pb.TagNumber(4)
  $core.int get rECEIVEPROFILE => $_getIZ(2);
  @$pb.TagNumber(4)
  set rECEIVEPROFILE($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasRECEIVEPROFILE() => $_has(2);
  @$pb.TagNumber(4)
  void clearRECEIVEPROFILE() => clearField(4);
}

class KeepAlive_Request extends $pb.GeneratedMessage {
  factory KeepAlive_Request({
    $core.bool? idle,
  }) {
    final $result = create();
    if (idle != null) {
      $result.idle = idle;
    }
    return $result;
  }
  KeepAlive_Request._() : super();
  factory KeepAlive_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeepAlive_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KeepAlive.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'idle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeepAlive_Request clone() => KeepAlive_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeepAlive_Request copyWith(void Function(KeepAlive_Request) updates) => super.copyWith((message) => updates(message as KeepAlive_Request)) as KeepAlive_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAlive_Request create() => KeepAlive_Request._();
  KeepAlive_Request createEmptyInstance() => create();
  static $pb.PbList<KeepAlive_Request> createRepeated() => $pb.PbList<KeepAlive_Request>();
  @$core.pragma('dart2js:noInline')
  static KeepAlive_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeepAlive_Request>(create);
  static KeepAlive_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get idle => $_getBF(0);
  @$pb.TagNumber(1)
  set idle($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdle() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdle() => clearField(1);
}

class KeepAlive_Reply extends $pb.GeneratedMessage {
  factory KeepAlive_Reply() => create();
  KeepAlive_Reply._() : super();
  factory KeepAlive_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeepAlive_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KeepAlive.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeepAlive_Reply clone() => KeepAlive_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeepAlive_Reply copyWith(void Function(KeepAlive_Reply) updates) => super.copyWith((message) => updates(message as KeepAlive_Reply)) as KeepAlive_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAlive_Reply create() => KeepAlive_Reply._();
  KeepAlive_Reply createEmptyInstance() => create();
  static $pb.PbList<KeepAlive_Reply> createRepeated() => $pb.PbList<KeepAlive_Reply>();
  @$core.pragma('dart2js:noInline')
  static KeepAlive_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeepAlive_Reply>(create);
  static KeepAlive_Reply? _defaultInstance;
}

class KeepAlive extends $pb.GeneratedMessage {
  factory KeepAlive({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  KeepAlive._() : super();
  factory KeepAlive.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeepAlive.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KeepAlive', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(100, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeepAlive clone() => KeepAlive()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeepAlive copyWith(void Function(KeepAlive) updates) => super.copyWith((message) => updates(message as KeepAlive)) as KeepAlive;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAlive create() => KeepAlive._();
  KeepAlive createEmptyInstance() => create();
  static $pb.PbList<KeepAlive> createRepeated() => $pb.PbList<KeepAlive>();
  @$core.pragma('dart2js:noInline')
  static KeepAlive getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeepAlive>(create);
  static KeepAlive? _defaultInstance;

  @$pb.TagNumber(100)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(100)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(100)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(100)
  void clearID() => clearField(100);
}

class Authenticate_Request extends $pb.GeneratedMessage {
  factory Authenticate_Request({
    $core.String? account,
    $core.String? password,
    $core.int? platform,
    $core.String? token,
    $core.String? appVersion,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (password != null) {
      $result.password = password;
    }
    if (platform != null) {
      $result.platform = platform;
    }
    if (token != null) {
      $result.token = token;
    }
    if (appVersion != null) {
      $result.appVersion = appVersion;
    }
    return $result;
  }
  Authenticate_Request._() : super();
  factory Authenticate_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Authenticate.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'platform', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'token')
    ..aOS(5, _omitFieldNames ? '' : 'appVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticate_Request clone() => Authenticate_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticate_Request copyWith(void Function(Authenticate_Request) updates) => super.copyWith((message) => updates(message as Authenticate_Request)) as Authenticate_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Authenticate_Request create() => Authenticate_Request._();
  Authenticate_Request createEmptyInstance() => create();
  static $pb.PbList<Authenticate_Request> createRepeated() => $pb.PbList<Authenticate_Request>();
  @$core.pragma('dart2js:noInline')
  static Authenticate_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate_Request>(create);
  static Authenticate_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get platform => $_getIZ(2);
  @$pb.TagNumber(3)
  set platform($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlatform() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlatform() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get token => $_getSZ(3);
  @$pb.TagNumber(4)
  set token($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearToken() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get appVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set appVersion($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAppVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppVersion() => clearField(5);
}

class Authenticate_Reply extends $pb.GeneratedMessage {
  factory Authenticate_Reply({
    $core.List<$core.int>? uid,
    $core.List<$core.int>? sessionId,
    $core.String? host,
    $core.int? port,
    $core.String? webSockHost,
    $core.int? webSockPort,
    $core.String? ssid,
    $0.License_profile? licenseProfile,
    $core.bool? webSocketTlsEnable,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    if (webSockHost != null) {
      $result.webSockHost = webSockHost;
    }
    if (webSockPort != null) {
      $result.webSockPort = webSockPort;
    }
    if (ssid != null) {
      $result.ssid = ssid;
    }
    if (licenseProfile != null) {
      $result.licenseProfile = licenseProfile;
    }
    if (webSocketTlsEnable != null) {
      $result.webSocketTlsEnable = webSocketTlsEnable;
    }
    return $result;
  }
  Authenticate_Reply._() : super();
  factory Authenticate_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Authenticate.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'port', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'webSockHost', protoName: 'webSock_host')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'webSockPort', $pb.PbFieldType.OU3, protoName: 'webSock_port')
    ..aOS(7, _omitFieldNames ? '' : 'ssid')
    ..aOM<$0.License_profile>(8, _omitFieldNames ? '' : 'licenseProfile', subBuilder: $0.License_profile.create)
    ..aOB(9, _omitFieldNames ? '' : 'webSocketTlsEnable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticate_Reply clone() => Authenticate_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticate_Reply copyWith(void Function(Authenticate_Reply) updates) => super.copyWith((message) => updates(message as Authenticate_Reply)) as Authenticate_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Authenticate_Reply create() => Authenticate_Reply._();
  Authenticate_Reply createEmptyInstance() => create();
  static $pb.PbList<Authenticate_Reply> createRepeated() => $pb.PbList<Authenticate_Reply>();
  @$core.pragma('dart2js:noInline')
  static Authenticate_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate_Reply>(create);
  static Authenticate_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get uid => $_getN(0);
  @$pb.TagNumber(1)
  set uid($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get sessionId => $_getN(1);
  @$pb.TagNumber(2)
  set sessionId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => clearField(2);

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

  @$pb.TagNumber(5)
  $core.String get webSockHost => $_getSZ(4);
  @$pb.TagNumber(5)
  set webSockHost($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWebSockHost() => $_has(4);
  @$pb.TagNumber(5)
  void clearWebSockHost() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get webSockPort => $_getIZ(5);
  @$pb.TagNumber(6)
  set webSockPort($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWebSockPort() => $_has(5);
  @$pb.TagNumber(6)
  void clearWebSockPort() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ssid => $_getSZ(6);
  @$pb.TagNumber(7)
  set ssid($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSsid() => $_has(6);
  @$pb.TagNumber(7)
  void clearSsid() => clearField(7);

  @$pb.TagNumber(8)
  $0.License_profile get licenseProfile => $_getN(7);
  @$pb.TagNumber(8)
  set licenseProfile($0.License_profile v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLicenseProfile() => $_has(7);
  @$pb.TagNumber(8)
  void clearLicenseProfile() => clearField(8);
  @$pb.TagNumber(8)
  $0.License_profile ensureLicenseProfile() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get webSocketTlsEnable => $_getBF(8);
  @$pb.TagNumber(9)
  set webSocketTlsEnable($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasWebSocketTlsEnable() => $_has(8);
  @$pb.TagNumber(9)
  void clearWebSocketTlsEnable() => clearField(9);
}

class Authenticate extends $pb.GeneratedMessage {
  factory Authenticate({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Authenticate._() : super();
  factory Authenticate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Authenticate', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(101, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticate clone() => Authenticate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticate copyWith(void Function(Authenticate) updates) => super.copyWith((message) => updates(message as Authenticate)) as Authenticate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Authenticate create() => Authenticate._();
  Authenticate createEmptyInstance() => create();
  static $pb.PbList<Authenticate> createRepeated() => $pb.PbList<Authenticate>();
  @$core.pragma('dart2js:noInline')
  static Authenticate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate>(create);
  static Authenticate? _defaultInstance;

  @$pb.TagNumber(101)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(101)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(101)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(101)
  void clearID() => clearField(101);
}

class Login_Request extends $pb.GeneratedMessage {
  factory Login_Request({
    $core.List<$core.int>? uid,
    $core.List<$core.int>? sessionId,
    $0.ProjectTarget? target,
    $core.int? apiVersion,
    $core.int? platform,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (target != null) {
      $result.target = target;
    }
    if (apiVersion != null) {
      $result.apiVersion = apiVersion;
    }
    if (platform != null) {
      $result.platform = platform;
    }
    return $result;
  }
  Login_Request._() : super();
  factory Login_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Login_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Login.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OY)
    ..e<$0.ProjectTarget>(3, _omitFieldNames ? '' : 'target', $pb.PbFieldType.OE, defaultOrMaker: $0.ProjectTarget.VIVAS, valueOf: $0.ProjectTarget.valueOf, enumValues: $0.ProjectTarget.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'apiVersion', $pb.PbFieldType.O3, protoName: 'apiVersion')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'platform', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Login_Request clone() => Login_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Login_Request copyWith(void Function(Login_Request) updates) => super.copyWith((message) => updates(message as Login_Request)) as Login_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Login_Request create() => Login_Request._();
  Login_Request createEmptyInstance() => create();
  static $pb.PbList<Login_Request> createRepeated() => $pb.PbList<Login_Request>();
  @$core.pragma('dart2js:noInline')
  static Login_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Login_Request>(create);
  static Login_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get uid => $_getN(0);
  @$pb.TagNumber(1)
  set uid($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get sessionId => $_getN(1);
  @$pb.TagNumber(2)
  set sessionId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => clearField(2);

  @$pb.TagNumber(3)
  $0.ProjectTarget get target => $_getN(2);
  @$pb.TagNumber(3)
  set target($0.ProjectTarget v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTarget() => $_has(2);
  @$pb.TagNumber(3)
  void clearTarget() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get apiVersion => $_getIZ(3);
  @$pb.TagNumber(4)
  set apiVersion($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasApiVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearApiVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get platform => $_getIZ(4);
  @$pb.TagNumber(5)
  set platform($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlatform() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlatform() => clearField(5);
}

class Login_Reply extends $pb.GeneratedMessage {
  factory Login_Reply({
    $0.TurnAccount? turnAccount,
    $fixnum.Int64? serverTime,
    $0.Profile? profile,
    $core.int? serverVersionBuild,
    $core.String? baseImageUrl,
    $core.Iterable<$core.String>? listNtpServer,
    $core.int? buildNumber,
    $core.String? linkDownload,
    $0.ProjectTarget? target,
    Login_BaseURL? baseUrl,
    $0.License_profile? licenseProfile,
  }) {
    final $result = create();
    if (turnAccount != null) {
      $result.turnAccount = turnAccount;
    }
    if (serverTime != null) {
      $result.serverTime = serverTime;
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (serverVersionBuild != null) {
      $result.serverVersionBuild = serverVersionBuild;
    }
    if (baseImageUrl != null) {
      $result.baseImageUrl = baseImageUrl;
    }
    if (listNtpServer != null) {
      $result.listNtpServer.addAll(listNtpServer);
    }
    if (buildNumber != null) {
      $result.buildNumber = buildNumber;
    }
    if (linkDownload != null) {
      $result.linkDownload = linkDownload;
    }
    if (target != null) {
      $result.target = target;
    }
    if (baseUrl != null) {
      $result.baseUrl = baseUrl;
    }
    if (licenseProfile != null) {
      $result.licenseProfile = licenseProfile;
    }
    return $result;
  }
  Login_Reply._() : super();
  factory Login_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Login_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Login.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.TurnAccount>(1, _omitFieldNames ? '' : 'turnAccount', subBuilder: $0.TurnAccount.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'serverTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Profile>(3, _omitFieldNames ? '' : 'profile', subBuilder: $0.Profile.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'serverVersionBuild', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'baseImageUrl')
    ..pPS(6, _omitFieldNames ? '' : 'listNtpServer')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'buildNumber', $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : 'linkDownload')
    ..e<$0.ProjectTarget>(9, _omitFieldNames ? '' : 'target', $pb.PbFieldType.OE, defaultOrMaker: $0.ProjectTarget.VIVAS, valueOf: $0.ProjectTarget.valueOf, enumValues: $0.ProjectTarget.values)
    ..aOM<Login_BaseURL>(10, _omitFieldNames ? '' : 'baseUrl', subBuilder: Login_BaseURL.create)
    ..aOM<$0.License_profile>(11, _omitFieldNames ? '' : 'licenseProfile', subBuilder: $0.License_profile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Login_Reply clone() => Login_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Login_Reply copyWith(void Function(Login_Reply) updates) => super.copyWith((message) => updates(message as Login_Reply)) as Login_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Login_Reply create() => Login_Reply._();
  Login_Reply createEmptyInstance() => create();
  static $pb.PbList<Login_Reply> createRepeated() => $pb.PbList<Login_Reply>();
  @$core.pragma('dart2js:noInline')
  static Login_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Login_Reply>(create);
  static Login_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.TurnAccount get turnAccount => $_getN(0);
  @$pb.TagNumber(1)
  set turnAccount($0.TurnAccount v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTurnAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTurnAccount() => clearField(1);
  @$pb.TagNumber(1)
  $0.TurnAccount ensureTurnAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get serverTime => $_getI64(1);
  @$pb.TagNumber(2)
  set serverTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerTime() => clearField(2);

  @$pb.TagNumber(3)
  $0.Profile get profile => $_getN(2);
  @$pb.TagNumber(3)
  set profile($0.Profile v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfile() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfile() => clearField(3);
  @$pb.TagNumber(3)
  $0.Profile ensureProfile() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get serverVersionBuild => $_getIZ(3);
  @$pb.TagNumber(4)
  set serverVersionBuild($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServerVersionBuild() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerVersionBuild() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get baseImageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set baseImageUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBaseImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearBaseImageUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get listNtpServer => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get buildNumber => $_getIZ(6);
  @$pb.TagNumber(7)
  set buildNumber($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBuildNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuildNumber() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get linkDownload => $_getSZ(7);
  @$pb.TagNumber(8)
  set linkDownload($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLinkDownload() => $_has(7);
  @$pb.TagNumber(8)
  void clearLinkDownload() => clearField(8);

  @$pb.TagNumber(9)
  $0.ProjectTarget get target => $_getN(8);
  @$pb.TagNumber(9)
  set target($0.ProjectTarget v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearTarget() => clearField(9);

  @$pb.TagNumber(10)
  Login_BaseURL get baseUrl => $_getN(9);
  @$pb.TagNumber(10)
  set baseUrl(Login_BaseURL v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasBaseUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearBaseUrl() => clearField(10);
  @$pb.TagNumber(10)
  Login_BaseURL ensureBaseUrl() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.License_profile get licenseProfile => $_getN(10);
  @$pb.TagNumber(11)
  set licenseProfile($0.License_profile v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasLicenseProfile() => $_has(10);
  @$pb.TagNumber(11)
  void clearLicenseProfile() => clearField(11);
  @$pb.TagNumber(11)
  $0.License_profile ensureLicenseProfile() => $_ensure(10);
}

class Login_BaseURL extends $pb.GeneratedMessage {
  factory Login_BaseURL({
    $core.String? faceBaseUrl,
  }) {
    final $result = create();
    if (faceBaseUrl != null) {
      $result.faceBaseUrl = faceBaseUrl;
    }
    return $result;
  }
  Login_BaseURL._() : super();
  factory Login_BaseURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Login_BaseURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Login.BaseURL', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'faceBaseUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Login_BaseURL clone() => Login_BaseURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Login_BaseURL copyWith(void Function(Login_BaseURL) updates) => super.copyWith((message) => updates(message as Login_BaseURL)) as Login_BaseURL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Login_BaseURL create() => Login_BaseURL._();
  Login_BaseURL createEmptyInstance() => create();
  static $pb.PbList<Login_BaseURL> createRepeated() => $pb.PbList<Login_BaseURL>();
  @$core.pragma('dart2js:noInline')
  static Login_BaseURL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Login_BaseURL>(create);
  static Login_BaseURL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get faceBaseUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set faceBaseUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFaceBaseUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearFaceBaseUrl() => clearField(1);
}

class Login extends $pb.GeneratedMessage {
  factory Login({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Login._() : super();
  factory Login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Login', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(102, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Login clone() => Login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Login copyWith(void Function(Login) updates) => super.copyWith((message) => updates(message as Login)) as Login;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Login create() => Login._();
  Login createEmptyInstance() => create();
  static $pb.PbList<Login> createRepeated() => $pb.PbList<Login>();
  @$core.pragma('dart2js:noInline')
  static Login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Login>(create);
  static Login? _defaultInstance;

  @$pb.TagNumber(102)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(102)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(102)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(102)
  void clearID() => clearField(102);
}

class Logout_Request extends $pb.GeneratedMessage {
  factory Logout_Request() => create();
  Logout_Request._() : super();
  factory Logout_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Logout_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Logout.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Logout_Request clone() => Logout_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Logout_Request copyWith(void Function(Logout_Request) updates) => super.copyWith((message) => updates(message as Logout_Request)) as Logout_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Logout_Request create() => Logout_Request._();
  Logout_Request createEmptyInstance() => create();
  static $pb.PbList<Logout_Request> createRepeated() => $pb.PbList<Logout_Request>();
  @$core.pragma('dart2js:noInline')
  static Logout_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Logout_Request>(create);
  static Logout_Request? _defaultInstance;
}

class Logout_Reply extends $pb.GeneratedMessage {
  factory Logout_Reply() => create();
  Logout_Reply._() : super();
  factory Logout_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Logout_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Logout.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Logout_Reply clone() => Logout_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Logout_Reply copyWith(void Function(Logout_Reply) updates) => super.copyWith((message) => updates(message as Logout_Reply)) as Logout_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Logout_Reply create() => Logout_Reply._();
  Logout_Reply createEmptyInstance() => create();
  static $pb.PbList<Logout_Reply> createRepeated() => $pb.PbList<Logout_Reply>();
  @$core.pragma('dart2js:noInline')
  static Logout_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Logout_Reply>(create);
  static Logout_Reply? _defaultInstance;
}

class Logout extends $pb.GeneratedMessage {
  factory Logout({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Logout._() : super();
  factory Logout.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Logout.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Logout', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(103, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Logout clone() => Logout()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Logout copyWith(void Function(Logout) updates) => super.copyWith((message) => updates(message as Logout)) as Logout;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Logout create() => Logout._();
  Logout createEmptyInstance() => create();
  static $pb.PbList<Logout> createRepeated() => $pb.PbList<Logout>();
  @$core.pragma('dart2js:noInline')
  static Logout getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Logout>(create);
  static Logout? _defaultInstance;

  @$pb.TagNumber(103)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(103)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(103)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(103)
  void clearID() => clearField(103);
}

class Register_Request extends $pb.GeneratedMessage {
  factory Register_Request({
    $core.String? account,
    $core.String? password,
    $core.String? otp,
    $core.String? address,
    $core.String? email,
    $core.String? tel,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (password != null) {
      $result.password = password;
    }
    if (otp != null) {
      $result.otp = otp;
    }
    if (address != null) {
      $result.address = address;
    }
    if (email != null) {
      $result.email = email;
    }
    if (tel != null) {
      $result.tel = tel;
    }
    return $result;
  }
  Register_Request._() : super();
  factory Register_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Register_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Register.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'otp')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'tel')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Register_Request clone() => Register_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Register_Request copyWith(void Function(Register_Request) updates) => super.copyWith((message) => updates(message as Register_Request)) as Register_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Register_Request create() => Register_Request._();
  Register_Request createEmptyInstance() => create();
  static $pb.PbList<Register_Request> createRepeated() => $pb.PbList<Register_Request>();
  @$core.pragma('dart2js:noInline')
  static Register_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Register_Request>(create);
  static Register_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get otp => $_getSZ(2);
  @$pb.TagNumber(3)
  set otp($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOtp() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtp() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tel => $_getSZ(5);
  @$pb.TagNumber(6)
  set tel($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTel() => $_has(5);
  @$pb.TagNumber(6)
  void clearTel() => clearField(6);
}

class Register_Reply extends $pb.GeneratedMessage {
  factory Register_Reply() => create();
  Register_Reply._() : super();
  factory Register_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Register_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Register.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Register_Reply clone() => Register_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Register_Reply copyWith(void Function(Register_Reply) updates) => super.copyWith((message) => updates(message as Register_Reply)) as Register_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Register_Reply create() => Register_Reply._();
  Register_Reply createEmptyInstance() => create();
  static $pb.PbList<Register_Reply> createRepeated() => $pb.PbList<Register_Reply>();
  @$core.pragma('dart2js:noInline')
  static Register_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Register_Reply>(create);
  static Register_Reply? _defaultInstance;
}

class Register extends $pb.GeneratedMessage {
  factory Register({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  Register._() : super();
  factory Register.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Register.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Register', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(104, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Register clone() => Register()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Register copyWith(void Function(Register) updates) => super.copyWith((message) => updates(message as Register)) as Register;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Register create() => Register._();
  Register createEmptyInstance() => create();
  static $pb.PbList<Register> createRepeated() => $pb.PbList<Register>();
  @$core.pragma('dart2js:noInline')
  static Register getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Register>(create);
  static Register? _defaultInstance;

  @$pb.TagNumber(104)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(104)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(104)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(104)
  void clearID() => clearField(104);
}

class UpdateDeviceToken_Request extends $pb.GeneratedMessage {
  factory UpdateDeviceToken_Request({
    $core.String? token,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  UpdateDeviceToken_Request._() : super();
  factory UpdateDeviceToken_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDeviceToken_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDeviceToken.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDeviceToken_Request clone() => UpdateDeviceToken_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDeviceToken_Request copyWith(void Function(UpdateDeviceToken_Request) updates) => super.copyWith((message) => updates(message as UpdateDeviceToken_Request)) as UpdateDeviceToken_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDeviceToken_Request create() => UpdateDeviceToken_Request._();
  UpdateDeviceToken_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateDeviceToken_Request> createRepeated() => $pb.PbList<UpdateDeviceToken_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceToken_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDeviceToken_Request>(create);
  static UpdateDeviceToken_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class UpdateDeviceToken_Reply extends $pb.GeneratedMessage {
  factory UpdateDeviceToken_Reply() => create();
  UpdateDeviceToken_Reply._() : super();
  factory UpdateDeviceToken_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDeviceToken_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDeviceToken.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDeviceToken_Reply clone() => UpdateDeviceToken_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDeviceToken_Reply copyWith(void Function(UpdateDeviceToken_Reply) updates) => super.copyWith((message) => updates(message as UpdateDeviceToken_Reply)) as UpdateDeviceToken_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDeviceToken_Reply create() => UpdateDeviceToken_Reply._();
  UpdateDeviceToken_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateDeviceToken_Reply> createRepeated() => $pb.PbList<UpdateDeviceToken_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceToken_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDeviceToken_Reply>(create);
  static UpdateDeviceToken_Reply? _defaultInstance;
}

class UpdateDeviceToken extends $pb.GeneratedMessage {
  factory UpdateDeviceToken({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateDeviceToken._() : super();
  factory UpdateDeviceToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDeviceToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDeviceToken', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(105, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDeviceToken clone() => UpdateDeviceToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDeviceToken copyWith(void Function(UpdateDeviceToken) updates) => super.copyWith((message) => updates(message as UpdateDeviceToken)) as UpdateDeviceToken;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDeviceToken create() => UpdateDeviceToken._();
  UpdateDeviceToken createEmptyInstance() => create();
  static $pb.PbList<UpdateDeviceToken> createRepeated() => $pb.PbList<UpdateDeviceToken>();
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDeviceToken>(create);
  static UpdateDeviceToken? _defaultInstance;

  @$pb.TagNumber(105)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(105)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(105)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(105)
  void clearID() => clearField(105);
}

class ChangePassword_Request extends $pb.GeneratedMessage {
  factory ChangePassword_Request({
    $core.String? current,
    $core.String? password,
    $core.bool? kickOthers,
  }) {
    final $result = create();
    if (current != null) {
      $result.current = current;
    }
    if (password != null) {
      $result.password = password;
    }
    if (kickOthers != null) {
      $result.kickOthers = kickOthers;
    }
    return $result;
  }
  ChangePassword_Request._() : super();
  factory ChangePassword_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePassword_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePassword.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'current')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOB(3, _omitFieldNames ? '' : 'kickOthers')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePassword_Request clone() => ChangePassword_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePassword_Request copyWith(void Function(ChangePassword_Request) updates) => super.copyWith((message) => updates(message as ChangePassword_Request)) as ChangePassword_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePassword_Request create() => ChangePassword_Request._();
  ChangePassword_Request createEmptyInstance() => create();
  static $pb.PbList<ChangePassword_Request> createRepeated() => $pb.PbList<ChangePassword_Request>();
  @$core.pragma('dart2js:noInline')
  static ChangePassword_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePassword_Request>(create);
  static ChangePassword_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get current => $_getSZ(0);
  @$pb.TagNumber(1)
  set current($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get kickOthers => $_getBF(2);
  @$pb.TagNumber(3)
  set kickOthers($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKickOthers() => $_has(2);
  @$pb.TagNumber(3)
  void clearKickOthers() => clearField(3);
}

class ChangePassword_Reply extends $pb.GeneratedMessage {
  factory ChangePassword_Reply() => create();
  ChangePassword_Reply._() : super();
  factory ChangePassword_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePassword_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePassword.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePassword_Reply clone() => ChangePassword_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePassword_Reply copyWith(void Function(ChangePassword_Reply) updates) => super.copyWith((message) => updates(message as ChangePassword_Reply)) as ChangePassword_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePassword_Reply create() => ChangePassword_Reply._();
  ChangePassword_Reply createEmptyInstance() => create();
  static $pb.PbList<ChangePassword_Reply> createRepeated() => $pb.PbList<ChangePassword_Reply>();
  @$core.pragma('dart2js:noInline')
  static ChangePassword_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePassword_Reply>(create);
  static ChangePassword_Reply? _defaultInstance;
}

class ChangePassword extends $pb.GeneratedMessage {
  factory ChangePassword({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ChangePassword._() : super();
  factory ChangePassword.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePassword.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePassword', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(106, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePassword clone() => ChangePassword()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePassword copyWith(void Function(ChangePassword) updates) => super.copyWith((message) => updates(message as ChangePassword)) as ChangePassword;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePassword create() => ChangePassword._();
  ChangePassword createEmptyInstance() => create();
  static $pb.PbList<ChangePassword> createRepeated() => $pb.PbList<ChangePassword>();
  @$core.pragma('dart2js:noInline')
  static ChangePassword getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePassword>(create);
  static ChangePassword? _defaultInstance;

  @$pb.TagNumber(106)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(106)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(106)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(106)
  void clearID() => clearField(106);
}

class ForgotPassword_Request extends $pb.GeneratedMessage {
  factory ForgotPassword_Request({
    $core.String? account,
    $core.String? password,
    $core.String? otp,
    $core.bool? kickOut,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (password != null) {
      $result.password = password;
    }
    if (otp != null) {
      $result.otp = otp;
    }
    if (kickOut != null) {
      $result.kickOut = kickOut;
    }
    return $result;
  }
  ForgotPassword_Request._() : super();
  factory ForgotPassword_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPassword_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForgotPassword.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'otp')
    ..aOB(4, _omitFieldNames ? '' : 'kickOut')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPassword_Request clone() => ForgotPassword_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPassword_Request copyWith(void Function(ForgotPassword_Request) updates) => super.copyWith((message) => updates(message as ForgotPassword_Request)) as ForgotPassword_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgotPassword_Request create() => ForgotPassword_Request._();
  ForgotPassword_Request createEmptyInstance() => create();
  static $pb.PbList<ForgotPassword_Request> createRepeated() => $pb.PbList<ForgotPassword_Request>();
  @$core.pragma('dart2js:noInline')
  static ForgotPassword_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPassword_Request>(create);
  static ForgotPassword_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get otp => $_getSZ(2);
  @$pb.TagNumber(3)
  set otp($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOtp() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtp() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get kickOut => $_getBF(3);
  @$pb.TagNumber(4)
  set kickOut($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasKickOut() => $_has(3);
  @$pb.TagNumber(4)
  void clearKickOut() => clearField(4);
}

class ForgotPassword_Reply extends $pb.GeneratedMessage {
  factory ForgotPassword_Reply() => create();
  ForgotPassword_Reply._() : super();
  factory ForgotPassword_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPassword_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForgotPassword.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPassword_Reply clone() => ForgotPassword_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPassword_Reply copyWith(void Function(ForgotPassword_Reply) updates) => super.copyWith((message) => updates(message as ForgotPassword_Reply)) as ForgotPassword_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgotPassword_Reply create() => ForgotPassword_Reply._();
  ForgotPassword_Reply createEmptyInstance() => create();
  static $pb.PbList<ForgotPassword_Reply> createRepeated() => $pb.PbList<ForgotPassword_Reply>();
  @$core.pragma('dart2js:noInline')
  static ForgotPassword_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPassword_Reply>(create);
  static ForgotPassword_Reply? _defaultInstance;
}

class ForgotPassword extends $pb.GeneratedMessage {
  factory ForgotPassword({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  ForgotPassword._() : super();
  factory ForgotPassword.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPassword.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForgotPassword', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(107, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPassword clone() => ForgotPassword()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPassword copyWith(void Function(ForgotPassword) updates) => super.copyWith((message) => updates(message as ForgotPassword)) as ForgotPassword;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgotPassword create() => ForgotPassword._();
  ForgotPassword createEmptyInstance() => create();
  static $pb.PbList<ForgotPassword> createRepeated() => $pb.PbList<ForgotPassword>();
  @$core.pragma('dart2js:noInline')
  static ForgotPassword getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPassword>(create);
  static ForgotPassword? _defaultInstance;

  @$pb.TagNumber(107)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(107)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(107)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(107)
  void clearID() => clearField(107);
}

class RequestOTP_Request extends $pb.GeneratedMessage {
  factory RequestOTP_Request({
    $core.String? account,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    return $result;
  }
  RequestOTP_Request._() : super();
  factory RequestOTP_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestOTP_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestOTP.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestOTP_Request clone() => RequestOTP_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestOTP_Request copyWith(void Function(RequestOTP_Request) updates) => super.copyWith((message) => updates(message as RequestOTP_Request)) as RequestOTP_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestOTP_Request create() => RequestOTP_Request._();
  RequestOTP_Request createEmptyInstance() => create();
  static $pb.PbList<RequestOTP_Request> createRepeated() => $pb.PbList<RequestOTP_Request>();
  @$core.pragma('dart2js:noInline')
  static RequestOTP_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestOTP_Request>(create);
  static RequestOTP_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
}

class RequestOTP_Reply extends $pb.GeneratedMessage {
  factory RequestOTP_Reply({
    $core.int? waitTime,
  }) {
    final $result = create();
    if (waitTime != null) {
      $result.waitTime = waitTime;
    }
    return $result;
  }
  RequestOTP_Reply._() : super();
  factory RequestOTP_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestOTP_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestOTP.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'waitTime', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestOTP_Reply clone() => RequestOTP_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestOTP_Reply copyWith(void Function(RequestOTP_Reply) updates) => super.copyWith((message) => updates(message as RequestOTP_Reply)) as RequestOTP_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestOTP_Reply create() => RequestOTP_Reply._();
  RequestOTP_Reply createEmptyInstance() => create();
  static $pb.PbList<RequestOTP_Reply> createRepeated() => $pb.PbList<RequestOTP_Reply>();
  @$core.pragma('dart2js:noInline')
  static RequestOTP_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestOTP_Reply>(create);
  static RequestOTP_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get waitTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set waitTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWaitTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearWaitTime() => clearField(1);
}

class RequestOTP extends $pb.GeneratedMessage {
  factory RequestOTP({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RequestOTP._() : super();
  factory RequestOTP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestOTP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestOTP', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(108, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestOTP clone() => RequestOTP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestOTP copyWith(void Function(RequestOTP) updates) => super.copyWith((message) => updates(message as RequestOTP)) as RequestOTP;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestOTP create() => RequestOTP._();
  RequestOTP createEmptyInstance() => create();
  static $pb.PbList<RequestOTP> createRepeated() => $pb.PbList<RequestOTP>();
  @$core.pragma('dart2js:noInline')
  static RequestOTP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestOTP>(create);
  static RequestOTP? _defaultInstance;

  @$pb.TagNumber(108)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(108)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(108)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(108)
  void clearID() => clearField(108);
}

class CheckAccount_Request extends $pb.GeneratedMessage {
  factory CheckAccount_Request({
    $core.String? account,
    $core.String? password,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  CheckAccount_Request._() : super();
  factory CheckAccount_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccount_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccount.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccount_Request clone() => CheckAccount_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccount_Request copyWith(void Function(CheckAccount_Request) updates) => super.copyWith((message) => updates(message as CheckAccount_Request)) as CheckAccount_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccount_Request create() => CheckAccount_Request._();
  CheckAccount_Request createEmptyInstance() => create();
  static $pb.PbList<CheckAccount_Request> createRepeated() => $pb.PbList<CheckAccount_Request>();
  @$core.pragma('dart2js:noInline')
  static CheckAccount_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccount_Request>(create);
  static CheckAccount_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class CheckAccount_Reply extends $pb.GeneratedMessage {
  factory CheckAccount_Reply({
    CheckAccount_State? state,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  CheckAccount_Reply._() : super();
  factory CheckAccount_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccount_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccount.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..e<CheckAccount_State>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: CheckAccount_State.NOT_EXISTED, valueOf: CheckAccount_State.valueOf, enumValues: CheckAccount_State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccount_Reply clone() => CheckAccount_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccount_Reply copyWith(void Function(CheckAccount_Reply) updates) => super.copyWith((message) => updates(message as CheckAccount_Reply)) as CheckAccount_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccount_Reply create() => CheckAccount_Reply._();
  CheckAccount_Reply createEmptyInstance() => create();
  static $pb.PbList<CheckAccount_Reply> createRepeated() => $pb.PbList<CheckAccount_Reply>();
  @$core.pragma('dart2js:noInline')
  static CheckAccount_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccount_Reply>(create);
  static CheckAccount_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  CheckAccount_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(CheckAccount_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

class CheckAccount extends $pb.GeneratedMessage {
  factory CheckAccount({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  CheckAccount._() : super();
  factory CheckAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccount', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(109, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccount clone() => CheckAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccount copyWith(void Function(CheckAccount) updates) => super.copyWith((message) => updates(message as CheckAccount)) as CheckAccount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccount create() => CheckAccount._();
  CheckAccount createEmptyInstance() => create();
  static $pb.PbList<CheckAccount> createRepeated() => $pb.PbList<CheckAccount>();
  @$core.pragma('dart2js:noInline')
  static CheckAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccount>(create);
  static CheckAccount? _defaultInstance;

  @$pb.TagNumber(109)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(109)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(109)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(109)
  void clearID() => clearField(109);
}

class FeedbackUser_Request extends $pb.GeneratedMessage {
  factory FeedbackUser_Request({
    $core.String? feedback,
  }) {
    final $result = create();
    if (feedback != null) {
      $result.feedback = feedback;
    }
    return $result;
  }
  FeedbackUser_Request._() : super();
  factory FeedbackUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedbackUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeedbackUser.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'feedback')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedbackUser_Request clone() => FeedbackUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedbackUser_Request copyWith(void Function(FeedbackUser_Request) updates) => super.copyWith((message) => updates(message as FeedbackUser_Request)) as FeedbackUser_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeedbackUser_Request create() => FeedbackUser_Request._();
  FeedbackUser_Request createEmptyInstance() => create();
  static $pb.PbList<FeedbackUser_Request> createRepeated() => $pb.PbList<FeedbackUser_Request>();
  @$core.pragma('dart2js:noInline')
  static FeedbackUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedbackUser_Request>(create);
  static FeedbackUser_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get feedback => $_getSZ(0);
  @$pb.TagNumber(1)
  set feedback($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeedback() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeedback() => clearField(1);
}

class FeedbackUser_Reply extends $pb.GeneratedMessage {
  factory FeedbackUser_Reply() => create();
  FeedbackUser_Reply._() : super();
  factory FeedbackUser_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedbackUser_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeedbackUser.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedbackUser_Reply clone() => FeedbackUser_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedbackUser_Reply copyWith(void Function(FeedbackUser_Reply) updates) => super.copyWith((message) => updates(message as FeedbackUser_Reply)) as FeedbackUser_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeedbackUser_Reply create() => FeedbackUser_Reply._();
  FeedbackUser_Reply createEmptyInstance() => create();
  static $pb.PbList<FeedbackUser_Reply> createRepeated() => $pb.PbList<FeedbackUser_Reply>();
  @$core.pragma('dart2js:noInline')
  static FeedbackUser_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedbackUser_Reply>(create);
  static FeedbackUser_Reply? _defaultInstance;
}

class FeedbackUser extends $pb.GeneratedMessage {
  factory FeedbackUser({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  FeedbackUser._() : super();
  factory FeedbackUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedbackUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeedbackUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(110, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedbackUser clone() => FeedbackUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedbackUser copyWith(void Function(FeedbackUser) updates) => super.copyWith((message) => updates(message as FeedbackUser)) as FeedbackUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeedbackUser create() => FeedbackUser._();
  FeedbackUser createEmptyInstance() => create();
  static $pb.PbList<FeedbackUser> createRepeated() => $pb.PbList<FeedbackUser>();
  @$core.pragma('dart2js:noInline')
  static FeedbackUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedbackUser>(create);
  static FeedbackUser? _defaultInstance;

  @$pb.TagNumber(110)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(110)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(110)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(110)
  void clearID() => clearField(110);
}

class CheckAccountExists_Request extends $pb.GeneratedMessage {
  factory CheckAccountExists_Request({
    $core.String? account,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    return $result;
  }
  CheckAccountExists_Request._() : super();
  factory CheckAccountExists_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccountExists_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccountExists.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccountExists_Request clone() => CheckAccountExists_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccountExists_Request copyWith(void Function(CheckAccountExists_Request) updates) => super.copyWith((message) => updates(message as CheckAccountExists_Request)) as CheckAccountExists_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccountExists_Request create() => CheckAccountExists_Request._();
  CheckAccountExists_Request createEmptyInstance() => create();
  static $pb.PbList<CheckAccountExists_Request> createRepeated() => $pb.PbList<CheckAccountExists_Request>();
  @$core.pragma('dart2js:noInline')
  static CheckAccountExists_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccountExists_Request>(create);
  static CheckAccountExists_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
}

class CheckAccountExists_Reply extends $pb.GeneratedMessage {
  factory CheckAccountExists_Reply({
    $core.bool? isExists,
    $core.String? info,
  }) {
    final $result = create();
    if (isExists != null) {
      $result.isExists = isExists;
    }
    if (info != null) {
      $result.info = info;
    }
    return $result;
  }
  CheckAccountExists_Reply._() : super();
  factory CheckAccountExists_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccountExists_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccountExists.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isExists', protoName: 'isExists')
    ..aOS(2, _omitFieldNames ? '' : 'info')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccountExists_Reply clone() => CheckAccountExists_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccountExists_Reply copyWith(void Function(CheckAccountExists_Reply) updates) => super.copyWith((message) => updates(message as CheckAccountExists_Reply)) as CheckAccountExists_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccountExists_Reply create() => CheckAccountExists_Reply._();
  CheckAccountExists_Reply createEmptyInstance() => create();
  static $pb.PbList<CheckAccountExists_Reply> createRepeated() => $pb.PbList<CheckAccountExists_Reply>();
  @$core.pragma('dart2js:noInline')
  static CheckAccountExists_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccountExists_Reply>(create);
  static CheckAccountExists_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isExists => $_getBF(0);
  @$pb.TagNumber(1)
  set isExists($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsExists() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsExists() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get info => $_getSZ(1);
  @$pb.TagNumber(2)
  set info($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => clearField(2);
}

class CheckAccountExists extends $pb.GeneratedMessage {
  factory CheckAccountExists({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  CheckAccountExists._() : super();
  factory CheckAccountExists.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAccountExists.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckAccountExists', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(111, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckAccountExists clone() => CheckAccountExists()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckAccountExists copyWith(void Function(CheckAccountExists) updates) => super.copyWith((message) => updates(message as CheckAccountExists)) as CheckAccountExists;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckAccountExists create() => CheckAccountExists._();
  CheckAccountExists createEmptyInstance() => create();
  static $pb.PbList<CheckAccountExists> createRepeated() => $pb.PbList<CheckAccountExists>();
  @$core.pragma('dart2js:noInline')
  static CheckAccountExists getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckAccountExists>(create);
  static CheckAccountExists? _defaultInstance;

  @$pb.TagNumber(111)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(111)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(111)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(111)
  void clearID() => clearField(111);
}

class RequestUpdateTelProfile_Request extends $pb.GeneratedMessage {
  factory RequestUpdateTelProfile_Request({
    $core.String? tel,
    $core.String? currentPassword,
  }) {
    final $result = create();
    if (tel != null) {
      $result.tel = tel;
    }
    if (currentPassword != null) {
      $result.currentPassword = currentPassword;
    }
    return $result;
  }
  RequestUpdateTelProfile_Request._() : super();
  factory RequestUpdateTelProfile_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdateTelProfile_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestUpdateTelProfile.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tel')
    ..aOS(2, _omitFieldNames ? '' : 'currentPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdateTelProfile_Request clone() => RequestUpdateTelProfile_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdateTelProfile_Request copyWith(void Function(RequestUpdateTelProfile_Request) updates) => super.copyWith((message) => updates(message as RequestUpdateTelProfile_Request)) as RequestUpdateTelProfile_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestUpdateTelProfile_Request create() => RequestUpdateTelProfile_Request._();
  RequestUpdateTelProfile_Request createEmptyInstance() => create();
  static $pb.PbList<RequestUpdateTelProfile_Request> createRepeated() => $pb.PbList<RequestUpdateTelProfile_Request>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdateTelProfile_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdateTelProfile_Request>(create);
  static RequestUpdateTelProfile_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tel => $_getSZ(0);
  @$pb.TagNumber(1)
  set tel($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTel() => $_has(0);
  @$pb.TagNumber(1)
  void clearTel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentPassword() => clearField(2);
}

class RequestUpdateTelProfile_Reply extends $pb.GeneratedMessage {
  factory RequestUpdateTelProfile_Reply({
    $core.int? waitTime,
  }) {
    final $result = create();
    if (waitTime != null) {
      $result.waitTime = waitTime;
    }
    return $result;
  }
  RequestUpdateTelProfile_Reply._() : super();
  factory RequestUpdateTelProfile_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdateTelProfile_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestUpdateTelProfile.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'waitTime', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdateTelProfile_Reply clone() => RequestUpdateTelProfile_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdateTelProfile_Reply copyWith(void Function(RequestUpdateTelProfile_Reply) updates) => super.copyWith((message) => updates(message as RequestUpdateTelProfile_Reply)) as RequestUpdateTelProfile_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestUpdateTelProfile_Reply create() => RequestUpdateTelProfile_Reply._();
  RequestUpdateTelProfile_Reply createEmptyInstance() => create();
  static $pb.PbList<RequestUpdateTelProfile_Reply> createRepeated() => $pb.PbList<RequestUpdateTelProfile_Reply>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdateTelProfile_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdateTelProfile_Reply>(create);
  static RequestUpdateTelProfile_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get waitTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set waitTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWaitTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearWaitTime() => clearField(1);
}

class RequestUpdateTelProfile extends $pb.GeneratedMessage {
  factory RequestUpdateTelProfile({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RequestUpdateTelProfile._() : super();
  factory RequestUpdateTelProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdateTelProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestUpdateTelProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(112, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdateTelProfile clone() => RequestUpdateTelProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdateTelProfile copyWith(void Function(RequestUpdateTelProfile) updates) => super.copyWith((message) => updates(message as RequestUpdateTelProfile)) as RequestUpdateTelProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestUpdateTelProfile create() => RequestUpdateTelProfile._();
  RequestUpdateTelProfile createEmptyInstance() => create();
  static $pb.PbList<RequestUpdateTelProfile> createRepeated() => $pb.PbList<RequestUpdateTelProfile>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdateTelProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdateTelProfile>(create);
  static RequestUpdateTelProfile? _defaultInstance;

  @$pb.TagNumber(112)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(112)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(112)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(112)
  void clearID() => clearField(112);
}

class UpdateTelProfile_Request extends $pb.GeneratedMessage {
  factory UpdateTelProfile_Request({
    $core.String? otp,
  }) {
    final $result = create();
    if (otp != null) {
      $result.otp = otp;
    }
    return $result;
  }
  UpdateTelProfile_Request._() : super();
  factory UpdateTelProfile_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTelProfile_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTelProfile.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'otp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTelProfile_Request clone() => UpdateTelProfile_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTelProfile_Request copyWith(void Function(UpdateTelProfile_Request) updates) => super.copyWith((message) => updates(message as UpdateTelProfile_Request)) as UpdateTelProfile_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTelProfile_Request create() => UpdateTelProfile_Request._();
  UpdateTelProfile_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateTelProfile_Request> createRepeated() => $pb.PbList<UpdateTelProfile_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateTelProfile_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTelProfile_Request>(create);
  static UpdateTelProfile_Request? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get otp => $_getSZ(0);
  @$pb.TagNumber(2)
  set otp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtp() => $_has(0);
  @$pb.TagNumber(2)
  void clearOtp() => clearField(2);
}

class UpdateTelProfile_Reply extends $pb.GeneratedMessage {
  factory UpdateTelProfile_Reply({
    $0.Profile? newProfile,
  }) {
    final $result = create();
    if (newProfile != null) {
      $result.newProfile = newProfile;
    }
    return $result;
  }
  UpdateTelProfile_Reply._() : super();
  factory UpdateTelProfile_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTelProfile_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTelProfile.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.Profile>(1, _omitFieldNames ? '' : 'newProfile', protoName: 'newProfile', subBuilder: $0.Profile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTelProfile_Reply clone() => UpdateTelProfile_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTelProfile_Reply copyWith(void Function(UpdateTelProfile_Reply) updates) => super.copyWith((message) => updates(message as UpdateTelProfile_Reply)) as UpdateTelProfile_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTelProfile_Reply create() => UpdateTelProfile_Reply._();
  UpdateTelProfile_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateTelProfile_Reply> createRepeated() => $pb.PbList<UpdateTelProfile_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateTelProfile_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTelProfile_Reply>(create);
  static UpdateTelProfile_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Profile get newProfile => $_getN(0);
  @$pb.TagNumber(1)
  set newProfile($0.Profile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewProfile() => clearField(1);
  @$pb.TagNumber(1)
  $0.Profile ensureNewProfile() => $_ensure(0);
}

class UpdateTelProfile extends $pb.GeneratedMessage {
  factory UpdateTelProfile({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateTelProfile._() : super();
  factory UpdateTelProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTelProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTelProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(113, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTelProfile clone() => UpdateTelProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTelProfile copyWith(void Function(UpdateTelProfile) updates) => super.copyWith((message) => updates(message as UpdateTelProfile)) as UpdateTelProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTelProfile create() => UpdateTelProfile._();
  UpdateTelProfile createEmptyInstance() => create();
  static $pb.PbList<UpdateTelProfile> createRepeated() => $pb.PbList<UpdateTelProfile>();
  @$core.pragma('dart2js:noInline')
  static UpdateTelProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTelProfile>(create);
  static UpdateTelProfile? _defaultInstance;

  @$pb.TagNumber(113)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(113)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(113)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(113)
  void clearID() => clearField(113);
}

class RequestUpdateEmailProfile_Request extends $pb.GeneratedMessage {
  factory RequestUpdateEmailProfile_Request({
    $core.String? email,
    $core.String? currentPassword,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (currentPassword != null) {
      $result.currentPassword = currentPassword;
    }
    return $result;
  }
  RequestUpdateEmailProfile_Request._() : super();
  factory RequestUpdateEmailProfile_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdateEmailProfile_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestUpdateEmailProfile.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'currentPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdateEmailProfile_Request clone() => RequestUpdateEmailProfile_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdateEmailProfile_Request copyWith(void Function(RequestUpdateEmailProfile_Request) updates) => super.copyWith((message) => updates(message as RequestUpdateEmailProfile_Request)) as RequestUpdateEmailProfile_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestUpdateEmailProfile_Request create() => RequestUpdateEmailProfile_Request._();
  RequestUpdateEmailProfile_Request createEmptyInstance() => create();
  static $pb.PbList<RequestUpdateEmailProfile_Request> createRepeated() => $pb.PbList<RequestUpdateEmailProfile_Request>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdateEmailProfile_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdateEmailProfile_Request>(create);
  static RequestUpdateEmailProfile_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentPassword() => clearField(2);
}

class RequestUpdateEmailProfile_Reply extends $pb.GeneratedMessage {
  factory RequestUpdateEmailProfile_Reply({
    $core.int? waitTime,
  }) {
    final $result = create();
    if (waitTime != null) {
      $result.waitTime = waitTime;
    }
    return $result;
  }
  RequestUpdateEmailProfile_Reply._() : super();
  factory RequestUpdateEmailProfile_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdateEmailProfile_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestUpdateEmailProfile.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'waitTime', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdateEmailProfile_Reply clone() => RequestUpdateEmailProfile_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdateEmailProfile_Reply copyWith(void Function(RequestUpdateEmailProfile_Reply) updates) => super.copyWith((message) => updates(message as RequestUpdateEmailProfile_Reply)) as RequestUpdateEmailProfile_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestUpdateEmailProfile_Reply create() => RequestUpdateEmailProfile_Reply._();
  RequestUpdateEmailProfile_Reply createEmptyInstance() => create();
  static $pb.PbList<RequestUpdateEmailProfile_Reply> createRepeated() => $pb.PbList<RequestUpdateEmailProfile_Reply>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdateEmailProfile_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdateEmailProfile_Reply>(create);
  static RequestUpdateEmailProfile_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get waitTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set waitTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWaitTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearWaitTime() => clearField(1);
}

/// Nếu status = 0 và wait_time thì tài khoản vẫn trong thời gian get otp của phiên trước
class RequestUpdateEmailProfile extends $pb.GeneratedMessage {
  factory RequestUpdateEmailProfile({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RequestUpdateEmailProfile._() : super();
  factory RequestUpdateEmailProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestUpdateEmailProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestUpdateEmailProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(114, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestUpdateEmailProfile clone() => RequestUpdateEmailProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestUpdateEmailProfile copyWith(void Function(RequestUpdateEmailProfile) updates) => super.copyWith((message) => updates(message as RequestUpdateEmailProfile)) as RequestUpdateEmailProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestUpdateEmailProfile create() => RequestUpdateEmailProfile._();
  RequestUpdateEmailProfile createEmptyInstance() => create();
  static $pb.PbList<RequestUpdateEmailProfile> createRepeated() => $pb.PbList<RequestUpdateEmailProfile>();
  @$core.pragma('dart2js:noInline')
  static RequestUpdateEmailProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestUpdateEmailProfile>(create);
  static RequestUpdateEmailProfile? _defaultInstance;

  @$pb.TagNumber(114)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(114)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(114)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(114)
  void clearID() => clearField(114);
}

class UpdateEmailProfile_Request extends $pb.GeneratedMessage {
  factory UpdateEmailProfile_Request({
    $core.String? otp,
  }) {
    final $result = create();
    if (otp != null) {
      $result.otp = otp;
    }
    return $result;
  }
  UpdateEmailProfile_Request._() : super();
  factory UpdateEmailProfile_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEmailProfile_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEmailProfile.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'otp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEmailProfile_Request clone() => UpdateEmailProfile_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEmailProfile_Request copyWith(void Function(UpdateEmailProfile_Request) updates) => super.copyWith((message) => updates(message as UpdateEmailProfile_Request)) as UpdateEmailProfile_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmailProfile_Request create() => UpdateEmailProfile_Request._();
  UpdateEmailProfile_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateEmailProfile_Request> createRepeated() => $pb.PbList<UpdateEmailProfile_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmailProfile_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEmailProfile_Request>(create);
  static UpdateEmailProfile_Request? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get otp => $_getSZ(0);
  @$pb.TagNumber(2)
  set otp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtp() => $_has(0);
  @$pb.TagNumber(2)
  void clearOtp() => clearField(2);
}

class UpdateEmailProfile_Reply extends $pb.GeneratedMessage {
  factory UpdateEmailProfile_Reply({
    $0.Profile? newProfile,
  }) {
    final $result = create();
    if (newProfile != null) {
      $result.newProfile = newProfile;
    }
    return $result;
  }
  UpdateEmailProfile_Reply._() : super();
  factory UpdateEmailProfile_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEmailProfile_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEmailProfile.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.Profile>(1, _omitFieldNames ? '' : 'newProfile', protoName: 'newProfile', subBuilder: $0.Profile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEmailProfile_Reply clone() => UpdateEmailProfile_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEmailProfile_Reply copyWith(void Function(UpdateEmailProfile_Reply) updates) => super.copyWith((message) => updates(message as UpdateEmailProfile_Reply)) as UpdateEmailProfile_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmailProfile_Reply create() => UpdateEmailProfile_Reply._();
  UpdateEmailProfile_Reply createEmptyInstance() => create();
  static $pb.PbList<UpdateEmailProfile_Reply> createRepeated() => $pb.PbList<UpdateEmailProfile_Reply>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmailProfile_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEmailProfile_Reply>(create);
  static UpdateEmailProfile_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Profile get newProfile => $_getN(0);
  @$pb.TagNumber(1)
  set newProfile($0.Profile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewProfile() => clearField(1);
  @$pb.TagNumber(1)
  $0.Profile ensureNewProfile() => $_ensure(0);
}

class UpdateEmailProfile extends $pb.GeneratedMessage {
  factory UpdateEmailProfile({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  UpdateEmailProfile._() : super();
  factory UpdateEmailProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEmailProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEmailProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(115, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEmailProfile clone() => UpdateEmailProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEmailProfile copyWith(void Function(UpdateEmailProfile) updates) => super.copyWith((message) => updates(message as UpdateEmailProfile)) as UpdateEmailProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmailProfile create() => UpdateEmailProfile._();
  UpdateEmailProfile createEmptyInstance() => create();
  static $pb.PbList<UpdateEmailProfile> createRepeated() => $pb.PbList<UpdateEmailProfile>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmailProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEmailProfile>(create);
  static UpdateEmailProfile? _defaultInstance;

  @$pb.TagNumber(115)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(115)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(115)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(115)
  void clearID() => clearField(115);
}

class CloudDefaultSetting_Request extends $pb.GeneratedMessage {
  factory CloudDefaultSetting_Request({
    $core.bool? powerCloudStorage,
    $core.int? numberDaysStorage,
  }) {
    final $result = create();
    if (powerCloudStorage != null) {
      $result.powerCloudStorage = powerCloudStorage;
    }
    if (numberDaysStorage != null) {
      $result.numberDaysStorage = numberDaysStorage;
    }
    return $result;
  }
  CloudDefaultSetting_Request._() : super();
  factory CloudDefaultSetting_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloudDefaultSetting_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CloudDefaultSetting.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'powerCloudStorage')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'numberDaysStorage', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CloudDefaultSetting_Request clone() => CloudDefaultSetting_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CloudDefaultSetting_Request copyWith(void Function(CloudDefaultSetting_Request) updates) => super.copyWith((message) => updates(message as CloudDefaultSetting_Request)) as CloudDefaultSetting_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloudDefaultSetting_Request create() => CloudDefaultSetting_Request._();
  CloudDefaultSetting_Request createEmptyInstance() => create();
  static $pb.PbList<CloudDefaultSetting_Request> createRepeated() => $pb.PbList<CloudDefaultSetting_Request>();
  @$core.pragma('dart2js:noInline')
  static CloudDefaultSetting_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloudDefaultSetting_Request>(create);
  static CloudDefaultSetting_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get powerCloudStorage => $_getBF(0);
  @$pb.TagNumber(1)
  set powerCloudStorage($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPowerCloudStorage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowerCloudStorage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get numberDaysStorage => $_getIZ(1);
  @$pb.TagNumber(2)
  set numberDaysStorage($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumberDaysStorage() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumberDaysStorage() => clearField(2);
}

class CloudDefaultSetting_Reply extends $pb.GeneratedMessage {
  factory CloudDefaultSetting_Reply({
    $0.Profile? newProfile,
  }) {
    final $result = create();
    if (newProfile != null) {
      $result.newProfile = newProfile;
    }
    return $result;
  }
  CloudDefaultSetting_Reply._() : super();
  factory CloudDefaultSetting_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloudDefaultSetting_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CloudDefaultSetting.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.Profile>(1, _omitFieldNames ? '' : 'newProfile', protoName: 'newProfile', subBuilder: $0.Profile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CloudDefaultSetting_Reply clone() => CloudDefaultSetting_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CloudDefaultSetting_Reply copyWith(void Function(CloudDefaultSetting_Reply) updates) => super.copyWith((message) => updates(message as CloudDefaultSetting_Reply)) as CloudDefaultSetting_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloudDefaultSetting_Reply create() => CloudDefaultSetting_Reply._();
  CloudDefaultSetting_Reply createEmptyInstance() => create();
  static $pb.PbList<CloudDefaultSetting_Reply> createRepeated() => $pb.PbList<CloudDefaultSetting_Reply>();
  @$core.pragma('dart2js:noInline')
  static CloudDefaultSetting_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloudDefaultSetting_Reply>(create);
  static CloudDefaultSetting_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Profile get newProfile => $_getN(0);
  @$pb.TagNumber(1)
  set newProfile($0.Profile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewProfile() => clearField(1);
  @$pb.TagNumber(1)
  $0.Profile ensureNewProfile() => $_ensure(0);
}

class CloudDefaultSetting extends $pb.GeneratedMessage {
  factory CloudDefaultSetting({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  CloudDefaultSetting._() : super();
  factory CloudDefaultSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloudDefaultSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CloudDefaultSetting', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(116, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CloudDefaultSetting clone() => CloudDefaultSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CloudDefaultSetting copyWith(void Function(CloudDefaultSetting) updates) => super.copyWith((message) => updates(message as CloudDefaultSetting)) as CloudDefaultSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloudDefaultSetting create() => CloudDefaultSetting._();
  CloudDefaultSetting createEmptyInstance() => create();
  static $pb.PbList<CloudDefaultSetting> createRepeated() => $pb.PbList<CloudDefaultSetting>();
  @$core.pragma('dart2js:noInline')
  static CloudDefaultSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloudDefaultSetting>(create);
  static CloudDefaultSetting? _defaultInstance;

  @$pb.TagNumber(116)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(116)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(116)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(116)
  void clearID() => clearField(116);
}

class VerifyURL_Request extends $pb.GeneratedMessage {
  factory VerifyURL_Request({
    $core.String? url,
  }) {
    final $result = create();
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  VerifyURL_Request._() : super();
  factory VerifyURL_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyURL_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyURL.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyURL_Request clone() => VerifyURL_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyURL_Request copyWith(void Function(VerifyURL_Request) updates) => super.copyWith((message) => updates(message as VerifyURL_Request)) as VerifyURL_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyURL_Request create() => VerifyURL_Request._();
  VerifyURL_Request createEmptyInstance() => create();
  static $pb.PbList<VerifyURL_Request> createRepeated() => $pb.PbList<VerifyURL_Request>();
  @$core.pragma('dart2js:noInline')
  static VerifyURL_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyURL_Request>(create);
  static VerifyURL_Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);
}

class VerifyURL_Reply extends $pb.GeneratedMessage {
  factory VerifyURL_Reply({
    $0.License_profile? licenseProfile,
  }) {
    final $result = create();
    if (licenseProfile != null) {
      $result.licenseProfile = licenseProfile;
    }
    return $result;
  }
  VerifyURL_Reply._() : super();
  factory VerifyURL_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyURL_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyURL.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.License_profile>(1, _omitFieldNames ? '' : 'licenseProfile', subBuilder: $0.License_profile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyURL_Reply clone() => VerifyURL_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyURL_Reply copyWith(void Function(VerifyURL_Reply) updates) => super.copyWith((message) => updates(message as VerifyURL_Reply)) as VerifyURL_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyURL_Reply create() => VerifyURL_Reply._();
  VerifyURL_Reply createEmptyInstance() => create();
  static $pb.PbList<VerifyURL_Reply> createRepeated() => $pb.PbList<VerifyURL_Reply>();
  @$core.pragma('dart2js:noInline')
  static VerifyURL_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyURL_Reply>(create);
  static VerifyURL_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.License_profile get licenseProfile => $_getN(0);
  @$pb.TagNumber(1)
  set licenseProfile($0.License_profile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseProfile() => clearField(1);
  @$pb.TagNumber(1)
  $0.License_profile ensureLicenseProfile() => $_ensure(0);
}

class VerifyURL extends $pb.GeneratedMessage {
  factory VerifyURL({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  VerifyURL._() : super();
  factory VerifyURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyURL', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(117, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyURL clone() => VerifyURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyURL copyWith(void Function(VerifyURL) updates) => super.copyWith((message) => updates(message as VerifyURL)) as VerifyURL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyURL create() => VerifyURL._();
  VerifyURL createEmptyInstance() => create();
  static $pb.PbList<VerifyURL> createRepeated() => $pb.PbList<VerifyURL>();
  @$core.pragma('dart2js:noInline')
  static VerifyURL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyURL>(create);
  static VerifyURL? _defaultInstance;

  @$pb.TagNumber(117)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(117)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(117)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(117)
  void clearID() => clearField(117);
}

class VconnexLogin_Request extends $pb.GeneratedMessage {
  factory VconnexLogin_Request({
    $core.String? token,
    $0.ProjectTarget? target,
    $core.int? apiVersion,
    $core.int? platform,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (target != null) {
      $result.target = target;
    }
    if (apiVersion != null) {
      $result.apiVersion = apiVersion;
    }
    if (platform != null) {
      $result.platform = platform;
    }
    return $result;
  }
  VconnexLogin_Request._() : super();
  factory VconnexLogin_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VconnexLogin_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VconnexLogin.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..e<$0.ProjectTarget>(3, _omitFieldNames ? '' : 'target', $pb.PbFieldType.OE, defaultOrMaker: $0.ProjectTarget.VIVAS, valueOf: $0.ProjectTarget.valueOf, enumValues: $0.ProjectTarget.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'apiVersion', $pb.PbFieldType.O3, protoName: 'apiVersion')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'platform', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VconnexLogin_Request clone() => VconnexLogin_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VconnexLogin_Request copyWith(void Function(VconnexLogin_Request) updates) => super.copyWith((message) => updates(message as VconnexLogin_Request)) as VconnexLogin_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VconnexLogin_Request create() => VconnexLogin_Request._();
  VconnexLogin_Request createEmptyInstance() => create();
  static $pb.PbList<VconnexLogin_Request> createRepeated() => $pb.PbList<VconnexLogin_Request>();
  @$core.pragma('dart2js:noInline')
  static VconnexLogin_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VconnexLogin_Request>(create);
  static VconnexLogin_Request? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);

  @$pb.TagNumber(3)
  $0.ProjectTarget get target => $_getN(1);
  @$pb.TagNumber(3)
  set target($0.ProjectTarget v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTarget() => $_has(1);
  @$pb.TagNumber(3)
  void clearTarget() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get apiVersion => $_getIZ(2);
  @$pb.TagNumber(4)
  set apiVersion($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasApiVersion() => $_has(2);
  @$pb.TagNumber(4)
  void clearApiVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get platform => $_getIZ(3);
  @$pb.TagNumber(5)
  set platform($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlatform() => $_has(3);
  @$pb.TagNumber(5)
  void clearPlatform() => clearField(5);
}

class VconnexLogin_Reply extends $pb.GeneratedMessage {
  factory VconnexLogin_Reply({
    $0.TurnAccount? turnAccount,
    $fixnum.Int64? serverTime,
    $0.Profile? profile,
    $core.int? serverVersionBuild,
    $core.String? baseImageUrl,
    $core.Iterable<$core.String>? listNtpServer,
    $core.int? buildNumber,
    $core.String? linkDownload,
    $0.ProjectTarget? target,
    VconnexLogin_BaseURL? baseUrl,
    $0.License_profile? licenseProfile,
  }) {
    final $result = create();
    if (turnAccount != null) {
      $result.turnAccount = turnAccount;
    }
    if (serverTime != null) {
      $result.serverTime = serverTime;
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (serverVersionBuild != null) {
      $result.serverVersionBuild = serverVersionBuild;
    }
    if (baseImageUrl != null) {
      $result.baseImageUrl = baseImageUrl;
    }
    if (listNtpServer != null) {
      $result.listNtpServer.addAll(listNtpServer);
    }
    if (buildNumber != null) {
      $result.buildNumber = buildNumber;
    }
    if (linkDownload != null) {
      $result.linkDownload = linkDownload;
    }
    if (target != null) {
      $result.target = target;
    }
    if (baseUrl != null) {
      $result.baseUrl = baseUrl;
    }
    if (licenseProfile != null) {
      $result.licenseProfile = licenseProfile;
    }
    return $result;
  }
  VconnexLogin_Reply._() : super();
  factory VconnexLogin_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VconnexLogin_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VconnexLogin.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOM<$0.TurnAccount>(1, _omitFieldNames ? '' : 'turnAccount', subBuilder: $0.TurnAccount.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'serverTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Profile>(3, _omitFieldNames ? '' : 'profile', subBuilder: $0.Profile.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'serverVersionBuild', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'baseImageUrl')
    ..pPS(6, _omitFieldNames ? '' : 'listNtpServer')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'buildNumber', $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : 'linkDownload')
    ..e<$0.ProjectTarget>(9, _omitFieldNames ? '' : 'target', $pb.PbFieldType.OE, defaultOrMaker: $0.ProjectTarget.VIVAS, valueOf: $0.ProjectTarget.valueOf, enumValues: $0.ProjectTarget.values)
    ..aOM<VconnexLogin_BaseURL>(10, _omitFieldNames ? '' : 'baseUrl', subBuilder: VconnexLogin_BaseURL.create)
    ..aOM<$0.License_profile>(11, _omitFieldNames ? '' : 'licenseProfile', subBuilder: $0.License_profile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VconnexLogin_Reply clone() => VconnexLogin_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VconnexLogin_Reply copyWith(void Function(VconnexLogin_Reply) updates) => super.copyWith((message) => updates(message as VconnexLogin_Reply)) as VconnexLogin_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VconnexLogin_Reply create() => VconnexLogin_Reply._();
  VconnexLogin_Reply createEmptyInstance() => create();
  static $pb.PbList<VconnexLogin_Reply> createRepeated() => $pb.PbList<VconnexLogin_Reply>();
  @$core.pragma('dart2js:noInline')
  static VconnexLogin_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VconnexLogin_Reply>(create);
  static VconnexLogin_Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $0.TurnAccount get turnAccount => $_getN(0);
  @$pb.TagNumber(1)
  set turnAccount($0.TurnAccount v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTurnAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTurnAccount() => clearField(1);
  @$pb.TagNumber(1)
  $0.TurnAccount ensureTurnAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get serverTime => $_getI64(1);
  @$pb.TagNumber(2)
  set serverTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerTime() => clearField(2);

  @$pb.TagNumber(3)
  $0.Profile get profile => $_getN(2);
  @$pb.TagNumber(3)
  set profile($0.Profile v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfile() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfile() => clearField(3);
  @$pb.TagNumber(3)
  $0.Profile ensureProfile() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get serverVersionBuild => $_getIZ(3);
  @$pb.TagNumber(4)
  set serverVersionBuild($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServerVersionBuild() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerVersionBuild() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get baseImageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set baseImageUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBaseImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearBaseImageUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get listNtpServer => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get buildNumber => $_getIZ(6);
  @$pb.TagNumber(7)
  set buildNumber($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBuildNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuildNumber() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get linkDownload => $_getSZ(7);
  @$pb.TagNumber(8)
  set linkDownload($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLinkDownload() => $_has(7);
  @$pb.TagNumber(8)
  void clearLinkDownload() => clearField(8);

  @$pb.TagNumber(9)
  $0.ProjectTarget get target => $_getN(8);
  @$pb.TagNumber(9)
  set target($0.ProjectTarget v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearTarget() => clearField(9);

  @$pb.TagNumber(10)
  VconnexLogin_BaseURL get baseUrl => $_getN(9);
  @$pb.TagNumber(10)
  set baseUrl(VconnexLogin_BaseURL v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasBaseUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearBaseUrl() => clearField(10);
  @$pb.TagNumber(10)
  VconnexLogin_BaseURL ensureBaseUrl() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.License_profile get licenseProfile => $_getN(10);
  @$pb.TagNumber(11)
  set licenseProfile($0.License_profile v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasLicenseProfile() => $_has(10);
  @$pb.TagNumber(11)
  void clearLicenseProfile() => clearField(11);
  @$pb.TagNumber(11)
  $0.License_profile ensureLicenseProfile() => $_ensure(10);
}

class VconnexLogin_BaseURL extends $pb.GeneratedMessage {
  factory VconnexLogin_BaseURL({
    $core.String? faceBaseUrl,
  }) {
    final $result = create();
    if (faceBaseUrl != null) {
      $result.faceBaseUrl = faceBaseUrl;
    }
    return $result;
  }
  VconnexLogin_BaseURL._() : super();
  factory VconnexLogin_BaseURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VconnexLogin_BaseURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VconnexLogin.BaseURL', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'faceBaseUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VconnexLogin_BaseURL clone() => VconnexLogin_BaseURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VconnexLogin_BaseURL copyWith(void Function(VconnexLogin_BaseURL) updates) => super.copyWith((message) => updates(message as VconnexLogin_BaseURL)) as VconnexLogin_BaseURL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VconnexLogin_BaseURL create() => VconnexLogin_BaseURL._();
  VconnexLogin_BaseURL createEmptyInstance() => create();
  static $pb.PbList<VconnexLogin_BaseURL> createRepeated() => $pb.PbList<VconnexLogin_BaseURL>();
  @$core.pragma('dart2js:noInline')
  static VconnexLogin_BaseURL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VconnexLogin_BaseURL>(create);
  static VconnexLogin_BaseURL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get faceBaseUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set faceBaseUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFaceBaseUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearFaceBaseUrl() => clearField(1);
}

class VconnexLogin extends $pb.GeneratedMessage {
  factory VconnexLogin({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  VconnexLogin._() : super();
  factory VconnexLogin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VconnexLogin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VconnexLogin', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(118, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.OU3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VconnexLogin clone() => VconnexLogin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VconnexLogin copyWith(void Function(VconnexLogin) updates) => super.copyWith((message) => updates(message as VconnexLogin)) as VconnexLogin;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VconnexLogin create() => VconnexLogin._();
  VconnexLogin createEmptyInstance() => create();
  static $pb.PbList<VconnexLogin> createRepeated() => $pb.PbList<VconnexLogin>();
  @$core.pragma('dart2js:noInline')
  static VconnexLogin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VconnexLogin>(create);
  static VconnexLogin? _defaultInstance;

  @$pb.TagNumber(118)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(118)
  set iD($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(118)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(118)
  void clearID() => clearField(118);
}

class RemoveAccount_Request extends $pb.GeneratedMessage {
  factory RemoveAccount_Request() => create();
  RemoveAccount_Request._() : super();
  factory RemoveAccount_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveAccount_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveAccount.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveAccount_Request clone() => RemoveAccount_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveAccount_Request copyWith(void Function(RemoveAccount_Request) updates) => super.copyWith((message) => updates(message as RemoveAccount_Request)) as RemoveAccount_Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveAccount_Request create() => RemoveAccount_Request._();
  RemoveAccount_Request createEmptyInstance() => create();
  static $pb.PbList<RemoveAccount_Request> createRepeated() => $pb.PbList<RemoveAccount_Request>();
  @$core.pragma('dart2js:noInline')
  static RemoveAccount_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveAccount_Request>(create);
  static RemoveAccount_Request? _defaultInstance;
}

class RemoveAccount_Reply extends $pb.GeneratedMessage {
  factory RemoveAccount_Reply() => create();
  RemoveAccount_Reply._() : super();
  factory RemoveAccount_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveAccount_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveAccount.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveAccount_Reply clone() => RemoveAccount_Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveAccount_Reply copyWith(void Function(RemoveAccount_Reply) updates) => super.copyWith((message) => updates(message as RemoveAccount_Reply)) as RemoveAccount_Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveAccount_Reply create() => RemoveAccount_Reply._();
  RemoveAccount_Reply createEmptyInstance() => create();
  static $pb.PbList<RemoveAccount_Reply> createRepeated() => $pb.PbList<RemoveAccount_Reply>();
  @$core.pragma('dart2js:noInline')
  static RemoveAccount_Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveAccount_Reply>(create);
  static RemoveAccount_Reply? _defaultInstance;
}

class RemoveAccount extends $pb.GeneratedMessage {
  factory RemoveAccount({
    $core.int? iD,
  }) {
    final $result = create();
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  RemoveAccount._() : super();
  factory RemoveAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveAccount', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$core.int>(119, _omitFieldNames ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveAccount clone() => RemoveAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveAccount copyWith(void Function(RemoveAccount) updates) => super.copyWith((message) => updates(message as RemoveAccount)) as RemoveAccount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveAccount create() => RemoveAccount._();
  RemoveAccount createEmptyInstance() => create();
  static $pb.PbList<RemoveAccount> createRepeated() => $pb.PbList<RemoveAccount>();
  @$core.pragma('dart2js:noInline')
  static RemoveAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveAccount>(create);
  static RemoveAccount? _defaultInstance;

  @$pb.TagNumber(119)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(119)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(119)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(119)
  void clearID() => clearField(119);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
