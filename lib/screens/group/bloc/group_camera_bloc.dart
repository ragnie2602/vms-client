import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_group_repository.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';

class GroupCameraBloc extends BaseBloc<GroupCameraEvent, GroupCameraState> {
  final IGroupRepository groupCameraRepository;

  GroupCameraBloc({required this.groupCameraRepository})
    : super(const GroupCameraState()) {
    on<AddGroupCameraEvent>(_onAddGroupCamera);
  }

  FutureOr<void> _onAddGroupCamera(
    AddGroupCameraEvent event,
    Emitter<GroupCameraState> emit,
  ) async {
    emit(GroupCameraLoadingState());
    final groups = await groupCameraRepository.addGroupCamera(
      groupName: event.groupName,
      parentGroupId: event.parentGroupId,
    );
    if (groups.right != null) {
      emit(AddGroupCameraSuccessState(groups: groups.right));
    } else {
      emit(AddGroupCameraFailState(groups.left.toString()));
    }
  }
}
