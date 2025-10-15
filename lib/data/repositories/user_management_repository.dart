import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/user_service.dart';
import 'package:vms_flutter_client/data/mappers/user_mapper.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';

import 'base_repository.dart';

class UserManagementRepository extends BaseRepository
    implements IUserManagementRepository {
  final UserService service;

  const UserManagementRepository(this.service);

  @override
  Future<Either<Failure, List<UserEntity>>> listUser() async {
    return await catchError<List<UserEntity>>(() async {
      final groups = await service.getListUser();
      return Right(groups.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, UserEntity>> addUser({
    required String account,
    required String password,
    String? tel,
    String? email,
    String? address,
    String? desc,
    String? fullName,
    bool? isAmin,
    bool? changePassDenied,
    bool? addCamDenied,
  }) async {
    {
      return await catchError<UserEntity>(() async {
        final groups = await service.addUser(
          account: account,
          password: password,
          tel: tel,
          address: address,
          email: email,
          desc: desc,
          fullName: fullName,
          isAmin: isAmin,
          changePassDenied: changePassDenied,
          addCamDenied: addCamDenied,
        );
        return Right(groups.toDomain());
      });
    }
  }

  @override
  Future<Either<Failure, List<int>>> deleteUser({
    required List<int> userId,
  }) async {
    return await catchError<List<int>>(() async {
      final groups = await service.deleteUser(userId: userId);
      return Right(groups.toList());
    });
  }
}
