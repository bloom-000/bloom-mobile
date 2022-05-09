import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_confirm_code_response_schema.freezed.dart';

part 'recover_password_confirm_code_response_schema.g.dart';

@freezed
class RecoverPasswordConfirmCodeResponseSchema with _$RecoverPasswordConfirmCodeResponseSchema {
  const factory RecoverPasswordConfirmCodeResponseSchema({
    String? uuid,
  }) = _RecoverPasswordConfirmCodeResponseSchema;

  factory RecoverPasswordConfirmCodeResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordConfirmCodeResponseSchemaFromJson(json);
}
