import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_box_repository.dart';
import 'package:vms_flutter_client/domain/usecases/ai_box/filter_ai_box_input.dart';
import 'package:vms_flutter_client/domain/usecases/ai_box/filter_ai_box_use_case.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_state.dart';

class AiBoxBloc extends BaseBloc<AiBoxEvent, AiBoxState> {
  List<AiBoxEntity> listAiBox = [];
  final IAiBoxRepository aiBoxRepository;
  final FilterAiBoxUseCase filterAiBoxUseCase;

  // Lưu trạng thái filter hiện tại
  String _currentKeyword = '';
  AiBoxStatus _currentStatusFilter = AiBoxStatus.all;

  AiBoxBloc({required this.aiBoxRepository, required this.filterAiBoxUseCase})
    : super(const AiBoxState()) {
    on<GetListAiBoxEvent>(_onGetListAiBox);
    on<AddAiBoxEvent>(_onAddAiBox);
    on<DeleteAiBoxEvent>(_onDeleteAiBox);
    on<EditAiBoxEvent>(_onEditAiBox);
    on<FilterAiBoxEvent>(_onFilterAiBox);
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
        emit(AIBoxLoadedState(aiBoxes: groups.right, aiBoxSelctedDetail: null));
      },
    );
  }

  FutureOr<void> _onAddAiBox(
    AddAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());

    final result = await aiBoxRepository.createAiBox(request: event.aiBox);
    result.fold(
      (failure) {
        final currentState = state;
        emit(AiBoxAddFailState(errorMessage: failure.toString()));
        if (currentState is AIBoxLoadedState) {
          emit(AIBoxLoadedState(aiBoxes: currentState.aiBoxes ?? []));
        }
      },
      (newAiBox) {
        listAiBox.add(newAiBox);
        emit(AiBoxAddSuccessState());
        emit(AIBoxLoadedState(aiBoxes: listAiBox));
      },
    );
  }

  FutureOr<void> _onDeleteAiBox(
    DeleteAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    if (event.aiBox.id == null) return;
    emit(AiBoxLoadingState());
    final result = await aiBoxRepository.removeAiBox(event.aiBox.id!);
    result.fold(
      (failure) {
        final currentState = state;
        emit(AiBoxDeleteFailState(errorMessage: failure.toString()));
        if (currentState is AIBoxLoadedState) {
          emit(AIBoxLoadedState(aiBoxes: currentState.aiBoxes ?? []));
        }
      },
      (deletedId) {
        final deletedAiBox = listAiBox.firstWhereOrNull(
          (item) => item.id == deletedId,
        );

        if (deletedAiBox != null) {
          listAiBox.removeWhere((item) => item.id == deletedId);
          emit(
            AiBoxDeleteSuccessState(
              aiBoxId: deletedId,
              aiBoxName: deletedAiBox.name ?? '',
            ),
          );
        }
        emit(AIBoxLoadedState(aiBoxes: listAiBox));
      },
    );
  }

  FutureOr<void> _onEditAiBox(
    EditAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());

    final result = await aiBoxRepository.editAiBox(
      aiBoxId: event.aiBoxId,
      request: event.aiBox,
    );

    result.fold(
      (failure) {
        final currentState = state;
        emit(AiBoxEditFailState(errorMessage: failure.toString()));
        if (currentState is AIBoxLoadedState) {
          emit(AIBoxLoadedState(aiBoxes: currentState.aiBoxes ?? []));
        }
      },
      (updatedAiBox) {
        final index = listAiBox.indexWhere((item) => item.id == event.aiBoxId);
        if (index != -1) {
          listAiBox[index] = updatedAiBox;
        }
        emit(AiBoxEditSuccessState(aiBoxName: updatedAiBox.name ?? ''));
        emit(AIBoxLoadedState(aiBoxes: listAiBox));
      },
    );
  }

  void _onFilterAiBox(FilterAiBoxEvent event, Emitter<AiBoxState> emit) {
    // Cập nhật filter state: nếu có truyền giá trị mới thì dùng, không thì giữ nguyên giá trị cũ
    if (event.keyword != null) {
      _currentKeyword = event.keyword!;
    }
    if (event.statusFilter != null) {
      _currentStatusFilter = event.statusFilter!;
    }
    final input = FilterAiBoxInput(
      keyword: _currentKeyword,
      statusFilter: _currentStatusFilter,
      listAiBoxOrigin: listAiBox,
    );
    final output = filterAiBoxUseCase.execute(input);

    emit(AIBoxLoadedState(aiBoxes: output.listAiBox ?? []));
  }
}
