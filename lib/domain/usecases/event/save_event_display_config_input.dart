part of 'save_event_display_config_usecase.dart';

class SaveEventDisplayConfigInput extends BaseInput {
  final List<EventDisplayConfig> configs;

  const SaveEventDisplayConfigInput(this.configs);
}
