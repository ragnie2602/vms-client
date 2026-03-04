part of 'setup_info_field_bloc.dart';

abstract class SetupEventDisplayEvent extends Equatable {
  const SetupEventDisplayEvent();

  @override
  List<Object?> get props => [];
}

class CancelChangeConfigs extends SetupEventDisplayEvent {
  const CancelChangeConfigs();
}

class ChangeConfig extends SetupEventDisplayEvent {
  final EventDisplayConfig config;

  const ChangeConfig(this.config);

  @override
  List<Object?> get props => [config];
}

class GetEventDisplayConfig extends SetupEventDisplayEvent {
  final String eventType;
  final int typeConfig;
  final int? subjectTypeId;

  const GetEventDisplayConfig(this.eventType, this.typeConfig, {this.subjectTypeId});

  @override
  List<Object?> get props => [eventType, typeConfig, subjectTypeId];
}

class GetAllSubjectTypes extends SetupEventDisplayEvent {}

class SaveConfigs extends SetupEventDisplayEvent {
  const SaveConfigs();
}
