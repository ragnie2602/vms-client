import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';

class ControlCameraBloc extends BaseBloc<ControlCameraEvent, ControlCameraState> {
  final IControlCameraRepository controlGroupRepository;
  ControlCameraBloc({required this.controlGroupRepository}) : super(const ControlCameraState()) {
    on<ValidateCameraEvent>(_onValidateCamera);
    on<GetListCameraEvent>(_onGetListCamera);
    on<CheckOnvifEvent>(_onCheckOnvif);
    on<AddCameraRTSPEvent>(_onAddCameraRTSP);
    on<AddCameraOnvifEvent>(_onAddCameraOnvif);
  }

  // list camera
  List<CameraEntity> listCamera = [];

  FutureOr<void> _onGetListCamera(GetListCameraEvent event, Emitter<ControlCameraState> emit) async {
    final groups = await controlGroupRepository.getAllCamera();
    groups.fold(
      (onFailure) {
        listCamera = [];
        emit(ListCameraFailState(groups.left.toString()));
      },
      (onSuccess) {
        listCamera = onSuccess;
        emit(ListCameraSuccessState(cameras: listCamera));
      },
    );
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

  FutureOr<void> _onAddCameraRTSP(AddCameraRTSPEvent event, Emitter<ControlCameraState> emit) async {
    final addCameraRTSP = await controlGroupRepository.addCameraRTSP(
      name: event.name,
      username: event.username,
      password: event.password,
      rtspUrl: event.rtspUrl,
      location: event.location,
      boxId: event.boxId,
      groupId: event.groupId,
      subStreamUrls: event.subStreamUrls,
    );
    addCameraRTSP.fold(
      (onFailure) => emit(AddCameraFailState(addCameraRTSP.left.toString())),
      (onSuccess) => emit(AddCameraSuccessState(cameraEntity: onSuccess)),
    );
  }

  FutureOr<void> _onAddCameraOnvif(AddCameraOnvifEvent event, Emitter<ControlCameraState> emit) async {
    final addCameraOnvif = await controlGroupRepository.addCameraOnvif(
      name: event.name,
      username: event.username,
      password: event.password,
      onvifDeviceIp: event.onvifDeviceIp,
      rtspUrl: event.rtspUrl,
      serialNumber: event.serialNumber,
      location: event.location,
      boxId: event.boxId,
      groupId: event.groupId,
      urn: event.urn,
      subStreamUrls: event.subStreamUrls,
    );
    addCameraOnvif.fold(
      (onFailure) => emit(AddCameraFailState(addCameraOnvif.left.toString())),
      (onSuccess) => emit(AddCameraSuccessState(cameraEntity: onSuccess)),
    );
  }
}
