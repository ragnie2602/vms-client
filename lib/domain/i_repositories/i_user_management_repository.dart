import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';

abstract class IUserManagementRepository {
  Future<Either<Failure, List<UserEntity>>> listUser();
  Future<Either<Failure, UserEntity>> addUser();
}
