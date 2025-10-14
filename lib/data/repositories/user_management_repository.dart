import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/user_service.dart';
import 'package:vms_flutter_client/data/mappers/user_mapper.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import 'package:vms_flutter_client/domain/entities/user/user.dart';

import 'base_repository.dart';

class UserManagementRepository extends BaseRepository
    implements IUserManagementRepository {
  final UserService service;

  const UserManagementRepository(this.service);

  @override
  Future<Either<Failure, List<User>>> listUser() async {
    return await catchError<List<User>>(() async {
      final groups = await service.getListUser();
      return Right(groups.map((e) => e.toDomain()).toList());
    });
  }
  
  @override
  Future<Either<Failure, User>> user() {
    // TODO: implement user
    throw UnimplementedError();
  }
}
