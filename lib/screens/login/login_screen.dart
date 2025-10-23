import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_event.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_state.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import 'bloc/login_bloc.dart';

TextEditingController loginStatus = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController serverController;
  final serverFN = FocusNode();
  late final TextEditingController usernameController;
  final usernameFN = FocusNode();
  late final TextEditingController passwordController;
  final passwordFN = FocusNode();

  final formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  void initState() {
    final storedServer = AppData.instance.read<String>(AppKeys.SP_SERVER_KEY);
    final storedUsername = AppData.instance.read<String>(AppKeys.SP_USERNAME_KEY);
    final storedPassword = AppData.instance.read<String>(AppKeys.SP_PASSWORD_KEY);

    serverController = TextEditingController(text: storedServer ?? EnvService.apiBaseUrl);
    usernameController = TextEditingController(text: storedUsername);
    passwordController = TextEditingController(text: storedPassword);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginBloc>().add(const LoginReset());

      if (AppConfig.AUTO_LOGIN &&
          storedUsername != null &&
          storedPassword != null &&
          storedServer != null) {
        _login();
      }
    });
  }

  @override
  void dispose() {
    serverController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    serverFN.dispose();
    usernameFN.dispose();
    passwordFN.dispose();
    super.dispose();
  }

  void _login() {
    if (formKey.currentState?.validate() ?? false) {
      loginStatus.text += loginStatus.text.isNotEmpty ? "\n" : "";

      context.read<LoginBloc>().add(
        LoginSubmitted(
          username: usernameController.text,
          password: passwordController.text,
          server: serverController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Stack(
        children: [
          Center(
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('Welcome ${state.account ?? 'User'}!'),
                  //     backgroundColor: Colors.green,
                  //   ),
                  // );
                  context.goNamed(Routes.monitoring.name);
                } 
                else if (state.isLoading == false && state.errorMessage != null) {
                  showAppMessageDialog(
                    context,
                    message: state.errorMessage ?? 'Kết nối không thành công! Vui lòng kiểm tra lại địa chỉ máy chủ!',
                    type: AppMessageType.error,
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 80),
                              child: SvgPicture.asset(
                                width: 260,
                                AppAssets.logoFull,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 44),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  'Đăng nhập',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: AppField(
                                controller: serverController,
                                label: 'Địa chỉ máy chủ',
                                hintText: 'Nhập địa chỉ máy chủ',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Máy chủ không được để trống.';
                                  }
                                  return null;
                                },
                                paddingBottomLabel: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: AppField(
                                controller: usernameController,
                                label: 'Tên đăng nhập',
                                hintText: 'Nhập tên đăng nhập',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tên đăng nhập không được để trống.';
                                  }
                                  return null;
                                },
                                paddingBottomLabel: 16,
                              ),
                            ),
                            StatefulBuilder(
                              builder: (context, setState) => 
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: AppField(
                                  controller: passwordController,
                                  label: 'Mật khẩu',
                                  hintText: 'Nhập mật khẩu',
                                  obscureText: obscure,
                                  suffix: IconButton(
                                    onPressed: () => setState(() => obscure = !obscure),
                                    icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                                    iconSize: 20,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Mật khẩu không được để trống.';
                                    }
                                    if (value.length < 6) {
                                      return 'Mật khẩu phải có ít nhất 6 ký tự';
                                    }
                                    return null;
                                  },
                                  paddingBottomLabel: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 36),
                                              
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return  AppButton.filled(label: 'Đăng Nhập', onPressed: () => _login(), fullWidth: true,);
                              },
                            ),
                            Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        'assets/images/login_illustration.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Visibility(
            visible: false,
            child: Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 30,
                        offset: Offset(0, 20),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    keyboardType: TextInputType.multiline, // Hỗ trợ nhiều dòng
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Bỏ border
                      isDense: true, // Giảm khoảng trống
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 12),
                    ),
                    readOnly: true,
                    controller: loginStatus,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
