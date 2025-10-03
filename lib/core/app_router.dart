import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/screens/camera_live/camera_live_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/list_camera_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_screen.dart';

import '../domain/usecases/login/login_usecase.dart';
import '../screens/home/home_bloc.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../screens/login/login_screen.dart';

enum Routes {
  test11(name: 'test11', path: '/test11'),
  test12(name: 'test12', path: '/test12'),
  test2(name: 'test2', path: '/test2'),

  login(name: 'login', path: '/login'),
  monitoring(name: 'monitoring', path: '/monitoring'),
  livecamera(name: 'livecamera', path: 'livecamera'),
  about(name: 'about', path: '/about');

  final String name;
  final String path;
  const Routes({required this.name, required this.path});
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConfig.INITIAL_ROUTE.path,
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
            BlocProvider(create: (context) => ListCameraBloc(context.read())..add(GetAllCamera())),
          ],
          child: HomeScreen(body: child),
        ),
        routes: [
          GoRoute(
            path: Routes.monitoring.path,
            name: Routes.monitoring.name,
            builder: (context, state) => MonitorScreen(),
            routes: [
              GoRoute(
                path: Routes.livecamera.path,
                name: Routes.livecamera.name,
                builder: (context, state) =>
                    CameraLiveScreen(args: state.extra as CameraLiveScreenArgs),
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
        ],
      ),
    ],
  );
}
