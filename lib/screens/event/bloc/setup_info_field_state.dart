part of 'setup_info_field_bloc.dart';

class SetupEventDisplayState extends Equatable {
  const SetupEventDisplayState();

  @override
  List<Object?> get props => [];
}

class SEDGetAllSubjectTypesSuccess extends SetupEventDisplayState {
  final List<ObjectType> subjectTypes;

  const SEDGetAllSubjectTypesSuccess(this.subjectTypes);

  @override
  List<Object?> get props => [subjectTypes];
}

class SEDGetAllSubjectTypesFailure extends SetupEventDisplayState {
  final String message;

  const SEDGetAllSubjectTypesFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class SEDGettingAllSubjectTypes extends SetupEventDisplayState {
  const SEDGettingAllSubjectTypes();
}

class SEDGetEventDisplayConfigSuccess extends SetupEventDisplayState {
  final EventDisplayConfig config;

  const SEDGetEventDisplayConfigSuccess(this.config);

  @override
  List<Object?> get props => [config];
}

class SEDGetEventDisplayConfigFailure extends SetupEventDisplayState {
  final String message;
  final int? subjectTypeId;

  const SEDGetEventDisplayConfigFailure(this.message, this.subjectTypeId);

  @override
  List<Object?> get props => [message, subjectTypeId];
}

class SEDGettingEventDisplayConfig extends SetupEventDisplayState {
  final int? subjectTypeId;

  const SEDGettingEventDisplayConfig({this.subjectTypeId});

  @override
  List<Object?> get props => [subjectTypeId];
}

class SEDSavingConfigs extends SetupEventDisplayState {
  const SEDSavingConfigs();
}

class SEDSavingConfigsSuccess extends SetupEventDisplayState {
  const SEDSavingConfigsSuccess();
}

class SEDSavingConfigsFailure extends SetupEventDisplayState {
  final String message;

  const SEDSavingConfigsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
