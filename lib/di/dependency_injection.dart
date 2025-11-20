import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/data/datasources/emap_service.dart';
import 'package:vms_flutter_client/data/datasources/sources.dart';
import 'package:vms_flutter_client/data/datasources/upload_api_client.dart';
import 'package:vms_flutter_client/data/repositories/schedule_repository.dart';
import 'package:vms_flutter_client/data/repositories/sources.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_schedule_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/filter_camera_not_in_group/filter_camera_not_in_group_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/my_profile/update_my_profile_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/sources.dart';
import 'package:vms_flutter_client/domain/usecases/user/search_user_use_case.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    // Base
    Provider<SocketApiClient>(create: (_) => SocketApiClient()),
    Provider<UploadApiClient>(create: (_) => UploadApiClient()),
    Provider<ProtobufHttpClient>(create: (_) => ProtobufHttpClient()),
    Provider<UploadApiClient>(create: (_) => UploadApiClient()),

    // Data Sources
    Provider<AuthenticateService>(
      create: (context) => AuthenticateService(
        httpClient: context.read<ProtobufHttpClient>(),
        socketApiClient: context.read<SocketApiClient>(),
      ),
    ),
    Provider<CameraService>(create: (context) => CameraService(context.read())),
    Provider<ControlCameraService>(create: (context) => ControlCameraService(context.read())),
    Provider<GroupService>(create: (context) => GroupService(context.read())),
    Provider<EmapService>(create: (context) => EmapService(context.read(), context.read())),
    Provider<UserService>(create: (context) => UserService(context.read())),
    Provider<CustomLiveViewService>(create: (context) => CustomLiveViewService(context.read())),
    Provider<PlaybackService>(create: (context) => PlaybackService(context.read())),
    Provider<EmapService>(create: (context) => EmapService(context.read(), context.read())),

    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(authenticateService: context.read<AuthenticateService>()),
    ),
    Provider<ICameraRepository>(create: (context) => CameraRepository(context.read())),
    Provider<SearchGroupUseCase>(create: (context) => SearchGroupUseCase()),
    Provider<IControlCameraRepository>(
      create: (context) => ControlCameraRepository(context.read(), context.read()),
    ),
    Provider<IGroupRepository>(create: (context) => GroupRepository(context.read())),
    Provider<IEmapRepository>(create: (context) => EmapRepository(context.read())),
    Provider<IScheduleRepository>(
      create: (context) => ScheduleRepository(cameraService: context.read()),
    ),
    Provider<IPlaybackRepository>(create: (context) => PlaybackRepository(context.read())),
    Provider<IUserManagementRepository>(
      create: (context) => UserManagementRepository(context.read()),
    ),
    Provider<ICustomLiveViewRepository>(
      create: (context) => CustomLiveViewRepository(context.read()),
    ),
    Provider<IEmapRepository>(create: (context) => EmapRepository(context.read())),

    // Use Cases
    Provider<CreateNewWindowUseCase>(create: (context) => CreateNewWindowUseCase()),
    Provider<SendMultiWindowEventUseCase>(create: (context) => SendMultiWindowEventUseCase()),
    Provider<SubscribeMultiWindowEventUseCase>(
      create: (context) => SubscribeMultiWindowEventUseCase(context.read<IAuthRepository>()),
    ),

    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(authRepository: context.read<IAuthRepository>()),
    ),

    Provider<DeleteCameraUseCase>(
      create: (context) => DeleteCameraUseCase(cameraService: context.read<CameraService>()),
    ),

    Provider<CreateCustomLiveViewUseCase>(
      create: (context) => CreateCustomLiveViewUseCase(context.read(), context.read()),
    ),
    Provider<CreateTempCustomLiveViewUseCase>(
      create: (context) => CreateTempCustomLiveViewUseCase(),
    ),
    Provider<GetListCustomLiveViewUseCase>(
      create: (context) => GetListCustomLiveViewUseCase(context.read(), context.read()),
    ),
    Provider<UpdateCustomLiveViewUseCase>(
      create: (context) => UpdateCustomLiveViewUseCase(context.read(), context.read()),
    ),

    Provider<FilterCameraUseCase>(create: (context) => FilterCameraUseCase()),
    Provider<FilterCameraNoGroupUseCase>(create: (context) => FilterCameraNoGroupUseCase()),
    Provider<FilterCameraNotInGroupUsecase>(
      create: (context) =>
          FilterCameraNotInGroupUsecase(cameraRepository: context.read<ICameraRepository>()),
    ),
    Provider<SearchUserUseCase>(create: (context) => SearchUserUseCase()),
    Provider<UpdateMyProfileUseCase>(
      create: (context) => UpdateMyProfileUseCase(
        userManagementRepository: context.read<IUserManagementRepository>(),
      ),
    ),
    Provider<SearchEmapUseCase>(create: (context) => SearchEmapUseCase()),

    // Bloc
    Provider<AppBloc>(create: (context) => AppBloc(context.read(), context.read(), context.read())),
  ];
}
