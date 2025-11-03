import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/mappers/invite_message_mapper.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';
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

  @override
  Future<Either<Failure, List<DeviceGroup>?>> removeGroupCamera({
    List<int>? groupId,
  }) async {
    return await catchError<List<DeviceGroup>>(() async {
      final groups = await service.removeGroupCamera(groupId: groupId);
      return Right(groups.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<DeviceGroup>?>> updateGroupCamera({
    List<int>? groupId,
    String? groupName,
    List<int>? parentGroupId,
  }) async {
    return await catchError<List<DeviceGroup>>(() async {
      final groups = await service.updateGroupCamera(
        groupId: groupId,
        groupName: groupName,
        parentGroupId: parentGroupId,
      );
      return Right(groups.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<int>?>> shareGroupCamera({
    List<int>? groupId,
    DeviceGroupRole? role,
    List<int>? accountInviteId,
  }) async {
    return await catchError<List<int>>(() async {
      final sharedGroupIds = await service.shareGroup(
        groupId: groupId,
        role: role,
        accountInviteId: accountInviteId,
      );
      return Right(sharedGroupIds);
    });
  }

  @override
  Future<Either<Failure, List<InviteMessageEntity>>> listShareInviteGroup({
    required List<int> groupId,
  }) async {
    return await catchError<List<InviteMessageEntity>>(() async {
      final invites = await service.listShareInviteGroup(groupId: groupId);
      return Right(invites.map((e) => e.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<int>?>> deleteShareGroupCamera({
    List<int>? shareInviteId,
  }) async {
    return await catchError<List<int>>(() async {
      final invites = await service.deleteShareGroup(
        shareInviteId: shareInviteId,
      );
      return Right(invites);
    });
  }
}
