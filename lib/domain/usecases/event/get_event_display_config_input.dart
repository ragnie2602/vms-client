part of 'get_event_display_config_usecase.dart';

class GetEventDisplayConfigInput extends BaseInput {
  final String eventType;
  final int typeConfig;

  const GetEventDisplayConfigInput(this.eventType, this.typeConfig);
}
