import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/roles/permission.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';
import 'package:vms_flutter_client/screens/roles/bloc/role_bloc.dart';
import 'package:vms_flutter_client/screens/roles/widget/permission_item.dart';

class AddEditRoleDialog extends StatefulWidget {
  final Role? role;

  const AddEditRoleDialog({super.key, this.role});

  @override
  State<AddEditRoleDialog> createState() => _AddEditRoleDialogState();
}

class _AddEditRoleDialogState extends State<AddEditRoleDialog> {
  late final RoleBloc roleBloc;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  late RoleStatus _status = widget.role?.status ?? RoleStatus.active;

  List<Permissions> _permissions = [];
  final ValueNotifier<Set<int>> _selectedIds = ValueNotifier(<int>{});

  @override
  void initState() {
    super.initState();
    roleBloc = context.read<RoleBloc>();
    roleBloc.add(GetPermissions());
  }

  @override
  void dispose() {
    _selectedIds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.heightOf(context) * 697 / 900,
      width: MediaQuery.widthOf(context) * 980 / 1600,
      child: Column(
        children: [
          Container(
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
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 405,
                    child: Column(
                      children: [
                        AppField(
                          borderRadius: 3,
                          controller: _nameController,
                          hintText: 'Nhập tên nhóm quyền',
                          label: 'Tên nhóm quyền',
                          requiredField: true,
                        ),
                        const SizedBox(height: 10),
                        EventFilterDropdown(
                          initialValue: _status,
                          isDense: true,
                          itemBuilder: (item) => Text(
                            item.label,
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          items: RoleStatus.values,
                          label: 'Trạng thái',
                          onChanged: (status) => _status = status,
                          padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                        ),
                        const SizedBox(height: 10),
                        AppField(
                          borderRadius: 3,
                          controller: _descriptionController,
                          hintText: 'Nhập mô tả',
                          label: 'Mô tả',
                          maxLines: 8,
                          minLines: 4,
                          requiredField: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 495,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Danh sách quyền',
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.greyF2F4FA,
                            ),
                            padding: EdgeInsets.all(16),
                            child: BlocConsumer<RoleBloc, RoleState>(
                              listener: (context, state) {
                                if (state is GetAllPermissionsSuccess) {
                                  _permissions = state.permissions;
                                }
                              },
                              builder: (context, state) {
                                if (state is GetAllPermissionsLoading) {
                                  return Center(child: CircularProgressIndicator());
                                }

                                return SingleChildScrollView(
                                  child: PermissionItem(
                                    _permissions,
                                    'Toàn quyền',
                                    selectedIds: _selectedIds,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                    label: 'Lưu',
                    onPressed: () {
                      print(_selectedIds.value);
                    },
                  ),
                ),
                const Spacer(flex: 154),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
