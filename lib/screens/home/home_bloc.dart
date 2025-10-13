import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

import '../../core/base_bloc.dart';

class HomeTab {
  final Routes? route;
  final String title;
  final String svg;
  final List<HomeTab> nested;

  HomeTab(this.route, {required this.title, required this.svg, this.nested = const []});

  static final tabs = [
    HomeTab(Routes.monitoring, title: 'Liveview', svg: AppAssets.tabMonitor),
    HomeTab(Routes.playback, title: 'Playback', svg: AppAssets.tabPlayback),
    HomeTab(Routes.controlCamera, title: 'Quản lý camera', svg: AppAssets.tabCameras),
    HomeTab(Routes.addGroupCamera, title: 'Quản lý nhóm camera', svg: AppAssets.tabCameraGroups),
    HomeTab(Routes.users, title: 'Quản lý tài khoản', svg: AppAssets.tabUsers),
    HomeTab(Routes.setting, title: 'Cấu hình hệ thống', svg: AppAssets.tabSettings),
    HomeTab(Routes.about, title: 'Thông tin ứng dụng', svg: AppAssets.tabInfo),
    HomeTab(
      null,
      title: 'Test group tab',
      svg: AppAssets.tabMonitor,
      nested: [
        HomeTab(
          null,
          title: 'Nested 1',
          svg: AppAssets.tabMonitor,
          nested: [
            HomeTab(Routes.test11, title: 'Nested child 1-1', svg: AppAssets.tabMonitor),
            HomeTab(Routes.test12, title: 'Nested child 1-2', svg: AppAssets.tabMonitor),
          ],
        ),
      ],
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
