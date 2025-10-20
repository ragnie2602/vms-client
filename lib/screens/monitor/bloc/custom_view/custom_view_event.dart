part of 'custom_view_bloc.dart';

sealed class CustomViewEvent extends BaseEvent {
  const CustomViewEvent();
}

class GetListCustomViews extends CustomViewEvent {}

class ShowCustomView extends CustomViewEvent {
  final ViewMode base;

  const ShowCustomView(this.base);
}

class AddingCameraToCustomView extends CustomViewEvent {
  final CameraEntity camera;
  final int index;

  const AddingCameraToCustomView(this.camera, this.index);
}

class CreateCustomView extends CustomViewEvent {
  final String name;
  final ViewMode base;

  const CreateCustomView({required this.name, required this.base});
}

class UpdateCustomView extends CustomViewEvent {
  final CustomLiveView customView;

  const UpdateCustomView({required this.customView});
}
