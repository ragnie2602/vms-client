import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import '../../core/base_bloc.dart';

class HomeTab {
  final Routes? route;
  final String title;
  final IconData icon;
  final List<HomeTab> nested;

  HomeTab(this.route, {required this.title, required this.icon, this.nested = const []});

  static final tabs = [
    HomeTab(Routes.monitoring, title: 'Giám sát', icon: Icons.fiber_manual_record),
    HomeTab(
      null,
      title: 'Thông tin',
      icon: Icons.list,
      nested: [
        HomeTab(
          null,
          title: 'Test 1',
          icon: Icons.abc,
          nested: [
            HomeTab(Routes.test11, title: 'Test 1-1', icon: Icons.abc),
            HomeTab(Routes.test12, title: 'Test 1-2', icon: Icons.abc),
          ],
        ),
        HomeTab(Routes.test2, title: 'Test 2', icon: Icons.abc),
      ],
    ),
    HomeTab(Routes.about, title: 'Thông tin', icon: Icons.info),
    HomeTab(
      Routes.controlCamera,
      title: 'Quản lý camera đơn',
      icon: Icons.info,
    ),
    HomeTab(
      Routes.addGroupCamera,
      title: 'Quản lý thiết bị (nhóm camera)',
      icon: Icons.home,
    ),
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
    if (state.selectedTab == event.tab) return;

    emit(state.copyWith(selectedTab: event.tab));
    if (event.tab.route != null) AppRouter.router.goNamed(event.tab.route!.name);
  }
}
