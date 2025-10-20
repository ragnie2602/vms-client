import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class UpdateCustomLiveViewUseCase
    extends FutureUseCase<UpdateCustomLiveViewUseCaseInput, UpdateCustomLiveViewUseCaseOutput> {
  final ICustomLiveViewRepository customLiveViewRepository;

  const UpdateCustomLiveViewUseCase(this.customLiveViewRepository);

  @override
  Future<UpdateCustomLiveViewUseCaseOutput> buildUseCase(
    UpdateCustomLiveViewUseCaseInput input,
  ) async {
    final response = await customLiveViewRepository.updateCustomLiveView(input.customView);

    return response.fold(
      (failure) =>
          UpdateCustomLiveViewUseCaseOutput(isSuccess: false, errorMessage: failure.toString()),
      (customView) => UpdateCustomLiveViewUseCaseOutput(isSuccess: true, customView: customView),
    );
  }
}
