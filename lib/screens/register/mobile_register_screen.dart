import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/register/bloc/register_bloc.dart';
import 'package:vms_flutter_client/screens/register/bloc/register_event.dart';
import 'package:vms_flutter_client/screens/register/bloc/register_state.dart';
import 'package:vms_flutter_client/screens/login/components/mobile_login_item.dart';
import 'package:vms_flutter_client/screens/register/components/mobile_register_item.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

class MobileRegisterScreen extends StatefulWidget {
  const MobileRegisterScreen({super.key});

  @override
  State<MobileRegisterScreen> createState() => _MobileRegisterScreenState();
}

class _MobileRegisterScreenState extends State<MobileRegisterScreen> {
  late final TextEditingController accountController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController serverController;

  final GlobalKey<MobileRegisterItemState> accountKey = GlobalKey();
  final GlobalKey<MobileRegisterItemState> passwordKey = GlobalKey();
  final GlobalKey<MobileRegisterItemState> confirmPasswordKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    accountController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    serverController = TextEditingController(
      text:
          AppData.instance.read<String>(AppKeys.SP_SERVER_KEY) ??
          EndPoints.baseUrl,
    );
  }

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    serverController.dispose();
    super.dispose();
  }

  bool _validateAllFields() {
    bool isValid = true;

    // Validate account
    if (!accountKey.currentState!.validate()) {
      isValid = false;
    }

    // Validate password
    if (!passwordKey.currentState!.validate()) {
      isValid = false;
    }

    // Validate confirm password
    if (!confirmPasswordKey.currentState!.validate()) {
      isValid = false;
    }

    return isValid;
  }

  void _handleRegister() {
    if (!_validateAllFields()) {
      return;
    }

    context.read<RegisterBloc>().add(
      RegisterSubmitted(
        account: accountController.text,
        password: passwordController.text,
        server: serverController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Đăng ký',
          style: AppTypography.style(18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: SvgPicture.asset(
                AppAssets.logoFull,
                width: MediaQuery.widthOf(context) * 200 / 375,
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  MobileLoginItem(
                    controller: serverController,
                    hintText: 'Nhập địa chỉ máy chủ',
                    label: 'Địa chỉ máy chủ',
                  ),
                  const SizedBox(height: 15),
                  MobileRegisterItem(
                    key: accountKey,
                    controller: accountController,
                    hintText: 'Nhập tên tài khoản',
                    label: 'Tên tài khoản',
                    validationType: ValidationType.account,
                  ),
                  const SizedBox(height: 15),
                  MobileRegisterItem(
                    key: passwordKey,
                    controller: passwordController,
                    hintText: 'Nhập mật khẩu',
                    label: 'Mật khẩu',
                    obscureText: true,
                    validationType: ValidationType.password,
                  ),
                  const SizedBox(height: 15),
                  MobileRegisterItem(
                    key: confirmPasswordKey,
                    controller: confirmPasswordController,
                    hintText: 'Nhập lại mật khẩu',
                    label: 'Xác nhận mật khẩu',
                    obscureText: true,
                    validationType: ValidationType.confirmPassword,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 44),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) async {
                          if (state.isSuccess) {
                            await showAppMessageDialog(
                              context,
                              message:
                                  'Đăng ký thành công! Vui lòng đăng nhập.',
                              type: AppMessageType.success,
                            );
                            if (context.mounted) context.pop();
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
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            );
                          }

                          return Text(
                            'Đăng ký',
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
          ],
        ),
      ),
    );
  }
}
