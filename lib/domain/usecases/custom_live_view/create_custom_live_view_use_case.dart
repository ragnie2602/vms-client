import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';
import 'package:vms_flutter_client/screens/shared/utils.dart';

class CreateCustomLiveViewUseCase
    extends FutureUseCase<CreateCustomLiveViewInput, CreateCustomLiveViewOutput> {
  final ICameraRepository cameraRepository;
  final ICustomLiveViewRepository customLiveViewRepository;

  const CreateCustomLiveViewUseCase(this.cameraRepository, this.customLiveViewRepository);

  @override
  Future<CreateCustomLiveViewOutput> buildUseCase(CreateCustomLiveViewInput input) async {
    // Create custom live view with empty position first due to the backend requirement
    final createResponse = await customLiveViewRepository.addCustomLiveView(
      name: input.name,
      baseViewCode: input.base.value,
      positions: List.generate(
        input.base.total,
        (index) => LiveViewPosition(index: index, cameraId: []),
      ),
    );

    // Update positions with the actual positions
    CustomLiveView? customLiveView = createResponse.fold(
      (failure) => null,
      (customLiveView) => customLiveView.copyWith(positions: input.positions),
    );
    if (customLiveView != null && input.positions.isNotEmpty) {
      final updateResponse = await customLiveViewRepository.updateCustomLiveView(customLiveView);
      customLiveView = updateResponse.fold<CustomLiveView?>(
        (failure) => null,
        (customLiveView) => customLiveView,
      );
    }

    // Assign camera entity to each position
    if (customLiveView != null) {
      final cameras = await cameraRepository.getAllCamera();
      final camerasList = cameras.fold((failure) => [], (cameras) => cameras);

      for (var i = 0; i < customLiveView.positions.length; i++) {
        if (customLiveView.positions[i].cameraId.isNotEmpty) {
          final camera = camerasList.firstWhereOrNull(
            (camera) => Utils.isEqual(camera.id, customLiveView!.positions[i].cameraId),
          );
          customLiveView.positions[i] = customLiveView.positions[i].copyWith(camera: camera);
        }
      }
    }

    return CreateCustomLiveViewOutput(
      isSuccess: customLiveView != null,
      errorMessage: customLiveView == null ? 'Failed to create custom live view' : null,
      customLiveView: customLiveView,
    );
  }
}
