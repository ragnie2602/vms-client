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

  const ListCameraSuccess({required this.cameras});

  @override
  List<Object?> get props => [cameras];
  @override
  StateType get type => isEmpty ? StateType.empty : StateType.success;
  bool get isEmpty => cameras.isEmpty;
}
