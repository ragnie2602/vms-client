import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/data/models/drag_item_model.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';

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

class EmapSuccessState extends EmapState {
  final List<EmapEntity>? listEmap;
  final EmapEntity? emapSelected;
  final List<DragItemModel>? dragItems;

  const EmapSuccessState({this.listEmap, this.emapSelected, this.dragItems});

  @override
  List<Object?> get props => [listEmap, emapSelected, dragItems];

  EmapSuccessState copyWith({
    List<EmapEntity>? listEmap,
    EmapEntity? emapSelected,
    List<DragItemModel>? dragItems,
  }) {
    return EmapSuccessState(
      listEmap: listEmap ?? this.listEmap,
      emapSelected: emapSelected ?? this.emapSelected,
      dragItems: dragItems ?? this.dragItems,
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
