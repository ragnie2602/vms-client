import 'dart:async';
import 'dart:typed_data';

import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
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

  // Streams
  late StreamController<Map<String, dynamic>> _messageController;
  late StreamController<SocketConnectionState> _stateController;
  Stream<SocketConnectionState> get stateStream => _stateController.stream.distinct();

  // State
  SocketConnectionState _state = SocketConnectionState.connecting;
  SocketConnectionState get state => _state;
  set state(SocketConnectionState value) {
    _state = value;
    if (!_stateController.isClosed) _stateController.add(_state);

    Logger.log(
      "Connection state: ${_state.name.capitalizeFirstLetter}",
      tag: 'SOCKET',
      writeLog: true,
    );
  }

  // Requesting
  final Map<int, Completer> _requestCompleters = {};
  Timer? _keepAliveTimer;

  // FutureOr<void> --> Future<void> hoặc void
  Future<void> _safeCall(FutureOr<void> Function() cb) async {
    try {
      await cb();
    } catch (_) {}
  }

  @override
  Future<bool> connect(SocketConnectionParams params) async {
    _safeCall(() => _socket.close());

    // Initialize
    serverUrl = "ws://${params.host}:${params.port}";
    await _safeCall(() => _messageController.close());
    _messageController = StreamController.broadcast();
    await _safeCall(() => _stateController.close());
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
      _socket.connection.listen((_state) {
        // Case Reconnected --> Cần đăng nhập lại
        if (_state is Reconnected) return _relogin();

        state = SocketConnectionState.fromConnectionState(_state);
      });

      // Wait until a connection has been established.
      if (!await _waitForConnected(Duration(seconds: params.timeout))) {
        throw TimeoutException('Connection timeout');
      }

      _keepAliveTimer?.cancel();
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
    if (!isConnected && !await _waitForConnected(Duration(seconds: 5))) {
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

  void _sendKeepAlive([Timer? _]) {
    if (!isConnected) return;

    _socket.send(
      Packet(
        id: DateTime.now().microsecondsSinceEpoch,
        data: KeepAlive_Request(idle: false).writeToBuffer(),
        type: PacketType.keepAlive,
      ).writeToBuffer(),
    );
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
        final msg = ResultType.valueOf(reply.type).translate(-1);
        Logger.error("Request '${reply.reply.typeUrl}' failed: $msg", tag: 'SOCKET');
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
      // Đăng nhập lỗi --> Đăng nhập lại
      if (state == SocketConnectionState.unauthenticated) _relogin();

      await stateStream
          .firstWhere((state) => state == SocketConnectionState.connected)
          .timeout(timeout);

      return true;
    } catch (_) {
      return isConnected;
    }
  }

  @override
  Stream<Map<String, dynamic>> listen() {
    return _messageController.stream;
  }

  @override
  bool get isConnected => state == SocketConnectionState.connected;

  static const int RELOGIN_ID = -666666666666666;
  void _relogin() {
    if (state == SocketConnectionState.reauthenticating) return;
    state = SocketConnectionState.reauthenticating;

    if (AppData.instance.profile == null) {
      state = SocketConnectionState.unauthenticated;
      Logger.error("Unable to re-login (profile null)", tag: 'SOCKET', writeLog: true);
      return;
    }

    if (!_requestCompleters.containsKey(RELOGIN_ID)) {
      final completer = Completer<Either<Failure, List<int>>>();
      _requestCompleters[RELOGIN_ID] = completer;

      _socket.send(
        Packet(
          id: RELOGIN_ID,
          data: Login_Request(
            uid: AppData.instance.profile!.uid,
            sessionId: AppData.instance.profile!.sessionId,
          ).writeToBuffer(),
          type: PacketType.login,
        ).writeToBuffer(),
      );
    }

    (_requestCompleters[RELOGIN_ID] as Completer<Either<Failure, List<int>>>).future
        .timeout(Duration(seconds: 10), onTimeout: () => Left(Failure.message(TIMEOUT_DEFAULT)))
        .then(
          (response) => response.fold(
            (failure) => state = SocketConnectionState.unauthenticated,
            (success) => state = SocketConnectionState.connected,
          ),
        );
  }
}

enum SocketConnectionState {
  connecting,
  reconnecting,
  reauthenticating,
  unauthenticated,
  connected,
  disconnecting,
  disconnected;

  factory SocketConnectionState.fromConnectionState(ConnectionState state) => switch (state) {
    Connecting() => SocketConnectionState.connecting,
    Connected() => SocketConnectionState.connected,
    Reconnecting() => SocketConnectionState.reconnecting,
    Reconnected() => SocketConnectionState.connected,
    Disconnecting() => SocketConnectionState.disconnecting,
    Disconnected() => SocketConnectionState.disconnected,
  };
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
