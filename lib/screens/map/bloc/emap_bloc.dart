import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_input.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_output.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';

class EmapBloc extends BaseBloc<EmapEvent, EmapState> {
  List<CameraEntity> listCamera = [];
  final IEmapRepository emapRepository;
  final SearchEmapUseCase searchEmapUseCase;
  EmapBloc({required this.emapRepository, required this.searchEmapUseCase})
    : super(const EmapState()) {
    on<GetListEmapEvent>(_onGetListEmap);
    on<ChangeEmapEvent>(_onChangeSelectEmap);
    on<RemoveEmapEvent>(_onRemoveEmap);
    on<AddCameraEmapEvent>(_addCameraEmapInfo);
    on<GetAllListCameraEvent>(_onGetListCamera);
    on<AddEmapEvent>(_onAddEmap);
    on<AddDragItemEvent>(_onAddDragItem);
    on<UpdateDragItemPositionEvent>(_onUpdateDragItemPosition);
    on<RemoveDragItemEvent>(_onRemoveDragItem);
    on<EditEmapEvent>(_onEditEmap);
    on<SearchEmapEvent>(_onSearchEmap);
  }

  // list group origin
  List<EmapEntity> listEmap = [];

  FutureOr<void> _onGetListEmap(
    GetListEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    emit(EmapLoadingState());
    final emaps = await emapRepository.listEmap();
    emaps.fold((onFailure) {}, (onSuccess) {
      List<EmapEntity> _list = onSuccess;
      emit(
        EmapSuccessState(
          listEmap: _list,
          emapSelected: _list.isEmpty ? null : _list.first,
        ),
      );
      listEmap = _list;
    });
  }

  Future<void> _onSearchEmap(
    SearchEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    final SearchEmapInput input = SearchEmapInput(
      keyword: event.keyword,
      listEmapOrigin: listEmap,
    );
    final SearchEmapOutput output = searchEmapUseCase.execute(input);
    emit(
      currentState.copyWith(
        listEmap: output.listEmapResult,
        emapSelected: output.listEmapResult?.firstOrNull,
      ),
    );
  }

  FutureOr<void> _onChangeSelectEmap(
    ChangeEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    currentState.dragItems?.clear();
    if (currentState.emapSelected != event.emap) {
      emit(currentState.copyWith(emapSelected: event.emap));
    }
  }

  FutureOr<void> _onAddEmap(AddEmapEvent event, Emitter<EmapState> emit) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    List<EmapEntity> emaps = List<EmapEntity>.of(currentState.listEmap ?? []);
    emit(EmapLoadingState());
    final res = await emapRepository.postEmap(
      emapName: event.emapName,
      imageBytes: event.imageBytes,
      imagePath: event.imagePath,
    );
    res.fold((onFailure) {}, (onSuccess) {
      emaps.add(onSuccess);
      emit(AddEmapSuccessState());
      emit(currentState.copyWith(listEmap: emaps, emapSelected: onSuccess));
      listEmap = emaps;
    });
  }

  FutureOr<void> _onEditEmap(
    EditEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    List<EmapEntity> emaps = List<EmapEntity>.of(currentState.listEmap ?? []);
    emit(EmapLoadingState());
    final res = await emapRepository.postEmap(
      emapId: event.emapId,
      emapName: event.emapName,
      imageBytes: event.imageBytes,
      imagePath: event.imagePath,
    );
    res.fold((onFailure) {}, (onSuccess) {
      emaps = emaps
          .map((e) => listEquals(e.emapId, event.emapId) ? onSuccess : e)
          .toList();
      emit(EditEmapSuccessState());
      emit(currentState.copyWith(listEmap: emaps, emapSelected: onSuccess));
      listEmap = emaps;
    });
  }

  FutureOr<void> _onRemoveEmap(
    RemoveEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    final res = await emapRepository.removeEmap(emapId: event.emapId ?? []);
    res.fold((onFailure) {}, (onSuccess) {
      if (state is! EmapSuccessState) {
        return;
      }
      final currentState = state as EmapSuccessState;
      final _listEmap = currentState.listEmap;
      _listEmap?.removeWhere(
        (element) => listEquals(element.emapId, event.emapId),
      );
      emit(RemoveEmapSucessSate());
      emit(
        currentState.copyWith(
          listEmap: _listEmap,
          emapSelected: _listEmap?.first,
        ),
      );
      listEmap = _listEmap ?? [];
    });
  }

  FutureOr<void> _addCameraEmapInfo(
    AddCameraEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    final res = await emapRepository.addCameraEmapInfo(
      emapId: event.emapId,
      cameraEmapinfo: event.cameraEmapInfoEntity,
    );
    res.fold((onFailure) {}, (onSuccess) {
      CameraEmapInfoEntity cameraEmapInfoEntity = onSuccess;
      emit(AddCameraEmapSuccessState(cameraEmapInfo: cameraEmapInfoEntity));
    });
  }

  FutureOr<void> _onGetListCamera(
    GetAllListCameraEvent event,
    Emitter<EmapState> emit,
  ) async {
    final groups = await emapRepository.getAllCamera();
    groups.fold(
      (onFailure) {
        listCamera = [];
      },
      (onSuccess) {
        listCamera = onSuccess;
        debugPrint('_onGetListCamera Camera count: ${listCamera.length}');
      },
    );
  }

  // Handler thêm item mới
  FutureOr<void> _onAddDragItem(
    AddDragItemEvent event,
    Emitter<EmapState> emit,
  ) {
    final currentState = state as EmapSuccessState;
    final updatedItems = List<DragItemModel>.from(currentState.dragItems ?? [])
      ..add(event.item);

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  // Handler cập nhật vị trí item
  FutureOr<void> _onUpdateDragItemPosition(
    UpdateDragItemPositionEvent event,
    Emitter<EmapState> emit,
  ) {
    final currentState = state as EmapSuccessState;
    final updatedItems = currentState.dragItems?.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(position: event.newPosition);
      }
      return item;
    }).toList();

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  // Handler xóa item
  FutureOr<void> _onRemoveDragItem(
    RemoveDragItemEvent event,
    Emitter<EmapState> emit,
  ) {
    final currentState = state as EmapSuccessState;
    final updatedItems = currentState.dragItems
        ?.where((item) => item.id != event.itemId)
        .toList();

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  // Future<void> _onlistCameraEmapInfo(ListCameraEmapInfoEvent event) async {
  //   final res = await emapRepository.listCameraEmapInfo(emapId: event.emapId);
  //   res.fold((onFailure) {}, (onSuccess) {
  //     listCameraEmapInfo = onSuccess;
  //     );
  //   });
  // }
}
