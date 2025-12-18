import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),

            // App Logo - centered and big
            SvgPicture.asset(
              AppAssets.logoFull,
              width: 200,
              height: 150,
            ),

            const SizedBox(height: 32),
            // Version
            const Text(
              'Phiên bản: 1.1.1 | Build 10',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SizedBox(
                width: 700,
                child: const Text(
                  'VNPT Secure Vision là giải pháp phần mềm giám sát tập trung và toàn diện, cho phép quan sát nhiều camera đồng thời, lưu trữ tập trung tại server trung tâm, sử dụng trí tuệ nhân tạo để phân tích và xử lý hình ảnh thu được từ hệ thống các camera kết nối qua mạng internet (IP Camera).',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

              const Spacer(flex: 3),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                'VIVAS | A member of VNPT Technology',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
