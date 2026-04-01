import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class SearchRolesOutput extends BaseOutput {
  final List<Role> roles;

  SearchRolesOutput({required this.roles});
}
