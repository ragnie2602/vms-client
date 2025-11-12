import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.skipLogin) {
            context.goNamed(Routes.monitoring.name);
          } else {
            context.goNamed(Routes.login.name);
          }
        },
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
