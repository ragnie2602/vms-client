part of 'get_event_display_config_usecase.dart';

class GetEventDisplayConfigInput extends BaseInput {
  final String eventType;
  final int typeConfig;
  final int? subjectTypeId;

  const GetEventDisplayConfigInput(this.eventType, this.typeConfig, this.subjectTypeId);
}
