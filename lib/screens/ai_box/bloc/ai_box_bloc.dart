import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_box_repository.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_state.dart';

class AiBoxBloc extends BaseBloc<AiBoxEvent, AiBoxState> {
  List<AiBoxEntity> listAiBox = [];
  final IAiBoxRepository aiBoxRepository;
  AiBoxBloc({required this.aiBoxRepository}) : super(const AiBoxState()) {
    on<GetListAiBoxEvent>(_onGetListAiBox);
    on<AddAiBoxEvent>(_onAddAiBox);
    on<DeleteAiBoxEvent>(_onDeleteAiBox);
    on<EditAiBoxEvent>(_onEditAiBox);
    on<SearchAiBoxEvent>(_onSearch);
  }

  FutureOr<void> _onGetListAiBox(
    GetListAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());
    final groups = await aiBoxRepository.listAiBox();
    groups.fold(
      (onFailure) {
        listAiBox = [];
        emit(AiBoxErrorState(errorMessage: onFailure.toString()));
      },
      (onSuccess) {
        listAiBox = onSuccess;
        emit(AIBoxLoadedState(aiBoxes: groups.right));
      },
    );
  }

  FutureOr<void> _onAddAiBox(
    AddAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));

    final newAiBox = AiBoxEntity(
      id: listAiBox.length + 1,
      name: event.name,
      ip: event.ipAddress,
    );

    listAiBox.add(newAiBox);
    emit(AIBoxLoadedState(aiBoxes: listAiBox));
  }

  FutureOr<void> _onDeleteAiBox(
    DeleteAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));

    listAiBox.removeWhere((item) => item.id == event.aiBoxId);
    emit(AIBoxLoadedState(aiBoxes: listAiBox));
  }

  FutureOr<void> _onEditAiBox(
    EditAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));

    final index = listAiBox.indexWhere((item) => item.id == event.aiBoxId);
    if (index != -1) {
      final updatedAiBox = AiBoxEntity(
        id: event.aiBoxId,
        name: event.name,
        status: listAiBox[index].status,
      );
      listAiBox[index] = updatedAiBox;
    }
    emit(AIBoxLoadedState(aiBoxes: listAiBox));
  }

  void _onSearch(SearchAiBoxEvent event, Emitter<AiBoxState> emit) {
    final keyword = event.keyword.toLowerCase();

    if (keyword.isEmpty) {
      emit(AIBoxLoadedState(aiBoxes: listAiBox));
      return;
    }

    final filteredList = listAiBox.where((item) {
      return item.name!.toLowerCase().contains(keyword) ||
          (item.ip?.toLowerCase().contains(keyword) ?? false) ||
          (item.name?.toLowerCase().contains(keyword) ?? false);
    }).toList();

    emit(AIBoxLoadedState(aiBoxes: filteredList));
  }
}
