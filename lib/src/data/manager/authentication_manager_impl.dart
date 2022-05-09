import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/enum/gender.dart';
import '../../domain/failure/authentication/recover_password_confirm_code_failure.dart';
import '../../domain/failure/authentication/recover_password_failure.dart';
import '../../domain/failure/authentication/request_recover_password_failure.dart';
import '../../domain/failure/authentication/sign_in_failure.dart';
import '../../domain/failure/authentication/sign_up_failure.dart';
import '../../domain/manager/authentication_manager.dart';
import '../../domain/model/authentication/authentication_payload.dart';
import '../../domain/model/authentication/recover_password_confirm_code_response.dart';
import '../../domain/store/authentication_token_store.dart';
import '../network/mapper/authentication/authentication_payload_mapper.dart';
import '../network/mapper/authentication/recover_password_confirm_code_response_mapper.dart';
import '../network/mapper/enum/gender_mapper.dart';
import '../network/remote_service/authentication_remote_service.dart';
import '../network/schema/authentication/authentication_payload_schema.dart';
import '../network/schema/authentication/recover_password_confirm_code_response_schema.dart';

@LazySingleton(as: AuthenticationManager)
class AuthenticationManagerImpl implements AuthenticationManager {
  AuthenticationManagerImpl(
    this._authenticationTokenStore,
    this._authenticationRemoteService,
    this._authenticationPayloadMapper,
    this._recoverPasswordConfirmCodeResponseMapper,
    this._genderMapper,
  );

  final AuthenticationTokenStore _authenticationTokenStore;
  final AuthenticationRemoteService _authenticationRemoteService;
  final AuthenticationPayloadMapper _authenticationPayloadMapper;
  final RecoverPasswordConfirmCodeResponseMapper _recoverPasswordConfirmCodeResponseMapper;
  final GenderMapper _genderMapper;

  @override
  Future<bool> isAuthenticated() => _authenticationTokenStore.hasRefreshToken();

  @override
  Future<void> signOut() async {
    await _authenticationTokenStore.clear();
  }

  @override
  Future<Either<SignInFailure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    final Either<SignInFailure, AuthenticationPayloadSchema> result =
        await _authenticationRemoteService.signIn(
      email: email,
      password: password,
    );

    if (result.isLeft()) {
      return result.map((_) => unit);
    }

    final AuthenticationPayload authenticationPayload =
        _authenticationPayloadMapper.mapToRight(result.rightOrThrow);

    if (authenticationPayload.accessToken == null || authenticationPayload.refreshToken == null) {
      return left(const SignInFailure.unknown());
    }

    await _authenticationTokenStore.writeAccessToken(authenticationPayload.accessToken!);
    await _authenticationTokenStore.writeRefreshToken(authenticationPayload.refreshToken!);

    return result.map((_) => unit);
  }

  @override
  Future<Either<SignUpFailure, Unit>> signUp({
    required String fullName,
    required String email,
    required DateTime birthDate,
    required Gender gender,
    required String password,
  }) async {
    final Either<SignUpFailure, AuthenticationPayloadSchema> result =
        await _authenticationRemoteService.signUp(
      fullName: fullName,
      email: email,
      birthDate: birthDate.toIso8601String(),
      gender: _genderMapper.mapToLeft(gender),
      password: password,
    );

    if (result.isLeft()) {
      return result.map((_) => unit);
    }

    final AuthenticationPayload authenticationPayload =
        _authenticationPayloadMapper.mapToRight(result.rightOrThrow);

    if (authenticationPayload.accessToken == null || authenticationPayload.refreshToken == null) {
      return left(const SignUpFailure.unknown());
    }

    await _authenticationTokenStore.writeAccessToken(authenticationPayload.accessToken!);
    await _authenticationTokenStore.writeRefreshToken(authenticationPayload.refreshToken!);

    return result.map((_) => unit);
  }

  @override
  Future<Either<RequestRecoverPasswordFailure, Unit>> requestRecoverPassword({
    required String email,
  }) async =>
      _authenticationRemoteService.requestRecoverPassword(email: email);

  @override
  Future<Either<RecoverPasswordConfirmCodeFailure, RecoverPasswordConfirmCodeResponse>>
      recoverPasswordConfirmCode({
    required String email,
    required String code,
  }) async {
    final Either<RecoverPasswordConfirmCodeFailure, RecoverPasswordConfirmCodeResponseSchema>
        result = await _authenticationRemoteService.recoverPasswordConfirmCode(
      email: email,
      code: code,
    );

    return result.map((RecoverPasswordConfirmCodeResponseSchema r) =>
        _recoverPasswordConfirmCodeResponseMapper.mapToRight(r));
  }

  @override
  Future<Either<RecoverPasswordFailure, AuthenticationPayload>> recoverPassword({
    required String uuid,
    required String newPassword,
  }) async {
    final Either<RecoverPasswordFailure, AuthenticationPayloadSchema> result =
        await _authenticationRemoteService.recoverPassword(
      uuid: uuid,
      newPassword: newPassword,
    );

    return result
        .map((AuthenticationPayloadSchema r) => _authenticationPayloadMapper.mapToRight(r));
  }
}
