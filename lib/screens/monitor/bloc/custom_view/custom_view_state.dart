// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'custom_view_bloc.dart';

class CustomViewState extends BaseState {
  const CustomViewState();
}

class CustomViewInitial extends CustomViewState {}

class CustomViewLoading extends CustomViewState {
  @override
  StateType get type => StateType.loading;
}

class ListCustomViewFailure extends CustomViewState {
  final String message;

  const ListCustomViewFailure(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class ListCustomViewSuccess extends CustomViewState {
  final List<CustomLiveView> customViews;

  const ListCustomViewSuccess({required this.customViews});

  @override
  List<Object?> get props => [customViews];
  @override
  StateType get type => customViews.isEmpty ? StateType.empty : StateType.success;

  ListCustomViewSuccess copyWith({List<CustomLiveView>? customViews}) {
    return ListCustomViewSuccess(customViews: customViews ?? this.customViews);
  }
}

class ShowCustomViewSuccess extends CustomViewState {
  final CustomLiveView customView;

  const ShowCustomViewSuccess({required this.customView});

  @override
  StateType get type => StateType.success;

  @override
  List<Object?> get props => [customView];
}

class AddingCameraToCustomViewSuccess extends CustomViewState {
  final CameraEntity camera;
  final int index;

  const AddingCameraToCustomViewSuccess({required this.camera, required this.index});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [camera, index];
}

class CreateCustomViewSuccess extends CustomViewState {
  final CustomLiveView customView;

  const CreateCustomViewSuccess({required this.customView});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [customView];
}

class CreateCustomViewFailure extends CustomViewState {
  final String message;
  const CreateCustomViewFailure({required this.message});

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}
