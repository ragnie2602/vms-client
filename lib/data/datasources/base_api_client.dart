abstract class BaseApiClient {
  const BaseApiClient();
  
  Future<void> connect();
  Future<void> disconnect();
  void send(Map<String, dynamic> data);
  Stream<Map<String, dynamic>> listen();
  bool get isConnected;
}