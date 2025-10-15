import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_output.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_use_case.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';

class ControlCameraBloc extends BaseBloc<ControlCameraEvent, ControlCameraState> {
  final IControlCameraRepository controlGroupRepository;
  final FilterCameraUseCase filterCameraUseCase;
  ControlCameraBloc({required this.controlGroupRepository, required this.filterCameraUseCase}) : super(const ControlCameraState()) {
    on<ValidateCameraEvent>(_onValidateCamera);
    on<GetListCameraEvent>(_onGetListCamera);
    on<CheckOnvifEvent>(_onCheckOnvif);
    on<FilterCameraEvent>(_onFilterCamera);
    on<AddCameraRTSPEvent>(_onAddCameraRTSP);
    on<AddCameraOnvifEvent>(_onAddCameraOnvif);
    on<UpdateCameraEvent>(_onUpdateCamera);
    on<DeleteCameraEvent>(_onDeleteCamera);
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
    // Reset state trước khi check để đảm bảo listener luôn được trigger
    emit(const ControlCameraState());

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

  void _onFilterCamera(FilterCameraEvent event, Emitter<ControlCameraState> emit) {
    final FilterCameraInput input = FilterCameraInput(nameCamera: event.cameraName, cameraStatus: event.cameraStatus, listCameraOrigin: listCamera);
    final FilterCameraOutput output = filterCameraUseCase.execute(input);
    emit(ListCameraSuccessState(cameras: output.listCamera ?? []));
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

  FutureOr<void> _onUpdateCamera(UpdateCameraEvent event, Emitter<ControlCameraState> emit) async {
    emit(const ControlCameraState());
    final res = await controlGroupRepository.updateCamera(
      cameraId: event.cameraId,
      name: event.name,
      rtspUrl: event.rtspUrl,
      userName: event.userName,
      password: event.password,
      xaddr: event.xaddr,
      location: event.location,
      subStreamUrls: event.subStreamUrls,
    );
    res.fold((onFailure) => emit(AddCameraFailState(res.left.toString())), (onSuccess) => emit(UpdateCameraSuccessState(cameraEntity: onSuccess)));
  }

  FutureOr<void> _onDeleteCamera(DeleteCameraEvent event, Emitter<ControlCameraState> emit) async {
    final res = await controlGroupRepository.deleteCamera(cameraId: event.cameraId);
    res.fold((onFailure) => emit(AddCameraFailState(res.left.toString())), (onSuccess) {
      // Xóa camera khỏi danh sách local
      listCamera = listCamera.where((camera) => camera.id != event.cameraId).toList();
      // Emit delete success state để hiển thị popup thông báo
      emit(DeleteCameraSuccessState(deletedCameraId: event.cameraId));
    });
  }
}
