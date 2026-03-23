import 'package:protobuf/protobuf.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/lang/language.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pbenum.dart';

sealed class Either<L, R> {
  const Either();

  bool get isLeft => this is Left;
  bool get isRight => this is Right;
  L? get left => this is Left ? (this as Left).value : null;
  R? get right => this is Right ? (this as Right).value : null;

  T fold<T>(T Function(L l) onFailure, T Function(R r) onSuccess) {
    final self = this;
    switch (self) {
      case Left(:final value):
        return onFailure(value);
      case Right(:final value):
        return onSuccess(value);
    }
  }
}

class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);
}

class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);
}

sealed class Failure {
  const Failure._();

  factory Failure.defaultError() => MessageFailure(DEFAULT_ERROR_MESSAGE);
  factory Failure.code(int code) => CodeFailure(code);
  factory Failure.message(String message) => MessageFailure(message);

  MessageFailure toMessageFailure<T extends ProtobufEnum>([
    T? Function(int)? valueOf,
    int? packetType,
  ]) => MessageFailure(parseMessage(valueOf, packetType));

  String parseMessage<T extends ProtobufEnum>([
    T? Function(int)? valueOf,
    int? packetType,
  ]) {
    switch (this) {
      case MessageFailure(:final message):
        return message;
      case DioFailure(:final message):
        return message;
      case CodeFailure(:final code):
        try {
          // Khi reconnected + relogin lỗi --> code = 1000 (Invalid request)
          // Một vài API getList sẽ không có hàm valueOf --> Không parse được mã lỗi --> xử lý theo common error
          return valueOf?.call(code)?.translate(packetType ?? 0) ??
              ResultType.valueOf(code).translate(-1);
        } catch (e) {
          Logger.error(e);
          return code.toString();
        }
    }
  }

  @override
  String toString() => parseMessage();

  int? get code {
    switch (this) {
      case MessageFailure():
        return null;
      case DioFailure(:final code):
        return code;
      case CodeFailure(:final code):
        return code;
    }
  }
}

class MessageFailure extends Failure {
  final String message;
  const MessageFailure(this.message) : super._();
}

class CodeFailure extends Failure {
  final int code;
  const CodeFailure(this.code) : super._();
}

class DioFailure extends Failure {
  final String message;
  final int? code;
  final int statusCode;
  final dynamic data;
  const DioFailure({required this.message, this.code, required this.statusCode, this.data})
    : super._();
}

class ApiException implements Exception {
  final String message;
  final int? code;

  const ApiException(this.message, {this.code});

  @override
  String toString() => message;
}
