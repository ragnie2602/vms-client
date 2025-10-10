import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/env_service.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_event.dart';
import 'package:vms_flutter_client/screens/login/bloc/login_state.dart';

import 'bloc/login_bloc.dart';

TextEditingController loginStatus = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final serverController = TextEditingController(
    text: AppData.instance.read<String>(AppKeys.SP_SERVER_KEY) ?? EnvService.apiBaseUrl,
  );
  final serverFN = FocusNode();
  final usernameController = TextEditingController(
    text: AppData.instance.read<String>(AppKeys.SP_USERNAME_KEY),
  );
  final usernameFN = FocusNode();
  final passwordController = TextEditingController(
    text: AppData.instance.read<String>(AppKeys.SP_PASSWORD_KEY),
  );
  final passwordFN = FocusNode();

  final formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginBloc>().add(const LoginReset());
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
    if (formKey.currentState!.validate()) {
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Welcome ${state.account ?? 'User'}!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  context.goNamed(Routes.monitoring.name);
                } else if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage!), backgroundColor: Colors.red),
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 30,
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Spacer(),
                      const Text(
                        'VMS Client',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      const Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(flex: 2),
                      TextFormField(
                        autofocus: true,
                        focusNode: serverFN,
                        controller: serverController,
                        decoration: const InputDecoration(
                          labelText: 'Máy chủ',
                          hintText: 'http://10.3.3.162:8787',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                          prefixIcon: Icon(Icons.cloud),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Máy chủ không được để trống';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => usernameFN.requestFocus(),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        focusNode: usernameFN,
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Tài khoản',
                          hintText: 'Nhập tài khoản, email hoặc số điện thoại',
                          hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tài khoản không được để trống';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => passwordFN.requestFocus(),
                      ),
                      const SizedBox(height: 16),
                      StatefulBuilder(
                        builder: (context, setState) => TextFormField(
                          focusNode: passwordFN,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            hintText: 'Nhập mật khẩu',
                            hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () => setState(() => obscure = !obscure),
                              icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                              iconSize: 20,
                            ),
                          ),
                          obscureText: obscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mật khẩu không được để trống';
                            }
                            if (value.length < 6) {
                              return 'Mật khẩu phải có ít nhất 6 ký tự';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _login(),
                        ),
                      ),
                      const SizedBox(height: 36),

                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              backgroundColor: Colors.blueAccent,
                              minimumSize: Size(double.infinity, 60),
                            ),
                            onPressed: state.isLoading ? null : _login,
                            child: state.isLoading
                                ? Center(
                                    child: const CircularProgressIndicator(color: Colors.white),
                                  )
                                : Text(
                                    'ĐĂNG NHẬP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          );
                        },
                      ),
                      Spacer(),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () => context.goNamed(Routes.monitoring.name),
                        icon: Icon(Icons.login, size: 13, color: Colors.grey),
                        label: Text(
                          'Continue as Guest',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
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
        ],
      ),
    );
  }
}
