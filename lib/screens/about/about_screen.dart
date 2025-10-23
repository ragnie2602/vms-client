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

            // App Name
            const Text(
              'VNPT Secure Vision',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Version
            const Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
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
