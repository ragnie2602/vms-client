import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';

class LicenseState extends BaseState {
  final StateType stateType;
  final String errorMessage;
  final CurrentLicenseData? currentLicense;

  const LicenseState({
    this.stateType = StateType.initial,
    this.errorMessage = '',
    this.currentLicense,
  });

  @override
  StateType get type => stateType;

  @override
  String get errorMsg => errorMessage;

  @override
  List<Object?> get props => [stateType, errorMessage, currentLicense];

  LicenseState copyWith({
    StateType? stateType,
    String? errorMessage,
    CurrentLicenseData? currentLicense,
  }) {
    return LicenseState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      currentLicense: currentLicense ?? this.currentLicense,
    );
  }
}
