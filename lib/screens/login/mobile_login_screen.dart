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
            flex: 457,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
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
                              showAppMessageDialog(context, message: state.errorMessage!);
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
          ),
        ],
      ),
    );
  }
}

class MobileLoginItem extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isError;
  final bool obscureText;

  const MobileLoginItem({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isError = false,
    this.obscureText = false,
  });

  @override
  State<MobileLoginItem> createState() => _MobileLoginItemState();
}

class _MobileLoginItemState extends State<MobileLoginItem> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTypography.style(13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorText: errorText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.secondary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.red),
            ),
            hintStyle: AppTypography.style(14, fontWeight: FontWeight.w400),
            hintText: widget.hintText,
            isDense: true,
          ),
          obscuringCharacter: '*',
          obscureText: widget.obscureText,
          onChanged: (_) => setState(
            () => errorText = widget.controller.text.isEmpty
                ? '${widget.label} không được để trống'
                : null,
          ),
        ),
      ],
    );
  }
}
