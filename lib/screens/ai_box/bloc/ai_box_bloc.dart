import 'dart:async';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_box_repository.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_state.dart';

class AiBoxBloc extends BaseBloc<AiBoxEvent, AiBoxState> {
  List<AiBoxEntity> listAiBox = [];
  final IAiBoxRepository aiBoxRepository;

  // Lưu trạng thái filter hiện tại
  String _currentKeyword = '';
  AiBoxStatus _currentStatusFilter =
      AiBoxStatus.all; // -1: all, 0: offline, 1: online

  AiBoxBloc({required this.aiBoxRepository}) : super(const AiBoxState()) {
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

  void _onFilterAiBox(FilterAiBoxEvent event, Emitter<AiBoxState> emit) {
    // Cập nhật filter state: nếu có truyền giá trị mới thì dùng, không thì giữ nguyên giá trị cũ
    if (event.keyword != null) {
      _currentKeyword = event.keyword!;
    }
    if (event.statusFilter != null) {
      _currentStatusFilter = event.statusFilter!;
    }

    final keyword = removeDiacritics(_currentKeyword.toLowerCase().trim());
    final statusFilter = _currentStatusFilter;

    // Bắt đầu với danh sách gốc
    List<AiBoxEntity> filteredList = List.from(listAiBox);

    // Filter theo status (nếu không phải "all" = -1)
    if (statusFilter != AiBoxStatus.all) {
      filteredList = filteredList.where((item) {
        return item.status == statusFilter.value;
      }).toList();
    }

    // Filter theo keyword (nếu có)
    if (keyword.isNotEmpty) {
      filteredList = filteredList.where((item) {
        final nameMatch = removeDiacritics(
          item.name?.toLowerCase() ?? '',
        ).contains(keyword);
        final modelMatch = removeDiacritics(
          item.model?.toLowerCase() ?? '',
        ).contains(keyword);
        final ipMatch = (item.ip?.toLowerCase().contains(keyword) ?? false);
        final portMatch = (item.port?.toString().contains(keyword) ?? false);

        return nameMatch || modelMatch || ipMatch || portMatch;
      }).toList();
    }
    emit(AIBoxLoadedState(aiBoxes: filteredList));
  }
}
