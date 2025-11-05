import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
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
}
