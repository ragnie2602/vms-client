import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_output.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';

class GroupCameraBloc extends BaseBloc<GroupCameraEvent, GroupCameraState> {
  final IGroupRepository groupCameraRepository;
  final SearchGroupUseCase searchGroupUseCase;
  final FilterCameraNotInGroupUsecase filterCameraNotInGroupUsecase;
  GroupCameraBloc({
    required this.groupCameraRepository,
    required this.searchGroupUseCase,
    required this.filterCameraNotInGroupUsecase,
  }) : super(const GroupCameraState()) {
    on<GetAllGroupCameraEvent>(_onGetAllGroupCamera);
    on<AddGroupCameraEvent>(_onAddGroupCamera);
    on<RemoveGroupCameraEvent>(_onRemoveGroupCamera);
    on<UpdateGroupCameraEvent>(_onUpdateGroupCamera);
    on<SearchGroupEvent>(_onSearch);
    // on<GetListShareGroupEvent>(_onListShareInviteGroup);
    // on<ShareGroupEvent>(_onShareGroup);
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
      (onFailure) => {
        //  emit(AddGroupCameraFailState(groups.left.toString()))
      },
      (onSuccess) {
        listGroup = onSuccess ?? [];
        emit(AddGroupCameraSuccessState(groups: listGroup));
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
        emit(RemoveGroupCameraSuccessState(groups: listGroup));
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
        emit(UpdateGroupCameraSuccessState(groups: listGroup));
        emit(GetAllGroupCameraSuccessState(groups: groups.right));
      },
    );
  }

  Future<List<CameraEntity>> getAvailableCamerasForGroup({
    List<int>? groupId,
  }) async {
    final input = FilterCameraNotInGroupInput(groupId: groupId);
    final output = await filterCameraNotInGroupUsecase.execute(input);
    return output.listCamera ?? [];
  }

  Future<List<InviteMessageEntity>> getListSharedGroup({
    List<int>? groupId,
  }) async {
    final res = await groupCameraRepository.listShareInviteGroup(
      groupId: groupId ?? [],
    );
    return res.fold(
      (onFailure) => <InviteMessageEntity>[],
      (onSuccess) => onSuccess,
    );
  }

  Future<List<int>> deleteShareGroup({List<int>? shareInviteId}) async {
    final res = await groupCameraRepository.deleteShareGroupCamera(
      shareInviteId: shareInviteId ?? [],
    );
    return res.fold(
      (onFailure) => <int>[],
      (onSuccess) => onSuccess ?? <int>[],
    );
  }

  Future<List<int>> shareGroup({
    List<int>? groupId,
    List<int>? accoungtInviteId,
    DeviceGroupRole? role,
  }) async {
    final res = await groupCameraRepository.shareGroupCamera(
      groupId: groupId,
      role: role,
      accountInviteId: accoungtInviteId,
    );
    return res.fold(
      (onFailure) => <int>[],
      (onSuccess) => onSuccess ?? <int>[],
    );
  }
}
