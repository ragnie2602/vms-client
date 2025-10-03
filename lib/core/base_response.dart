import 'package:protobuf/protobuf.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/lang/language.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';

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

  MessageFailure toMessageFailure<T extends ProtobufEnum>([T? Function(int)? valueOf]) =>
      MessageFailure(parseMessage(valueOf));

  String parseMessage<T extends ProtobufEnum>([T? Function(int)? valueOf]) {
    switch (this) {
      case MessageFailure(:final message):
        return message;
      case CodeFailure(:final code):
        try {
          return valueOf?.call(code)?.translate() ?? code.toString();
        } catch (e) {
          Logger.error(e);
          return code.toString();
        }
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
