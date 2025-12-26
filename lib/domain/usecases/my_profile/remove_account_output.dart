import '../base_output.dart';

class RemoveAccountOutput extends BaseOutput {
  final bool isSuccess;
  final String? errorMessage;

  const RemoveAccountOutput({
    required this.isSuccess,
    this.errorMessage,
  });
}
