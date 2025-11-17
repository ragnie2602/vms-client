import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';

import '../../../core/base_bloc.dart';

class HomeTab {
  final Routes? route;
  final String title;
  final String svg;
  final List<HomeTab> nested;

  const HomeTab(this.route, {required this.title, required this.svg, this.nested = const []});

  static const tabs = [
    HomeTab(Routes.monitoring, title: 'Xem trực tiếp', svg: AppAssets.tabMonitor),
    HomeTab(Routes.playback, title: 'Xem lại', svg: AppAssets.tabPlayback),
    HomeTab(Routes.addGroupCamera, title: 'Quản lý camera', svg: AppAssets.tabCameraGroups),
    HomeTab(Routes.emap, title: 'Bản đồ camera', svg: AppAssets.tabMap),
    HomeTab(Routes.schedule, title: 'Lập lịch ghi hình', svg: AppAssets.icSchedule),
    HomeTab(Routes.users, title: 'Quản lý tài khoản', svg: AppAssets.tabUsers),
    HomeTab(Routes.about, title: 'Thông tin ứng dụng', svg: AppAssets.tabInfo),
  ];
}

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChangeTab>(_onChangeTab);
    on<ChangePageInfo>(_onChangePageInfo);
    on<ToggleSidebar>(_onToggleSidebar);
  }

  bool? _lastSidebarState;

  FutureOr<void> _onToggleSidebar(ToggleSidebar event, Emitter<HomeState> emit) async {
    // Đóng và save trạng thái trước đó
    if (event.type == 1) {
      _lastSidebarState = state.expandedSidebar;
      emit(state.copyWith(expandedSidebar: false));
    }
    // Khôi phục lại trạng thái đã save
    else if (event.type == 2) {
      emit(state.copyWith(expandedSidebar: _lastSidebarState ?? state.expandedSidebar));
      _lastSidebarState = null;
    }
    // Toggle bình thường
    else {
      _lastSidebarState = null;
      emit(state.copyWith(expandedSidebar: !state.expandedSidebar));
    }
  }

  FutureOr<void> _onChangeTab(ChangeTab event, Emitter<HomeState> emit) async {
    if (state.selectedTab == event.tab && !event.force) return;

    emit(state.copyWith(selectedTab: event.tab));
    if (event.tab.route != null || event.route != null) {
      AppRouter.router.goNamed(event.route?.name ?? event.tab.route!.name, extra: event.extra);
    }
  }

  FutureOr<void> _onChangePageInfo(ChangePageInfo event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        pageTitle: event.title,
        pageDescription: event.description,
        onBack: event.onBack,
      ),
    );
  }
}

class ToggleSidebar extends HomeEvent {
  /// 1: đóng + save trạng thái cũ, 2: khôi phục lại trạng thái cũ
  final int type;
  const ToggleSidebar({this.type = 0});
}

class ChangePageInfo extends HomeEvent {
  final String? title;
  final String? description;
  final void Function()? onBack;
  const ChangePageInfo({this.title, this.description, this.onBack});
}

class ChangeTab extends HomeEvent {
  final HomeTab tab;
  final Routes? route;
  final Object? extra;
  final bool force;
  const ChangeTab(this.tab, {this.route, this.extra, this.force = false});
}

class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class HomeState extends BaseState {
  final HomeTab selectedTab;
  final String pageTitle;
  final String pageDescription;
  final void Function()? onBack;
  final bool expandedSidebar;

  HomeState({
    HomeTab? selectedTab,
    this.pageTitle = '',
    this.pageDescription = '',
    this.onBack,
    this.expandedSidebar = true,
  }) : selectedTab = selectedTab ?? AppConfig.INITIAL_HOME_TAB;

  HomeState copyWith({
    HomeTab? selectedTab,
    String? pageTitle,
    String? pageDescription,
    void Function()? onBack,
    bool? expandedSidebar,
  }) {
    return HomeState(
      selectedTab: selectedTab ?? this.selectedTab,
      pageTitle: pageTitle ?? this.pageTitle,
      pageDescription: pageDescription ?? this.pageDescription,
      onBack: onBack,
      expandedSidebar: expandedSidebar ?? this.expandedSidebar,
    );
  }

  @override
  List<Object?> get props => [selectedTab, pageTitle, pageDescription, onBack, expandedSidebar];
}
