part of 'setup_info_field_bloc.dart';

class SetupEventDisplayState extends Equatable {
  const SetupEventDisplayState();

  @override
  List<Object?> get props => [];
}

class SEDGetEventDisplayConfigSuccess extends SetupEventDisplayState {
  final EventDisplayConfig config;

  const SEDGetEventDisplayConfigSuccess(this.config);

  @override
  List<Object?> get props => [config];
}

class SEDGetEventDisplayConfigFailure extends SetupEventDisplayState {
  final String message;

  const SEDGetEventDisplayConfigFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class SEDGettingEventDisplayConfig extends SetupEventDisplayState {
  const SEDGettingEventDisplayConfig();
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
