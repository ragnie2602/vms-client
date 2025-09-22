import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_screen.dart';
import '../../core/base_bloc.dart';

class HomeTab {
  final String key;
  final String title;
  final IconData icon;
  final Widget content;
  final List<HomeTab> nested;

  HomeTab(
    this.key, {
    required this.title,
    required this.icon,
    required this.content,
    this.nested = const [],
  });

  static final tabs = [
    HomeTab(
      'monitor',
      content: MonitorScreen(),
      title: 'Giám sát',
      icon: Icons.fiber_manual_record,
    ),
    HomeTab(
      'test',
      content: Container(),
      title: 'Thông tin',
      icon: Icons.list,
      nested: [
        HomeTab(
          'test-1',
          content: Container(),
          title: 'Test 1',
          icon: Icons.abc,
          nested: [
            HomeTab('test-1-1', content: Container(), title: 'Test 1-1', icon: Icons.abc),
            HomeTab('test-1-2', content: Container(), title: 'Test 1-2', icon: Icons.abc),
          ],
        ),
        HomeTab('test-2', content: Container(), title: 'Test 2', icon: Icons.abc),
      ],
    ),
    HomeTab('about', content: Container(), title: 'Thông tin', icon: Icons.info),
  ];
}

class HomeState extends BaseState {
  final HomeTab selectedTab;

  HomeState({HomeTab? selectedTab}) : selectedTab = selectedTab ?? HomeTab.tabs[0];

  HomeState copyWith({HomeTab? selectedTab}) {
    return HomeState(selectedTab: selectedTab ?? this.selectedTab);
  }

  @override
  List<Object?> get props => [selectedTab];
}

class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class ChangeTab extends HomeEvent {
  final HomeTab tab;
  const ChangeTab(this.tab);
}

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChangeTab>(_onChangeTab);
  }

  FutureOr<void> _onChangeTab(ChangeTab event, Emitter<HomeState> emit) async {
    if (state.selectedTab.key == event.tab.key) return;

    emit(state.copyWith(selectedTab: event.tab));
  }
}
