import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';

class EmapState extends BaseState {
  const EmapState();
}

class EmapLoadingState extends EmapState {
  @override
  StateType get type => StateType.loading;
}

class RemoveEmapSucessSate extends EmapState {
  @override
  StateType get type => StateType.success;
}

class AddEmapSuccessState extends EmapState {
  @override
  StateType get type => StateType.success;
}
class EditEmapSuccessState extends EmapState{
   @override
  StateType get type => StateType.success;
}

class EmapSuccessState extends EmapState {
  final List<EmapEntity>? listEmap;
  final EmapEntity? emapSelected;
  final bool? isSearching;
  final List<DragItemModel>? dragItems;
  final List<CameraEntity>? listCamera;

  const EmapSuccessState({
    this.listEmap,
    this.emapSelected,
    this.isSearching,
    this.dragItems,
    this.listCamera,
  });

  @override
  List<Object?> get props => [listEmap, emapSelected, isSearching, dragItems, listCamera];

  EmapSuccessState copyWith({
    List<EmapEntity>? listEmap,
    EmapEntity? emapSelected,
    bool? isSearching,
    List<DragItemModel>? dragItems,
    List<CameraEntity>? listCamera,
  }) {
    return EmapSuccessState(
      listEmap: listEmap ?? this.listEmap,
      emapSelected: emapSelected ?? this.emapSelected,
      isSearching: isSearching,
      dragItems: dragItems ?? this.dragItems,
      listCamera: listCamera ?? this.listCamera,
    );
  }
}

class AddCameraEmapSuccessState extends EmapState {
  final CameraEmapInfoEntity? cameraEmapInfo;
  const AddCameraEmapSuccessState({this.cameraEmapInfo});
  @override
  List<Object?> get props => [cameraEmapInfo];
}

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
