import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'app_bloc.dart';
import 'core/app_router.dart';
import 'core/env_service.dart';
import 'di/dependency_injection.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:media_kit/media_kit.dart';

void main(List<String> args) async {
  ErrorService.initGlobalErrorHandler(() async {
    initializeDateFormatting('vi');

    MediaKit.ensureInitialized();
    fvp.registerWith(
      options: {
        'lowLatency': 2,
        'video.decoders': AppConfig.MDK_DECODERS,
        'global': <String, Object>{'log': AppConfig.MDK_LOG_LEVEL},
        'player': <String, String>{},
        'onMdkLog': Logger.onMdkLog,
      },
    );

    await AppData.instance.init();
    await EnvService.init();

    final windowController = await WindowController.fromCurrentEngine();
    final arguments = windowController.arguments.isNotEmpty
        ? jsonDecode(windowController.arguments) as Map<String, dynamic>
        : {'businessWindowID': ''};

    // const channel = WindowMethodChannel('main_channel');
    // channel.setMethodCallHandler((call) async {
    //   debugPrint('CỬA SỔ (ID: ${windowController.windowId}) NHẬN ĐƯỢC LỆNH:');
    //   debugPrint('Lệnh: ${call.method}');
    //   debugPrint('Tham số: ${call.arguments}');

    //   // Handle received command
    //   // if (call.method == 'ping') {
    //   //   return 'ping from window ${windowController.windowId}';
    //   // }

    //   // Return null if the command is not recognized
    //   // return 'OK';
    // });

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
    }, appRunner: () => runApp(MyApp(windowId: arguments['businessWindowID'] ?? '')));
  });
}

class MyApp extends StatelessWidget {
  final String windowId;

  const MyApp({super.key, required this.windowId});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyInjection.providers,
      child: BlocProvider(
        create: (context) => AppBloc(context.read())..add(AppStarted(windowId)),
        child: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state.newWindowController != null) state.newWindowController!.show();
          },
          child: BlocSelector<AppBloc, AppState, ThemeMode>(
            selector: (state) => state.themeMode,
            builder: (context, theme) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'VNPT Secure Vision',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: theme,
              routerConfig: AppRouter.router,
            ),
          ),
        ),
      ),
    );
  }
}
