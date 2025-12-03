part of 'get_camera_use_case.dart';

class GetCameraInput extends BaseInput {
  final List<int> groupId;
  final Set<TagEntity>? tags;

  GetCameraInput({this.tags, required this.groupId});
}
