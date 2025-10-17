import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/usecases/monitor/create_temp_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/monitor/create_temp_custom_live_view_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class CreateTempCustomLiveViewUseCase
    extends SyncUseCase<CreateTempCustomLiveViewInput, CreateTempCustomLiveViewOutput> {
  @override
  CreateTempCustomLiveViewOutput buildUseCase(CreateTempCustomLiveViewInput input) {
    final positions = List.generate(
      input.base.total,
      (index) => LiveViewPosition(index: index, cameraId: [], camera: null),
    );
    final customLiveView = CustomLiveView(id: [], base: input.base, positions: positions, name: '');

    return CreateTempCustomLiveViewOutput(customLiveView: customLiveView);
  }
}
