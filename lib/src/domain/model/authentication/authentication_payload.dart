import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_payload.freezed.dart';

@freezed
class AuthenticationPayload with _$AuthenticationPayload {
  const factory AuthenticationPayload({
    required String? accessToken,
    required String? refreshToken,
  }) = _AuthenticationPayload;
}
