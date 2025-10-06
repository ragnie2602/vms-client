import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_status.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_type.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';

extension DeviceGroupStatusMapper on pb.DeviceGroup_Status {
  DeviceGroupStatus toDomain() {
    return DeviceGroupStatus.fromValue(value);
  }
}

extension DeviceGroupTypeMapper on pb.DeviceGroup_Type {
  DeviceGroupType toDomain() {
    return DeviceGroupType.fromValue(value);
  }
}

extension DeviceGroupRoleMapper on pb.DeviceGroup_Role {
  DeviceGroupRole toDomain() {
    return DeviceGroupRole.fromValue(value);
  }
}

extension DeviceGroupMapper on pb.DeviceGroup {
  DeviceGroup toDomain() {
    return DeviceGroup(
      name: name,
      parentGroupId: parentGroupId,
      status: status.toDomain(),
      level: level,
      createdDate: createdDate.toInt(),
      lastUpdate: lastUpdate.toInt(),
      userCreated: userCreated,
      groups: groups.map((e) => e.toDomain()).toList(),
      groupId: groupId,
      groupType: groupType.toDomain(),
      groupRole: groupRole.toDomain(),
    );
  }
}
