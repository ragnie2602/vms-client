import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_use_case.dart';
import 'package:window_manager/window_manager.dart';

class AppBloc extends BaseBloc<AppEvent, AppState> {
  final CreateNewWindowUseCase createNewWindowUseCase;
  final SendMultiWindowEventUseCase sendMultiWindowEventUseCase;
  final SubscribeMultiWindowEventUseCase subscribeMultiWindowEventUseCase;

  int windowId = 0; // businessWindowID

  StreamSubscription? _multiWindowEventSubscription;

  AppBloc(
    this.createNewWindowUseCase,
    this.sendMultiWindowEventUseCase,
    this.subscribeMultiWindowEventUseCase,
  ) : super(AppState(false)) {
    on<ChangeTheme>(_onChangeTheme);
    on<AppStarted>(_onAppStarted);
    on<DisposePlayer>(_onDisposePlayer, transformer: sequential());
    on<ToggleMonitorDisplayMode>(_onToggleMonitorDisplayMode);
    on<SignOut>(_onSignOut);

    on<ChangeSettingWindow>(_onChangeSettingWindow);
    on<CloseWindow>(_onCloseWindow);
    on<CreateNewWindow>(_onCreateNewWindow);
    on<MultiWindowEventReceived>(_onMultiWindowEventReceived);
    on<ReopenSubWindow>(_onReopenSubWindow);
    on<MyProfileInfoChanged>(_onMyProfileChanged);
  }

  @override
  Future<void> close() {
    _multiWindowEventSubscription?.cancel();
    return super.close();
  }

  void registerIPCEvents() {
    _multiWindowEventSubscription?.cancel();

    final mweOuput = subscribeMultiWindowEventUseCase.execute(SubscribeMultiWindowEventInput());

    // In case of call the other usecase(s)
    _multiWindowEventSubscription = mweOuput.listen((output) {
      add(MultiWindowEventReceived(output.event));
    });
  }

  FutureOr<void> _onChangeTheme(ChangeTheme event, Emitter<AppState> emit) async {
    if (state.themeMode == event.themeMode) return;

    emit(state.copyWith(themeMode: event.themeMode));
    AppData.instance.save(AppKeys.SP_THEME_KEY, event.themeMode.name);
  }

  FutureOr<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    windowId = event.windowId;

    registerIPCEvents();

    try {
      final userTheme = AppData.instance.read<String>(AppKeys.SP_THEME_KEY);

      if (userTheme != null) {
        emit(
          state.copyWith(
            themeMode: ThemeMode.values.byName(userTheme),
            displayFullScreenLiveView: false,
            isSignOut: false,
          ),
        );
      }
    } catch (_) {}

    emit(state.copyWith(skipLogin: !MultiWindowUtil.isMainWindow(windowId)));
  }

  FutureOr<void> _onCreateNewWindow(CreateNewWindow event, Emitter<AppState> emit) async {
    final output = await createNewWindowUseCase.execute(CreateNewWindowInput());
    await sendMultiWindowEventUseCase.execute(
      SendMultiWindowEventInput(output.windowController.windowId, 'profile'),
    );
    output.windowController.show();
  }

  FutureOr<void> _onDisposePlayer(DisposePlayer event, Emitter<AppState> emit) async {
    if (event.sequentialMode) {
      await event.player.dispose();
    } else {
      event.player.dispose();
    }
  }

  FutureOr<void> _onMultiWindowEventReceived(
    MultiWindowEventReceived event,
    Emitter<AppState> emit,
  ) async {
    if (event.multiWindowEvent is MWECloseWindow) {
      final bSourceID = (event.multiWindowEvent as MWECloseWindow).windowId; // business ID
      MultiWindowUtil.clearWindowSetting(bSourceID);

      if (MultiWindowUtil.hasClosedAll()) {
        await windowManager.setPreventClose(false);
        windowManager.close();
      }
    }
    if (event.multiWindowEvent is MWESignOut) {
      if (MultiWindowUtil.isMainWindow(windowId)) {
        await MultiWindowUtil.save();

        emit(state.copyWith(isSignOut: false)); // Avoid equatable mistake
        emit(state.copyWith(isSignOut: true));
      } else {
        await windowManager.setPreventClose(false);
        windowManager.close();
      }
    }
    if (event.multiWindowEvent is MWEProfileReady) emit(state.copyWith(profileReady: true));
  }

  FutureOr<void> _onToggleMonitorDisplayMode(
    ToggleMonitorDisplayMode event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(displayFullScreenLiveView: !state.displayFullScreenLiveView));
  }

  FutureOr<void> _onSignOut(SignOut event, Emitter<AppState> emit) async {
    await MultiWindowUtil.save();

    AppData.instance.profile = null;

    sendMultiWindowEventUseCase.execute(SendMultiWindowEventInput(-1, 'sign_out'));
  }

  FutureOr<void> _onChangeSettingWindow(ChangeSettingWindow event, Emitter<AppState> emit) async {
    final rect = await windowManager.getBounds();
    sendMultiWindowEventUseCase.execute(
      SendMultiWindowEventInput(
        0,
        'change_setting_window',
        data: {
          'bWindowID': windowId,
          'rect': rect,
          'viewMode': event.viewMode?.value,
          'isDefaultMode': event.isDefaultMode,
          'id': event.id,
        },
      ),
    );
  }

  FutureOr<void> _onCloseWindow(CloseWindow event, Emitter<AppState> emit) async {
    if (MultiWindowUtil.isMainWindow(windowId)) {
      await MultiWindowUtil.save();

      MultiWindowUtil.clearWindowSetting(windowId);

      for (var subWindowId in await DesktopMultiWindow.getAllSubWindowIds()) {
        WindowController.fromWindowId(subWindowId).close();
      }

      // Need to call here because it can be no sub-window to send message to main window
      if (MultiWindowUtil.hasClosedAll()) {
        await windowManager.setPreventClose(false);
        windowManager.close();
      }
    } else {
      await sendMultiWindowEventUseCase.execute(
        SendMultiWindowEventInput(0, 'close_window', data: {'windowId': windowId}),
      );

      await windowManager.setPreventClose(false);
      windowManager.close();
    }
  }

  FutureOr<void> _onReopenSubWindow(ReopenSubWindow event, Emitter<AppState> emit) async {
    MultiWindowUtil.init();

    if (MultiWindowUtil.isMainWindow(windowId)) {
      final subWindowCount = MultiWindowUtil.getSubWindowCount();
      for (var i = 1; i <= subWindowCount; i++) {
        final output = await createNewWindowUseCase.execute(CreateNewWindowInput(windowID: i));
        output.windowController.show().then((_) async {
          await sendMultiWindowEventUseCase.execute(
            SendMultiWindowEventInput(output.windowController.windowId, 'profile'),
          );
          await sendMultiWindowEventUseCase.execute(
            SendMultiWindowEventInput(
              output.windowController.windowId,
              'restore_monitor_mode',
              data: {'bWindowID': i},
            ),
          );
        });
      }
    }
  }

  FutureOr<void> _onMyProfileChanged(MyProfileInfoChanged event, Emitter<AppState> emit) async {
    emit(state.copyWith(myProfileUpdatedAt: DateTime.now().millisecondsSinceEpoch));
  }
}

class AppState extends BaseState {
  final ThemeMode themeMode;
  final bool displayFullScreenLiveView;
  final bool isSignOut;
  final int myProfileUpdatedAt;
  final bool skipLogin;
  final bool profileReady;

  AppState(
    this.displayFullScreenLiveView, {
    ThemeMode? themeMode,
    this.isSignOut = false,
    this.myProfileUpdatedAt = 0,
    this.skipLogin = false,
    this.profileReady = false,
  }) : themeMode = themeMode ?? AppConfig.DEFAULT_THEME_MODE {
    AppTheme.currentMode = this.themeMode;
  }

  AppState copyWith({
    ThemeMode? themeMode,
    bool? displayFullScreenLiveView,
    bool? isSignOut,
    int? myProfileUpdatedAt,
    bool? skipLogin,
    bool? profileReady,
  }) {
    return AppState(
      displayFullScreenLiveView ?? this.displayFullScreenLiveView,
      themeMode: themeMode ?? this.themeMode,
      isSignOut: isSignOut ?? false,
      myProfileUpdatedAt: myProfileUpdatedAt ?? this.myProfileUpdatedAt,
      skipLogin: skipLogin ?? this.skipLogin,
      profileReady: profileReady ?? this.profileReady,
    );
  }

  @override
  List<Object?> get props => [
    themeMode,
    displayFullScreenLiveView,
    isSignOut,
    myProfileUpdatedAt,
    skipLogin,
    profileReady,
  ];
}

class AppEvent extends BaseEvent {
  const AppEvent();
}

class AppStarted extends AppEvent {
  final int windowId;

  const AppStarted(this.windowId);
}

class CreateNewWindow extends AppEvent {
  const CreateNewWindow();
}

class DisposePlayer extends AppEvent {
  final Player player;
  final bool sequentialMode;

  const DisposePlayer(this.player, {this.sequentialMode = true});
}

class ChangeTheme extends AppEvent {
  final ThemeMode themeMode;
  const ChangeTheme(this.themeMode);
}

class ToggleMonitorDisplayMode extends AppEvent {}

class SignOut extends AppEvent {}

class ChangeSettingWindow extends AppEvent {
  final ViewMode? viewMode;
  final bool? isDefaultMode;
  final List<int>? id;

  const ChangeSettingWindow({this.viewMode, this.isDefaultMode, this.id});
}

class CloseWindow extends AppEvent {
  const CloseWindow();
}

class MultiWindowEventReceived extends AppEvent {
  final MWE multiWindowEvent;

  const MultiWindowEventReceived(this.multiWindowEvent);
}

class ReopenSubWindow extends AppEvent {
  const ReopenSubWindow();
}

class MyProfileInfoChanged extends AppEvent {}
