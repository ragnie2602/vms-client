import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import '../models/config_template.dart';

class ConfigCard extends StatelessWidget {
  final ConfigTemplate template;
  final bool isSelected;
  final VoidCallback onTap;

  const ConfigCard({
    super.key,
    required this.template,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color(0xFF4F46E5);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? activeColor : AppColors.white,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
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
                color: template.iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(template.icon, color: template.iconColor, size: 28),
            ),
            const SizedBox(height: 20),
            Text(
              template.title,
              style: AppTypography.style(16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                template.description,
                style: AppTypography.style(14, color: const Color(0xFF6B7280)),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 16),
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
                  child: Icon(
                    isSelected ? Icons.check : Icons.arrow_forward_ios,
                    color: isSelected
                        ? AppColors.white
                        : const Color(0xFF9CA3AF),
                    size: 14,
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
