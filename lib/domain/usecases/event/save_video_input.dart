part of 'save_video_usecase.dart';

class SaveVideoInput extends BaseInput {
  final String url;
  final String savePath;

  const SaveVideoInput(this.url, this.savePath);
}
