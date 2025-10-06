import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_group_repository.dart';

import '../datasources/group_service.dart';
import 'base_repository.dart';

class GroupRepository extends BaseRepository implements IGroupRepository {
  final GroupService service;

  const GroupRepository(this.service);

  @override
  Future<Either<Failure, List<DeviceGroup>>> getAllGroup() async {
    return await catchError<List<DeviceGroup>>(() async {
      return Right(await service.getAllGroup());
    });
  }
}
