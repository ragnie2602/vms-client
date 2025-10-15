import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';

import '../../../core/constants/colors.dart';

Future<T?> showDialogAddGroup<T>(
  BuildContext context, {
  Function()? onConfirm,
  List<DeviceGroup>? listGroupAvailable,
}) {
  final controlCameraBloc = context.read<GroupCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: AddGroupWidget(listGroupAvailable: listGroupAvailable),
    ),
  );
}

class AddGroupWidget extends StatefulWidget {
  const AddGroupWidget({super.key, this.listGroupAvailable});
  final List<DeviceGroup>? listGroupAvailable;

  @override
  State<AddGroupWidget> createState() => _AddGroupWidgetState();
}

class _AddGroupWidgetState extends State<AddGroupWidget> {
  final _nameGroupController = TextEditingController();

  @override
  void dispose() {
    _nameGroupController.dispose();
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
              'Thêm nhóm camera',
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AppField(
              controller: _nameGroupController,
              hintText: 'Nhập tên camera',
              label: 'Tên nhóm camera',
              requiredField: true,
              maxLength: 50,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
