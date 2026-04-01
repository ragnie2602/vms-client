import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class SearchRolesInput extends BaseInput {
  final String keyword;
  final List<Role> roles;

  SearchRolesInput({required this.keyword, required this.roles});
}
