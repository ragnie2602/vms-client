part of 'custom_view_bloc.dart';

sealed class CustomViewEvent extends BaseEvent {
  const CustomViewEvent();
}

class GetListCustomViews extends CustomViewEvent {}

class AddingCustomView extends CustomViewEvent {
  final ViewMode base;

  const AddingCustomView(this.base);
}

class AddingCameraToCustomView extends CustomViewEvent {
  final CameraEntity camera;
  final int index;

  const AddingCameraToCustomView(this.camera, this.index);
}
