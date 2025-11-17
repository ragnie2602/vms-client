import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/delete_camera/delete_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_use_case.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/control_camera_screen.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/emap_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/custom_monitor_pane.dart';
import 'package:vms_flutter_client/screens/monitor/default_monitor_pane.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_screen.dart';
import 'package:vms_flutter_client/screens/playback/playback_screen.dart';
import 'package:vms_flutter_client/screens/splash_screen.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/user_management_screen.dart';

import '../domain/usecases/login/login_usecase.dart';
import '../screens/about/about_screen.dart';
import '../screens/home/bloc/home_bloc.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../screens/login/login_screen.dart';

enum Routes {
  splash(name: 'splash', path: '/splash'),
  controlCamera(name: 'controlCamera', path: '/controlCamera'),
  addGroupCamera(
    name: 'addGroupCamera',
    path: '/addGroupCamera',
    title: 'Quản lý camera',
    description:
        'Cho phép tổ chức và sắp xếp các thiết bị camera thành các nhóm logic để dễ dàng theo dõi và quản lý',
  ),
  login(name: 'login', path: '/login'),
  monitoring(
    name: 'monitoring',
    path: '/monitoring',
    title: 'Xem trực tiếp',
    description: 'Hiển thị các màn hình theo dõi theo thời gian thực',
  ),
  custom_live_view(
    name: 'custom_live_view',
    path: '/custom_live_view',
    title: 'Chế độ tùy biến',
    description: 'Hiển thị các màn hình theo dõi theo thời gian thực theo các view được tạo sẵn',
  ),
  cameraDetail(name: 'camera_detail', path: '/camera_detail'),
  playback(
    name: 'playback',
    path: '/playback',
    title: 'Playback',
    description: 'Cho phép truy cập và xem lại các đoạn video đã được ghi',
  ),
  emap(
    name: 'emap',
    path: '/emap',
    title: 'Bản đồ camera',
    description:
        'Cho phép người dùng tạo và quản lý sơ đồ vị trí của các camera',
  ),
  users(
    name: 'users',
    path: '/users',
    title: 'Quản lý tài khoản',
    description:
        'Cho phép quản trị viên kiểm soát ai có thể xem camera của mình và cách thức họ truy cập',
  ),
  setting(name: 'setting', path: '/setting'),
  about(name: 'about', path: '/about');

  final String name;
  final String path;
  final String title;
  final String description;
  const Routes({
    required this.name,
    required this.path,
    this.title = '',
    this.description = '',
  });

  static final _mapper = {for (var element in values) element.name: element};
  static Routes? fromName(String name) => _mapper[name];
}

abstract class BaseScreenArgs {
  final String? title;
  final String? description;
  final VoidCallback? onBack;

  BaseScreenArgs({this.title, this.description, this.onBack});
}

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final homeNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: AppConfig.INITIAL_ROUTE.path,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LoginBloc(loginUseCase: context.read<LoginUseCase>()),
          child: const LoginScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeBloc()),
            BlocProvider(
              create: (context) => MonitorBloc(context.read(), context.read(), context.read()),
            ),
            BlocProvider(
              create: (context) => CustomViewBloc(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              )..add(GetListCustomViews()),
              lazy: false,
            ),
            BlocProvider(
              create: (context) => GroupCameraBloc(
                groupCameraRepository: context.read(),
                searchGroupUseCase: context.read<SearchGroupUseCase>(),
                filterCameraNotInGroupUsecase: context
                    .read<FilterCameraNotInGroupUsecase>(),
              )..add(GetAllGroupCameraEvent()),
              lazy: false,
            ),
            BlocProvider(
              create: (context) => ControlCameraBloc(
                controlGroupRepository: context.read(),
                filterCameraUseCase: context.read<FilterCameraUseCase>(),
                filterCameraNoGroupUseCase: context
                    .read<FilterCameraNoGroupUseCase>(),
                deleteCameraUseCase: context.read<DeleteCameraUseCase>(),
              ),
            ),
            BlocProvider(
              create: (context) => EmapBloc(
                emapRepository: context.read(),
                searchEmapUseCase: context.read<SearchEmapUseCase>(),
              ),
            ),
            BlocProvider(
              create: (context) => UserManagementBloc(
                userManagermentRepository: context.read(),
                searchUserUseCase: context.read<SearchUserUseCase>(),
              ),
            ),
          ],
          child: HomeScreen(body: child),
        ),
        routes: [
          ShellRoute(
            builder: (context, state, child) => MonitorScreen(child: child),
            routes: [
              GoRoute(
                path: Routes.monitoring.path,
                name: Routes.monitoring.name,
                pageBuilder: (context, state) => fadeTransition(
                  context: context,
                  state: state,
                  child: DefaultMonitorPane(),
                ),
              ),
              GoRoute(
                path: Routes.custom_live_view.path,
                name: Routes.custom_live_view.name,
                pageBuilder: (context, state) {
                  final args = state.extra as CustomMonitorPaneArgs?;

                  return fadeTransition(
                    context: context,
                    state: state,
                    child: CustomMonitorPane(
                      mode: args?.mode ?? CustomMonitorPaneMode.view,
                    ),
                  );
                },
              ),
            ],
          ),

          GoRoute(
            path: Routes.cameraDetail.path,
            name: Routes.cameraDetail.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: CameraDetailScreen(
                  args: state.extra as CameraDetailScreenArgs,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.playback.path,
            name: Routes.playback.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: PlaybackScreen(),
              );
            },
          ),
          GoRoute(
            path: Routes.about.path,
            name: Routes.about.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: AboutScreen(),
              );
            },
          ),
          // GoRoute(
          //   path: Routes.controlCamera.path,
          //   name: Routes.controlCamera.name,
          //   pageBuilder: (context, state) {
          //     return fadeTransition(context: context, state: state, child: ControlCameraScreen());
          //   },
          // ),
          GoRoute(
            path: Routes.addGroupCamera.path,
            name: Routes.addGroupCamera.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: ControlCameraScreen(),
              );
            },
          ),
          GoRoute(
            path: Routes.emap.path,
            name: Routes.emap.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: EmapScreen(),
              );
            },
          ),
          GoRoute(
            path: Routes.users.path,
            name: Routes.users.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: UserManagementScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage fadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        ),
  );
}

enum _SlideType { ltr, rtl, btt, ttb }

CustomTransitionPage slideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  // ignore: library_private_types_in_public_api
  _SlideType type = _SlideType.ltr,
}) {
  Offset begin = switch (type) {
    _SlideType.ltr => const Offset(-2.5, 0),
    _SlideType.rtl => const Offset(2.5, 0),
    _SlideType.btt => const Offset(0, 1),
    _SlideType.ttb => const Offset(0, -2.5),
  };
  Offset end = Offset.zero;

  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease)),
        ),
        child: child,
      );
    },
  );
}

class CustomMonitorPaneArgs {
  final CustomMonitorPaneMode? mode;

  const CustomMonitorPaneArgs({this.mode = CustomMonitorPaneMode.view});
}
