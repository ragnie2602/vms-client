part of 'setup_info_field_bloc.dart';

enum SetupInfoFieldStatus { initial, loading, success, failure }

enum SetupInfoFieldConfigStatus { initial, loading, success, failure }

class SetupInfoFieldState extends Equatable {
  final SetupInfoFieldStatus status;
  final SetupInfoFieldConfigStatus configStatus;
  final SetupInfoFieldStatus saveStatus; // edit
  final String errorMessage;
  final String saveErrorMessage; // edit
  final List<FieldConfigEntity> availableFields;
  final List<TypeEventDetectEntity> typeEvents;
  final TypeEventDetectEntity? selectedType;
  final EventDisplayConfigEntity? currentConfig;
  final List<FieldConfigEntity> currentFields;

  const SetupInfoFieldState({
    this.status = SetupInfoFieldStatus.initial,
    this.configStatus = SetupInfoFieldConfigStatus.initial,
    this.saveStatus = SetupInfoFieldStatus.initial, // edit
    this.errorMessage = '',
    this.saveErrorMessage = '', // edit
    this.availableFields = const [],
    this.typeEvents = const [],
    this.selectedType,
    this.currentConfig,
    this.currentFields = const [],
  });

  SetupInfoFieldState copyWith({
    SetupInfoFieldStatus? status,
    SetupInfoFieldConfigStatus? configStatus,
    SetupInfoFieldStatus? saveStatus, // edit
    String? errorMessage,
    String? saveErrorMessage, // edit
    List<FieldConfigEntity>? availableFields,
    List<TypeEventDetectEntity>? typeEvents,
    TypeEventDetectEntity? selectedType,
    EventDisplayConfigEntity? currentConfig,
    List<FieldConfigEntity>? currentFields,
  }) {
    return SetupInfoFieldState(
      status: status ?? this.status,
      configStatus: configStatus ?? this.configStatus,
      saveStatus: saveStatus ?? this.saveStatus, // edit
      errorMessage: errorMessage ?? this.errorMessage,
      saveErrorMessage: saveErrorMessage ?? this.saveErrorMessage, // edit
      availableFields: availableFields ?? this.availableFields,
      typeEvents: typeEvents ?? this.typeEvents,
      selectedType: selectedType ?? this.selectedType,
      currentConfig: currentConfig ?? this.currentConfig,
      currentFields: currentFields ?? this.currentFields,
    );
  }

  @override
  List<Object?> get props => [
    status,
    configStatus,
    saveStatus, // edit
    errorMessage,
    saveErrorMessage, // edit
    availableFields,
    typeEvents,
    selectedType,
    currentConfig,
    currentFields,
  ];
}
