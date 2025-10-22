import 'dart:math';

import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_output.dart';
import 'package:vms_flutter_client/domain/usecases/sync_use_case.dart';

class CreateTempCustomLiveViewUseCase
    extends SyncUseCase<CreateTempCustomLiveViewInput, CreateTempCustomLiveViewOutput> {
  @override
  CreateTempCustomLiveViewOutput buildUseCase(CreateTempCustomLiveViewInput input) {
    // Migrate cameras
    final positions = List.generate(
      input.newBase.total,
      (index) => LiveViewPosition(index: index, cameraId: [], camera: null),
    );
    final oldCv = input.oldCv;
    if (oldCv != null) {
      int sz = min(oldCv.positions.length, input.newBase.total);
      for (var i = 0; i < sz; i++) {
        positions[i] = oldCv.positions[i];
      }
    }

    final customLiveView = CustomLiveView(
      id: [],
      base: input.newBase,
      positions: positions,
      name: '',
    );

    return CreateTempCustomLiveViewOutput(customLiveView: customLiveView);
  }
}
