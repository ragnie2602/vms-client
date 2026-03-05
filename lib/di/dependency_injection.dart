import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/data/datasources/ai_box_service.dart';
import 'package:vms_flutter_client/data/datasources/ai_config_service.dart';
import 'package:vms_flutter_client/data/datasources/detect_service.dart';
import 'package:vms_flutter_client/data/datasources/emap_service.dart';
import 'package:vms_flutter_client/data/datasources/event_service.dart';
import 'package:vms_flutter_client/data/datasources/notification_service.dart';
import 'package:vms_flutter_client/data/datasources/schedule_record_service.dart';
import 'package:vms_flutter_client/data/datasources/sources.dart';
import 'package:vms_flutter_client/data/datasources/upload_api_client.dart';
import 'package:vms_flutter_client/data/repositories/ai_config_repository.dart';
import 'package:vms_flutter_client/data/repositories/event_repository.dart';
import 'package:vms_flutter_client/data/repositories/notification_repository.dart';
import 'package:vms_flutter_client/data/repositories/schedule_repository.dart';
import 'package:vms_flutter_client/data/repositories/sources.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_config_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/data/repositories/ai_box_repository.dart';
import 'package:vms_flutter_client/data/repositories/detect_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_box_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_notication_repostory.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_schedule_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/export_file_user_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/ai_box/filter_ai_box_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/event/export_event_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/fetch_config_table_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/save_image_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/save_video_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/monitor/get_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/my_profile/update_my_profile_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/register/register_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/sources.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_use_case.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/osd/osd_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/filter_drawer.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    // Base
    Provider<SocketApiClient>(create: (_) => SocketApiClient()),
    Provider<UploadApiClient>(create: (_) => UploadApiClient()),
    Provider<HttpClient>(create: (_) => HttpClient()),
    Provider<UploadApiClient>(create: (_) => UploadApiClient()),

    // Data Sources
    Provider<AuthenticateService>(
      create: (context) => AuthenticateService(
        httpClient: context.read<HttpClient>(),
        socketApiClient: context.read<SocketApiClient>(),
      ),
    ),
    Provider<CameraService>(create: (context) => CameraService(context.read())),
    Provider<AiConfigService>(
      create: (context) => AiConfigService(context.read()),
    ),
    Provider<ControlCameraService>(
      create: (context) => ControlCameraService(context.read()),
    ),
    Provider<GroupService>(create: (context) => GroupService(context.read())),
    Provider<ScheduleRecordService>(
      create: (context) => ScheduleRecordService(context.read()),
    ),
    Provider<EmapService>(
      create: (context) =>
          EmapService(context.read(), context.read(), context.read()),
    ),
    Provider<UserService>(
      create: (context) => UserService(context.read(), context.read()),
    ),
    Provider<AiBoxService>(create: (context) => AiBoxService(context.read())),
    Provider<CustomLiveViewService>(
      create: (context) => CustomLiveViewService(context.read()),
    ),
    Provider<PlaybackService>(
      create: (context) => PlaybackService(context.read()),
    ),
    Provider<EventService>(create: (context) => EventService(context.read())),
    Provider<UserService>(
      create: (context) => UserService(context.read(), context.read()),
    ),
    Provider<CustomLiveViewService>(
      create: (context) => CustomLiveViewService(context.read()),
    ),
    Provider<PlaybackService>(
      create: (context) => PlaybackService(context.read()),
    ),
    Provider<DetectService>(
      create: (context) => DetectService(context.read(), context.read()),
    ),
    Provider<NotificationService>(
      create: (context) => NotificationService(context.read(), context.read()),
    ),
    Provider<CustomLiveViewService>(
      create: (context) => CustomLiveViewService(context.read()),
    ),
    Provider<PlaybackService>(
      create: (context) => PlaybackService(context.read()),
    ),

    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(
        authenticateService: context.read<AuthenticateService>(),
      ),
    ),
    Provider<ICameraRepository>(
      create: (context) => CameraRepository(context.read()),
    ),
    Provider<IAiConfigRepository>(
      create: (context) => AiConfigRepository(context.read()),
    ),
    Provider<SearchGroupUseCase>(create: (context) => SearchGroupUseCase()),
    Provider<IControlCameraRepository>(
      create: (context) =>
          ControlCameraRepository(context.read(), context.read()),
    ),
    Provider<IGroupRepository>(
      create: (context) => GroupRepository(context.read()),
    ),
    Provider<IEmapRepository>(
      create: (context) => EmapRepository(context.read()),
    ),
    Provider<IAiBoxRepository>(
      create: (context) => AiBoxRepository(service: context.read()),
    ),
    Provider<IDetectRepository>(
      create: (context) => DetectRepository(context.read()),
    ),
    Provider<IScheduleRepository>(
      create: (context) => ScheduleRepository(context.read()),
    ),
    Provider<IPlaybackRepository>(
      create: (context) => PlaybackRepository(context.read()),
    ),
    Provider<IGroupRepository>(
      create: (context) => GroupRepository(context.read()),
    ),
    Provider<IEmapRepository>(
      create: (context) => EmapRepository(context.read()),
    ),
    Provider<IEventRepository>(
      create: (context) => EventRepository(context.read()),
    ),
    Provider<IScheduleRepository>(
      create: (context) => ScheduleRepository(context.read()),
    ),
    Provider<IPlaybackRepository>(
      create: (context) => PlaybackRepository(context.read()),
    ),
    Provider<IUserManagementRepository>(
      create: (context) => UserManagementRepository(context.read()),
    ),
    Provider<ICustomLiveViewRepository>(
      create: (context) => CustomLiveViewRepository(context.read()),
    ),
    Provider<INotificationRepository>(
      create: (context) =>
          NotificationRepository(notificationService: context.read()),
    ),

    // Use Cases
    Provider<CreateNewWindowUseCase>(
      create: (context) => CreateNewWindowUseCase(),
    ),
    Provider<SendMultiWindowEventUseCase>(
      create: (context) => SendMultiWindowEventUseCase(),
    ),
    Provider<SubscribeMultiWindowEventUseCase>(
      create: (context) =>
          SubscribeMultiWindowEventUseCase(context.read<IAuthRepository>()),
    ),

    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(
        authRepository: context.read<IAuthRepository>(),
        detectRepository: context.read<IDetectRepository>(),
      ),
    ),

    Provider<RegisterUseCase>(
      create: (context) =>
          RegisterUseCase(authRepository: context.read<IAuthRepository>()),
    ),

    Provider<DeleteCameraUseCase>(
      create: (context) =>
          DeleteCameraUseCase(cameraService: context.read<CameraService>()),
    ),

    Provider<CreateCustomLiveViewUseCase>(
      create: (context) =>
          CreateCustomLiveViewUseCase(context.read(), context.read()),
    ),
    Provider<CreateTempCustomLiveViewUseCase>(
      create: (context) => CreateTempCustomLiveViewUseCase(),
    ),
    Provider<GetListCustomLiveViewUseCase>(
      create: (context) =>
          GetListCustomLiveViewUseCase(context.read(), context.read()),
    ),
    Provider<UpdateCustomLiveViewUseCase>(
      create: (context) =>
          UpdateCustomLiveViewUseCase(context.read(), context.read()),
    ),

    Provider<FilterCameraUseCase>(create: (context) => FilterCameraUseCase()),
    Provider<ExportFileUserCase>(create: (context) => ExportFileUserCase()),
    Provider<FilterTagCameraUseCase>(
      create: (context) => FilterTagCameraUseCase(),
    ),
    Provider<FilterCameraNoGroupUseCase>(
      create: (context) => FilterCameraNoGroupUseCase(),
    ),
    Provider<FilterCameraNotInGroupUsecase>(
      create: (context) => FilterCameraNotInGroupUsecase(
        cameraRepository: context.read<ICameraRepository>(),
      ),
    ),
    Provider<SearchUserUseCase>(create: (context) => SearchUserUseCase()),
    Provider<UpdateMyProfileUseCase>(
      create: (context) => UpdateMyProfileUseCase(
        userManagementRepository: context.read<IUserManagementRepository>(),
      ),
    ),
    Provider<SearchEmapUseCase>(create: (context) => SearchEmapUseCase()),
    Provider<FilterAiBoxUseCase>(create: (context) => FilterAiBoxUseCase()),

    Provider<GetCameraUseCase>(
      create: (context) => GetCameraUseCase(context.read()),
    ),

    Provider<ExportEventUseCase>(
      create: (context) => ExportEventUseCase(context.read<IEventRepository>()),
    ),
    Provider<SaveImageUseCase>(create: (context) => SaveImageUseCase()),
    Provider<SaveVideoUseCase>(create: (context) => SaveVideoUseCase()),
    Provider<SearchEventUseCase>(
      create: (context) => SearchEventUseCase(context.read<IEventRepository>()),
    ),
    Provider<FetchConfigTableUsecase>(
      create: (context) => FetchConfigTableUsecase(context.read()),
    ),

    // Bloc
    Provider<OsdBloc>(
      create: (context) => OsdBloc(context.read(), context.read()),
    ),
    Provider<AppBloc>(
      create: (context) => AppBloc(
        context.read(),
        context.read(),
        context.read(),
        context.read(),
      ),
    ),

    // Controller
    Provider<FilterDrawerController>(
      create: (context) => FilterDrawerController(),
    ),
  ];
}
