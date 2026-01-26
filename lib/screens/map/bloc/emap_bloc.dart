import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_input.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_output.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

class EmapBloc extends BaseBloc<EmapEvent, EmapState> {
  List<CameraEntity> listCamera = [];
  final IEmapRepository emapRepository;
  final SearchEmapUseCase searchEmapUseCase;
  EmapBloc({required this.emapRepository, required this.searchEmapUseCase})
    : super(const EmapState()) {
    on<AddEmapEvent>(_onAddEmap);
    on<GetListEmapEvent>(_onGetListEmap);
    on<RemoveEmapEvent>(_onRemoveEmap);
    on<EditEmapEvent>(_onEditEmap);

    on<AddCameraEmapEvent>(_addCameraEmapInfo);
    on<UpdateCameraEmapEvent>(_onUpdateCameraEmap);
    on<RemoveCameraEmapEvent>(_onRemoveCameraEmap);
    on<SearchEmapEvent>(_onSearchEmap);
  }

  FutureOr<void> _onAddEmap(AddEmapEvent event, Emitter<EmapState> emit) async {
    emit(EmapLoadingState());

    final res = await emapRepository.postEmap(emapName: event.emapName, imageFile: event.imageFile);
    res.fold((onFailure) {}, (onSuccess) => emit(AddEmapSuccessState(onSuccess)));
  }

  FutureOr<void> _onEditEmap(EditEmapEvent event, Emitter<EmapState> emit) async {
    emit(EmapLoadingState());

    final res = await emapRepository.editEmap(
      emapId: event.emapId,
      emapName: event.emapName,
      imageFile: event.imageFile,
    );
    res.fold((onFailure) {}, (onSuccess) => emit(EditEmapSuccessState(onSuccess)));
  }

  FutureOr<void> _onGetListEmap(GetListEmapEvent event, Emitter<EmapState> emit) async {
    emit(EmapLoadingState());

    final emaps = await emapRepository.listEmap();
    emaps.fold((onFailure) {}, (onSuccess) => emit(EmapSuccessState(listEmap: onSuccess)));
  }

  FutureOr<void> _onRemoveEmap(RemoveEmapEvent event, Emitter<EmapState> emit) async {
    final res = await emapRepository.removeEmap(event.emapId);
    res.fold((onFailure) {}, (onSuccess) => emit(RemoveEmapSucessSate(onSuccess)));
  }

  Future<void> _onSearchEmap(SearchEmapEvent event, Emitter<EmapState> emit) async {
    final SearchEmapOutput output = searchEmapUseCase.execute(
      SearchEmapInput(keyword: event.keyword, listEmapOrigin: event.listEmap),
    );
    emit(SearchEmapSuccessState(listEmap: output.listEmapResult));
  }

  FutureOr<void> _addCameraEmapInfo(AddCameraEmapEvent event, Emitter<EmapState> emit) async {
    final res = await emapRepository.addCameraEmapInfo(
      emapId: event.emapId,
      xRatio: event.cameraEmapInfoEntity.xRatio,
      yRatio: event.cameraEmapInfoEntity.yRatio,
      camId: event.cameraEmapInfoEntity.cameraId,
    );
    res.fold(
      (onFailure) => emit(AddCameraEmapFailState()),
      (onSuccess) => emit(AddCameraEmapSuccessState(onSuccess)),
    );
  }

  FutureOr<void> _onUpdateCameraEmap(UpdateCameraEmapEvent event, Emitter<EmapState> emit) async {
    final res = await emapRepository.updateCameraEmapInfo(
      emapId: event.emapId,
      cameraEmapInfoId: event.cammapId,
      xRatio: event.xRatio,
      yRatio: event.yRatio,
    );
    res.fold(
      (onFailure) => emit(UpdateCameraEmapFailState()),
      (onSuccess) => emit(UpdateCameraEmapSuccessState(onSuccess)),
    );
  }

  FutureOr<void> _onRemoveCameraEmap(RemoveCameraEmapEvent event, Emitter<EmapState> emit) async {
    final res = await emapRepository.deleteCameraEmapInfo(
      emapId: event.emapId,
      cameraEmapInfoId: event.cammapId,
    );
    res.fold(
      (onFailure) => emit(RemoveCameraEmapFailState()),
      (onSuccess) => emit(RemoveCameraEmapSuccessState(onSuccess)),
    );
  }
}
