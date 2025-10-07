import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

abstract class IGroupRepository {
  Future<Either<Failure, List<DeviceGroup>>> getAllGroup();
  Future<Either<Failure, List<DeviceGroup>?>> addGroupCamera({
    String? groupName,
    List<int>? parentGroupId,
  });
  Future<Either<Failure, List<DeviceGroup>?>> removeGroupCamera({
    List<int>? groupId,
  });
  Future<Either<Failure, List<DeviceGroup>?>> updateGroupCamera({
    List<int>? groupId,
    String? groupName,
    List<int>? parentGroupId,
  });
}
