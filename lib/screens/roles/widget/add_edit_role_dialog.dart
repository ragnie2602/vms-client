import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/role_status.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/roles/bloc/role_bloc.dart';
import 'package:vms_flutter_client/screens/roles/widget/camera_group_tree.dart';
import 'package:vms_flutter_client/screens/roles/widget/permission_list.dart';
import 'package:vms_flutter_client/screens/roles/widget/role_text_field.dart';
import 'package:vms_flutter_client/screens/roles/widget/subject_group_tree.dart';

class AddEditRoleDialog extends StatefulWidget {
  final Role? role;

  const AddEditRoleDialog({super.key, this.role});

  @override
  State<AddEditRoleDialog> createState() => _AddEditRoleDialogState();
}

class _AddEditRoleDialogState extends State<AddEditRoleDialog> with TickerProviderStateMixin {
  late final RoleBloc roleBloc;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  late RoleStatus _status = widget.role?.status ?? RoleStatus.active;
  late final TabController _tabController;

  final ValueNotifier<Set<String>> _selectedCameraGroupIds = ValueNotifier(<String>{});
  final ValueNotifier<Set<int>> _selectedSubjectGroupIds = ValueNotifier(<int>{});
  final ValueNotifier<Set<String>> _selectedSystemPermissions = ValueNotifier(<String>{});
  final ValueNotifier<Set<String>> _selectedSubjectPermissions = ValueNotifier(<String>{});
  final ValueNotifier<Set<String>> _selectedCameraPermissions = ValueNotifier(<String>{});

  @override
  void initState() {
    super.initState();
    roleBloc = context.read<RoleBloc>();
    roleBloc.add(GetPermissions());

    if (widget.role != null) {
      _nameController.text = widget.role!.name ?? '';
      _descriptionController.text = widget.role!.description ?? '';
      _status = widget.role!.status ?? RoleStatus.active;
      _selectedSystemPermissions.value =
          widget.role!.systemPermissions?.actions?.map((e) => e).toSet() ?? {};
      _selectedSubjectPermissions.value =
          widget.role!.subjectPermissions?.actions?.map((e) => e).toSet() ?? {};
      _selectedCameraPermissions.value =
          widget.role!.cameraPermissions?.actions?.map((e) => e).toSet() ?? {};
      _selectedCameraGroupIds.value =
          widget.role!.cameraPermissions?.allowedCameraGroupUuids?.map((e) => e).toSet() ?? {};
      _selectedSubjectGroupIds.value =
          widget.role!.subjectPermissions?.allowedSubjectGroupIds?.map((e) => e).toSet() ?? {};
    }

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.heightOf(context) * 803 / 900,
      width: MediaQuery.widthOf(context) * 850 / 1600,
      child: Column(
        children: [
          _header(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin chung',
                    style: AppTypography.style(14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.greyF2F4FA,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Column(
                      spacing: 15,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: RoleTextField(
                                borderColor: AppColors.greyE2E8F0,
                                controller: _nameController,
                                fillColor: AppColors.white,
                                hintText: 'Nhập tên nhóm quyền',
                                isRequired: true,
                                label: 'Tên nhóm quyền',
                                maxLength: 255,
                                onChanged: (value) {},
                              ),
                            ),
                            Expanded(
                              child: EventFilterDropdown<RoleStatus?>(
                                borderColor: AppColors.greyE2E8F0,
                                fillColor: AppColors.white,
                                initialValue: _status,
                                isDense: true,
                                itemBuilder: (item) => Text(
                                  item?.label ?? 'Tất cả',
                                  style: AppTypography.style(
                                    14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey64748B,
                                  ),
                                ),
                                items: RoleStatus.values,
                                label: 'Trạng thái',
                                labelStyle: AppTypography.style(
                                  13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                onChanged: (value) => _status = value ?? RoleStatus.active,
                                padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey64748B,
                                ),
                              ),
                            ),
                          ],
                        ),
                        RoleTextField(
                          borderColor: AppColors.greyE2E8F0,
                          controller: _descriptionController,
                          fillColor: AppColors.white,
                          hintText: 'Nhập mô tả',
                          label: 'Mô tả',
                          maxLength: 200,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Phân quyền', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 15),
                  Container(
                    color: AppColors.greyFBFBFB,
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.secondary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      labelStyle: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                      padding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(height: 40, text: 'Hệ thống'),
                        Tab(height: 40, text: 'Nhóm đối tượng'),
                        Tab(height: 40, text: 'Nhóm camera'),
                      ],
                      unselectedLabelStyle: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey64748B,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.greyF2F4FA,
                      ),
                      padding: const EdgeInsets.only(left: 17, right: 17, top: 10),
                      child: BlocBuilder<RoleBloc, RoleState>(
                        builder: (context, state) {
                          if (state is! GetAllPermissionsSuccess) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final tree = state.tree;
                          return TabBarView(
                            controller: _tabController,
                            children: [
                              PermissionList(
                                tree.systemPermissions ?? [],
                                selectedCodes: _selectedSystemPermissions,
                              ),
                              PermissionList(
                                tree.subjectPermissions ?? [],
                                selectedCodes: _selectedSubjectPermissions,
                                subTree: SubjectGroupTree(
                                  selectedGroupIds: _selectedSubjectGroupIds,
                                ),
                              ),
                              PermissionList(
                                tree.cameraPermissions ?? [],
                                selectedCodes: _selectedCameraPermissions,
                                subTree: CameraGroupTree(selectedGroupIds: _selectedCameraGroupIds),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _footer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _selectedCameraGroupIds.dispose();
    _selectedSubjectGroupIds.dispose();
    _selectedSystemPermissions.dispose();
    _selectedSubjectPermissions.dispose();
    _selectedCameraPermissions.dispose();
    super.dispose();
  }

  // WIDGETS
  Widget _header() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.role == null ? 'Thêm nhóm quyền' : 'Sửa nhóm quyền',
            style: AppTypography.style(20, fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: SvgPicture.asset(AppAssets.icClose),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.greyF2F4FA)),
      ),
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          const Spacer(flex: 154),
          Expanded(
            flex: 328,
            child: AppButton.outline(label: 'Hủy', onPressed: () => Navigator.pop(context)),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 328,
            child: BlocConsumer<RoleBloc, RoleState>(
              builder: (context, state) {
                if (state is AddingRole || state is EditingRole) {
                  return Center(child: CircularProgressIndicator());
                }

                return AppButton.filled(
                  label: 'Xác nhận',
                  onPressed: widget.role == null ? _addRole : _editRole,
                );
              },
              listener: (context, state) {
                if (state is AddRoleSuccess || state is EditRoleSuccess) Navigator.pop(context);
                if (state is AddRoleFailure) {
                  ToastUtil.toastFail(title: Text(state.message ?? 'Có lỗi khi tạo quyền'));
                } else if (state is EditRoleFailure) {
                  ToastUtil.toastFail(title: Text(state.message ?? 'Có lỗi khi sửa quyền'));
                }
              },
            ),
          ),
          const Spacer(flex: 154),
        ],
      ),
    );
  }

  // FUNCTIONS
  _addRole() {
    if (_nameController.text.isEmpty) {
      ToastUtil.toastFail(title: Text('Vui lòng nhập tên nhóm quyền'));
      return;
    }

    Role role = Role(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      status: _status,
      systemPermissions: SystemPermissions(actions: _selectedSystemPermissions.value.toList()),
      subjectPermissions: SubjectPermissions(
        actions: _selectedSubjectPermissions.value.toList(),
        allowedSubjectGroupIds: _selectedSubjectGroupIds.value.toList(),
      ),
      cameraPermissions: CameraPermissions(
        actions: _selectedCameraPermissions.value.toList(),
        allowedCameraGroupUuids: _selectedCameraGroupIds.value.toList(),
      ),
    );

    roleBloc.add(AddRole(role: role));
  }

  _editRole() {
    if (_nameController.text.isEmpty) {
      ToastUtil.toastFail(title: Text('Vui lòng nhập tên nhóm quyền'));
      return;
    }

    Role role = Role(
      id: widget.role?.id,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      status: _status,
      systemPermissions: SystemPermissions(actions: _selectedSystemPermissions.value.toList()),
      subjectPermissions: SubjectPermissions(
        actions: _selectedSubjectPermissions.value.toList(),
        allowedSubjectGroupIds: _selectedSubjectGroupIds.value.toList(),
      ),
      cameraPermissions: CameraPermissions(
        actions: _selectedCameraPermissions.value.toList(),
        allowedCameraGroupUuids: _selectedCameraGroupIds.value.toList(),
      ),
    );

    roleBloc.add(EditRole(role: role));
  }
}
