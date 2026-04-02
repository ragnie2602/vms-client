import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/domain/usecases/ai_box/filter_ai_box_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/export_file_user_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/delete_camera/delete_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_use_case.dart';
import 'package:vms_flutter_client/screens/account/mobile_account_screen.dart';
import 'package:vms_flutter_client/screens/account/mobile_info_screen.dart';
import 'package:vms_flutter_client/screens/ai_box/ai_box_screen.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_bloc.dart';
import 'package:vms_flutter_client/screens/camera_configuration/bloc/alarm_sound/alarm_sound_bloc.dart';
import 'package:vms_flutter_client/screens/camera_configuration/bloc/schedule/schedule_bloc.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/camera_detail/mobile_camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/control_camera_screen.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/event_screen.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/home/bloc/change_my_info_bloc.dart';
import 'package:vms_flutter_client/screens/home/bloc/header_notification_bloc.dart';
import 'package:vms_flutter_client/screens/login/mobile_login_screen.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/emap_screen.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/custom_monitor_pane.dart';
import 'package:vms_flutter_client/screens/monitor/default_monitor_pane.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_screen.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/object_group_screen.dart';
import 'package:vms_flutter_client/screens/object_type/bloc/object_type_bloc.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_screen.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback_screen.dart';
import 'package:vms_flutter_client/screens/playback/playback_screen.dart';
import 'package:vms_flutter_client/screens/roles/roles_screen.dart';
import 'package:vms_flutter_client/screens/shared/platform_builder.dart';
import 'package:vms_flutter_client/screens/splash_screen.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/notification/notification_setting_bloc.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';
import 'package:vms_flutter_client/screens/system_configuration/system_configuration_screen.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/user_management_screen.dart';

import '../domain/usecases/login/login_usecase.dart';
import '../domain/usecases/register/register_usecase.dart';
import '../screens/about/about_screen.dart';
import '../screens/home/bloc/home_bloc.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/bloc/register_bloc.dart';
import '../screens/register/mobile_register_screen.dart';

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
  register(name: 'register', path: '/register'),
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
  multi_playback(name: 'multi_playback', path: '/multi_playback', title: 'Xem lại nhiều camera'),
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
    description: 'Cho phép người dùng tạo và quản lý sơ đồ vị trí của các camera',
  ),
  roles(
    name: 'roles',
    path: '/roles',
    title: 'Quản lý vai trò',
    description: 'Cho phép quản trị viên tạo và quản lý vai trò',
  ),
  aiBox(name: 'aiBox', path: '/aiBox', title: 'Quản lý AI Box', description: ''),
  users(name: 'users', path: '/users', title: 'Quản lý tài khoản', description: ''),
  events(
    name: 'events',
    path: '/events',
    title: 'Quản lý sự kiện',
    description: 'Cho phép quản trị viên tạo và quản lý sự kiện',
  ),
  objectTypes(
    name: 'objectTypes',
    path: '/objectTypes',
    title: 'Quản lý loại đối tượng',
    description: 'Quản lý và cấu hình trường dữ liệu cho các đối tượng người dùng trên hệ thống',
  ),
  objectGroups(
    name: 'objectGroups',
    path: '/objectGroups',
    title: 'Quản lý đối tượng',
    description: 'Quản lý và cấu hình trường dữ liệu cho các đối tượng người dùng trên hệ thống',
  ),
  configuration(
    name: 'system_configuration',
    path: '/system_configuration',
    title: 'Cấu hình hệ thống',
    description: 'Cho phép quản trị viên cấu hình hệ thống quản lý camera',
  ),
  about(name: 'about', path: '/about'),
  account(name: 'account', path: '/account'),
  info(name: 'info', path: '/info');

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
          create: (context) => LoginBloc(loginUseCase: context.read<LoginUseCase>()),
          child: PlatformBuilder.builder(
            onDesktop: (_) => LoginScreen(),
            onMobile: (_) => MobileLoginScreen(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterBloc(registerUseCase: context.read<RegisterUseCase>()),
          child: MobileRegisterScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeBloc()),
            BlocProvider(create: (context) => HeaderNotificationBloc(context.read())),
            BlocProvider(
              create: (context) =>
                  StorageFolderBloc(context.read(), context.read())..add(StorageFolderStarted()),
              lazy: false,
            ),
            BlocProvider(
              create: (context) =>
                  MonitorBloc(context.read(), context.read(), context.read(), context.read())..add(
                    ReopenMonitor(
                      context.read<AppBloc>().reopenViewId,
                      context.read<AppBloc>().reopenViewMode,
                    ),
                  ),
            ),
            BlocProvider(
              create: (context) => CustomViewBloc(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              )..add(ReopenCustomView(context.read<AppBloc>().reopenViewId)),
              lazy: false,
            ),
            BlocProvider(
              create: (context) => GroupCameraBloc(
                groupCameraRepository: context.read(),
                searchGroupUseCase: context.read<SearchGroupUseCase>(),
                filterCameraNotInGroupUsecase: context.read<FilterCameraNotInGroupUsecase>(),
              )..add(GetAllGroupCameraEvent()),
              lazy: false,
            ),
            BlocProvider(
              create: (context) => ControlCameraBloc(
                exportFileUserCase: context.read<ExportFileUserCase>(),
                filterTagCameraUseCase: context.read<FilterTagCameraUseCase>(),
                controlGroupRepository: context.read(),
                filterCameraUseCase: context.read<FilterCameraUseCase>(),
                filterCameraNoGroupUseCase: context.read<FilterCameraNoGroupUseCase>(),
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
              create: (context) => EventBloc(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  DetectBloc(context.read(), context.read(), context.read(), context.read()),
            ),
            BlocProvider(create: (context) => ObjectTypeBloc(context.read())),
            BlocProvider(
              create: (context) => ObjectGroupBloc(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            BlocProvider(
              create: (context) => AiBoxBloc(
                aiBoxRepository: context.read(),
                filterAiBoxUseCase: context.read<FilterAiBoxUseCase>(),
              ),
            ),
            BlocProvider(
              create: (context) => ScheduleBloc(
                cameraRepository: context.read(),
                scheduleRepository: context.read(),
              ),
            ),
            BlocProvider(
              create: (context) => UserManagementBloc(
                userManagermentRepository: context.read(),
                searchUserUseCase: context.read<SearchUserUseCase>(),
              ),
            ),
            BlocProvider(create: (context) => ChangeMyInfoBloc(context.read(), context.read())),
            BlocProvider(create: (context) => NotificationBloc(context.read())),
            BlocProvider.value(
              value: context.read<AlarmSoundBloc>()
                ..add(GetAlarmSounds(force: state.extra == 'isFreshLogin')),
            ),
          ],
          child: HomeScreen(body: child, currentPath: state.uri.path),
        ),
        routes: [
          ShellRoute(
            builder: (context, state, child) => MonitorScreen(child: child),
            routes: [
              GoRoute(
                path: Routes.monitoring.path,
                name: Routes.monitoring.name,
                pageBuilder: (context, state) =>
                    fadeTransition(context: context, state: state, child: DefaultMonitorPane()),
              ),
              GoRoute(
                path: Routes.custom_live_view.path,
                name: Routes.custom_live_view.name,
                pageBuilder: (context, state) {
                  final args = state.extra as CustomMonitorPaneArgs?;

                  return fadeTransition(
                    context: context,
                    state: state,
                    child: CustomMonitorPane(mode: args?.mode ?? CustomMonitorPaneMode.view),
                  );
                },
              ),
            ],
          ),

          GoRoute(
            path: Routes.account.path,
            name: Routes.account.name,
            pageBuilder: (context, state) =>
                fadeTransition(context: context, state: state, child: MobileAccountScreen()),
          ),

          GoRoute(
            path: Routes.cameraDetail.path,
            name: Routes.cameraDetail.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: PlatformBuilder.builder(
                  onDesktop: (_) => CameraDetailScreen(args: state.extra as CameraDetailScreenArgs),
                  onMobile: (_) =>
                      MobileCameraDetailScreen(args: state.extra as CameraDetailScreenArgs),
                ),
              );
            },
          ),

          GoRoute(
            path: Routes.info.path,
            name: Routes.info.name,
            pageBuilder: (context, state) =>
                fadeTransition(context: context, state: state, child: MobileInfoScreen()),
          ),

          GoRoute(
            path: Routes.playback.path,
            name: Routes.playback.name,
            pageBuilder: (context, state) {
              final args = state.extra as CameraDetailScreenArgs;

              return fadeTransition(
                context: context,
                state: state,
                child: PlatformBuilder.builder(
                  onDesktop: (_) => PlaybackScreen(),
                  onMobile: (_) => MobileCameraDetailScreen(
                    args: CameraDetailScreenArgs(
                      data: args.data,
                      isPlayback: true,
                      title: args.title,
                      key: args.key,
                      onBack: args.onBack,
                      description: args.description,
                      openCamerasPanelImmediately: args.openCamerasPanelImmediately,
                    ),
                  ),
                ),
              );
            },
          ),

          GoRoute(
            path: Routes.about.path,
            name: Routes.about.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: AboutScreen());
            },
          ),

          GoRoute(
            path: Routes.events.path,
            name: Routes.events.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: EventScreen());
            },
          ),

          GoRoute(
            path: Routes.objectTypes.path,
            name: Routes.objectTypes.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: ObjectTypeScreen());
            },
          ),
          GoRoute(
            path: Routes.objectGroups.path,
            name: Routes.objectGroups.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: ObjectGroupScreen());
            },
          ),

          GoRoute(
            path: Routes.configuration.path,
            name: Routes.configuration.name,
            pageBuilder: (context, state) {
              return fadeTransition(
                context: context,
                state: state,
                child: SystemConfigurationScreen(),
              );
            },
          ),

          GoRoute(
            path: Routes.addGroupCamera.path,
            name: Routes.addGroupCamera.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: ControlCameraScreen());
            },
          ),

          GoRoute(
            path: Routes.emap.path,
            name: Routes.emap.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: EmapScreen());
            },
          ),

          GoRoute(
            path: Routes.roles.path,
            name: Routes.roles.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: RolesScreen());
            },
          ),

          GoRoute(
            path: Routes.multi_playback.path,
            name: Routes.multi_playback.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: MultiPlaybackScreen());
            },
          ),
          GoRoute(
            path: Routes.aiBox.path,
            name: Routes.aiBox.name,
            pageBuilder: (context, state) {
              return fadeTransition(context: context, state: state, child: AiBoxScreen());
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

CustomTransitionPage fadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 0),
    reverseTransitionDuration: const Duration(milliseconds: 0),
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
