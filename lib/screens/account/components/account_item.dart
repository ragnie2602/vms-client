import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class AccountItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Widget? trailing;
  final String svgPath;

  const AccountItem({
    super.key,
    required this.onTap,
    required this.svgPath,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              SvgPicture.asset(svgPath, height: 24, width: 24),
              SizedBox(width: 10),
              Expanded(
                child: Text(title, style: AppTypography.style(14, fontWeight: FontWeight.w500)),
              ),
              trailing ?? Icon(Icons.chevron_right_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
