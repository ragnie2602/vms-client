import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/widget/drop_down_search_widget.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';

import '../../../core/constants/colors.dart';

enum AddEditGroupType { add, edit }

Future<T?> showDialogAddEditGroup<T>(
  BuildContext context, {
  Function({
    String? nameNewGroup,
    List<int>? parentGroupId,
    DeviceGroup? currentGroup,
  })?
  onConfirm,
  List<DeviceGroup>? listGroupAvailable,
  List<int>? parentGroupId,
  DeviceGroup? currentGroup,
  AddEditGroupType? addEditType,
}) {
  final controlCameraBloc = context.read<GroupCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: AddGroupWidget(
        listGroupAvailable: listGroupAvailable,
        onConfirm: onConfirm,
        parentGroupId: parentGroupId,
        currentGroup: currentGroup,
        addEditType: addEditType,
      ),
    ),
  );
}

class AddGroupWidget extends StatefulWidget {
  const AddGroupWidget({
    super.key,
    this.listGroupAvailable,
    this.parentGroupId,
    this.onConfirm,
    this.currentGroup,
    this.addEditType,
  });
  final List<DeviceGroup>? listGroupAvailable;
  final List<int>? parentGroupId;
  final Function({
    String? nameNewGroup,
    List<int>? parentGroupId,
    DeviceGroup? currentGroup,
  })?
  onConfirm;
  final DeviceGroup? currentGroup;
  final AddEditGroupType? addEditType;

  @override
  State<AddGroupWidget> createState() => _AddGroupWidgetState();
}

class _AddGroupWidgetState extends State<AddGroupWidget> {
  final _nameGroupController = TextEditingController();
  final formAddEditKey = GlobalKey<FormState>();
  DeviceGroup? _selectedParentGroup;
  bool _isConfirming = false;

  @override
  void initState() {
    super.initState();
    _selectedParentGroup = widget.parentGroupId != null
        ? widget.listGroupAvailable?.firstWhereOrNull(
            (element) =>
                listEquals(element.groupId, widget.parentGroupId ?? []),
          )
        : null;
    if (widget.addEditType == AddEditGroupType.edit &&
        widget.currentGroup != null) {
      _nameGroupController.text = widget.currentGroup!.name;
    }
  }

  @override
  void dispose() {
    _nameGroupController.dispose();
    _selectedParentGroup = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: EdgeInsets.only(top: 20, right: 24, left: 24, bottom: 10),
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.addEditType == AddEditGroupType.add
                  ? 'Thêm nhóm camera'
                  : 'Sửa nhóm camera',
              style: AppTypography.style(
                20,
                fontWeight: FontWeight.w600,
                color: AppColors.grey0F172A,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.greyE2E8F0),
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Form(
                      key: formAddEditKey,
                      child: AppField(
                        controller: _nameGroupController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên nhóm';
                          }
                          return null;
                        },
                        hintText: 'Nhập tên camera',
                        label: 'Tên nhóm camera',
                        requiredField: true,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // drop down search
                    AppDropdownSearch<DeviceGroup>(
                      label: 'Nhóm cha',
                      items: widget.listGroupAvailable ?? [],
                      selectedItem: _selectedParentGroup,
                      onChanged: (value) {
                        if (_selectedParentGroup?.groupId == value?.groupId) {
                          return;
                        }
                        _selectedParentGroup = value;
                      },
                      hintTextSearch: 'Nhập tên nhóm',
                      itemAsString: (group) {
                        return group.name;
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                height: 1,
                color: AppColors.greyE2E8F0,
                margin: EdgeInsets.only(bottom: 24),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyE2E8F0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                        child: Text(
                          'Hủy',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey0F172A,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      if (_isConfirming) return;
                      // tên trống => báo lỗi
                      if (_nameGroupController.text.trim().isEmpty) {
                        formAddEditKey.currentState?.validate();
                      } else {
                        setState(() {
                          _isConfirming = true;
                        });
                        bool isSuccess = true;
                        try {
                          final result = widget.onConfirm?.call(
                            nameNewGroup: _nameGroupController.text.trim(),
                            parentGroupId: _selectedParentGroup?.groupId,
                            currentGroup: widget.currentGroup,
                          );
                          if (result is Future) {
                            await result;
                          }
                        } catch (_) {
                          isSuccess = false;
                        } finally {
                          if (mounted) {
                            setState(() {
                              _isConfirming = false;
                            });
                          }
                        }
                        if (isSuccess && mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 24, left: 16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                        child: _isConfirming
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Đang xử lý...',
                                    style: AppTypography.style(
                                      14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                'Xác nhận',
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
