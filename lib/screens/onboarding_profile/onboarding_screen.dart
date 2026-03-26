import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_stepper.dart';

import 'steps/step1_config_selection.dart';
import 'steps/step2_confirmation.dart';
import 'steps/step3_initialization.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentStepIndex = 0;
  String? _selectedConfigId;

  @override
  void initState() {
    super.initState();
    _selectedConfigId = 'public';
  }

  void _finishOnboarding() {
    // AppData.instance.save(AppKeys.SP_IS_FIRST_LOGIN, false);

    // final (_, setting) = MultiWindowUtil.getSuitableWindowSetting(suggestWindowID: 0);
    // context.goNamed(
    //   setting.isDefaultMode ? Routes.monitoring.name : Routes.custom_live_view.name,
    //   extra: 'isFreshLogin',
    // );
  }

  void _nextStep() {
    if (_currentStepIndex < 2) {
      setState(() {
        _currentStepIndex++;
      });
    } else {
      _finishOnboarding();
    }
  }

  void _prevStep() {
    if (_currentStepIndex > 0) {
      setState(() {
        _currentStepIndex--;
      });
    }
  }

  Widget _buildCurrentStep() {
    switch (_currentStepIndex) {
      case 0:
        return Step1ConfigSelection(
          selectedConfigId: _selectedConfigId,
          onSelected: (id) => setState(() => _selectedConfigId = id),
        );
      case 1:
        return Step2Confirmation(configId: _selectedConfigId ?? 'public');
      case 2:
        return Step3Initialization(
          configId: _selectedConfigId ?? 'public',
          onComplete: _finishOnboarding,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      AppStepper(
                        listStepName: const ['Chọn cấu hình', 'Xác nhận', 'Khởi tạo'],
                        currentStepIndex: _currentStepIndex,
                      ),
                      const SizedBox(height: 48),
                      _buildCurrentStep(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_currentStepIndex == 1) ...[
                  SizedBox(
                    width: 140,
                    height: 40,
                    child: AppButton.outline(
                      label: 'Quay lại',
                      onPressed: _prevStep,
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 160,
                    height: 40,
                    child: AppButton.filled(
                      label: 'Đồng ý khởi tạo',
                      onPressed: _nextStep,
                    ),
                  ),
                ] else if (_currentStepIndex == 0) ...[
                  SizedBox(
                    width: 140,
                    height: 40,
                    child: AppButton.filled(
                      label: 'Tiếp theo',
                      onPressed: _selectedConfigId != null ? _nextStep : null,
                    ),
                  ),
                ] else if (_currentStepIndex == 2) ...[
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: AppButton.filled(
                      label: 'Đang xử lý thiết lập...',
                      onPressed: null,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
