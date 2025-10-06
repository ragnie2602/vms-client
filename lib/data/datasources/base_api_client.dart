import 'package:vms_flutter_client/core/base_response.dart';

abstract class BaseConnectionParams {}
abstract class BaseRequestPayload {}

abstract class BaseApiClient {
  const BaseApiClient();

  Future<bool> connect(covariant BaseConnectionParams data);
  Future<void> disconnect();
  Future<Either<Failure, T>> send<T>(covariant BaseRequestPayload data);

  Stream<Map<String, dynamic>> listen();
  bool get isConnected;
}
