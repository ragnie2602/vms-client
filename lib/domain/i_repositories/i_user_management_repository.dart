import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/user/user.dart';

abstract class IUserManagementRepository {
  Future<Either<Failure, List<User>>> listUser();
}
