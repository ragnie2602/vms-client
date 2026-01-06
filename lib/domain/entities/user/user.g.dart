// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  status: $enumDecode(_$UserStatusEnumMap, json['status']),
  userType: json['userType'] as String,
  createAt: json['createAt'] as String,
  lastUpdate: json['lastUpdate'] as String,
  desc: json['desc'] as String,
  fullname: json['fullname'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'status': _$UserStatusEnumMap[instance.status]!,
      'userType': instance.userType,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
      'desc': instance.desc,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
    };

const _$UserStatusEnumMap = {
  UserStatus.inactive: 'inactive',
  UserStatus.active: 'active',
  UserStatus.suspend: 'suspend',
  UserStatus.lock: 'lock',
};
