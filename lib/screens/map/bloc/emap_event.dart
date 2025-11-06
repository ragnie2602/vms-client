import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';

class EmapEvent extends BaseEvent {}

class GetListEmapEvent extends EmapEvent {}

class ChangeEmapEvent extends EmapEvent {
  final EmapEntity? emap;
  ChangeEmapEvent({required this.emap});
  @override
  List<Object?> get props => [emap];
}

class RemoveEmapEvent extends EmapEvent {
  final List<int>? emapId;
  RemoveEmapEvent({required this.emapId});
  @override
  List<Object?> get props => [emapId];
}

class AddCameraEmapEvent extends EmapEvent {
  final List<int> emapId;
  final CameraEmapInfoEntity cameraEmapInfoEntity;
  AddCameraEmapEvent({
    required this.emapId,
    required this.cameraEmapInfoEntity,
  });

  @override
  List<Object?> get props => [emapId, cameraEmapInfoEntity];
}
