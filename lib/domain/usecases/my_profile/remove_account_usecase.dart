import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import '../future_use_case.dart';
import 'remove_account_input.dart';
import 'remove_account_output.dart';

class RemoveAccountUseCase extends FutureUseCase<RemoveAccountInput, RemoveAccountOutput> {
  final IUserManagementRepository userManagementRepository;

  const RemoveAccountUseCase({required this.userManagementRepository});

  @override
  Future<RemoveAccountOutput> buildUseCase(RemoveAccountInput input) async {
    try {
      final result = await userManagementRepository.removeAccount();

      return result.fold(
        (failure) => RemoveAccountOutput(
          isSuccess: false,
          errorMessage: failure.parseMessage(),
        ),
        (success) {
          return RemoveAccountOutput(
            isSuccess: true,
          );
        },
      );
    } catch (e) {
      return RemoveAccountOutput(
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
