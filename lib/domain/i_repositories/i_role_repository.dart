import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';

abstract class IRoleRepository {
  Future<Either<Failure, List<Role>>> getAllRoles();
}
