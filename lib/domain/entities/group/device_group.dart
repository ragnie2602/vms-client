import 'package:vms_flutter_client/domain/entities/group/device_group_status.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_type.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';

class DeviceGroup {
  final String name;
  final List<int> parentGroupId;
  final DeviceGroupStatus status;
  final int level;
  final int createdDate;
  final int lastUpdate;
  final List<int> userCreated;
  final List<DeviceGroup> groups;
  final List<int> groupId;
  final DeviceGroupType groupType;
  final DeviceGroupRole groupRole;

  const DeviceGroup({
    required this.name,
    required this.parentGroupId,
    required this.status,
    required this.level,
    required this.createdDate,
    required this.lastUpdate,
    required this.userCreated,
    required this.groups,
    required this.groupId,
    required this.groupType,
    required this.groupRole,
  });
}
