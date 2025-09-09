import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/socket_api_client.dart';
import '../data/datasources/base_api_client.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/IRepositories/i_auth_repository.dart';
import '../domain/usecases/login/login_usecase.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    // Data Sources
    Provider<BaseApiClient>(
      create: (_) => SocketApiClient(serverUrl: 'http://localhost:3000'),
    ),
    
    // Repositories
    Provider<IAuthRepository>(
      create: (context) => AuthRepository(
        apiClient: context.read<BaseApiClient>(),
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