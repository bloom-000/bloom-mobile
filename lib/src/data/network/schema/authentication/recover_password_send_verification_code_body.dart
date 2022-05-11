import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_send_verification_code_body.freezed.dart';

part 'recover_password_send_verification_code_body.g.dart';

@freezed
class RecoverPasswordSendVerificationCodeBody with _$RecoverPasswordSendVerificationCodeBody {
  const factory RecoverPasswordSendVerificationCodeBody({
    required String email,
  }) = _RecoverPasswordSendVerificationCodeBody;

  factory RecoverPasswordSendVerificationCodeBody.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordSendVerificationCodeBodyFromJson(json);
}
