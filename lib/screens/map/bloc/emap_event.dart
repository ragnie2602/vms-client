import 'dart:io';
import 'dart:ui';

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

class SearchEmapEvent extends EmapEvent {
  final String keyword;
  final List<EmapEntity> listEmap;

  SearchEmapEvent({required this.keyword, required this.listEmap});

  @override
  List<Object?> get props => [keyword, listEmap];
}

class AddEmapEvent extends EmapEvent {
  final String emapName;
  final File imageFile;
  AddEmapEvent({required this.emapName, required this.imageFile});
  @override
  List<Object?> get props => [emapName, imageFile];
}

class EditEmapEvent extends EmapEvent {
  final int emapId;
  final String? emapName;
  final File? imageFile;
  EditEmapEvent({required this.emapId, this.emapName, this.imageFile});
}

class RemoveEmapEvent extends EmapEvent {
  final int emapId;
  RemoveEmapEvent({required this.emapId});
  @override
  List<Object?> get props => [emapId];
}

class AddCameraEmapEvent extends EmapEvent {
  final int emapId;
  final CameraEmapInfoEntity cameraEmapInfoEntity;

  AddCameraEmapEvent({required this.emapId, required this.cameraEmapInfoEntity});

  @override
  List<Object?> get props => [emapId, cameraEmapInfoEntity];
}

class GetAllListCameraEvent extends EmapEvent {
  final List<int>? cameraId;
  final int? status;
  final int? ivaType;
  GetAllListCameraEvent({this.cameraId, this.ivaType, this.status});
}

class UpdateCameraEmapEvent extends EmapEvent {
  final int emapId;
  final int cammapId;
  final double xRatio;
  final double yRatio;

  UpdateCameraEmapEvent({
    required this.emapId,
    required this.cammapId,
    required this.xRatio,
    required this.yRatio,
  });

  @override
  List<Object?> get props => [emapId, cammapId, xRatio, yRatio];
}

// Update vị trí camera trên emap
class UpdateCameraEmapPositionEvent extends EmapEvent {
  final List<int> emapId;
  final List<int> cameraEmapInfoId;
  final List<int> cameraId;
  final Offset newPosition;
  final int typeIcon;

  UpdateCameraEmapPositionEvent({
    required this.emapId,
    required this.cameraEmapInfoId,
    required this.cameraId,
    required this.newPosition,
    required this.typeIcon,
  });

  @override
  List<Object?> get props => [emapId, cameraEmapInfoId, cameraId, newPosition, typeIcon];
}

// Xóa camera khỏi emap (gọi API + xóa UI)
class RemoveCameraEmapEvent extends EmapEvent {
  final int emapId;
  final int cammapId;

  RemoveCameraEmapEvent({required this.emapId, required this.cammapId});

  @override
  List<Object?> get props => [emapId, cammapId];
}
