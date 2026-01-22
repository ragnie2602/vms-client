import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/role_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_role_repository.dart';

class RoleRepository extends BaseRepository implements IRoleRepository {
  final RoleService service;

  RoleRepository(this.service);

  @override
  Future<Either<Failure, List<Permissions>>> getAllPermissions() {
    return catchError(() async {
      final permissions = await service.getAllPermissions();
      return Right(List<Permissions>.from(permissions.map((e) => Permissions.fromJson(e))));
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
