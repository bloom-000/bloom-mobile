import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_recover_password_failure.freezed.dart';

@freezed
class RequestRecoverPasswordFailure with _$RequestRecoverPasswordFailure {
  const factory RequestRecoverPasswordFailure.network() = _Network;

  const factory RequestRecoverPasswordFailure.unknown() = _Unknown;

  const factory RequestRecoverPasswordFailure.userNotFound() = _UserNotFound;
}
