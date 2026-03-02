part of 'setup_info_field_bloc.dart';

abstract class SetupEventDisplayEvent extends Equatable {
  const SetupEventDisplayEvent();

  @override
  List<Object?> get props => [];
}

class GetEventDisplayConfig extends SetupEventDisplayEvent {
  final String eventType;
  final int typeConfig;

  const GetEventDisplayConfig(this.eventType, this.typeConfig);

  @override
  List<Object?> get props => [eventType, typeConfig];
}

class SetupInfoFieldSelectType extends SetupEventDisplayEvent {
  final int typeConfig;
  final TypeEventDetectEntity type;

  const SetupInfoFieldSelectType(this.typeConfig, this.type);
}

class SetupInfoFieldAddField extends SetupEventDisplayEvent {
  final FieldConfigEntity field;
  const SetupInfoFieldAddField(this.field);
}

class SetupInfoFieldRemoveField extends SetupEventDisplayEvent {
  final FieldConfigEntity field;
  const SetupInfoFieldRemoveField(this.field);
}

class SetupInfoFieldReorder extends SetupEventDisplayEvent {
  final int oldIndex;
  final int newIndex;
  const SetupInfoFieldReorder(this.oldIndex, this.newIndex);
}

class SetupInfoFieldSave extends SetupEventDisplayEvent {
  final int typeConfig;

  const SetupInfoFieldSave(this.typeConfig);

  @override
  List<Object?> get props => [typeConfig];
}
