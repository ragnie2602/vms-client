import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_info_entity.dart';
import 'package:vms_flutter_client/screens/schedule_recording/config_dialog.dart';

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
  final ConfigCameraTab? selectedTab;
  final CameraInfoEntity? cameraInfo;

  //

  const ScheduleSuccessState({this.selectedTab, this.cameraInfo});
  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [selectedTab, cameraInfo];

  ScheduleSuccessState copyWith({
    final ConfigCameraTab? selectedTab,
    CameraInfoEntity? cameraInfo,
  }) {
    return ScheduleSuccessState(
      selectedTab: selectedTab ?? this.selectedTab,
      cameraInfo: cameraInfo ?? this.cameraInfo,
    );
  }
}

class ScheduleErrorState extends ScheduleState {
  //
  final String message;
  @override
  StateType get type => StateType.failure;

  const ScheduleErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateConfigSuccessState extends ScheduleState {
  @override
  StateType get type => StateType.success;
}

class UpdateConfigFailState extends ScheduleState {
  //
  final String message;
  @override
  StateType get type => StateType.failure;

  const UpdateConfigFailState({required this.message});

  @override
  List<Object?> get props => [message];
}
