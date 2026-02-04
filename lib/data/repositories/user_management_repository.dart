import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/user_service.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';

import 'base_repository.dart';

class UserManagementRepository extends BaseRepository implements IUserManagementRepository {
  final UserService service;

  const UserManagementRepository(this.service);

  @override
  Future<Either<Failure, List<UserEntity>>> listUser() async {
    return await catchError<List<UserEntity>>(() async {
      final groups = await service.getListUser();
      return Right(groups);
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
    int? dataType,
  }) async {
    return await catchError<UserEntity>(() async {
      final user = await service.addUser(
        account: account,
        password: password,
        tel: tel,
        address: address,
        email: email,
        desc: desc,
        fullName: fullName,
        isAdmin: isAmin,
        changePassDenied: changePassDenied,
        addCamDenied: addCamDenied,
        dataType: dataType,
      );

      return Right(user);
    });
  }

  @override
  Future<Either<Failure, int>> deleteUser({required int userId}) async {
    return await catchError<int>(() async {
      final deletedUserId = await service.deleteUser(userId: userId);
      return Right(deletedUserId);
    });
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required int userId,
    required String newPassword,
  }) async {
    return await catchError<bool>(() async {
      final value = await service.resetPassword(userId: userId, newPassword: newPassword);
      return Right(value);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> editUser({
    required int userId,
    required String account,
    String? tel,
    String? email,
    String? address,
    String? desc,
    String? fullName,
    bool? isAmin,
    bool? changePassDenied,
    bool? addCamDenied,
  }) async {
    return await catchError<UserEntity>(() async {
      final user = await service.editUser(
        userId: userId,
        account: account,
        tel: tel,
        address: address,
        email: email,
        desc: desc,
        fullName: fullName,
        isAdmin: isAmin,
        changePassDenied: changePassDenied,
        addCamDenied: addCamDenied,
      );
      return Right(user);
    });
  }

  @override
  Future<Either<Failure, bool>> changeMyPassword({
    required String current,
    required String password,
    bool? kickOthers,
  }) async {
    return await catchError<bool>(() async {
      final value = await service.changeMyPassword(
        current: current,
        password: password,
        kickOthers: kickOthers,
      );
      return Right(value);
    });
  }

  @override
  Future<Either<Failure, bool>> updateMyProfile({
    String? displayName,
    String? email,
    String? tel,
    String? address,
  }) async {
    return await catchError<bool>(() async {
      final value = await service.updateMyProfile(
        displayName: displayName,
        email: email,
        tel: tel,
        address: address,
      );
      return Right(value);
    });
  }
}
