import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_license_repository.dart';
import 'package:vms_flutter_client/screens/license/bloc/license_event.dart';
import 'package:vms_flutter_client/screens/license/bloc/license_state.dart';

class LicenseBloc extends BaseBloc<LicenseEvent, LicenseState> {
  final ILicenseRepository repository;

  LicenseBloc({required this.repository}) : super(const LicenseState()) {
    on<CheckCurrentLicenseEvent>(_onCheckCurrentLicense);
  }

  Future<void> _onCheckCurrentLicense(
    CheckCurrentLicenseEvent event,
    Emitter<LicenseState> emit,
  ) async {
    emit(state.copyWith(stateType: StateType.loading));
    
    final result = await repository.getCurrentLicense();
    result.fold(
      (failure) {
        emit(state.copyWith(
          stateType: StateType.failure,
          errorMessage: failure.toString(),
        ));
      },
      (data) {
        emit(state.copyWith(
          stateType: StateType.success,
          currentLicense: data,
        ));
      },
    );
  }
}