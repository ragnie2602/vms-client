import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/role_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission_tree.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_role_repository.dart';

class RoleRepository extends BaseRepository implements IRoleRepository {
  final RoleService service;

  RoleRepository(this.service);

  @override
  Future<Either<Failure, Role>> addRole(Role role) {
    return catchError(() async {
      final request = role.toJson();
      request['systemActionCodes'] = role.systemPermissions?.actions;
      request['subjectActionCodes'] = role.subjectPermissions?.actions;
      request['cameraActionCodes'] = role.cameraPermissions?.actions;
      request['allowedCameraGroupUuids'] = role.cameraPermissions?.allowedCameraGroupUuids;
      request['allowedSubjectGroupIds'] = role.subjectPermissions?.allowedSubjectGroupIds;

      final data = await service.addRole(request);
      return Right(Role.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, void>> deleteRole(int roleId) {
    return catchError(() async {
      await service.deleteRole(roleId);
      return const Right(null);
    });
  }

  @override
  Future<Either<Failure, Role>> editRole(Role role) {
    return catchError(() async {
      final request = role.toJson();
      request['systemActionCodes'] = role.systemPermissions?.actions;
      request['subjectActionCodes'] = role.subjectPermissions?.actions;
      request['cameraActionCodes'] = role.cameraPermissions?.actions;
      request['allowedCameraGroupUuids'] = role.cameraPermissions?.allowedCameraGroupUuids;
      request['allowedSubjectGroupIds'] = role.subjectPermissions?.allowedSubjectGroupIds;

      final data = await service.editRole(role.id!, request);
      return Right(Role.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, PermissionTree>> getPermissionTree() {
    return catchError(() async {
      final tree = await service.getPermissionTree();

      return Right(PermissionTree.fromJson(tree));
    });
  }

  @override
  Future<Either<Failure, List<Role>>> getAllRoles() {
    return catchError(() async {
      final roles = await service.getAllRoles();
      return Right(List<Role>.from(roles.map((e) => Role.fromJson(e))));
    });
  }
}
