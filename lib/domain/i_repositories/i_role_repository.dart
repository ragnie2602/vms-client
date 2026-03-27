import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission_tree.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';

abstract class IRoleRepository {
  Future<Either<Failure, Role>> addRole(Role role);
  Future<Either<Failure, void>> deleteRole(int roleId);
  Future<Either<Failure, Role>> editRole(Role role);
  Future<Either<Failure, PermissionTree>> getPermissionTree();
  Future<Either<Failure, List<Role>>> getAllRoles();
}
