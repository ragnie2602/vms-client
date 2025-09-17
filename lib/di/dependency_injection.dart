import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vms_flutter_client/data/datasources/camera_service.dart';
import 'package:vms_flutter_client/data/repositories/camera_repository.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_camera_repository.dart';
import '../data/datasources/socket_api_client.dart';
import '../data/datasources/protobuf_http_client.dart';
import '../data/datasources/authenticate_service.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/IRepositories/i_auth_repository.dart';
import '../domain/usecases/login/login_usecase.dart';

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

    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(authenticateService: context.read<AuthenticateService>()),
    ),
    Provider<ICameraRepository>(
      create: (context) => CameraRepository(context.read()),
    ),

    // Use Cases
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(authRepository: context.read<IAuthRepository>()),
    ),
  ];
}
