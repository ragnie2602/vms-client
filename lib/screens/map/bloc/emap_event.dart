import 'dart:ui';

import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/data/models/drag_item_model.dart';
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
  UpdateDragItemPositionEvent({
    required this.itemId,
    required this.newPosition,
  });
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
