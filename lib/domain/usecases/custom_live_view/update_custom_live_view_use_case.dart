import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';
import 'package:vms_flutter_client/screens/shared/utils.dart';

class UpdateCustomLiveViewUseCase
    extends FutureUseCase<UpdateCustomLiveViewUseCaseInput, UpdateCustomLiveViewUseCaseOutput> {
  final ICameraRepository cameraRepository;
  final ICustomLiveViewRepository customLiveViewRepository;

  const UpdateCustomLiveViewUseCase(this.cameraRepository, this.customLiveViewRepository);

  @override
  Future<UpdateCustomLiveViewUseCaseOutput> buildUseCase(
    UpdateCustomLiveViewUseCaseInput input,
  ) async {
    final cameras = await cameraRepository.getAllCamera();
    final camerasList = cameras.fold((failure) => [], (cameras) => cameras);

    var cv = input.customView;
    if (cv.base.total < cv.positions.length) {
      cv = cv.copyWith(positions: cv.positions.sublist(0, cv.base.total));
    } else if (cv.base.total > cv.positions.length) {
      cv = cv.copyWith(
        positions:
            cv.positions +
            List.generate(
              cv.base.total - cv.positions.length,
              (index) => LiveViewPosition(index: index + cv.positions.length, cameraId: []),
            ),
      );
    }

    final response = await customLiveViewRepository.updateCustomLiveView(cv);
    final customView = response.fold((failure) => null, (customView) => customView);

    if (customView != null) {
      for (var i = 0; i < customView.positions.length; i++) {
        if (customView.positions[i].cameraId.isNotEmpty) {
          final camera = camerasList.firstWhereOrNull(
            (camera) => Utils.isEqual(camera.id, customView.positions[i].cameraId),
          );
          customView.positions[i] = customView.positions[i].copyWith(camera: camera);
        }
      }
    }

    return response.fold(
      (failure) =>
          UpdateCustomLiveViewUseCaseOutput(isSuccess: false, errorMessage: failure.toString()),
      (customView) => UpdateCustomLiveViewUseCaseOutput(isSuccess: true, customView: customView),
    );
  }
}
