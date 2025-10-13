import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';

class ControlCameraBloc extends BaseBloc<ControlCameraEvent, ControlCameraState> {
  final IControlCameraRepository controlGroupRepository;
  ControlCameraBloc({required this.controlGroupRepository}) : super(const ControlCameraState()) {
    on<ValidateCameraEvent>(_onValidateCamera);
    on<GetListCameraEvent>(_onGetListCamera);
    on<CheckOnvifEvent>(_onCheckOnvif);
  }
  FutureOr<void> _onGetListCamera(GetListCameraEvent event, Emitter<ControlCameraState> emit) async {
    final groups = await controlGroupRepository.getAllCamera();
    groups.fold((onFailure) => emit(GetListCameraFailState(groups.left.toString())), (onSuccess) {
      emit(GetListCameraSuccessState(cameras: onSuccess));
    });
  }

  FutureOr<void> _onValidateCamera(ValidateCameraEvent event, Emitter<ControlCameraState> emit) async {
    emit(ControlCameraState());
    final validateCamera = await controlGroupRepository.validateCamera(message: event.message);
    validateCamera.fold((onFailure) => emit(ValidateCameraState(validateCamera.left.toString())), (onSuccess) {
      emit(ValidateCameraState(validateCamera.left.toString()));
    });
  }

  FutureOr<void> _onCheckOnvif(CheckOnvifEvent event, Emitter<ControlCameraState> emit) async {
    final checkOnvif = await controlGroupRepository.checkCameraOnvif(
      xaddrs: event.xaddrs,
      userName: event.userName,
      password: event.password,
      boxId: event.boxId,
    );
    checkOnvif.fold(
      (onFailure) => emit(CheckOnvifFailState(checkOnvif.left.toString())),
      (onSuccess) => emit(CheckOnvifSuccessState(cameraOnvif: onSuccess)),
    );
  }
}
