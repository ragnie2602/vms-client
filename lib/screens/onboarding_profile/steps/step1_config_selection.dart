import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';
import '../components/config_card.dart';

class Step1ConfigSelection extends StatelessWidget {
  final List<Profile> profiles;
  final Profile? selectedProfile;
  final ValueChanged<Profile> onSelected;

  const Step1ConfigSelection({
    super.key,
    required this.profiles,
    required this.selectedProfile,
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
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            final profile = profiles[index];
            return ConfigCard(
              profile: profile,
              isSelected: selectedProfile?.id == profile.id,
              onTap: () => onSelected(profile),
            );
          },
        ),
      ],
    );
  }
}
