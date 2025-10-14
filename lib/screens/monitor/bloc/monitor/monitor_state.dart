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
  final List<CameraEntity> cameras;
  final ViewMode mode;
  final int page;

  const MonitorSuccess({required this.cameras, required this.mode, this.page = 1});

  @override
  List<Object?> get props => [cameras, mode, page];
  @override
  StateType get type => isEmpty ? StateType.empty : StateType.success;
  bool get isEmpty => cameras.isEmpty;

  List<CameraEntity> get paginatedCameras =>
      cameras.skip((page - 1) * mode.total).take(mode.total).toList();

  MonitorSuccess copyWith({ViewMode? mode, List<CameraEntity>? cameras, int? page}) {
    return MonitorSuccess(
      cameras: cameras ?? this.cameras,
      mode: mode ?? this.mode,
      page: page ?? this.page,
    );
  }
}
