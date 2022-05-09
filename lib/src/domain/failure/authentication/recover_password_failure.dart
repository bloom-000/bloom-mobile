import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_failure.freezed.dart';

@freezed
class RecoverPasswordFailure with _$RecoverPasswordFailure {
  const factory RecoverPasswordFailure.network() = _Network;

  const factory RecoverPasswordFailure.unknown() = _Unknown;

  const factory RecoverPasswordFailure.requestNotFound() = _RequestNotFound;
}