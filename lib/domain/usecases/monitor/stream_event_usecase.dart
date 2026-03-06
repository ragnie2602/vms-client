import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/stream_use_case.dart';

part 'stream_event_input.dart';
part 'stream_event_output.dart';

class StreamEventUsecase extends StreamUseCase<StreamEventInput, StreamEventOutput> {
  final ICameraRepository cameraRepository;
  final IDetectRepository detectRepository;

  StreamEventUsecase(this.cameraRepository, this.detectRepository);

  @override
  Stream<StreamEventOutput> buildUseCase(StreamEventInput input) async* {
    final response = await cameraRepository.getAllCamera();
    final cameras = response.fold((failure) => throw failure, (success) => success);

    yield* detectRepository.receiveEventStream.asyncMap((event) async {
      final String camId = event.eventData?['cameraId'] ?? '';
      if (camId.isNotEmpty) {
        final camera = cameras.firstWhereOrNull((e) => e.camId == camId);
        if (camera != null) event.eventData?['cameraName'] = camera.name;
      }
      return StreamEventOutput(event);
    });
  }
}
