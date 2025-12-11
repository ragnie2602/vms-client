import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_bloc.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_event.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_state.dart';
import 'package:vms_flutter_client/screens/login/components/mobile_login_item.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

// ignore: must_be_immutable
class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  late final TextEditingController passwordController;
  late final TextEditingController serverController;
  late final TextEditingController usernameController;

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController(
      text: AppData.instance.read<String>(AppKeys.SP_PASSWORD_KEY),
    );
    serverController = TextEditingController(
      text: AppData.instance.read<String>(AppKeys.SP_SERVER_KEY) ?? EnvService.apiBaseUrl,
    );
    usernameController = TextEditingController(
      text: AppData.instance.read<String>(AppKeys.SP_USERNAME_KEY),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            flex: 255,
            child: Center(
              child: SvgPicture.asset(
                AppAssets.logoFull,
                width: MediaQuery.widthOf(context) * 260 / 375,
              ),
            ),
          ),
          Expanded(
            flex: 557,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  MobileLoginItem(
                    controller: serverController,
                    hintText: 'Nhập địa chỉ máy chủ',
                    label: 'Địa chỉ máy chủ',
                  ),
                  const SizedBox(height: 15),
                  MobileLoginItem(
                    controller: usernameController,
                    hintText: 'Nhập tên đăng nhập',
                    label: 'Tên đăng nhập',
                  ),
                  const SizedBox(height: 15),
                  MobileLoginItem(
                    controller: passwordController,
                    hintText: 'Nhập mật khẩu',
                    label: 'Mật khẩu',
                    obscureText: true,
                  ),
                  const SizedBox(height: 44),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.read<LoginBloc>().add(
                        LoginSubmitted(
                          password: passwordController.text,
                          server: serverController.text,
                          username: usernameController.text,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state.isSuccess) {
                            context.goNamed(Routes.monitoring.name);
                          } else if (state.errorMessage?.isNotEmpty == true) {
                            showAppMessageDialog(
                              context,
                              message: state.errorMessage!,
                              type: AppMessageType.error,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state.isLoading) {
                            return Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircularProgressIndicator(color: AppColors.white),
                            );
                          }

                          return Text(
                            'Đăng nhập',
                            style: AppTypography.style(
                              14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
