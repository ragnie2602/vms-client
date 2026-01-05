import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/user_service.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/entities/user/user_status.dart';
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
      );

      return Right(user);
    });
  }

  @override
  Future<Either<Failure, List<int>>> deleteUser({required List<int> userId}) async {
    return await catchError<List<int>>(() async {
      final groups = await service.deleteUser(userId: userId);
      return Right(groups.toList());
    });
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required List<int> userId,
    required String newPassword,
  }) async {
    return await catchError<bool>(() async {
      final value = await service.resetPassword(userId: userId, newPassword: newPassword);
      return Right(value);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> editUser({
    required List<int> userId,
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
    return await catchError<UserEntity>(() async {
      final groups = await service.editUser(
        userId: userId,
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
      return Right(
        UserEntity(
          id: DateTime.now().millisecondsSinceEpoch ~/ 1000, // Mock ID từ timestamp
          username: account,
          status: UserStatus.active,
          userType: 'tenant_user',
          tenantId: 1,
          tenantName: 'Default Tenant',
          fullname: fullName ?? account,
          email: email ?? '',
          phone: tel ?? '',
          description: desc,
          type: null,
          permissions: isAmin == true ? ['ADMIN'] : ['USER'],
        ),
      );
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
