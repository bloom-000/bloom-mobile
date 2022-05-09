import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_confirm_code_body.freezed.dart';

part 'recover_password_confirm_code_body.g.dart';

@freezed
class RecoverPasswordConfirmCodeBody with _$RecoverPasswordConfirmCodeBody {
  const factory RecoverPasswordConfirmCodeBody({
    required String email,
    required String code,
  }) = _RecoverPasswordConfirmCodeBody;

  factory RecoverPasswordConfirmCodeBody.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordConfirmCodeBodyFromJson(json);
}
