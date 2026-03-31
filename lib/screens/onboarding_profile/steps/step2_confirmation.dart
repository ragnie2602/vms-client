import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

class Step2Confirmation extends StatelessWidget {
  final Profile? selectedProfile;

  const Step2Confirmation({super.key, required this.selectedProfile});

  @override
  Widget build(BuildContext context) {
    final name = selectedProfile?.name ?? '';
    final description = selectedProfile?.description ?? '';

    return Column(
      children: [
        (selectedProfile?.details?.icon ?? '').isNotEmpty
            ? SvgPicture.network(
                selectedProfile!.details!.icon!,
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.blueEFF6FF,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: AppColors.blue3B82F6,
                    size: 28,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.blueEFF6FF,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.settings,
                  color: AppColors.blue3B82F6,
                  size: 28,
                ),
              ),
        const SizedBox(height: 16),
        Text(
          name,
          style: AppTypography.style(
            24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackOrWhite,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey334155,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // System changes card
        Builder(
          builder: (context) {
            final detailList = selectedProfile?.details?.detail;
            if (detailList == null || detailList.isEmpty) {
              return const SizedBox.shrink();
            }
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CHI TIẾT THAY ĐỔI HỆ THỐNG',
                    style: AppTypography.style(
                      12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: detailList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 24),
                    itemBuilder: (_, index) {
                      final item = detailList[index];
                      return _buildChangeItem(
                        icon: item.icon ?? '',
                        title: item.title ?? '',
                        description: item.description ?? '',
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 24),

        // Warning alert box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.yellowFFFBEB,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.yellowFDE68A),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: AppColors.yellowF59E0B,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Lưu ý: ',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.yellow92400E,
                        ),
                      ),
                      if ((selectedProfile?.id ?? 0) == 0) ...[
                        TextSpan(
                          text: 'Bạn đang lựa chọn mô hình ',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.yellow92400E,
                          ),
                        ),
                        TextSpan(
                          text: 'Tự thiết lập',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.yellow78350F,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.yellow78350F,
                          ),
                        ),
                        TextSpan(
                          text:
                              '. Bạn không thể thay đổi cấu hình sau khi quá trình khởi tạo hoàn tất.',
                          style: AppTypography.style(
                            14,
                            color: AppColors.yellow92400E,
                          ),
                        ),
                      ] else ...[
                        TextSpan(
                          text:
                              'Hành động này sẽ tự động sinh ra các dữ liệu mẫu và cấu hình hệ thống theo mô hình ',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.yellow92400E,
                          ),
                        ),
                        TextSpan(
                          text: name,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.yellow78350F,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.yellow78350F,
                          ),
                        ),
                        TextSpan(
                          text:
                              '. Bạn không thể thay đổi cấu hình sau khi quá trình khởi tạo hoàn tất.',
                          style: AppTypography.style(
                            14,
                            color: AppColors.yellow92400E,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChangeItem({
    required String icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.blueEFF6FF,
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon.isEmpty
              ? Icon(Icons.settings, color: AppColors.blue3B82F6, size: 20)
              : SvgPicture.network(icon, width: 20, height: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.style(
                  15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackOrWhite,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                style: AppTypography.style(
                  14,
                  color: AppColors.grey64748B,
                  lineHeight: 1.63,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
