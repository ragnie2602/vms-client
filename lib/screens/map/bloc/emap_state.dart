import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';

class EmapState extends BaseState {
  const EmapState();
}

// EMAP
class EmapLoadingState extends EmapState {
  @override
  StateType get type => StateType.loading;
}

class RemoveEmapSucessSate extends EmapState {
  final int id;

  const RemoveEmapSucessSate(this.id);

  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [id];
}

class AddEmapSuccessState extends EmapState {
  final EmapEntity emap;

  const AddEmapSuccessState(this.emap);

  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [emap];
}

class EditEmapSuccessState extends EmapState {
  final EmapEntity emap;

  const EditEmapSuccessState(this.emap);

  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [emap];
}

class EmapSuccessState extends EmapState {
  final List<EmapEntity> listEmap;
  final bool? isSearching;
  final List<DragItemModel>? dragItems;
  final List<CameraEntity>? listCamera;

  const EmapSuccessState({
    required this.listEmap,
    this.isSearching,
    this.dragItems,
    this.listCamera,
  });

  @override
  List<Object?> get props => [listEmap, isSearching, dragItems, listCamera];

  EmapSuccessState copyWith({
    List<EmapEntity>? listEmap,
    bool? isSearching,
    List<DragItemModel>? dragItems,
    List<CameraEntity>? listCamera,
  }) {
    return EmapSuccessState(
      listEmap: listEmap ?? this.listEmap,
      isSearching: isSearching,
      dragItems: dragItems ?? this.dragItems,
      listCamera: listCamera ?? this.listCamera,
    );
  }
}

// EMAP'S CAMERA
class AddCameraEmapSuccessState extends EmapState {
  final EmapEntity emap;

  const AddCameraEmapSuccessState(this.emap);

  @override
  List<Object?> get props => [emap];
}

class AddCameraEmapFailState extends EmapState {}

class UpdateCameraEmapSuccessState extends EmapState {
  final EmapEntity emap;

  const UpdateCameraEmapSuccessState(this.emap);

  @override
  List<Object?> get props => [emap];
}

class UpdateCameraEmapFailState extends EmapState {}

class RemoveCameraEmapSuccessState extends EmapState {
  final EmapEntity emap;

  const RemoveCameraEmapSuccessState(this.emap);

  @override
  List<Object?> get props => [emap];
}

class RemoveCameraEmapFailState extends EmapState {}

class ListAllCameraSuccessState extends EmapState {
  final List<CameraEntity>? cameras;
  const ListAllCameraSuccessState({required this.cameras});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [cameras];
}

class ListAllCameraFailState extends EmapState {
  final String message;

  const ListAllCameraFailState(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class SearchEmapSuccessState extends EmapState {
  final List<EmapEntity> listEmap;

  const SearchEmapSuccessState({required this.listEmap});

  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [listEmap];
}
