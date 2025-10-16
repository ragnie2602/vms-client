import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/group/widget/add_group_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/group_tree_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/item_group_action.dart';

class GroupCameraView extends StatefulWidget {
  const GroupCameraView({super.key});

  @override
  State<GroupCameraView> createState() => _GroupCameraViewState();
}

class _GroupCameraViewState extends State<GroupCameraView> {
  TextEditingController searchGroupNameController = TextEditingController();
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? controllerTree;
  @override
  void dispose() {
    searchGroupNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _onGetAllGroupCamera();
    super.initState();
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
    DeviceGroup? parentGroup,
  }) {
    // chưa lấy được parent group id => bổ sung sau
    context.read<GroupCameraBloc>().add(
      AddGroupCameraEvent(
        groupName: groupName,
        parentGroupId: parentGroup != null ? parentGroup.groupId : [],
      ),
    );
  }

  void _onRemoveGroupCamera({required List<int> groupId}) {
    context.read<GroupCameraBloc>().add(
      RemoveGroupCameraEvent(groupId: groupId),
    );
  }

  void _onEditGroupCamera() {}
  void _onShareGroupCamera() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupCameraBloc, GroupCameraState>(
      listener: (context, state) {},
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
                TreeGroupWidget(
                  enableAddGroup: true,
                  controller: controllerTree,
                  searchController: searchGroupNameController,
                  onSearchGroup: ({keySearchGroup}) {
                    _onSearchGroup();
                  },
                  onClickAddGroup: () {
                    // convert list group => thành 1 list 1 cấp
                    List<DeviceGroup> listGroupOneLevel = [];
                    for (var e in newState.groups ?? []) {
                      listGroupOneLevel.addAll(e.convertToOneLevel());
                    }
                    showDialogAddGroup(
                      context,
                      listGroupAvailable: listGroupOneLevel,
                      onConfirm: ({nameNewGroup, parentGroup}) =>
                          _onAddGroupCamera(
                            groupName: nameNewGroup ?? '',
                            parentGroup: parentGroup,
                          ),
                    );
                  },
                  tree: newState.tree,
                  isShowGroupAll: true,
                  isShowNoGroup: true,
                  action: PopupMenuButton<ItemGroupAction>(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    menuPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    elevation: 8,
                    onSelected: (value) {},
                    itemBuilder: (BuildContext context) {
                      final listAction = ItemGroupAction.values;
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
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
