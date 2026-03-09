part of 'monitor_bloc.dart';

class MonitorState extends BaseState {
  const MonitorState();
}

class MonitorInitial extends MonitorState {}

class MonitorLoading extends MonitorState {
  @override
  StateType get type => StateType.loading;
}

class MonitorFailure extends MonitorState {
  final String message;

  const MonitorFailure(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class MonitorSuccess extends MonitorState {
  final List<CameraEntity> allCameras;
  final List<CameraEntity> cameras;
  final ViewMode mode;
  final int page;
  final List<int>? groupId; // []: no grouped camera; null: all camera; other: grouped camera

  const MonitorSuccess({
    required this.cameras,
    required this.mode,
    this.page = 1,
    this.groupId,
    required this.allCameras,
  });

  @override
  List<Object?> get props => [cameras, mode, page, groupId, allCameras];
  @override
  StateType get type => isEmpty ? StateType.empty : StateType.success;
  bool get isEmpty => cameras.isEmpty;

  List<CameraEntity> get paginatedCameras =>
      cameras.skip((page - 1) * mode.total).take(mode.total).toList();

  MonitorSuccess copyWith({
    ViewMode? mode,
    List<CameraEntity>? cameras,
    int? page,
    List<int>? groupId,
    List<CameraEntity>? allCameras,
  }) {
    return MonitorSuccess(
      cameras: cameras ?? this.cameras,
      mode: mode ?? this.mode,
      page: page ?? this.page,
      groupId: groupId ?? this.groupId,
      allCameras: allCameras ?? this.allCameras,
    );
  }
}
