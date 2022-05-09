import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_recover_password_body.freezed.dart';

part 'request_recover_password_body.g.dart';

@freezed
class RequestRecoverPasswordBody with _$RequestRecoverPasswordBody {
  const factory RequestRecoverPasswordBody({
    required String email,
  }) = _RequestRecoverPasswordBody;

  factory RequestRecoverPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$RequestRecoverPasswordBodyFromJson(json);
}
