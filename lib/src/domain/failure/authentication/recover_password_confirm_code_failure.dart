import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_confirm_code_failure.freezed.dart';

@freezed
class RecoverPasswordConfirmCodeFailure with _$RecoverPasswordConfirmCodeFailure {
  const factory RecoverPasswordConfirmCodeFailure.unknown() = _Unknown;

  const factory RecoverPasswordConfirmCodeFailure.network() = _Network;

  const factory RecoverPasswordConfirmCodeFailure.requestNotFound() = _RequestNotFound;

  const factory RecoverPasswordConfirmCodeFailure.timedOut() = TtimedOut;

  const factory RecoverPasswordConfirmCodeFailure.invalidCode() = _InvalidCode;
}