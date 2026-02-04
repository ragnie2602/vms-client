part of 'save_image_usecase.dart';

class SaveImageInput extends BaseInput {
  final EventEntity event;
  final String savePath;

  const SaveImageInput(this.event, this.savePath);
}
