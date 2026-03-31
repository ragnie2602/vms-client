import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import '../components/config_card.dart';
import '../models/config_template.dart';

class Step1ConfigSelection extends StatelessWidget {
  final String? selectedConfigId;
  final ValueChanged<String> onSelected;

  const Step1ConfigSelection({
    super.key,
    required this.selectedConfigId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Chào mừng bạn đến với VNPT Secure Vision',
          style: AppTypography.style(
            30,
            fontWeight: FontWeight.w700,
            color: AppColors.grey0F172A,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Bắt đầu trải nghiệm bằng cách chọn một cấu hình khởi tạo phù hợp nhất với nhu cầu của bạn.',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w500,
            color: AppColors.grey334155,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 330 / 280,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: ConfigTemplate.defaultTemplates.length,
          itemBuilder: (context, index) {
            final template = ConfigTemplate.defaultTemplates[index];
            return ConfigCard(
              template: template,
              isSelected: selectedConfigId == template.id,
              onTap: () => onSelected(template.id),
            );
          },
        ),
      ],
    );
  }
}
