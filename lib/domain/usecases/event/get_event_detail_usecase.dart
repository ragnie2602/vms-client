import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_type_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'get_event_detail_input.dart';
part 'get_event_detail_output.dart';

class GetEventDetailUseCase extends FutureUseCase<GetEventDetailInput, GetEventDetailOutput> {
  final ICameraRepository cameraRepository;
  final IEventRepository eventRepository;
  final IObjectTypeRepository objectTypeRepository;

  GetEventDetailUseCase(this.cameraRepository, this.objectTypeRepository, this.eventRepository);

  @override
  Future<GetEventDetailOutput> buildUseCase(GetEventDetailInput input) async {
    final res = await eventRepository.getEventDetail(input.eventId);
    final event = res.fold(
      (onFailure) => throw Exception(onFailure.parseMessage()),
      (onSuccess) => onSuccess,
    );

    final cameraId = event.cameraId?.codeUnits ?? event.payload?['cameraId']?.codeUnits;
    if (cameraId != null) {
      final cameraRes = await cameraRepository.getAllCamera(cameraId: event.cameraId!.codeUnits);
      cameraRes.fold(
        (onFailure) => throw Exception(onFailure.parseMessage()),
        (onSuccess) => event.camera = onSuccess.firstWhere((e) => e.camId == event.cameraId),
      );
    }

    List<(Widget, String, dynamic)> displayData = [];
    displayData.add((
      SvgPicture.asset(AppAssets.icTimeCircle, height: 20),
      'Thời gian',
      DateFormat('HH:mm dd/MM/yyyy').format(event.timeEvent),
    ));
    displayData.add((
      SvgPicture.asset(AppAssets.icVideoOn, height: 20),
      'Tên camera',
      event.camera?.name ?? '',
    ));

    final subTypeId = event.subjectTypeId ?? event.payload?['subjectTypeId'];
    if (event.eventType == "face_detection" && subTypeId != null) {
      final res = await objectTypeRepository.getObjectTypeDetail(subTypeId);
      final objType = res.fold(
        (onFailure) => throw Exception(onFailure.parseMessage()),
        (onSuccess) => onSuccess,
      );

      for (var f in objType.fields) {
        if (f.fieldName == 'Ảnh nhận diện khuôn mặt') continue;
        final v = event.payload?[f.fieldName];
        displayData.add((
          SvgPicture.network(
            f.iconUrl ?? '',
            height: 20,
            errorBuilder: (context, error, stackTrace) => SizedBox(width: 20),
          ),
          f.displayName,
          v ?? '-',
        ));
      }
    }

    return GetEventDetailOutput(event: event, displayData: displayData);
  }
}
