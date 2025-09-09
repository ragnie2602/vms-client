import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/socket_api_client.dart';
import '../data/datasources/base_api_client.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    Provider<BaseApiClient>(
      create: (_) => SocketApiClient(serverUrl: 'http://localhost:3000'),
    ),
  ];
}