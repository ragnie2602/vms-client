part of 'setup_info_field_bloc.dart';

abstract class SetupInfoFieldEvent extends Equatable {
  const SetupInfoFieldEvent();

  @override
  List<Object?> get props => [];
}

class SetupInfoFieldInit extends SetupInfoFieldEvent {
  final int typeConfig;
  final List<TypeEventDetectEntity>? typeEvents;

  const SetupInfoFieldInit(this.typeConfig, this.typeEvents);
}

class SetupInfoFieldSelectType extends SetupInfoFieldEvent {
  final int typeConfig;
  final TypeEventDetectEntity type;

  const SetupInfoFieldSelectType(this.typeConfig, this.type);
}

class SetupInfoFieldAddField extends SetupInfoFieldEvent {
  final FieldConfigEntity field;
  const SetupInfoFieldAddField(this.field);
}

class SetupInfoFieldRemoveField extends SetupInfoFieldEvent {
  final FieldConfigEntity field;
  const SetupInfoFieldRemoveField(this.field);
}

class SetupInfoFieldReorder extends SetupInfoFieldEvent {
  final int oldIndex;
  final int newIndex;
  const SetupInfoFieldReorder(this.oldIndex, this.newIndex);
}

class SetupInfoFieldSave extends SetupInfoFieldEvent {
  final int typeConfig;

  const SetupInfoFieldSave(this.typeConfig);

  @override
  List<Object?> get props => [typeConfig];
}
