import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/socket_api_client.dart';
import '../data/datasources/base_api_client.dart';
import '../data/datasources/protobuf_http_client.dart';
import '../data/datasources/authenticate_service.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/IRepositories/i_auth_repository.dart';
import '../domain/usecases/login/login_usecase.dart';
import '../core/env_service.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    // Data Sources
    Provider<BaseApiClient>(
      create: (_) => SocketApiClient(serverUrl: EnvService.socketBaseUrl),
    ),
    
    Provider<ProtobufHttpClient>(
      create: (_) => ProtobufHttpClient(),
    ),
    
    Provider<AuthenticateService>(
      create: (context) => AuthenticateService(
        httpClient: context.read<ProtobufHttpClient>(),
      ),
    ),
    
    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(
        authenticateService: context.read<AuthenticateService>(),
      ),
    ),
    
    // Use Cases
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(
        authRepository: context.read<IAuthRepository>(),
      ),
    ),
  ];
}