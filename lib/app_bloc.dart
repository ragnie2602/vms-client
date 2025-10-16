import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';


class DisposePlayer extends AppEvent {
  final Player player;
  final bool sequentialMode;

  const DisposePlayer(this.player, {this.sequentialMode = true});
}

class ChangeTheme extends AppEvent {
  final ThemeMode themeMode;
  const ChangeTheme(this.themeMode);
}

class AppStarted extends AppEvent {}

class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<ChangeTheme>(_onChangeTheme);
    on<AppStarted>(_onAppStarted);
    on<DisposePlayer>(_onDisposePlayer, transformer: sequential());
  }

  FutureOr<void> _onChangeTheme(ChangeTheme event, Emitter<AppState> emit) async {
    if (state.themeMode == event.themeMode) return;

    emit(state.copyWith(themeMode: event.themeMode));
    AppData.instance.save(AppKeys.SP_THEME_KEY, event.themeMode.name);
  }

  FutureOr<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      final userTheme = AppData.instance.read<String>(AppKeys.SP_THEME_KEY);

      if (userTheme != null) {
        emit(state.copyWith(themeMode: ThemeMode.values.byName(userTheme)));
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
}

class AppState extends BaseState {
  final ThemeMode themeMode;

  AppState({ThemeMode? themeMode}) : themeMode = themeMode ?? AppConfig.DEFAULT_THEME_MODE {
    AppTheme.currentMode = this.themeMode;
  }

  AppState copyWith({ThemeMode? themeMode}) {
    return AppState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object?> get props => [themeMode];
}

class AppEvent extends BaseEvent {
  const AppEvent();
}
