import 'dart:async';
import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:window_manager/window_manager.dart';
import 'app_bloc.dart';
import 'core/app_router.dart';
import 'core/env_service.dart';
import 'core/utils/chunked_downloader.dart';
import 'di/dependency_injection.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:media_kit/media_kit.dart';
import 'package:vms_flutter_client/core/utils/ios_network_helper.dart';

Future<int> initialMultiWindowConfig(List<String> args) async {
  if (Platform.isAndroid || Platform.isIOS) return 0;

  await windowManager.ensureInitialized();

  if (args.firstOrNull == 'multi_window') {
    return int.parse(args[2]); // businessWindowID
  } else {
    final controller = WindowController.main();

    await windowManager.maximize();

    return controller.windowId; // Main window ID is always 0
  }
}

void main(List<String> args) async {
  await ErrorService.initGlobalErrorHandler(() async {
    initializeDateFormatting('vi');

    // Load configs
    await AppConfig.loadConfigs();

    // Initialize media_kit for video playback
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

    /// Dọn dẹp các file .partX và file đích đang tải dở bị sót lại từ các phiên download trước đó
    if (Platform.isAndroid || Platform.isIOS)
      ChunkedDownloader.cleanupResidualFiles();

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
    }, appRunner: () => runApp(MyApp(bWindowID: windowID)));
  });
}

class MyApp extends StatefulWidget {
  final int bWindowID; // businessWindowID

  const MyApp({super.key, required this.bWindowID});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  AppBloc? appBloc;

  Timer? _changeSettingWindowTimer;

  @override
  void initState() {
    super.initState();
    // IosNetworkHelper.triggerPermission();
    if (!Platform.isAndroid && !Platform.isIOS) {
      windowManager.addListener(this);
      windowManager.setPreventClose(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyInjection.providers,
      child: BlocProvider(
        create: (context) =>
            (appBloc = context.read<AppBloc>())
              ..add(AppStarted(widget.bWindowID)),
        child: BlocSelector<AppBloc, AppState, ThemeMode>(
          selector: (state) => state.themeMode,
          builder: (context, theme) => MaterialApp.router(
            builder: (context, child) => ToastificationWrapper(child: child!),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [const Locale('en'), const Locale('vi')],
            darkTheme: AppTheme.dark,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: AppTheme.light,
            title: 'VNPT Secure Vision',
            themeMode: theme,
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
    _changeSettingWindowTimer = Timer(
      const Duration(milliseconds: 300),
      () => appBloc?.add(ChangeSettingWindow()),
    );
  }

  @override
  void onWindowResized() {
    _changeSettingWindowTimer?.cancel();
    _changeSettingWindowTimer = Timer(
      const Duration(milliseconds: 300),
      () => appBloc?.add(ChangeSettingWindow()),
    );
  }
}
