import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';
import 'package:vms_flutter_client/screens/group/widget/group_tree_widget.dart';
import 'package:animated_tree_view/animated_tree_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Danh sách nhóm camera"),
              const SizedBox(height: 10),
              Flexible(
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
                        return TreeGroupWidget(
                          controller: controllerTree,
                          tree: newState.tree,
                          isShowGroupAll: true,
                          isShowNoGroup: true,
                          action: InkWell(
                            splashColor: Colors.transparent,
                            child: SizedBox(
                              width: 12,
                              height: 12,
                              child: SvgPicture.asset(
                                AppAssets.icAction,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 2,
          child: Center(
            child: BlocConsumer<GroupCameraBloc, GroupCameraState>(
              builder: (context, newState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Thêm group mới nè'),
                    const SizedBox(height: 10),
                    TextFormField(
                      autofocus: true,
                      controller: groupNameController,
                      decoration: const InputDecoration(
                        labelText: 'Tên nhóm',
                        hintText: 'Tên nhóm',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tên nhóm không được để trống';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _onAddGroupCamera(),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap:
                          (newState.type.isLoading &&
                              !newState.type.isInit &&
                              newState is AddGroupCameraLoadingState)
                          ? null
                          : _onAddGroupCamera,
                      child: Container(
                        padding: EdgeInsetsGeometry.symmetric(
                          vertical: 10,
                          horizontal: 50,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child:
                            (newState.type.isLoading && !newState.type.isInit)
                            ? CircularProgressIndicator()
                            : Text(
                                'Thêm group mới',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                );
              },
              listener: (context, state) {
                // if (state.type.isSuccess &&
                //     state is AddGroupCameraSuccessState) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Thêm group camera thành công'),
                //       backgroundColor: Colors.green,
                //     ),
                //   );
                //   groupNameController.clear();
                // }
                if (state.type.isError && state is AddGroupCameraFailState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMsg),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
