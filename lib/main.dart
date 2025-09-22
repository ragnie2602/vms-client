import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'core/app_router.dart';
import 'core/env_service.dart';
import 'di/dependency_injection.dart';
import 'package:fvp/fvp.dart' as fvp;

void main() async {
  ErrorService.initGlobalErrorHandler(() async {
    // WidgetsFlutterBinding.ensureInitialized() --> Đã được gọi trước đó initGlobalErrorHandler

    // Fvp: Only for windows
    fvp.registerWith(
      options: {
        'platforms': ['windows'], // Chỉ sử dụng với platform windows
        'lowLatency': 1,
        'video.decoders': ['D3D11', 'DXVA', 'MFT:d3d=11', 'CUDA', 'FFmpeg'],
      },
      onMdkLog: Logger.onMdkLog,
    );

    // Env: Initialize environment configuration
    await EnvService.init();

    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyInjection.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'VMS Flutter Client',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
