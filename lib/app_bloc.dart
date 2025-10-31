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
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_use_case.dart';

class AppBloc extends BaseBloc<AppEvent, AppState> {
  final CreateNewWindowUseCase createNewWindowUseCase;

  String windowId = '';

  AppBloc(this.createNewWindowUseCase) : super(AppState(false)) {
    on<ChangeTheme>(_onChangeTheme);
    on<AppStarted>(_onAppStarted);
    on<DisposePlayer>(_onDisposePlayer, transformer: sequential());
    on<ToggleMonitorDisplayMode>(_onToggleMonitorDisplayMode);

    on<CreateNewWindow>(_onCreateNewWindow);
  }

  FutureOr<void> _onChangeTheme(ChangeTheme event, Emitter<AppState> emit) async {
    if (state.themeMode == event.themeMode) return;

    emit(state.copyWith(themeMode: event.themeMode));
    AppData.instance.save(AppKeys.SP_THEME_KEY, event.themeMode.name);
  }

  FutureOr<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    windowId = event.windowId;

    try {
      final userTheme = AppData.instance.read<String>(AppKeys.SP_THEME_KEY);

      if (userTheme != null) {
        emit(
          state.copyWith(
            themeMode: ThemeMode.values.byName(userTheme),
            displayFullScreenLiveView: false,
          ),
        );
      }
    } catch (_) {}
  }

  FutureOr<void> _onDisposePlayer(DisposePlayer event, Emitter<AppState> emit) async {
    if (event.sequentialMode) {
      await event.player.dispose();
    } else {
      event.player.dispose();
    }
  }

  FutureOr<void> _onToggleMonitorDisplayMode(
    ToggleMonitorDisplayMode event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(displayFullScreenLiveView: !state.displayFullScreenLiveView));
  }

  FutureOr<void> _onCreateNewWindow(CreateNewWindow event, Emitter<AppState> emit) async {
    final output = await createNewWindowUseCase.execute(CreateNewWindowInput());

    emit(state.copyWith(newWindowController: output.windowController));
  }
}

class AppState extends BaseState {
  final ThemeMode themeMode;
  final bool displayFullScreenLiveView;
  final WindowController? newWindowController;

  AppState(this.displayFullScreenLiveView, {ThemeMode? themeMode, this.newWindowController})
    : themeMode = themeMode ?? AppConfig.DEFAULT_THEME_MODE {
    AppTheme.currentMode = this.themeMode;
  }

  AppState copyWith({
    ThemeMode? themeMode,
    bool? displayFullScreenLiveView,
    WindowController? newWindowController,
  }) {
    return AppState(
      displayFullScreenLiveView ?? this.displayFullScreenLiveView,
      themeMode: themeMode ?? this.themeMode,
      newWindowController: newWindowController,
    );
  }

  @override
  List<Object?> get props => [themeMode, displayFullScreenLiveView, newWindowController];
}

class AppEvent extends BaseEvent {
  const AppEvent();
}

class AppStarted extends AppEvent {
  final String windowId;

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
