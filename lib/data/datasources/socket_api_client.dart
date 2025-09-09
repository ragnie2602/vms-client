import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'base_api_client.dart';

class SocketApiClient extends BaseApiClient {
  late IO.Socket _socket;
  final StreamController<Map<String, dynamic>> _messageController = StreamController.broadcast();
  
  final String serverUrl;
  
  SocketApiClient({required this.serverUrl});
  
  @override
  Future<void> connect() async {
    _socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    
    _socket.on('connect', (_) {
      print('Connected to server');
    });
    
    _socket.on('message', (data) {
      if (data is Map<String, dynamic>) {
        _messageController.add(data);
      }
    });
    
    _socket.on('disconnect', (_) {
      print('Disconnected from server');
    });
    
    _socket.connect();
  }
  
  @override
  Future<void> disconnect() async {
    _socket.disconnect();
    await _messageController.close();
  }
  
  @override 
  void send(Map<String, dynamic> data) {
    if (isConnected) {
      _socket.emit('message', data);
    }
  }
  
  @override
  Stream<Map<String, dynamic>> listen() {
    return _messageController.stream;
  }
  
  @override
  bool get isConnected => _socket.connected;
}