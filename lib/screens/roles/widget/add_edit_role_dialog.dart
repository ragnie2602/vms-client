import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission_tree.dart';
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
  final ValueNotifier<Set<String>> _selectedCodes = ValueNotifier(<String>{});
  final ValueNotifier<Set<String>> _selectedSubjectGroupIds = ValueNotifier(<String>{});

  @override
  void initState() {
    super.initState();
    roleBloc = context.read<RoleBloc>();
    roleBloc.add(GetPermissions());

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _selectedCodes.dispose();
    super.dispose();
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
                                label: 'Tên nhóm quyền',
                                onChanged: (value) => _nameController.text = value,
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
                                items: [null, ...RoleStatus.values],
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
                          onChanged: (value) => _descriptionController.text = value,
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
                                selectedCodes: _selectedCodes,
                              ),
                              PermissionList(
                                tree.subjectPermissions ?? [],
                                selectedCodes: _selectedCodes,
                                subTree: SubjectGroupTree(
                                  selectedGroupIds: _selectedSubjectGroupIds,
                                ),
                              ),
                              PermissionList(
                                tree.cameraPermissions ?? [],
                                selectedCodes: _selectedCodes,
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
            child: AppButton.filled(
              label: 'Xác nhận',
              onPressed: () {
                print(_selectedCodes.value);
              },
            ),
          ),
          const Spacer(flex: 154),
        ],
      ),
    );
  }
}
