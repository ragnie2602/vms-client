import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CreateCustomLiveViewUseCase
    extends FutureUseCase<CreateCustomLiveViewInput, CreateCustomLiveViewOutput> {
  final ICustomLiveViewRepository customLiveViewRepository;

  const CreateCustomLiveViewUseCase(this.customLiveViewRepository);

  @override
  Future<CreateCustomLiveViewOutput> buildUseCase(CreateCustomLiveViewInput input) async {
    final positions = List.generate(
      input.base.total,
      (index) => LiveViewPosition(index: index, cameraId: ''),
    );
    final response = await customLiveViewRepository.addCustomLiveView(
      name: input.name,
      baseViewCode: input.base.value,
      positions: positions,
    );

    return response.fold(
      (failure) => CreateCustomLiveViewOutput(isSuccess: false, errorMessage: failure.toString()),
      (customLiveView) =>
          CreateCustomLiveViewOutput(customLiveView: customLiveView, isSuccess: true),
    );
  }
}
