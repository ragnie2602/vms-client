import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';

Future<T?> showDialogRemoveCameraFromGroup<T>(
  BuildContext context, {
  required Function() onConfirm,
}) {
  final controlCameraBloc = context.read<ControlCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: RemoveCameraFromGroupWidget(onConfirm: onConfirm),
    ),
  );
}

class RemoveCameraFromGroupWidget extends StatelessWidget {
  const RemoveCameraFromGroupWidget({super.key, this.onConfirm});
  final Function()? onConfirm;

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
              'Xóa camera khỏi nhóm',
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
        width: MediaQuery.of(context).size.width * 0.3,
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
              child: Center(
                child: Text(
                  'Bạn có chắc chắn muốn xóa camera khỏi nhóm này không?',
                  style: AppTypography.style(13, color: Colors.black),
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
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      margin: EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyE2E8F0,
                        ),
                      ),
                      child: Text(
                        'Hủy',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey0F172A,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      onConfirm?.call();
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 24, left: 16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                        child: Text(
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
