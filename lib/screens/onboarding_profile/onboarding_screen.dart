import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
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
  Profile? _confirmedProfile;

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

  void _onConfirmSetup(Profile? selectedProfile) {
    // Fire API, then advance to step 3 to show loading UI
    final profileId = selectedProfile?.id ?? 0;
    _confirmedProfile = selectedProfile;
    setState(() => _currentStepIndex = StepOnboard.initialize.getIndex);
    context.read<ProfileBloc>().add(SetupProfileEvent(profileId));
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
          selectedProfile: _confirmedProfile ?? selectedProfile,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is SetupProfileSuccessState) {
          _finishOnboarding();
        } else if (state is SetupProfileErrorState) {
          ToastUtil.toastFail(context: context,
        title: const Text('Thiết lập thất bại vui lòng thử lại'),);
          // Go back to step 2 so user can retry
          setState(() => _currentStepIndex = StepOnboard.confirm.getIndex);
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          final isSetupLoading = profileState is SetupProfileLoadingState;

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
                              constraints:
                                  const BoxConstraints(maxWidth: 1000),
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
                          border: Border(
                              top: BorderSide(color: Color(0xFFE5E7EB))),
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
                                  onPressed: () =>
                                      _onConfirmSetup(selectedProfile),
                                ),
                              ),
                            ] else if (_currentStepIndex ==
                                StepOnboard.chooseConfig.getIndex) ...[
                              SizedBox(
                                width: 140,
                                height: 40,
                                child: AppButton.filled(
                                  label: 'Tiếp theo',
                                  onPressed: selectedProfile != null
                                      ? () => setState(
                                          () => _currentStepIndex++)
                                      : null,
                                ),
                              ),
                            ] else if (_currentStepIndex ==
                                StepOnboard.initialize.getIndex) ...[
                              SizedBox(
                                width: 200,
                                height: 40,
                                child: AppButton.filled(
                                  label: isSetupLoading
                                      ? 'Đang xử lý thiết lập...'
                                      : 'Đang xử lý thiết lập...',
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
      ),
    );
  }
}
