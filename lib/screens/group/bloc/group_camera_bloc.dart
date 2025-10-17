import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_output.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';

class GroupCameraBloc extends BaseBloc<GroupCameraEvent, GroupCameraState> {
  final IGroupRepository groupCameraRepository;
  final SearchGroupUseCase searchGroupUseCase;
  GroupCameraBloc({
    required this.groupCameraRepository,
    required this.searchGroupUseCase,
  }) : super(const GroupCameraState()) {
    on<GetAllGroupCameraEvent>(_onGetAllGroupCamera);
    on<AddGroupCameraEvent>(_onAddGroupCamera);
    on<RemoveGroupCameraEvent>(_onRemoveGroupCamera);
    on<UpdateGroupCameraEvent>(_onUpdateGroupCamera);
    on<SearchGroupEvent>(_onSearch);
  }
  // list group origin
  List<DeviceGroup> listGroup = [];

  FutureOr<void> _onGetAllGroupCamera(
    GetAllGroupCameraEvent event,
    Emitter<GroupCameraState> emit,
  ) async {
    emit(GroupCameraLoadingState());
    final groups = await groupCameraRepository.getAllGroup();
    groups.fold(
      (onFailure) {
        listGroup = [];
        emit(GetAllGroupCameraFailState(groups.left.toString()));
      },
      (onSuccess) {
        listGroup = onSuccess;
        emit(GetAllGroupCameraSuccessState(groups: groups.right));
      },
    );
  }

  void _onSearch(SearchGroupEvent event, Emitter<GroupCameraState> emit) {
    final SearchGroupInput input = SearchGroupInput(
      nameGroup: event.keyword,
      listGroupOrigin: listGroup,
    );
    final SearchGroupOutput output = searchGroupUseCase.execute(input);
    emit(GetAllGroupCameraSuccessState(groups: output.listGroupResult ?? []));
  }

  FutureOr<void> _onAddGroupCamera(
    AddGroupCameraEvent event,
    Emitter<GroupCameraState> emit,
  ) async {
    // emit(AddGroupCameraLoadingState());
    final groups = await groupCameraRepository.addGroupCamera(
      groupName: event.groupName,
      parentGroupId: event.parentGroupId,
    );
    groups.fold(
      (onFailure) => emit(AddGroupCameraFailState(groups.left.toString())),
      (onSuccess) {
        listGroup = onSuccess ?? [];
        emit(GetAllGroupCameraSuccessState(groups: groups.right));
      },
    );
  }

  FutureOr<void> _onRemoveGroupCamera(
    RemoveGroupCameraEvent event,
    Emitter<GroupCameraState> emit,
  ) async {
    final groups = await groupCameraRepository.removeGroupCamera(
      groupId: event.groupId,
    );
    groups.fold(
      (onFailure) => emit(RemoveGroupCameraFailState(groups.left.toString())),
      (onSuccess) {
        listGroup = onSuccess ?? [];
        emit(GetAllGroupCameraSuccessState(groups: groups.right));
      },
    );
  }

  FutureOr<void> _onUpdateGroupCamera(
    UpdateGroupCameraEvent event,
    Emitter<GroupCameraState> emit,
  ) async {
    final groups = await groupCameraRepository.updateGroupCamera(
      groupId: event.groupId,
      groupName: event.groupName,
      parentGroupId: event.parentGroupId,
    );
    groups.fold(
      (onFailure) => emit(UpdateGroupCameraFailState(groups.left.toString())),
      (onSuccess) {
        listGroup = onSuccess ?? [];
        emit(GetAllGroupCameraSuccessState(groups: groups.right));
      },
    );
  }
}
