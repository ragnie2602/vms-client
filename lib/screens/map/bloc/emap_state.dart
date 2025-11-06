import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';

class EmapState extends BaseState {
  const EmapState();
}

class EmapLoadingState extends EmapState {
  @override
  StateType get type => StateType.loading;
}
class RemoveEmapSucessSate extends EmapState{
   @override
  StateType get type => StateType.success;
}
class AddEmapSuccessState extends EmapState{
   @override
  StateType get type => StateType.success;
}

class EmapSuccessState extends EmapState {
  final List<EmapEntity>? listEmap;
  final EmapEntity? emapSelected;

  const EmapSuccessState({this.listEmap, this.emapSelected});

  @override
  List<Object?> get props => [listEmap, emapSelected];

  EmapSuccessState copyWith({
    List<EmapEntity>? listEmap,
    EmapEntity? emapSelected,
  }) {
    return EmapSuccessState(
      listEmap: listEmap ?? this.listEmap,
      emapSelected: emapSelected ?? this.emapSelected,
    );
  }
}

class AddCameraEmapSuccessState extends EmapState {
  final CameraEmapInfoEntity? cameraEmapInfo;
  const AddCameraEmapSuccessState({this.cameraEmapInfo});
  @override
  List<Object?> get props => [cameraEmapInfo];
}
