import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';

Future<T?> showDialogRemoveCameraFromGroup<T>(
  BuildContext context, {
  required Function() onConfirm,
  String? title,
}) {
  final controlCameraBloc = context.read<ControlCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: RemoveCameraFromGroupWidget(onConfirm: onConfirm, title: title),
    ),
  );
}

class RemoveCameraFromGroupWidget extends StatefulWidget {
  const RemoveCameraFromGroupWidget({super.key, this.onConfirm, this.title});
  final Function()? onConfirm;
  final String? title;

  @override
  State<RemoveCameraFromGroupWidget> createState() =>
      _RemoveCameraFromGroupWidgetState();
}

class _RemoveCameraFromGroupWidgetState
    extends State<RemoveCameraFromGroupWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControlCameraBloc, ControlCameraState>(
      listenWhen: (prev, current) =>
          current is DeleteCameraSuccessState ||
          current is RemoveCameraFromGroupSuccessState ||
          current is RemoveCameraFromGroupFailState,
      listener: (context, state) {
        if (state is DeleteCameraSuccessState ||
            state is RemoveCameraFromGroupSuccessState) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        } else if (state is RemoveCameraFromGroupFailState) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icDeleteLight,
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Bạn chắc chắn muốn xoá',
                      style: AppTypography.style(
                        14,
                        color: AppColors.blackOrWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.title ?? 'camera này khỏi nhóm?',
                      style: AppTypography.style(
                        14,
                        color: AppColors.blackOrWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width * 130.5 / 1600,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blackOrWhiteReverse,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              side: BorderSide(
                                color: AppColors.greyE2E8F0,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'Hủy',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackOrWhite,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width * 130.5 / 1600,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    widget.onConfirm?.call();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blackOrWhite,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'Xóa',
                                    style: AppTypography.style(
                                      14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackOrWhiteReverse,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
