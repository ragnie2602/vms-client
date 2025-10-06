import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_group_repository.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/data/mappers/group_mapper.dart';

import '../datasources/group_service.dart';
import 'base_repository.dart';

class GroupRepository extends BaseRepository implements IGroupRepository {
  final GroupService service;

  const GroupRepository(this.service);

  @override
  Future<Either<Failure, List<DeviceGroup>>> getAllGroup() async {
    return await catchError<List<DeviceGroup>>(() async {
      final groups = await service.getAllGroup();
      return Right(groups.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<DeviceGroup>?>> addGroupCamera({
    String? groupName,
    List<int>? parentGroupId,
  }) async {
    return await catchError<List<DeviceGroup>>(() async {
      final groups = await service.addGroupCamera(
        groupName: groupName,
        parentGroupId: parentGroupId,
      );
      return Right(groups.map((e) => e.toDomain()).toList());
    });
  }
}
