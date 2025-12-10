import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_status.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_type.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/mobile_tag_item.dart';

class FilterDrawer extends StatefulWidget {
  final FilterDrawerController controller;

  const FilterDrawer({super.key, required this.controller});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final Set<TagEntity> _tempSelectedTags = {};

  @override
  void initState() {
    super.initState();

    if (!widget.controller.isInitialized) {
      context.read<ControlCameraBloc>().add(GetAllTagsEvent());
      // context.read<GroupCameraBloc>().add(GetAllGroupCameraEvent());
      widget.controller.isInitialized = true;
    }

    _tempSelectedTags.addAll(widget.controller.selectedTags);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 24,
      width: MediaQuery.widthOf(context) * 330 / 375,
      child: Container(
        height: MediaQuery.heightOf(context),
        padding: const EdgeInsets.only(bottom: 111, right: 15, top: 41),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 13),
                IconButton(
                  onPressed: () => Scaffold.of(context).closeEndDrawer(),
                  icon: Icon(Icons.close),
                ),
                Text('Phân loại', style: AppTypography.style(20, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 11),
            const Divider(color: AppColors.greyF2F4FA),
            const SizedBox(height: 20),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Nhóm camera',
            //           style: AppTypography.style(16, fontWeight: FontWeight.w600),
            //         ),
            //         BlocListener<GroupCameraBloc, GroupCameraState>(
            //           listener: (context, state) {
            //             if (state is GetAllGroupCameraSuccessState) {
            //               setState(() {
            //                 if (widget.controller.groups.length > 2) {
            //                   widget.controller.groups.removeRange(
            //                     2,
            //                     widget.controller.groups.length,
            //                   );
            //                 }
            //                 widget.controller.groups.addAll(state.groups ?? []);
            //               });
            //             }
            //           },
            //           child: HierarchyDeviceGroupDropdown(
            //             widget.controller.groups,
            //             key: ValueKey(widget.controller.selectedGroupIdChain.toString()),
            //             initGroupIdChain: widget.controller.selectedGroupIdChain,
            //             onSelectGroup: (idChain) =>
            //                 widget.controller.selectedGroupIdChain = idChain,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const Divider(color: AppColors.greyF2F4FA),
            // const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theo thẻ Tags',
                      style: AppTypography.style(16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: BlocBuilder<ControlCameraBloc, ControlCameraState>(
                        buildWhen: (previous, current) =>
                            current is GetAllTagsSuccessState ||
                            current is GetAllTagsLoadingState ||
                            current is GetAllTagsFailState,
                        builder: (context, state) {
                          if (state is GetAllTagsSuccessState) {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final tag = state.tags[index];

                                return MobileTagItem(
                                  key: UniqueKey(),
                                  tag: tag,
                                  initValue: _tempSelectedTags.contains(tag),
                                  onChecked: (checked) {
                                    if (checked) {
                                      _tempSelectedTags.add(tag);
                                    } else {
                                      _tempSelectedTags.remove(tag);
                                    }
                                  },
                                );
                              },
                              itemCount: state.tags.length,
                            );
                          } else if (state is GetAllTagsLoadingState) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return Center(
                            child: Text(
                              'Không có dữ liệu',
                              style: AppTypography.style(
                                14,
                                color: AppColors.grey92929D,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: resetFilter,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                        side: BorderSide(color: AppColors.blue005AA9),
                      ),
                    ),
                    child: Text(
                      'Đặt lại',
                      style: AppTypography.style(
                        14,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => applyFilter(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                        side: BorderSide(color: AppColors.blue005AA9),
                      ),
                    ),
                    child: Text(
                      'Phân loại',
                      style: AppTypography.style(
                        14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void applyFilter(BuildContext context) {
    widget.controller.selectedTags = _tempSelectedTags;

    final MonitorBloc bloc = context.read();
    // final selectedId = widget.controller.selectedGroupIdChain.last;

    // if (selectedId.equals([0])) {
    //   bloc.add(GetAllCameraNoGroup(tags: widget.controller.selectedTags));
    // } else if (selectedId.equals([-1])) {
      bloc.add(GetAllCamera(tags: widget.controller.selectedTags));
    // } else {
    //   bloc.add(GetAllCameraInGroup(selectedId, tags: widget.controller.selectedTags));
    // }

    Scaffold.of(context).closeEndDrawer();
  }

  void resetFilter() {
    setState(() {
      // widget.controller.selectedGroupIdChain = [
      //   [-1],
      // ];
      _tempSelectedTags.clear();
    });
  }
}

class FilterDrawerController {
  List<DeviceGroup> groups = [];
  List<List<int>> selectedGroupIdChain = [
    [-1],
  ];
  Set<TagEntity> selectedTags = {};
  bool isInitialized = false;

  FilterDrawerController() {
    groups.addAll([
      DeviceGroup(
        groupId: [-1],
        name: 'Tất cả',
        groups: [],
        parentGroupId: [],
        status: DeviceGroupStatus.active,
        level: 1,
        createdDate: DateTime.now().millisecondsSinceEpoch,
        lastUpdate: DateTime.now().millisecondsSinceEpoch,
        userCreated: [],
        groupType: DeviceGroupType.owner,
        groupRole: DeviceGroupRole.full,
      ),
      DeviceGroup(
        groupId: [0],
        name: 'Chưa gán nhóm',
        groups: [],
        parentGroupId: [],
        status: DeviceGroupStatus.active,
        level: 1,
        createdDate: DateTime.now().millisecondsSinceEpoch,
        lastUpdate: DateTime.now().millisecondsSinceEpoch,
        userCreated: [],
        groupType: DeviceGroupType.owner,
        groupRole: DeviceGroupRole.full,
      ),
    ]);
  }
}
