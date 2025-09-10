import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication.freezed.dart';
part 'authentication.g.dart';

@freezed
class Authentication with _$Authentication {
  const factory Authentication({
    required String account,
    required List<int> sessionId,
    required List<int> uid,
    required String ssid,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, dynamic> json) => _$AuthenticationFromJson(json);
}