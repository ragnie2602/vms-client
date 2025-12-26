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
  });
  Future<Either<Failure, List<int>>> deleteUser({required List<int> userId});
  Future<Either<Failure, bool>> resetPassword({
    required List<int> userId,
    required String newPassword,
  });
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
  Future<Either<Failure, bool>> removeAccount();
}
