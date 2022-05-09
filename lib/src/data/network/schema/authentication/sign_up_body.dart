import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_body.freezed.dart';

part 'sign_up_body.g.dart';

@freezed
class SignUpBody with _$SignUpBody {
  const factory SignUpBody({
    required String fullName,
    required String email,
    required String birthDate,
    required String gender,
    required String password,
  }) = _SignUpBody;

  factory SignUpBody.fromJson(Map<String, dynamic> json) => _$SignUpBodyFromJson(json);
}
