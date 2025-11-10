import 'dart:async';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:window_manager/window_manager.dart';
import 'app_bloc.dart';
import 'core/app_router.dart';
import 'core/env_service.dart';
import 'di/dependency_injection.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:media_kit/media_kit.dart';

Future<int> initialMultiWindowConfig(List<String> args) async {
  await windowManager.ensureInitialized();

  if (args.firstOrNull == 'multi_window') {
    return int.parse(args[1]);
  } else {
    final controller = WindowController.main();

    MultiWindowUtil.getWindowRect(controller.windowId) ??
        await MultiWindowUtil.saveWindowRect(controller.windowId, Rect.fromLTWH(10, 10, 1200, 675));
    await windowManager.maximize();

    return controller.windowId;
  }
}

void main(List<String> args) async {
  await ErrorService.initGlobalErrorHandler(() async {
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

    final windowID = await initialMultiWindowConfig(args);

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
    }, appRunner: () => runApp(MyApp(windowId: windowID)));
  });
}

class MyApp extends StatefulWidget {
  final int windowId;

  const MyApp({super.key, required this.windowId});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  AppBloc? appBloc;

  Timer? _changeSettingWindowTimer;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    windowManager.setPreventClose(true);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyInjection.providers,
      child: BlocProvider(
        create: (context) => (appBloc = context.read<AppBloc>())..add(AppStarted(widget.windowId)),
        child: BlocSelector<AppBloc, AppState, ThemeMode>(
          selector: (state) => state.themeMode,
          builder: (context, theme) => ToastificationWrapper(
            child: MaterialApp.router(
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

  @override
  void onWindowClose() => appBloc?.add(CloseWindow());

  @override
  void onWindowMoved() {
    _changeSettingWindowTimer?.cancel();
    _changeSettingWindowTimer = Timer(const Duration(milliseconds: 300), () {
      appBloc?.add(ChangeSettingWindow());
    });
  }

  @override
  void onWindowResized() {
    _changeSettingWindowTimer?.cancel();
    _changeSettingWindowTimer = Timer(const Duration(milliseconds: 300), () {
      appBloc?.add(ChangeSettingWindow());
    });
  }
}
