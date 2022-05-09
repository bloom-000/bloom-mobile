import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_confirm_code_response.freezed.dart';

@freezed
class RecoverPasswordConfirmCodeResponse with _$RecoverPasswordConfirmCodeResponse {
  const factory RecoverPasswordConfirmCodeResponse({
    required String? uuid,
  }) = _RecoverPasswordConfirmCodeResponse;
}
