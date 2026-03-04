import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/group/widget/drop_down_search_widget.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';

enum AddEditGroupObjectType { add, edit }

Future<T?> showDialogAddEditGroupObject<T>(
  BuildContext context, {
  Function({
    String? nameNewGroup,
    SubjectGroup? parentGroup,
    SubjectGroup? currentGroup, // case edit
  })?
  onConfirm,
  List<SubjectGroup>? listGroupAvailable,
  SubjectGroup? parentGroup,
  SubjectGroup? currentGroup, // case edit
  AddEditGroupObjectType? addEditType,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AddEditGroupObjectWidget(
      listGroupAvailable: listGroupAvailable,
      onConfirm: onConfirm,
      parentGroup: parentGroup,
      currentGroup: currentGroup,
      addEditType: addEditType,
    ),
  );
}

class AddEditGroupObjectWidget extends StatefulWidget {
  const AddEditGroupObjectWidget({
    super.key,
    this.listGroupAvailable,
    this.parentGroup,
    this.onConfirm,
    this.currentGroup,
    this.addEditType,
  });

  final List<SubjectGroup>? listGroupAvailable;
  final SubjectGroup? parentGroup;
  final Function({
    String? nameNewGroup,
    SubjectGroup? parentGroup,
    SubjectGroup? currentGroup,
  })?
  onConfirm;
  final SubjectGroup? currentGroup;
  final AddEditGroupObjectType? addEditType;

  @override
  State<AddEditGroupObjectWidget> createState() =>
      _AddEditGroupObjectWidgetState();
}

class _AddEditGroupObjectWidgetState extends State<AddEditGroupObjectWidget> {
  final _nameGroupController = TextEditingController();
  final formAddEditKey = GlobalKey<FormState>();
  SubjectGroup? _selectedParentGroup;
  bool _isConfirming = false;

  @override
  void initState() {
    super.initState();
    _selectedParentGroup = widget.parentGroup;
    if (widget.addEditType == AddEditGroupObjectType.edit &&
        widget.currentGroup != null) {
      _nameGroupController.text = widget.currentGroup!.name ?? '';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      titlePadding: const EdgeInsets.only(
        top: 20,
        right: 24,
        left: 24,
        bottom: 10,
      ),
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.addEditType == AddEditGroupObjectType.add
                  ? 'Thêm nhóm đối tượng'
                  : 'Sửa nhóm đối tượng',
              style: AppTypography.style(
                20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppAssets.icClose),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Form(
                      key: formAddEditKey,
                      child: AppField(
                        controller: _nameGroupController,
                        borderRadius: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên nhóm';
                          }
                          return null;
                        },
                        hintText: 'Nhập tên nhóm',
                        label: 'Tên nhóm quản lý đối tượng',
                        requiredField: true,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // drop down search nhóm cha
                    AppDropdownSearch<SubjectGroup>(
                      label: 'Nhóm cha',
                      borderRadius: 3,
                      items: widget.listGroupAvailable ?? [],
                      selectedItem: _selectedParentGroup,
                      onChanged: (value) {
                        if (_selectedParentGroup?.id == value?.id) {
                          return;
                        }
                        _selectedParentGroup = value;
                      },
                      hintTextSearch: 'Nhập tên nhóm',
                      itemAsString: (group) {
                        return group.name ?? '';
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
                margin: const EdgeInsets.only(bottom: 24),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyE2E8F0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 13),
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
                            parentGroup: _selectedParentGroup,
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
                      margin: const EdgeInsets.only(right: 24, left: 16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: _isConfirming
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
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
