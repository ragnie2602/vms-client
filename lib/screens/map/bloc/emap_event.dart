import 'dart:io';
import 'dart:ui';

import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';

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

// Thêm item mới
class AddDragItemEvent extends EmapEvent {
  final DragItemModel item;
  AddDragItemEvent({required this.item});
  @override
  List<Object?> get props => [item];
}

// Cập nhật vị trí item
class UpdateDragItemPositionEvent extends EmapEvent {
  final String itemId;
  final Offset newPosition;
  UpdateDragItemPositionEvent({required this.itemId, required this.newPosition});
  @override
  List<Object?> get props => [itemId, newPosition];
}

// Xóa item
class RemoveDragItemEvent extends EmapEvent {
  final String itemId;
  RemoveDragItemEvent({required this.itemId});
  @override
  List<Object?> get props => [itemId];
}

class ListCameraEmapInfoEvent extends EmapEvent {}

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
  final String itemId; // ID của DragItem để xóa UI
  final List<int> emapId;
  final List<int> cameraEmapInfoId;

  RemoveCameraEmapEvent({
    required this.itemId,
    required this.emapId,
    required this.cameraEmapInfoId,
  });

  @override
  List<Object?> get props => [itemId, emapId, cameraEmapInfoId];
}
