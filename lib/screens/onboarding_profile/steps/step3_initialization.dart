import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';

class Step3Initialization extends StatefulWidget {
  final Profile? selectedProfile;
  final VoidCallback onComplete;

  const Step3Initialization({
    super.key,
    required this.selectedProfile,
    required this.onComplete,
  });

  @override
  State<Step3Initialization> createState() => _Step3InitializationState();
}

class _Step3InitializationState extends State<Step3Initialization> {
  int _progress = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startSimulatedProgress();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startSimulatedProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (!mounted) return;
      setState(() {
        if (_progress < 100) {
          _progress += 3;
          if (_progress > 100) _progress = 100;
        } else {
          timer.cancel();
          Future.delayed(const Duration(milliseconds: 800), () {
            if (mounted) widget.onComplete();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.selectedProfile?.name ?? '';

    return Column(
      children: [
        // Rocket Icon
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEEF2FF),
          ),
          child: Center(
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4F46E5),
              ),
              child: const Icon(
                Icons.rocket_launch,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Đang khởi tạo hệ thống...',
          style: AppTypography.style(
            24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackOrWhite,
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Vui lòng đợi trong giây lát, hệ thống đang được cài đặt theo mô hình ',
                style: AppTypography.style(14, color: const Color(0xFF6B7280)),
              ),
              TextSpan(
                text: '[$name]',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 48),

        // Progress Bar
        SizedBox(
          width: 600,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Đang xử lý',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackOrWhite,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.blue137FEC,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$_progress%',
                    style: AppTypography.style(
                      16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blue137FEC,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: _progress / 100,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFE5E7EB),
                  color: AppColors.blue137FEC,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 14,
                    color: Color(0xFF9CA3AF),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Vui lòng không đóng trình duyệt hoặc tải lại trang',
                    style: AppTypography.style(
                      12,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Status Card
        Container(
          width: 600,
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
                'TRẠNG THÁI CẤU HÌNH',
                style: AppTypography.style(
                  12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
              const SizedBox(height: 16),
              _buildStatusItem(
                title: 'Đang thiết lập cấu trúc cơ sở dữ liệu...',
                isCompleted: _progress >= 33,
                isActive: _progress < 33,
              ),
              const SizedBox(height: 16),
              _buildStatusItem(
                title: 'Đang tạo các trường dữ liệu động cho các loại đối tượng...',
                isCompleted: _progress >= 66,
                isActive: _progress >= 33 && _progress < 66,
              ),
              const SizedBox(height: 16),
              _buildStatusItem(
                title: 'Đang hoàn tất thiết lập',
                isCompleted: _progress == 100,
                isActive: _progress >= 66 && _progress < 100,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusItem({
    required String title,
    required bool isCompleted,
    required bool isActive,
  }) {
    Widget icon;
    if (isCompleted) {
      icon = Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFDCFCE7),
        ),
        child: const Icon(Icons.check, size: 14, color: Color(0xFF16A34A)),
      );
    } else if (isActive) {
      icon = const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF3B82F6)),
      );
    } else {
      icon = Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFD1D5DB), width: 1.5),
        ),
      );
    }

    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Center(child: icon)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: AppTypography.style(
              14,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isCompleted || isActive ? AppColors.blackOrWhite : const Color(0xFF9CA3AF),
            ),
          ),
        ),
      ],
    );
  }
}
