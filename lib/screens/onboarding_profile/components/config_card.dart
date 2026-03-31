import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

class ConfigCard extends StatelessWidget {
  final Profile profile;
  final bool isSelected;
  final VoidCallback onTap;

  const ConfigCard({
    super.key,
    required this.profile,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.blue2563EB;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? activeColor : AppColors.white,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.settings, color: Color(0xFF3B82F6), size: 28),
            ),
            const SizedBox(height: 20),
            Text(
              profile.name ?? '',
              style: AppTypography.style(
                16,
                fontWeight: FontWeight.w700,
                color: AppColors.grey0F172A,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                profile.description ?? '',
                style: AppTypography.style(
                  15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey64748B,
                  lineHeight: 1.56,
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isSelected)
                  Text(
                    'Đã được chọn',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w600,
                      color: activeColor,
                    ),
                  )
                else
                  const SizedBox(),

                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? activeColor : AppColors.white,
                    border: Border.all(
                      color: isSelected ? activeColor : const Color(0xFFE5E7EB),
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 14,
                        )
                      : SvgPicture.asset(
                          AppAssets.icArrowRight,
                          width: 14,
                          height: 14,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
