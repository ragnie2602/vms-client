import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_stepper.dart';
import 'package:vms_flutter_client/screens/license/components/enum_step_license.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/license/bloc/license_bloc.dart';
import 'package:vms_flutter_client/screens/license/bloc/license_state.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';

import 'steps/step1_input_code.dart';
import 'steps/step2_review_info.dart';
import 'steps/step3_complete.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  int _currentStepIndex = 0;
  bool _isDetailMode = false;
  bool _isUpdating = false;

  void _nextStep() {
    if (_currentStepIndex < 2) {
      setState(() {
        _currentStepIndex++;
      });
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
        return Step1InputCode(
          onCallPreview: _nextStep,
          onCancel: _isUpdating
              ? () {
                  setState(() {
                    _isDetailMode = true;
                    _isUpdating = false;
                  });
                }
              : null,
        );
      case 1:
        return const Step2ReviewInfo();
      case 2:
        return const Step3Complete();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LicenseBloc, LicenseState>(
      listener: (context, state) {
        if (state.type == StateType.failure) {
          // Show error or handle failure if needed
        } else if (state.type == StateType.success) {
          final status = state.currentLicense?.status;
          if (status == LicenseStatus.active ||
              status == LicenseStatus.expired) {
            setState(() {
              _isDetailMode = true;
            });
          } else {
            setState(() {
              _isDetailMode = false;
              _currentStepIndex = 0;
            });
          }
        }
      },
      builder: (context, state) {
        if (state.type == StateType.loading ||
            state.type == StateType.initial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_isDetailMode) {
          return Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            color: AppColors.white,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 40,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Step2ReviewInfo(
                          isDetailMode: true,
                          onUpdatePackage: () {
                            setState(() {
                              _isDetailMode = false;
                              _currentStepIndex = 0;
                              _isUpdating = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.icLogoVNPT),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bản quyền VNPT Technology',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black111827,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Hotline: ',
                              style: AppTypography.style(
                                14,
                                color: const Color(0xFF6B7280),
                              ),
                              children: [
                                TextSpan(
                                  text: '1800 XXXX',
                                  style: AppTypography.style(
                                    14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF2563EB),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.only(top: 10, left: 10),
          color: AppColors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Column(
                        children: [
                          AppStepper(
                            listStepName: StepLicense.values
                                .map((e) => e.getName)
                                .toList(),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    top: _currentStepIndex == StepLicense.inputCode.index
                        ? BorderSide.none
                        : const BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_currentStepIndex ==
                        StepLicense.reviewInfo.getIndex) ...[
                      SizedBox(
                        height: 40,
                        child: AppButton.outline(
                          label: 'Hủy bỏ',
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          onPressed: _prevStep,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        height: 40,
                        child: AppButton.filled(
                          label: 'Xác nhận kích hoạt',
                          backgroundColor: AppColors.blue005EB8,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          onPressed: _nextStep,
                        ),
                      ),
                    ] else if (_currentStepIndex ==
                        StepLicense.complete.getIndex) ...[
                      SizedBox(
                        height: 40,
                        child: AppButton.filled(
                          label: 'Hoàn tất',
                          backgroundColor: AppColors.blue005EB8,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          onPressed: () {
                            setState(() {
                              _isDetailMode = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
