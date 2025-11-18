part of 'custom_view_bloc.dart';

sealed class CustomViewEvent extends BaseEvent {
  const CustomViewEvent();
}

class GetListCustomViews extends CustomViewEvent {}

class ShowCustomView extends CustomViewEvent {
  final CustomLiveView customView;
  final CustomMonitorPaneMode mode;

  const ShowCustomView(this.customView, this.mode);
}

class AddingCameraToCustomView extends CustomViewEvent {
  final CameraEntity camera;
  final int index;

  const AddingCameraToCustomView(this.camera, this.index);
}

class RemovingCameraFromCustomView extends CustomViewEvent {
  final int index;

  const RemovingCameraFromCustomView(this.index);
}

class CreateCustomView extends CustomViewEvent {
  final String name;
  final ViewMode base;
  final List<LiveViewPosition>? positions;

  const CreateCustomView({required this.name, required this.base, this.positions});
}

class DeleteCustomLiveView extends CustomViewEvent {
  final List<int> id;

  const DeleteCustomLiveView(this.id);
}

class UpdateCustomView extends CustomViewEvent {
  final CustomLiveView customView;
  final int? index;

  const UpdateCustomView({required this.customView, this.index});
}

class MultiWindowEventReceived extends CustomViewEvent {
  final MWE event;

  const MultiWindowEventReceived(this.event);
}

class ReopenCustomView extends CustomViewEvent {
  final List<int> id;

  const ReopenCustomView(this.id);
}
