import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vms_flutter_client/data/datasources/sources.dart';
import 'package:vms_flutter_client/data/repositories/sources.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
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

    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(
        authenticateService: context.read<AuthenticateService>(),
      ),
    ),
    Provider<ICameraRepository>(
      create: (context) => CameraRepository(context.read()),
    ),
    Provider<FilterCameraUseCase>(create: (context) => FilterCameraUseCase()),
    Provider<IControlCameraRepository>(
      create: (context) => ControlCameraRepository(context.read()),
    ),
    Provider<IGroupRepository>(
      create: (context) => GroupRepository(context.read()),
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

    // Use Cases
    Provider<LoginUseCase>(
      create: (context) =>
          LoginUseCase(authRepository: context.read<IAuthRepository>()),
    ),
  ];
}
