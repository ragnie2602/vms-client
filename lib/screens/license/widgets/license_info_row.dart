import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class LicenseInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBoldValue;
  final String? valueHighlight;
  final Widget? badgeWidget;
  final Widget? actionWidget;

  const LicenseInfoRow(
    this.label,
    this.value, {
    super.key,
    this.isBoldValue = false,
    this.valueHighlight,
    this.badgeWidget,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.greyE5E7EB)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.blue64748B,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (valueHighlight != null) ...[
                  Text(
                    valueHighlight!,
                    style: AppTypography.style(
                      16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey0F172A,
                      lineHeight: 1.56,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    value.replaceAll(valueHighlight!, '').trim(),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      lineHeight: 1.43,
                      color: AppColors.blue64748B,
                    ),
                  ),
                ] else if (value.isNotEmpty) ...[
                  Text(
                    value,
                    style: AppTypography.style(
                      isBoldValue ? 16 : 14,
                      lineHeight: isBoldValue ? 1.1 : 1.43,
                      fontWeight:
                          isBoldValue ? FontWeight.w600 : FontWeight.w500,
                      color: AppColors.black111827,
                    ),
                  ),
                ],
                if (badgeWidget != null) ...[
                  if (value.isNotEmpty) const SizedBox(width: 12),
                  badgeWidget!,
                ],
                if (actionWidget != null) ...[const Spacer(), actionWidget!],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
