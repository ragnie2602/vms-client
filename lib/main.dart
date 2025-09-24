import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
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
        'global': <String, Object>{'log': AppConfig.MDK_LOG_LEVEL},
        'player': <String, String>{},
        'onMdkLog': Logger.onMdkLog,
      },
    );

    await AppData.instance.init(); // Trước EnvService
    await EnvService.init();

    await SentryFlutter.init((options) {
      options.dsn =
          'https://8168a7d1fdf6b839c0a84f7f111d8592@o4510069418557440.ingest.de.sentry.io/4510069475704912';
      options.beforeSend = (event, hint) async {
        try {
          await ErrorService.recordSentryEvent(event);
          return null;
        } catch (_) {
          return event;
        }
      };
    }, appRunner: () => runApp(const MyApp()));
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
