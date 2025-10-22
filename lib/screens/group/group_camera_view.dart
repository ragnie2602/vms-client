import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/group/widget/add_camera_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/add_edit_group_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/group_tree_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/item_group_action.dart';
import 'package:vms_flutter_client/screens/group/widget/remove_group_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/share_group_camera_widget.dart';

class GroupCameraView extends StatefulWidget {
  const GroupCameraView({
    super.key,
    required this.onGetCamerasInGroup,
    required this.onGetAllGroupCamera,
    required this.onGetNoGroupCamera,
    required this.onAddCameraToGroup,
    this.enableAddGroup,
    this.enableNodeAction,
    this.initiallySelectAllGroup = true,
  });

  final bool? enableAddGroup;
  final bool? enableNodeAction;
  final bool initiallySelectAllGroup;
  final Function(BuildContext, List<int>)? onGetCamerasInGroup;
  final Function(BuildContext)? onGetAllGroupCamera;
  final Function(BuildContext)? onGetNoGroupCamera;
  final Function({
    required BuildContext c,
    required List<int> currentGroupId,
    required List<List<int>> cameraIds,
  })?
  onAddCameraToGroup;
  // final Function() onShareGetList

  @override
  State<GroupCameraView> createState() => _GroupCameraViewState();
}

class _GroupCameraViewState extends State<GroupCameraView> {
  TextEditingController searchGroupNameController = TextEditingController();
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? controllerTree;
  late bool isClickAllGroup;
  bool isClickNoGroup = false;

  @override
  void dispose() {
    searchGroupNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isClickAllGroup = widget.initiallySelectAllGroup;
    if (widget.initiallySelectAllGroup) {
      _onGetAllGroupCamera();
    }
  }

  void _onGetAllGroupCamera() {
    context.read<GroupCameraBloc>().add(GetAllGroupCameraEvent());
  }

  void _onSearchGroup() {
    context.read<GroupCameraBloc>().add(
      SearchGroupEvent(keyword: searchGroupNameController.text.trim()),
    );
  }

  void _onAddGroupCamera({
    required String groupName,
    List<int>? parentGroupId,
  }) {
    // chưa lấy được parent group id => bổ sung sau
    context.read<GroupCameraBloc>().add(
      AddGroupCameraEvent(
        groupName: groupName,
        parentGroupId: parentGroupId ?? [],
      ),
    );
  }

  void _onShowDialogAddEditGroup({
    required List<DeviceGroup> listGroupInput,
    required BuildContext c,
    List<int>? parentGroupId,
    DeviceGroup? currentGroup,
    AddEditGroupType? addEditType,
  }) {
    // convert list group => thành 1 list 1 cấp
    List<DeviceGroup> listGroupOneLevel = [];
    for (var e in listGroupInput) {
      listGroupOneLevel.addAll(e.convertToOneLevel(hideFromLevel: 2));
    }
    showDialogAddEditGroup(
      c,
      listGroupAvailable: listGroupOneLevel,
      parentGroupId: parentGroupId,
      addEditType: addEditType ?? AddEditGroupType.add,
      currentGroup: currentGroup,
      onConfirm:
          ({
            String? nameNewGroup,
            List<int>? parentGroupId,
            DeviceGroup? currentGroup,
          }) {
            if (addEditType == AddEditGroupType.add) {
              _onAddGroupCamera(
                groupName: nameNewGroup ?? '',
                parentGroupId: parentGroupId ?? [],
              );
            } else if (addEditType == AddEditGroupType.edit &&
                currentGroup != null) {
              _onEditGroupCamera(
                groupName: nameNewGroup ?? '',
                groupId: currentGroup.groupId,
                parentGroupId: parentGroupId ?? [],
              );
            }
          },
    );
  }

  void _onRemoveGroupCamera({required List<int> groupId}) {
    context.read<GroupCameraBloc>().add(
      RemoveGroupCameraEvent(groupId: groupId),
    );
  }

  void _onShowDialogRemoveGroup({
    required BuildContext c,
    DeviceGroup? currentGroup,
  }) {
    showDialogRemoveGroup(
      c,
      onConfirm: () {
        _onRemoveGroupCamera(
          groupId: currentGroup != null ? currentGroup.groupId : [],
        );
      },
    );
  }

  void _onEditGroupCamera({
    required String groupName,
    required List<int> groupId,
    required List<int> parentGroupId,
  }) {
    context.read<GroupCameraBloc>().add(
      UpdateGroupCameraEvent(
        groupId: groupId,
        groupName: groupName,
        parentGroupId: parentGroupId,
      ),
    );
  }

  void _onShowDialogAddCamera({
    required BuildContext c,
    DeviceGroup? currentGroup,
  }) async {
    List<CameraEntity>? listCameraAvailable = await c
        .read<GroupCameraBloc>()
        .getAvailableCamerasForGroup(groupId: currentGroup?.groupId ?? []);
    if (!c.mounted) {
      return;
    }
    showDialogAddCamera(
      c,
      currentGroup: currentGroup,
      listCameraAvailable: listCameraAvailable,
      onConfirm: ({required listCameraSelected}) {
        widget.onAddCameraToGroup?.call(
          c: c,
          currentGroupId: currentGroup?.groupId ?? [],
          cameraIds: listCameraSelected.map((camera) => camera.id).toList(),
        );
      },
    );
  }

  Future<void> _onShowDialogShareGroup({
    required BuildContext c,
    required List<int> groupId,
  }) async {
    // If listShared not provided, fetch from bloc/repository
    List<InviteMessageEntity>? invites;

    invites = await c.read<GroupCameraBloc>().getListSharedGroup(
      groupId: groupId,
    );
    if (!c.mounted) return;

    showShareGroupCameraDialog(
      c,
      shareType: ShareType.groupCamera,
      groupId: groupId,
      onReloadData: () async {
        return await c.read<GroupCameraBloc>().getListSharedGroup(
          groupId: groupId,
        );
      },
      onDeleteShareGroup: (_inviteId) {
        return context.read<GroupCameraBloc>().deleteShareGroup(
          shareInviteId: _inviteId,
        );
      },
      onShareGroup: (_inviteId) {
        return context.read<GroupCameraBloc>().shareGroup(
          groupId: groupId,
          accoungtInviteId: _inviteId,
          role: DeviceGroupRole.gview,
        );
      },
      sharedUsers: invites, // list data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ControlCameraBloc, ControlCameraState>(
      listener: (context, state) {},
      child: BlocConsumer<GroupCameraBloc, GroupCameraState>(
        listener: (context, state) {
          // if (state is ListShareInviteGroupSuccessState) {
          //   _onShowDialogShareGroup(
          //     c: context,
          //     groupId: state.groupId,
          //     listShared: state.inviteMessages,
          //   );
          // }
        },
        builder: (context, newState) {
          if (newState is GroupCameraLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (newState is GetAllGroupCameraFailState) {
            return Center(child: Text(newState.errorMsg));
          } else if (newState.type.isSuccess &&
              newState is GetAllGroupCameraSuccessState) {
            return Container(
              margin: EdgeInsets.only(left: 1),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Expanded(
                    child: TreeGroupWidget(
                      actionBuilder: widget.enableNodeAction == true ? (node) {
                        return PopupMenuButton<ItemGroupAction>(
                          padding: EdgeInsets.zero,
                          splashRadius: 20,
                          menuPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8),
                          ),
                          elevation: 8,
                          onSelected: (value) async {
                            switch (value) {
                              case ItemGroupAction.add:
                                _onShowDialogAddEditGroup(
                                  listGroupInput: newState.groups ?? [],
                                  c: context,
                                  addEditType: AddEditGroupType.add,
                                );
                                break;
                              case ItemGroupAction.edit:
                                _onShowDialogAddEditGroup(
                                  listGroupInput: newState.groups ?? [],
                                  c: context,
                                  parentGroupId: node.data?.parentGroupId,
                                  addEditType: AddEditGroupType.edit,
                                  currentGroup: node.data,
                                );
                                break;
                              case ItemGroupAction.share:
                                if (node.data != null) {
                                  await _onShowDialogShareGroup(
                                    c: context,
                                    groupId: node.data!.groupId,
                                  );
                                }
                                break;
                              case ItemGroupAction.remove:
                                _onShowDialogRemoveGroup(
                                  c: context,
                                  currentGroup: node.data,
                                );
                                break;
                              case ItemGroupAction.addCamera:
                                _onShowDialogAddCamera(
                                  c: context,
                                  currentGroup: node.data,
                                );
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            List<ItemGroupAction> listAction = List.of(
                              ItemGroupAction.values,
                            );
                            // nếu level >= 2 (thứ 3) thì ko còn action add group nữa
                            if ((node.data?.level ?? 0) >= 2) {
                              listAction.remove(ItemGroupAction.add);
                            }
                            return listAction
                                .map(
                                  (e) => PopupMenuItem<ItemGroupAction>(
                                    value: e,
                                    child: ItemActionWidget(item: e),
                                  ),
                                )
                                .toList();
                          },
                          child: SvgPicture.asset(
                            AppAssets.icAction,
                            color: Colors.black,
                          ),
                        );
                      } : null,
                      onClickGroupNode: (c, groupId) {
                        setState(() {
                          isClickAllGroup = false;
                          isClickNoGroup = false;
                        });
                        // rest api lấy camera theo group
                        widget.onGetCamerasInGroup?.call(c, groupId);
                      },
                      onClickAllGroup: () {
                        setState(() {
                          isClickAllGroup = true;
                          isClickNoGroup = false;
                        });
                        widget.onGetAllGroupCamera?.call(context);
                      },
                      onClickNoGroup: () {
                        setState(() {
                          isClickAllGroup = false;
                          isClickNoGroup = true;
                        });
                        widget.onGetNoGroupCamera?.call(context);
                      },
                      enableAddGroup: widget.enableAddGroup,
                      controller: controllerTree,
                      searchController: searchGroupNameController,
                      onSearchGroup: ({keySearchGroup}) {
                        _onSearchGroup();
                      },
                      onClickAddGroup: () {
                        _onShowDialogAddEditGroup(
                          listGroupInput: newState.groups ?? [],
                          c: context,
                          addEditType: AddEditGroupType.add,
                        );
                      },
                      tree: newState.tree,
                      isShowGroupAll: true,
                      isShowNoGroup: true,
                      isClickAllGroup: isClickAllGroup,
                      isClickNoGroup: isClickNoGroup,
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
