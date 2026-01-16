import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication.freezed.dart';
part 'authentication.g.dart';

@freezed
class Authentication with _$Authentication {
  const factory Authentication({
    required String account,
    required String sessionId,
    required String uid,
    required String host,
    required int port,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, dynamic> json) => _$AuthenticationFromJson(json);
}
