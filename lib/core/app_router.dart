import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/screens/camera_live/camera_live_screen.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/control_camera_screen.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/group_camera_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_screen.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/user_management_screen.dart';

import '../domain/usecases/login/login_usecase.dart';
import '../screens/home/home_bloc.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../screens/login/login_screen.dart';

enum Routes {
  test11(name: 'test11', path: '/test11'),
  test12(name: 'test12', path: '/test12'),
  test2(name: 'test2', path: '/test2'),

  controlCamera(name: 'controlCamera', path: '/controlCamera'),
  addGroupCamera(
    name: 'addGroupCamera',
    path: '/addGroupCamera',
    title: 'Quản lý nhóm camera',
    description: 'Cho phép tổ chức và sắp xếp các thiết bị camera thành các nhóm logic để dễ dàng theo dõi và quản lý',
  ),
  login(name: 'login', path: '/login'),
  monitoring(name: 'monitoring', path: '/monitoring', title: 'Liveview', description: 'Hiển thị các màn hình theo dõi theo thời gian thực'),
  livecamera(name: 'livecamera', path: 'livecamera'),
  playback(name: 'playback', path: '/playback'),
  users(name: 'users', path: '/users'),
  setting(name: 'setting', path: '/setting'),
  about(name: 'about', path: '/about');

  final String name;
  final String path;
  final String title;
  final String description;
  const Routes({required this.name, required this.path, this.title = '', this.description = ''});

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

  static final GoRouter router = GoRouter(
    initialLocation: AppConfig.INITIAL_ROUTE.path,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(loginUseCase: context.read<LoginUseCase>()),
          child: const LoginScreen(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeBloc()),
            BlocProvider(create: (context) => MonitorBloc(context.read())..add(GetAllCamera())),
            BlocProvider(
              create: (context) => CustomViewBloc(context.read())..add(GetListCustomViews()),
              lazy: false,
            ),
            BlocProvider(
              create: (context) =>
                  GroupCameraBloc(groupCameraRepository: context.read(), searchGroupUseCase: context.read<SearchGroupUseCase>())
                    ..add(GetAllGroupCameraEvent()),
              lazy: false,
            ),
            BlocProvider(
              create: (context) => ControlCameraBloc(
                controlGroupRepository: context.read(),
                filterCameraUseCase: context.read<FilterCameraUseCase>(),
              ),
            ),

            BlocProvider(
              create: (context) => UserManagementBloc(userManagermentRepository: context.read()),
            ),
          ],
          child: HomeScreen(body: child),
        ),
        routes: [
          GoRoute(
            path: Routes.monitoring.path,
            name: Routes.monitoring.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: MonitorScreen());
            },
            routes: [
              GoRoute(
                path: Routes.livecamera.path,
                name: Routes.livecamera.name,
                pageBuilder: (context, state) {
                  return fadeTransition(
                    context: context,
                    state: state,
                    child: CameraLiveScreen(args: state.extra as CameraLiveScreenArgs),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.test11.path,
            name: Routes.test11.name,
            builder: (context, state) => Center(child: Text('Test 11')),
          ),
          GoRoute(
            path: Routes.test12.path,
            name: Routes.test12.name,
            builder: (context, state) => Center(child: Text('Test 12')),
          ),
          GoRoute(
            path: Routes.test2.path,
            name: Routes.test2.name,
            builder: (context, state) => Center(child: Text('Test 2')),
          ),
          GoRoute(
            path: Routes.about.path,
            name: Routes.about.name,
            builder: (context, state) => Center(child: Text('About')),
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
              return fadeTransition(context: context, state: state, child: ControlCameraScreen());
            },
          ),
          GoRoute(
            path: Routes.users.path,
            name: Routes.users.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: UserManagementScreen());
            },
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage fadeTransition<T>({required BuildContext context, required GoRouterState state, required Widget child}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
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
        position: animation.drive(Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease))),
        child: child,
      );
    },
  );
}
