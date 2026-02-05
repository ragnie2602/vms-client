import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_info_entity.dart';
import 'package:vms_flutter_client/screens/camera_configuration/config_dialog.dart';

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
  final bool isSaving; // lưu trạng thái loading của button lưu

  //

  const ScheduleSuccessState({
    this.selectedTab,
    this.cameraInfo,
    this.isSaving = false,
  });
  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [selectedTab, cameraInfo, isSaving];

  ScheduleSuccessState copyWith({
    final ConfigCameraTab? selectedTab,
    CameraInfoEntity? cameraInfo,
    bool? isSaving,
  }) {
    return ScheduleSuccessState(
      selectedTab: selectedTab ?? this.selectedTab,
      cameraInfo: cameraInfo ?? this.cameraInfo,
      isSaving: isSaving ?? this.isSaving,
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
  final CameraEntity? updatedCamera;
  const UpdateConfigSuccessState({this.updatedCamera});
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [updatedCamera];
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
