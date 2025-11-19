import 'package:vms_flutter_client/core/base_bloc.dart';
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

  //

  const ScheduleSuccessState({this.selectedTab});

  @override
  List<Object?> get props => [selectedTab];

  ScheduleSuccessState copyWith({final ConfigCameraTab? selectedTab}) {
    return ScheduleSuccessState(selectedTab: selectedTab ?? this.selectedTab);
  }
}
