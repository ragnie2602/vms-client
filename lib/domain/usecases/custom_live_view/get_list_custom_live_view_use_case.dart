import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';
import 'package:vms_flutter_client/screens/shared/utils.dart';

class GetListCustomLiveViewUseCase
    extends FutureUseCase<GetListCustomLiveViewInput, GetListCustomLiveViewOutput> {
  final ICameraRepository cameraRepository;
  final ICustomLiveViewRepository customLiveViewRepository;

  const GetListCustomLiveViewUseCase(this.cameraRepository, this.customLiveViewRepository);

  @override
  Future<GetListCustomLiveViewOutput> buildUseCase(GetListCustomLiveViewInput input) async {
    final cameraResponse = await cameraRepository.getAllCamera();
    final cameras = cameraResponse.fold((failure) => [], (cameras) => cameras);

    final response = await customLiveViewRepository.getListCustomLiveView();
    final customViews = response.fold(
      (failure) => <CustomLiveView>[],
      (customViews) => customViews,
    );

    for (var cv in customViews) {
      for (var i = 0; i < cv.positions.length; i++) {
        if (cv.positions[i].cameraId.isNotEmpty) {
          final camera = cameras.firstWhereOrNull(
            (camera) => Utils.isEqual(camera.id, cv.positions[i].cameraId),
          );
          cv.positions[i] = cv.positions[i].copyWith(camera: camera);
        }
      }
    }

    return GetListCustomLiveViewOutput(
      customViews: customViews,
      isSuccess: true,
      errorMessage: null,
    );
  }
}
