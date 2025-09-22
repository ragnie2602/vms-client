import 'dart:async';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:web_socket_client/web_socket_client.dart';
import '../models/packet.dart';
import '../proto/models/comm.model.pb.dart';
import 'base_api_client.dart';
import 'dart:typed_data';

class SocketApiClient extends BaseApiClient {
  late WebSocket _socket;
  late String serverUrl;

  late StreamController<Map<String, dynamic>> _messageController;
  late StreamController<ConnectionState> _stateController;
  Stream<ConnectionState> get state => _stateController.stream.distinct();

  final Map<int, Completer> _requestCompleters = {};

  @override
  Future<bool> connect(SocketConnectionParams params) async {
    try {
      _socket.close(); // Close if already initialized
    } catch (_) {}

    // Initialize
    serverUrl = "ws://${params.host}:${params.port}";
    _messageController = StreamController.broadcast();
    _stateController = StreamController.broadcast();

    try {
      _socket = WebSocket(
        Uri.parse(serverUrl),
        binaryType: 'arraybuffer',
        timeout: Duration(seconds: params.timeout),
        backoff: ConstantBackoff(Duration(seconds: 2)),
      );

      _socket.messages.listen(_handleMessages);
      _socket.connection.listen((state) {
        Logger.log("Connection status: ${state.runtimeType}", tag: 'SOCKET');
        _stateController.add(state);
      });

      // Wait until a connection has been established.
      await _socket.connection
          .firstWhere((state) => state is Connected)
          .timeout(
            Duration(seconds: params.timeout),
            onTimeout: () => throw TimeoutException('Connection timeout'),
          );

      return true;
    } catch (e) {
      Logger.error(e, tag: 'SOCKET');
      return false;
    }
  }

  @override
  Future<void> disconnect() async {
    await _messageController.close();
    await _stateController.close();
    _socket.close();
  }

  @override
  Future<T?> send<T>(SocketRequestPayload data) async {
    if (!isConnected) return null;

    final completer = Completer<T?>();
    _requestCompleters[data.packet.id] = completer;

    _socket.send(data.packet.writeToBuffer());

    return completer.future.timeout(
      Duration(seconds: data.timeout),
      onTimeout: () {
        _disposeCompleter(data.packet.id);
        return null;
      },
    );
  }

  void _handleMessages(dynamic message) {
    // Parse packet từ buffer
    final packet = Packet.fromBuffer(Uint8List.fromList(message));

    if (packet.type.isResponseFromApi) {
      // Response từ server sau khi client gửi request
      final reply = Reply.fromBuffer(packet.data);

      if (reply.isSuccess) {
        Logger.log("Request '${reply.reply.typeUrl}' success!", tag: 'SOCKET');
      } else {
        final msg = ResultType.valueOf(reply.type).translate();
        Logger.error("Request '${reply.reply.typeUrl}' failed: $msg", tag: 'SOCKET');
      }

      _disposeCompleter(packet.id, value: reply.reply.value);
    } else {
      // Message gửi từ server xuống
      final receive = Receive.fromBuffer(packet.data);
      Logger.log("Event: ${receive.receive.typeUrl}", tag: 'SOCKET');
    }
  }

  void _disposeCompleter(int id, {dynamic value}) {
    _requestCompleters[id]?.complete(value);
    _requestCompleters.remove(id);
  }

  @override
  Stream<Map<String, dynamic>> listen() {
    return _messageController.stream;
  }

  @override
  bool get isConnected => _socket.connection.state is Connected;
}

class SocketConnectionParams extends BaseConnectionParams {
  final String host;
  final int port;
  final int timeout;

  SocketConnectionParams(
    this.host,
    this.port, {
    this.timeout = AppConfig.SOCKET_CONNECTION_TIMEOUT,
  });
}

class SocketRequestPayload extends BaseRequestPayload {
  final Packet packet;
  final int timeout;

  SocketRequestPayload(this.packet, {this.timeout = 30});
}
