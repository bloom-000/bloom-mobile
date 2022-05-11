import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_send_verification_code_failure.freezed.dart';

@freezed
class RecoverPasswordSendVerificationCodeFailure with _$RecoverPasswordSendVerificationCodeFailure {
  const factory RecoverPasswordSendVerificationCodeFailure.network() = _Network;

  const factory RecoverPasswordSendVerificationCodeFailure.unknown() = _Unknown;

  const factory RecoverPasswordSendVerificationCodeFailure.timedOut() = _TimedOut;

  const factory RecoverPasswordSendVerificationCodeFailure.requestNotFound() = _RequestNotFound;
}
