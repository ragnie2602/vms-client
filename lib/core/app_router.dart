import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/home_bloc.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../domain/usecases/login/login_usecase.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(
            loginUseCase: context.read<LoginUseCase>(),
          ),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
        ),
      ),
    ],
  );
}
