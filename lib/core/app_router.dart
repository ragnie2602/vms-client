import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/list_camera_bloc.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/home_bloc.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../domain/usecases/login/login_usecase.dart';

enum Route {
  login(name: 'login', path: '/login'),
  home(name: 'home', path: '/home');

  final String name;
  final String path;
  const Route({required this.name, required this.path});
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConfig.INITIAL_ROUTE.path,
    routes: [
      GoRoute(
        path: Route.login.path,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(loginUseCase: context.read<LoginUseCase>()),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Route.home.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeBloc()),
            BlocProvider(create: (context) => ListCameraBloc(context.read())..add(GetAllCamera())),
          ],
          child: const HomeScreen(),
        ),
      ),
    ],
  );
}
