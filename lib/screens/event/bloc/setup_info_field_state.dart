part of 'setup_info_field_bloc.dart';

enum SetupInfoFieldStatus { initial, loading, success, failure }

enum SetupInfoFieldConfigStatus { initial, loading, success, failure }

class SetupInfoFieldState extends Equatable {
  final SetupInfoFieldStatus status;
  final SetupInfoFieldConfigStatus configStatus;
  final SetupInfoFieldStatus saveStatus;
  final String errorMessage;
  final String saveErrorMessage;
  final List<FieldConfigEntity> availableFields;
  final List<TypeEventDetectEntity> typeEvents;
  final TypeEventDetectEntity? selectedType;
  final List<FieldConfigEntity> currentFields;

  // Track original configs loaded from API (keyed by typeName)
  final Map<String, List<FieldConfigEntity>> originalConfigs;

  // Track modified configs (keyed by typeName)
  final Map<String, List<FieldConfigEntity>> modifiedConfigs;

  const SetupInfoFieldState({
    this.status = SetupInfoFieldStatus.initial,
    this.configStatus = SetupInfoFieldConfigStatus.initial,
    this.saveStatus = SetupInfoFieldStatus.initial,
    this.errorMessage = '',
    this.saveErrorMessage = '',
    this.availableFields = const [],
    this.typeEvents = const [],
    this.selectedType,
    this.currentFields = const [],
    this.originalConfigs = const {},
    this.modifiedConfigs = const {},
  });

  SetupInfoFieldState copyWith({
    SetupInfoFieldStatus? status,
    SetupInfoFieldConfigStatus? configStatus,
    SetupInfoFieldStatus? saveStatus,
    String? errorMessage,
    String? saveErrorMessage,
    List<FieldConfigEntity>? availableFields,
    List<TypeEventDetectEntity>? typeEvents,
    TypeEventDetectEntity? selectedType,
    List<FieldConfigEntity>? currentFields,
    Map<String, List<FieldConfigEntity>>? originalConfigs,
    Map<String, List<FieldConfigEntity>>? modifiedConfigs,
  }) {
    return SetupInfoFieldState(
      status: status ?? this.status,
      configStatus: configStatus ?? this.configStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      saveErrorMessage: saveErrorMessage ?? this.saveErrorMessage,
      availableFields: availableFields ?? this.availableFields,
      typeEvents: typeEvents ?? this.typeEvents,
      selectedType: selectedType ?? this.selectedType,
      currentFields: currentFields ?? this.currentFields,
      originalConfigs: originalConfigs ?? this.originalConfigs,
      modifiedConfigs: modifiedConfigs ?? this.modifiedConfigs,
    );
  }

  @override
  List<Object?> get props => [
    status,
    configStatus,
    saveStatus,
    errorMessage,
    saveErrorMessage,
    availableFields,
    typeEvents,
    selectedType,
    currentFields,
    originalConfigs,
    modifiedConfigs,
  ];
}
