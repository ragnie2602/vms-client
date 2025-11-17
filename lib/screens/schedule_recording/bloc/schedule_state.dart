import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class ScheduleState extends BaseState {
  const ScheduleState();
}

class ScheduleLoadingState extends ScheduleState {
  @override
  StateType get type => StateType.loading;
}

class ScheduleFailState extends ScheduleState {}

class ScheduleSuccessState extends ScheduleState {
  //
  final List<CameraEntity>? listCamera;
  final CameraEntity? cameraSelected;

  //

  const ScheduleSuccessState({this.listCamera, this.cameraSelected});

  @override
  List<Object?> get props => [listCamera, cameraSelected];

  ScheduleSuccessState copyWith({
    List<CameraEntity>? listCamera,
    CameraEntity? cameraSelected,
  }) {
    return ScheduleSuccessState(
      listCamera: listCamera ?? this.listCamera,
      cameraSelected: cameraSelected ?? this.cameraSelected,
    );
  }
}
