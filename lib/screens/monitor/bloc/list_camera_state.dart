part of 'list_camera_bloc.dart';

class ListCameraState extends BaseState {
  const ListCameraState();
}

class ListCameraInitial extends ListCameraState {}

class ListCameraLoading extends ListCameraState {
  @override
  StateType get type => StateType.loading;
}

class ListCameraFailure extends ListCameraState {
  final String message;

  const ListCameraFailure(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class ListCameraSuccess extends ListCameraState {
  final List<CameraEntity> cameras;
  final BaseView mode;
  final int page;

  const ListCameraSuccess({required this.cameras, required this.mode, this.page = 1});

  @override
  List<Object?> get props => [cameras, mode, page];
  @override
  StateType get type => isEmpty ? StateType.empty : StateType.success;
  bool get isEmpty => cameras.isEmpty;

  List<CameraEntity> get paginatedCameras =>
      cameras.skip((page - 1) * mode.total).take(mode.total).toList();

  ListCameraSuccess copyWith({BaseView? mode, List<CameraEntity>? cameras, int? page}) {
    return ListCameraSuccess(
      cameras: cameras ?? this.cameras,
      mode: mode ?? this.mode,
      page: page ?? this.page,
    );
  }
}
