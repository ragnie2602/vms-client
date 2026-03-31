import 'package:flutter/material.dart';
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
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEFF6FF),
          ),
          child: const Icon(Icons.settings, color: Color(0xFF3B82F6), size: 40),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: AppTypography.style(24, fontWeight: FontWeight.w700, color: AppColors.blackOrWhite),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: AppTypography.style(14, color: const Color(0xFF6B7280)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // System changes card
        Container(
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
                style: AppTypography.style(12, fontWeight: FontWeight.w600, color: const Color(0xFF9CA3AF)),
              ),
              const SizedBox(height: 24),
              _buildChangeItem(
                icon: Icons.group,
                title: 'Cấu trúc Hồ sơ & Dữ liệu',
                description: 'Tự động tạo sẵn các nhóm đối tượng và cấu hình sẵn các trường dữ liệu động.',
              ),
              const SizedBox(height: 24),
              _buildChangeItem(
                icon: Icons.dashboard_customize,
                title: 'Tùy biến Menu & Giao diện',
                description: 'Cá nhân hóa hệ thống danh mục để tối ưu trải nghiệm người dùng.',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Warning alert box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF9C3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFFDE047)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.warning_amber_rounded, color: Color(0xFFEAB308), size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Lưu ý: ',
                        style: AppTypography.style(14, fontWeight: FontWeight.w700, color: const Color(0xFF854D0E)),
                      ),
                      TextSpan(
                        text: 'Hành động này sẽ tự động sinh ra các dữ liệu mẫu và cấu hình hệ thống theo mô hình ',
                        style: AppTypography.style(14, color: const Color(0xFF854D0E)),
                      ),
                      TextSpan(
                        text: name,
                        style: AppTypography.style(14, fontWeight: FontWeight.w700, color: const Color(0xFF854D0E), decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: '. Bạn không thể thay đổi cấu hình sau khi quá trình khởi tạo hoàn tất.',
                        style: AppTypography.style(14, color: const Color(0xFF854D0E)),
                      ),
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

  Widget _buildChangeItem({required IconData icon, required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF3B82F6), size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.style(15, fontWeight: FontWeight.w700, color: AppColors.blackOrWhite),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTypography.style(14, color: const Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
