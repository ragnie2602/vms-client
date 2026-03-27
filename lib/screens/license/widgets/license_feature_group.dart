import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class LicenseFeatureGroup extends StatelessWidget {
  final String title;
  final String? badgeText;
  final Color? badgeBgColor;
  final Color? badgeBorderColor;
  final Color? badgeTextColor;
  final List<String> features;
  final bool isDetailMode;

  const LicenseFeatureGroup({
    super.key,
    required this.title,
    this.badgeText,
    this.badgeBgColor,
    this.badgeBorderColor,
    this.badgeTextColor,
    required this.features,
    this.isDetailMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildHeader(), const SizedBox(height: 16), _buildGrid()],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTypography.style(
              12,
              fontWeight: FontWeight.bold,
              color: AppColors.black111827,
            ),
          ),
        ),
        if (badgeText != null &&
            badgeBgColor != null &&
            badgeTextColor != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: badgeBgColor,
              borderRadius: BorderRadius.circular(8),
              border: badgeBorderColor != null
                  ? Border.all(color: badgeBorderColor!)
                  : null,
            ),
            child: Text(
              badgeText!,
              style: AppTypography.style(
                10,
                fontWeight: FontWeight.w500,
                lineHeight: 1.5,
                color: badgeTextColor,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildGrid() {
    final grid = Wrap(
      spacing: 16,
      runSpacing: 16,
      children: features.map((feature) {
        String mainText = feature;
        String? subText;
        if (feature.contains('(')) {
          final index = feature.indexOf('(');
          mainText = feature.substring(0, index).trim();
          subText = feature.substring(index).trim();
        }
        return SizedBox(
          width: 210,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: AppColors.blue2563EB,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: mainText,
                    style: AppTypography.style(
                      14,
                      color: AppColors.black111827,
                    ),
                    children: subText != null
                        ? [
                            TextSpan(
                              text: ' $subText',
                              style: AppTypography.style(
                                14,
                                color: AppColors.grey9CA3AF,
                              ).copyWith(fontStyle: FontStyle.italic),
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );

    if (isDetailMode) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyE5E7EB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: grid,
      );
    }
    return grid;
  }
}
