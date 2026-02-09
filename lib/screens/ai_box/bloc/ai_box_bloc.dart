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
  static const int _kPageSize = 20;

  final IAiBoxRepository aiBoxRepository;
  final FilterAiBoxUseCase filterAiBoxUseCase;

  // Lưu trạng thái filter hiện tại
  String _currentKeyword = '';
  AiBoxStatus _currentStatusFilter = AiBoxStatus.all;
  // Lưu danh sách gốc để filter
  List<AiBoxEntity> _originalList = [];

  AiBoxBloc({required this.aiBoxRepository, required this.filterAiBoxUseCase})
    : super(const AiBoxState()) {
    on<GetListAiBoxEvent>(_onGetListAiBox);
    on<AddAiBoxEvent>(_onAddAiBox);
    on<DeleteAiBoxEvent>(_onDeleteAiBox);
    on<EditAiBoxEvent>(_onEditAiBox);
    on<FilterAiBoxEvent>(_onFilterAiBox);
    on<GetAiBoxAtPage>(_onGetAiBoxAtPage);
  }

  List<AiBoxEntity> _paginateList(
    List<AiBoxEntity> fullList,
    int page,
    int pageSize,
  ) {
    if (fullList.isEmpty) return [];
    final startIndex = (page - 1) * pageSize;
    final endIndex = (startIndex + pageSize).clamp(0, fullList.length);
    if (startIndex >= fullList.length) return [];
    return fullList.sublist(startIndex, endIndex);
  }

  FutureOr<void> _onGetListAiBox(
    GetListAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    emit(AiBoxLoadingState());
    final groups = await aiBoxRepository.listAiBox();
    groups.fold(
      (onFailure) {
        _originalList = [];
        emit(AiBoxErrorState(errorMessage: onFailure.toString()));
      },
      (onSuccess) {
        _originalList = onSuccess;
        final paginatedList = _paginateList(_originalList, 1, _kPageSize);
        emit(
          AIBoxLoadedState(
            aiBoxes: _originalList,
            paginatedAiBoxes: paginatedList,
            page: 1,
            pageSize: _kPageSize,
            totalCount: _originalList.length,
          ),
        );
        event.onSuccess?.call();
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
          emit(currentState);
        }
      },
      (newAiBox) {
        // Add vào list hiện tại
        _originalList.add(newAiBox);

        // Nếu đnag search/filter thì search lại
        final filteredList = _applyCurrentFilter();

        final currentState = state;
        final currentPage = currentState is AIBoxLoadedState
            ? currentState.page
            : 1;
        final paginatedList = _paginateList(
          filteredList,
          currentPage,
          _kPageSize,
        );

        emit(AiBoxAddSuccessState());
        emit(
          AIBoxLoadedState(
            aiBoxes: filteredList,
            paginatedAiBoxes: paginatedList,
            page: currentPage,
            pageSize: _kPageSize,
            totalCount: filteredList.length,
          ),
        );
      },
    );
  }

  FutureOr<void> _onDeleteAiBox(
    DeleteAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    if (event.aiBox.id == null) return;
    final currentState = state;
    emit(AiBoxLoadingState());
    final result = await aiBoxRepository.removeAiBox(event.aiBox.id!);
    result.fold(
      (failure) {
        emit(AiBoxDeleteFailState(errorMessage: failure.toString()));
        if (currentState is AIBoxLoadedState) {
          emit(currentState);
        }
      },
      (deletedId) {
        // tim và xóa khỏi danh sách gốc
        final deletedAiBox = _originalList.firstWhereOrNull(
          (item) => item.id == deletedId,
        );

        if (deletedAiBox != null) {
          _originalList.removeWhere((item) => item.id == deletedId);

          // Nếu đang search/filter thì search lại
          final filteredList = _applyCurrentFilter();

          var currentPage = currentState is AIBoxLoadedState
              ? currentState.page
              : 1;
          final totalPages = (filteredList.length / _kPageSize).ceil();
          if (currentPage > totalPages && currentPage > 1) {
            currentPage = totalPages;
          }

          final paginatedList = _paginateList(
            filteredList,
            currentPage,
            _kPageSize,
          );

          emit(
            AiBoxDeleteSuccessState(
              aiBoxId: deletedId,
              aiBoxName: deletedAiBox.name ?? '',
            ),
          );
          emit(
            AIBoxLoadedState(
              aiBoxes: filteredList,
              paginatedAiBoxes: paginatedList,
              page: currentPage,
              pageSize: _kPageSize,
              totalCount: filteredList.length,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _onEditAiBox(
    EditAiBoxEvent event,
    Emitter<AiBoxState> emit,
  ) async {
    final currentState = state;
    emit(AiBoxLoadingState());

    final result = await aiBoxRepository.editAiBox(
      aiBoxId: event.aiBoxId,
      request: event.aiBox,
    );

    result.fold(
      (failure) {
        emit(AiBoxEditFailState(errorMessage: failure.toString()));
        if (currentState is AIBoxLoadedState) {
          emit(currentState);
        }
      },
      (updatedAiBox) {
        //update trong danh sách gốc
        final index = _originalList.indexWhere(
          (item) => item.id == event.aiBoxId,
        );
        if (index != -1) {
          _originalList[index] = updatedAiBox;
        }

        // Nếu đang search/filter thì search lại
        final filteredList = _applyCurrentFilter();

        final currentPage = currentState is AIBoxLoadedState
            ? currentState.page
            : 1;
        final paginatedList = _paginateList(
          filteredList,
          currentPage,
          _kPageSize,
        );

        emit(AiBoxEditSuccessState(aiBoxName: updatedAiBox.name ?? ''));
        emit(
          AIBoxLoadedState(
            aiBoxes: filteredList,
            paginatedAiBoxes: paginatedList,
            page: currentPage,
            pageSize: _kPageSize,
            totalCount: filteredList.length,
          ),
        );
      },
    );
  }

  // Áp dụng filter hiện tại và trả về danh sách đã lọc
  List<AiBoxEntity> _applyCurrentFilter() {
    if (_currentKeyword.isEmpty && _currentStatusFilter == AiBoxStatus.all) {
      return _originalList;
    }
    final input = FilterAiBoxInput(
      keyword: _currentKeyword,
      statusFilter: _currentStatusFilter,
      listAiBoxOrigin: _originalList,
    );
    final output = filterAiBoxUseCase.execute(input);
    return output.listAiBox ?? [];
  }

  void _onFilterAiBox(FilterAiBoxEvent event, Emitter<AiBoxState> emit) {
    // Cập nhật filter state: nếu có truyền giá trị mới thì dùng, không thì giữ nguyên giá trị cũ
    if (event.keyword != null) {
      _currentKeyword = event.keyword!;
    }
    if (event.statusFilter != null) {
      _currentStatusFilter = event.statusFilter!;
    }

    final filteredList = _applyCurrentFilter();

    // reset về trang 1
    final paginatedList = _paginateList(filteredList, 1, _kPageSize);

    emit(
      AIBoxLoadedState(
        aiBoxes: filteredList,
        paginatedAiBoxes: paginatedList,
        page: 1,
        pageSize: _kPageSize,
        totalCount: filteredList.length,
      ),
    );
  }

  void _onGetAiBoxAtPage(GetAiBoxAtPage event, Emitter<AiBoxState> emit) {
    if (state is AIBoxLoadedState) {
      final currentState = state as AIBoxLoadedState;
      final paginatedList = _paginateList(
        currentState.aiBoxes ?? [],
        event.page,
        currentState.pageSize,
      );

      emit(
        currentState.copyWith(
          page: event.page,
          paginatedAiBoxes: paginatedList,
        ),
      );
    }
  }
}
