// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationImpl _$$AuthenticationImplFromJson(Map<String, dynamic> json) =>
    _$AuthenticationImpl(
      account: json['account'] as String,
      sessionId: (json['sessionId'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      uid: (json['uid'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      ssid: json['ssid'] as String,
    );

Map<String, dynamic> _$$AuthenticationImplToJson(
  _$AuthenticationImpl instance,
) => <String, dynamic>{
  'account': instance.account,
  'sessionId': instance.sessionId,
  'uid': instance.uid,
  'ssid': instance.ssid,
};
