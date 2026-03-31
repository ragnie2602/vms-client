import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';
import 'package:vms_flutter_client/domain/entities/license/license_preview_data.dart';

class LicenseState extends BaseState {
  final StateType stateType;
  final String errorMessage;
  final CurrentLicenseData? currentLicense;
  
  final bool isPreviewLoading;
  final String? previewErrorMessage;
  final LicensePreviewData? previewData;

  const LicenseState({
    this.stateType = StateType.initial,
    this.errorMessage = '',
    this.currentLicense,
    this.isPreviewLoading = false,
    this.previewErrorMessage,
    this.previewData,
  });

  @override
  StateType get type => stateType;

  @override
  String get errorMsg => errorMessage;

  @override
  List<Object?> get props => [
    stateType, errorMessage, currentLicense,
    isPreviewLoading, previewErrorMessage, previewData,
  ];

  LicenseState copyWith({
    StateType? stateType,
    String? errorMessage,
    CurrentLicenseData? currentLicense,
    bool? isPreviewLoading,
    String? previewErrorMessage,
    bool clearPreviewError = false,
    LicensePreviewData? previewData,
  }) {
    return LicenseState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      currentLicense: currentLicense ?? this.currentLicense,
      isPreviewLoading: isPreviewLoading ?? this.isPreviewLoading,
      previewErrorMessage: clearPreviewError ? null : (previewErrorMessage ?? this.previewErrorMessage),
      previewData: previewData ?? this.previewData,
    );
  }
}
