import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class RemoveGroupObjectDialog extends StatelessWidget {
  const RemoveGroupObjectDialog({
    super.key,
    this.onConfirm,
    this.groupName,
    this.hasChildren,
  });
  final Function()? onConfirm;
  final String? groupName;
  final bool? hasChildren;

  @override
  Widget build(BuildContext context) {
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
                  AppAssets.icRemoveAiBox,
                  height: 88,
                  width: 88,
                ),
                const SizedBox(height: 16),
                Text(
                  'Xóa nhóm đối tượng',
                  style: AppTypography.style(
                    18,
                    color: AppColors.grey34404b,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                hasChildren == true
                    ? Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: groupName ?? 'Nhóm',
                              style: AppTypography.style(
                                16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' đang chứa dữ liệu đối tượng/nhóm con.\nBạn có chắc chắn muốn xóa?',
                              style: AppTypography.style(
                                16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bạn có chắc chắn muốn xóa \n',
                              style: AppTypography.style(
                                16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: groupName ?? 'nhóm',
                              style: AppTypography.style(
                                16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' ?',
                              style: AppTypography.style(
                                16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                const SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 130.5 / 1600,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
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
                      width: MediaQuery.of(context).size.width * 130.5 / 1600,
                      child: ElevatedButton(
                        onPressed: () {
                          //
                          Navigator.pop(context);
                          onConfirm?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        child: Text(
                          'Đồng ý',
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
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
