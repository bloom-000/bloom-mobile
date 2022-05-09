import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_body.freezed.dart';

part 'recover_password_body.g.dart';

@freezed
class RecoverPasswordBody with _$RecoverPasswordBody {
  const factory RecoverPasswordBody({
    required String newPassword,
    required String uuid,
  }) = _RecoverPasswordBody;

  factory RecoverPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordBodyFromJson(json);
}
