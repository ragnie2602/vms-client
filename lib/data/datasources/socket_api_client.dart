import 'dart:async';
import 'dart:typed_data';

import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/lang/language.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/proto/models/comm.profile.pb.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../models/packet.dart';
import '../proto/models/comm.model.pb.dart';
import 'base_api_client.dart';

class SocketApiClient extends BaseApiClient {
  late WebSocket _socket;
  late String serverUrl;

  late StreamController<Map<String, dynamic>> _messageController;
  late StreamController<ConnectionState> _stateController;
  Stream<ConnectionState> get state => _stateController.stream.distinct();

  final Map<int, Completer> _requestCompleters = {};
  Timer? _keepAliveTimer;

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
      // WebSocket sử dụng tham số timeout:
      //   + Khi mở kết nối
      //   + Auto Reconnecting sau khi Disconnected (backoff tăng dần tới khi nào vượt qua timeout thì Disconnected hẳn, không tự Reconnecting nữa)
      // Nên
      // --> timeout truyền vào WebSocket --> CỰC TO --> không bị ngắt Auto Reconnecting
      // --> timeout khi mở kết nối --> tự xử lý ở bên dưới (thông qua _socket.connection.timeout)
      _socket = WebSocket(
        Uri.parse(serverUrl),
        binaryType: 'arraybuffer',
        timeout: Duration(days: 106751), // +2s dần tới (~292 năm) thì ngừng thử kết nối lại
        backoff: ConstantBackoff(Duration(seconds: 2)),
      );

      _socket.messages.listen(_handleMessages);
      _socket.connection.listen((state) {
        Logger.log("Connection status: ${state.runtimeType}", tag: 'SOCKET', writeLog: true);
        if (_stateController.isClosed) return;
        _stateController.add(state);
      });

      // Wait until a connection has been established.
      if (!await _waitForConnected(Duration(seconds: params.timeout))) {
        throw TimeoutException('Connection timeout');
      }

      _keepAliveTimer = Timer.periodic(const Duration(seconds: 30), _sendKeepAlive);

      return true;
    } catch (e) {
      _socket.close();
      Logger.error(e, tag: 'SOCKET');
      return false;
    }
  }

  @override
  Future<void> disconnect() async {
    _keepAliveTimer?.cancel();
    await _messageController.close();
    await _stateController.close();
    _socket.close();
  }

  @override
  Future<Either<Failure, T>> send<T>(SocketRequestPayload data) async {
    if (!isConnected &&
        !await _waitForConnected(Duration(seconds: AppConfig.SOCKET_CONNECTION_TIMEOUT))) {
      return Left(Failure.message(SOCKET_UNCONNECTED));
    }

    final completer = Completer<Either<Failure, T>>();
    _requestCompleters[data.packet.id] = completer;

    _socket.send(data.packet.writeToBuffer());

    return completer.future.timeout(
      Duration(seconds: data.timeout),
      onTimeout: () {
        _disposeCompleter(data.packet.id);
        return Left(Failure.message(TIMEOUT_DEFAULT));
      },
    );
  }

  void _sendKeepAlive(Timer _) {
    _socket.send(Packet(id: 100, data: KeepAlive_Request(idle: false).writeToBuffer(), type: PacketType.keepAlive).writeToBuffer());
  }

  void _handleMessages(dynamic message) {
    // Parse packet từ buffer
    final packet = Packet.fromBuffer(Uint8List.fromList(message));

    if (packet.type.isResponseFromApi) {
      // Response từ server sau khi client gửi request
      final reply = Reply.fromBuffer(packet.data);
      late Either<Failure, List<int>> result;

      if (reply.isSuccess) {
        Logger.log("Request '${reply.reply.typeUrl}' success!", tag: 'SOCKET');
        result = Right(reply.reply.value);
      } else {
        final msg = ResultType.valueOf(reply.type).translate(packet.id);
        Logger.error(
          "Request '${reply.reply.typeUrl}' failed: $msg",
          tag: 'SOCKET',
        );
        result = Left(Failure.code(reply.type));
      }

      _disposeCompleter(packet.id, value: result);
    } else {
      // Message gửi từ server xuống
      final receive = Receive.fromBuffer(packet.data);
      Logger.log("Event: ${receive.receive.typeUrl}", tag: 'SOCKET');
    }
  }

  void _disposeCompleter(int id, {Either<Failure, List<int>>? value}) {
    final completer = _requestCompleters[id] as Completer<Either<Failure, List<int>>>?;
    if (completer != null && !completer.isCompleted) {
      completer.complete(value ?? Left(Failure.defaultError()));
    }
    _requestCompleters.remove(id);
  }

  Future<bool> _waitForConnected(Duration timeout) async {
    try {
      await _socket.connection.firstWhere((state) => state is Connected).timeout(timeout);
      return true;
    } catch (_) {
      return false;
    }
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
