import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';
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
        // 'platforms': ['windows'], // Chỉ sử dụng với platform windows
        'lowLatency': 2,
        'video.decoders': AppConfig.MDK_DECODERS,
        'global': <String, Object>{'log': AppConfig.MDK_LOG_LEVEL},
        'player': <String, String>{},
        'onMdkLog': Logger.onMdkLog,
      },
    );

    await AppData.instance.init(); // Trước EnvService
    await EnvService.init();

    await SentryFlutter.init((options) {
      options.debug = false;
      options.diagnosticLevel = SentryLevel.warning;
      options.dsn = ''; // EnvService.read('SENTRY_DSN');
      options.autoInitializeNativeSdk = true;
      options.enableNativeCrashHandling = true;
      options.enableAutoSessionTracking = false;
      options.enableAutoPerformanceTracing = false;
      options.enableBrightnessChangeBreadcrumbs = false;
      options.enableFramesTracking = false;
      options.enableAutoNativeBreadcrumbs = true;
      options.enableSentryJs = false;
      options.enableWatchdogTerminationTracking = true;
      options.enableWindowMetricBreadcrumbs = false;
      options.maxBreadcrumbs = 30;
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
        title: 'VNPT Secure Vision',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
