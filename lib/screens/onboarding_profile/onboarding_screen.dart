import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/domain/entities/onboard_profile/onboard_profile_response.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_stepper.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_bloc.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_event.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/bloc/profile_state.dart';
import 'package:vms_flutter_client/screens/onboarding_profile/components/enum_step_onboard.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(const GetProfilesEvent());
    });
  }

  void _finishOnboarding() {
    final (_, setting) = MultiWindowUtil.getSuitableWindowSetting(
      suggestWindowID: 0,
    );
    context.goNamed(
      setting.isDefaultMode
          ? Routes.monitoring.name
          : Routes.custom_live_view.name,
      extra: 'isFreshLogin',
    );
  }

  void _nextStep() {
    if (_currentStepIndex < 2) {
      setState(() => _currentStepIndex++);
    } else {
      _finishOnboarding();
    }
  }

  void _prevStep() {
    if (_currentStepIndex > 0) {
      setState(() => _currentStepIndex--);
    }
  }

  Widget _buildCurrentStep({
    required List<Profile> profiles,
    required Profile? selectedProfile,
  }) {
    switch (_currentStepIndex) {
      case 0:
        return Step1ConfigSelection(
          profiles: profiles,
          selectedProfile: selectedProfile,
          onSelected: (profile) =>
              context.read<ProfileBloc>().add(SelectProfileEvent(profile)),
        );
      case 1:
        return Step2Confirmation(selectedProfile: selectedProfile);
      case 2:
        return Step3Initialization(
          selectedProfile: selectedProfile,
          onComplete: _finishOnboarding,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        final profiles = profileState is ProfileLoadedState
            ? (profileState.profileResponse.profiles ?? [])
            : <Profile>[];
        final selectedProfile = profileState is ProfileLoadedState
            ? profileState.selectedProfile
            : null;

        return Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: profileState is ProfileLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 40),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1000),
                            child: Column(
                              children: [
                                AppStepper(
                                  listStepName: StepOnboard.values
                                      .map((e) => e.getName)
                                      .toList(),
                                  currentStepIndex: _currentStepIndex,
                                ),
                                const SizedBox(height: 48),
                                _buildCurrentStep(
                                  profiles: profiles,
                                  selectedProfile: selectedProfile,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        border:
                            Border(top: BorderSide(color: Color(0xFFE5E7EB))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (_currentStepIndex ==
                              StepOnboard.confirm.getIndex) ...[
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
                          ] else if (_currentStepIndex ==
                              StepOnboard.chooseConfig.getIndex) ...[
                            SizedBox(
                              width: 140,
                              height: 40,
                              child: AppButton.filled(
                                label: 'Tiếp theo',
                                onPressed:
                                    selectedProfile != null ? _nextStep : null,
                              ),
                            ),
                          ] else if (_currentStepIndex ==
                              StepOnboard.initialize.getIndex) ...[
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: AppButton.filled(
                                label: 'Đang xử lý thiết lập...',
                                onPressed: null,
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
