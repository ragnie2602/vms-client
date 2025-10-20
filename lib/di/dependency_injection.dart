import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vms_flutter_client/data/datasources/custom_live_view_service.dart';
import 'package:vms_flutter_client/data/datasources/sources.dart';
import 'package:vms_flutter_client/data/datasources/user_service.dart';
import 'package:vms_flutter_client/data/repositories/control_group_repository.dart';
import 'package:vms_flutter_client/data/repositories/custom_live_view_repository.dart';
import 'package:vms_flutter_client/data/repositories/sources.dart';
import 'package:vms_flutter_client/data/repositories/user_management_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/group/search_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/sources.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    // Base
    Provider<SocketApiClient>(create: (_) => SocketApiClient()),
    Provider<ProtobufHttpClient>(create: (_) => ProtobufHttpClient()),

    // Data Sources
    Provider<AuthenticateService>(
      create: (context) => AuthenticateService(
        httpClient: context.read<ProtobufHttpClient>(),
        socketApiClient: context.read<SocketApiClient>(),
      ),
    ),
    Provider<CameraService>(create: (context) => CameraService(context.read())),
    Provider<GroupService>(create: (context) => GroupService(context.read())),
    Provider<UserService>(create: (context) => UserService(context.read())),
    Provider<CustomLiveViewService>(create: (context) => CustomLiveViewService(context.read())),
    Provider<PlaybackService>(create: (context) => PlaybackService(context.read())),

    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(authenticateService: context.read<AuthenticateService>()),
    ),
    Provider<ICameraRepository>(create: (context) => CameraRepository(context.read())),
    Provider<FilterCameraUseCase>(create: (context) => FilterCameraUseCase()),
    Provider<FilterCameraNoGroupUseCase>(create: (context) => FilterCameraNoGroupUseCase()),
    Provider<SearchGroupUseCase>(create: (context) => SearchGroupUseCase()),
    Provider<IControlCameraRepository>(
      create: (context) => ControlCameraRepository(context.read()),
    ),
    Provider<IGroupRepository>(create: (context) => GroupRepository(context.read())),
    Provider<IPlaybackRepository>(create: (context) => PlaybackRepository(context.read())),
    Provider<IUserManagementRepository>(
      create: (context) => UserManagementRepository(context.read()),
    ),
    Provider<ICustomLiveViewRepository>(
      create: (context) => CustomLiveViewRepository(context.read()),
    ),

    // Use Cases
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(authRepository: context.read<IAuthRepository>()),
    ),
    Provider<DeleteCameraUseCase>(
      create: (context) => DeleteCameraUseCase(cameraService: context.read<CameraService>()),
    ),
    Provider<CreateCustomLiveViewUseCase>(
      create: (context) => CreateCustomLiveViewUseCase(context.read<ICustomLiveViewRepository>()),
    ),
    Provider<CreateTempCustomLiveViewUseCase>(
      create: (context) => CreateTempCustomLiveViewUseCase(),
    ),
    Provider<GetListCustomLiveViewUseCase>(
      create: (context) => GetListCustomLiveViewUseCase(context.read(), context.read()),
    ),
    Provider<UpdateCustomLiveViewUseCase>(
      create: (context) => UpdateCustomLiveViewUseCase(context.read<ICustomLiveViewRepository>()),
    ),
  ];
}
