import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/control_camera/control_camera_screen.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/group/widget/group_tree_widget.dart';
import 'package:vms_flutter_client/screens/group/widget/item_group_action.dart';

class GroupCameraScreen extends StatefulWidget {
  const GroupCameraScreen({super.key});

  @override
  State<GroupCameraScreen> createState() => _GroupCameraScreenState();
}

class _GroupCameraScreenState extends State<GroupCameraScreen> {
  TextEditingController groupNameController = TextEditingController();
  TreeViewController<DeviceGroup, TreeNode<DeviceGroup>>? controllerTree;
  @override
  void dispose() {
    groupNameController.dispose();
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

  void _onAddGroupCamera() {
    // chưa lấy được parent group id => bổ sung sau
    context.read<GroupCameraBloc>().add(
      AddGroupCameraEvent(
        groupName: groupNameController.text,
        parentGroupId: [],
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: BlocBuilder<GroupCameraBloc, GroupCameraState>(
            builder: (context, newState) {
              if (newState is GroupCameraLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (newState is GetAllGroupCameraFailState) {
                return Center(child: Text(newState.errorMsg));
              } else if (newState.type.isSuccess &&
                  newState is GetAllGroupCameraSuccessState) {
                if ((newState.groups ?? []).isEmpty) {
                  return Center(child: Text('Chưa có dữ liệu.'));
                } else {
                  return Container(
                    margin: EdgeInsets.only(left: 1),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        TreeGroupWidget(
                          controller: controllerTree,
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
                              return ItemGroupAction.values
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
              }
              return SizedBox();
            },
          ),
        ),
        Flexible(
          flex: 7,
          child: ControlCameraScreen(),
          //  Center(
          //   child: BlocConsumer<GroupCameraBloc, GroupCameraState>(
          //     builder: (context, newState) {
          //       return Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Text('Thêm group mới nè'),
          //           const SizedBox(height: 10),
          //           TextFormField(
          //             autofocus: true,
          //             controller: groupNameController,
          //             decoration: const InputDecoration(
          //               labelText: 'Tên nhóm',
          //               hintText: 'Tên nhóm',
          //               hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
          //               border: OutlineInputBorder(),
          //               prefixIcon: Icon(Icons.person),
          //             ),
          //             validator: (value) {
          //               if (value == null || value.isEmpty) {
          //                 return 'Tên nhóm không được để trống';
          //               }
          //               return null;
          //             },
          //             textInputAction: TextInputAction.done,
          //             onFieldSubmitted: (_) => _onAddGroupCamera(),
          //           ),
          //           const SizedBox(height: 10),
          //           InkWell(
          //             onTap:
          //                 (newState.type.isLoading &&
          //                     !newState.type.isInit &&
          //                     newState is AddGroupCameraLoadingState)
          //                 ? null
          //                 : _onAddGroupCamera,
          //             child: Container(
          //               padding: EdgeInsetsGeometry.symmetric(
          //                 vertical: 10,
          //                 horizontal: 50,
          //               ),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: Colors.amber,
          //               ),
          //               child:
          //                   (newState.type.isLoading && !newState.type.isInit)
          //                   ? CircularProgressIndicator()
          //                   : Text(
          //                       'Thêm group mới',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //     listener: (context, state) {
          //       // if (state.type.isSuccess &&
          //       //     state is AddGroupCameraSuccessState) {
          //       //   ScaffoldMessenger.of(context).showSnackBar(
          //       //     SnackBar(
          //       //       content: Text('Thêm group camera thành công'),
          //       //       backgroundColor: Colors.green,
          //       //     ),
          //       //   );
          //       //   groupNameController.clear();
          //       // }
          //       if (state.type.isError && state is AddGroupCameraFailState) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(
          //             content: Text(state.errorMsg),
          //             backgroundColor: Colors.red,
          //           ),
          //         );
          //       }
          //     },
          //   ),
          // ),
        ),
      ],
    );
  }
}
