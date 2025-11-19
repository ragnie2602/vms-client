import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.nextRoute == Routes.login.name) {
            context.goNamed(Routes.login.name);
            return;
          }

          if (state.profileReady && state.nextRoute.isNotEmpty) context.goNamed(state.nextRoute);
        },
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
