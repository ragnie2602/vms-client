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
    $core.String? uid,
    $core.String? sessionId,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  Login_Request._() : super();
  factory Login_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Login_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Login.Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'sessionId')
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
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => clearField(2);
}

class Login_Reply extends $pb.GeneratedMessage {
  factory Login_Reply({
    $fixnum.Int64? serverTime,
    $0.Profile? profile,
    $core.String? baseApiUrl,
  }) {
    final $result = create();
    if (serverTime != null) {
      $result.serverTime = serverTime;
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (baseApiUrl != null) {
      $result.baseApiUrl = baseApiUrl;
    }
    return $result;
  }
  Login_Reply._() : super();
  factory Login_Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Login_Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Login.Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'comm'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'serverTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Profile>(2, _omitFieldNames ? '' : 'profile', subBuilder: $0.Profile.create)
    ..aOS(3, _omitFieldNames ? '' : 'baseApiUrl')
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
  $fixnum.Int64 get serverTime => $_getI64(0);
  @$pb.TagNumber(1)
  set serverTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerTime() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.String get baseApiUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set baseApiUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBaseApiUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearBaseApiUrl() => clearField(3);
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
