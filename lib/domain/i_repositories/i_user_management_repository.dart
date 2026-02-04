import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';

abstract class IUserManagementRepository {
  Future<Either<Failure, List<UserEntity>>> listUser();
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
  });
  Future<Either<Failure, int>> deleteUser({required int userId});
  Future<Either<Failure, bool>> resetPassword({required int userId, required String newPassword});
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
  });
  Future<Either<Failure, bool>> changeMyPassword({
    required String current,
    required String password,
    bool? kickOthers,
  });
  Future<Either<Failure, bool>> updateMyProfile({
    String? displayName,
    String? email,
    String? tel,
    String? address,
  });
}
