import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/roles/bloc/role_bloc.dart';
import 'package:vms_flutter_client/screens/roles/widget/add_edit_role_dialog.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  late final RoleBloc roleBloc;

  List<Role> roles = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    roleBloc = context.read()..add(GetRoles());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 380,
                  child: TextField(
                    onChanged: (value) => roleBloc.add(SearchRoles(keyword: value, roles: roles)),
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                      ),
                      constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                      ),
                      hintStyle: AppTypography.style(
                        14,
                        color: AppColors.grey64748B,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Nhập thông tin tìm kiếm',
                      isDense: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(AppAssets.icSearch),
                      ),
                      prefixIconConstraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
                    ),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const Spacer(flex: 751),
                EventCustomButton(
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Thêm nhóm quyền',
                  onPressed: () => addRole(),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  prefix: Icon(Icons.add, color: AppColors.blue005AA9, size: 20),
                  prefixGap: 8,
                  textStyle: AppTypography.style(
                    14,
                    color: AppColors.blue005AA9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              color: AppColors.white,
              padding: EdgeInsets.all(10),
              child: BlocConsumer<RoleBloc, RoleState>(
                listener: (context, state) {
                  if (state is GetAllRolesSuccess) roles = state.roles;
                },
                builder: (context, state) {
                  if (state is GetAllRolesLoading) return CircularProgressIndicator();

                  List<Role> _roles = roles;
                  if (state is SearchRolesSuccess) _roles = state.roles;

                  return CustomTable(
                    data: CustomTableData(
                      columnFlexes: [66, 400, 600, 150, 112],
                      data: List.generate(_roles.length, (i) => _roleRow(i, _roles[i])),
                      headers: ['STT', 'Tên nhóm quyền', 'Mô tả', 'Trạng thái', 'Thao tác'],
                    ),
                    headerBuilder: (header) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(3),
                        ),
                        color: AppColors.greyF2F4FA,
                      ),
                      height: 48,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          header,
                          style: AppTypography.style(
                            13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey4A4A4A,
                          ),
                        ),
                      ),
                    ),
                    verticalAlignments: List.generate(
                      _roles.length,
                      (_) => CrossAxisAlignment.center,
                    ),
                    verticalBorder: const Divider(color: AppColors.greyF2F4FA),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _roleRow(int index, Role role) {
    return [
      Center(
        child: Text('${index + 1}', style: AppTypography.style(14, fontWeight: FontWeight.w400)),
      ),
      Text(role.name ?? ''),
      Text(role.description ?? ''),
      Center(
        child: Container(
          decoration: BoxDecoration(
            color: role.status?.bgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            role.status?.label ?? '',
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w500,
              color: role.status?.textColor,
            ),
          ),
        ),
      ),
      Center(
        child: PopupMenuButton<String>(
          tooltip: '',
          icon: SvgPicture.asset(AppAssets.icAction),
          padding: EdgeInsets.zero,
          splashRadius: 20,
          position: PopupMenuPosition.under,
          offset: Offset(0, 8),
          elevation: 3,
          shadowColor: AppColors.black,
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          menuPadding: EdgeInsets.zero,
          onSelected: (String value) {
            switch (value) {
              case 'edit':
                editRole(role);
                break;
              case 'delete':
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chức năng xóa nhóm quyền đang phát triển')),
                );
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'edit',
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.icEdit, width: 16, height: 16),
                  SizedBox(width: 8),
                  Text(
                    'Sửa',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuDivider(height: 0.5, color: AppColors.greyE2E8F0),
            PopupMenuItem<String>(
              value: 'delete',
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.icDelete, width: 16, height: 16),
                  SizedBox(width: 8),
                  Text(
                    'Xóa',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ];
  }

  addRole() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: BlocProvider.value(value: roleBloc, child: AddEditRoleDialog()),
      ),
    );
  }

  editRole(Role role) {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: AddEditRoleDialog(role: role)),
    );
  }
}
