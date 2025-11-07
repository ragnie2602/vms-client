import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/data/models/drag_item_model.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

class EmapBloc extends BaseBloc<EmapEvent, EmapState> {
  final IEmapRepository emapRepository;
  EmapBloc({required this.emapRepository}) : super(const EmapState()) {
    on<GetListEmapEvent>(_onGetListEmap);
    on<ChangeEmapEvent>(_onChangeSelectEmap);
    on<RemoveEmapEvent>(_onRemoveEmap);
    on<AddDragItemEvent>(_onAddDragItem);
    on<UpdateDragItemPositionEvent>(_onUpdateDragItemPosition);
    on<RemoveDragItemEvent>(_onRemoveDragItem);
  }

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
    });
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
    if (currentState.emapSelected != event.emap) {
      emit(currentState.copyWith(emapSelected: event.emap));
    }
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
    });
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
}
