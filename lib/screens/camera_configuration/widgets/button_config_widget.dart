import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ButtonConfigWidget extends StatelessWidget {
  const ButtonConfigWidget({
    super.key,
    required this.onSave,
    this.isLoading = false,
  });

  final Function() onSave;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: AppColors.greyE2E8F0),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              child: Center(
                child: Text(
                  'Hủy',
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {
              if (!isLoading) {
                onSave.call();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.blue005AA9,
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 45),
              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Lưu',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
