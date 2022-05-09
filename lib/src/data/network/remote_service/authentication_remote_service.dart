import 'package:common_models/common_models.dart';
import 'package:common_network_components/common_network_components.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failure/authentication/recover_password_confirm_code_failure.dart';
import '../../../domain/failure/authentication/recover_password_failure.dart';
import '../../../domain/failure/authentication/request_recover_password_failure.dart';
import '../../../domain/failure/authentication/sign_in_failure.dart';
import '../../../domain/failure/authentication/sign_up_failure.dart';
import '../api/api_service.dart';
import '../schema/authentication/authentication_payload_schema.dart';
import '../schema/authentication/recover_password_body.dart';
import '../schema/authentication/recover_password_confirm_code_body.dart';
import '../schema/authentication/recover_password_confirm_code_response_schema.dart';
import '../schema/authentication/request_recover_password_body.dart';
import '../schema/authentication/sign_in_body.dart';
import '../schema/authentication/sign_up_body.dart';
import '../schema/common/error_response_schema.dart';

@lazySingleton
class AuthenticationRemoteService extends BaseService {
  AuthenticationRemoteService(
    this._apiService,
  );

  final ApiService _apiService;

  Future<Either<SignInFailure, AuthenticationPayloadSchema>> signIn({
    required String email,
    required String password,
  }) async {
    return safeCall(
      call: () {
        final SignInBody body = SignInBody(
          email: email,
          password: password,
        );

        return _apiService.signIn(body);
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'EMAIL_OR_PASSWORD_INVALID':
            return const SignInFailure.invalidEmailOrPassword();
        }
        return const SignInFailure.unknown();
      },
      onNetworkError: () => const SignInFailure.network(),
      onUnknownError: (_) => const SignInFailure.unknown(),
    );
  }

  Future<Either<SignUpFailure, AuthenticationPayloadSchema>> signUp({
    required String fullName,
    required String email,
    required String birthDate,
    required String gender,
    required String password,
  }) async {
    return safeCall(
      call: () {
        final SignUpBody body = SignUpBody(
          fullName: fullName,
          email: email,
          birthDate: birthDate,
          gender: gender,
          password: password,
        );

        return _apiService.signUp(body);
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'USER_EMAIL_ALREADY_EXISTS':
            return const SignUpFailure.emailAlreadyInUse();
        }
        return const SignUpFailure.unknown();
      },
      onNetworkError: () => const SignUpFailure.network(),
      onUnknownError: (_) => const SignUpFailure.unknown(),
    );
  }

  Future<Either<RequestRecoverPasswordFailure, Unit>> requestRecoverPassword({
    required String email,
  }) async {
    return safeCall(
      call: () async {
        final RequestRecoverPasswordBody body = RequestRecoverPasswordBody(
          email: email,
        );

        await _apiService.requestRecoverPassword(body);

        return unit;
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'USER_NOT_FOUND':
            return const RequestRecoverPasswordFailure.userNotFound();
        }
        return const RequestRecoverPasswordFailure.unknown();
      },
      onNetworkError: () => const RequestRecoverPasswordFailure.network(),
      onUnknownError: (_) => const RequestRecoverPasswordFailure.unknown(),
    );
  }

  Future<Either<RecoverPasswordConfirmCodeFailure, RecoverPasswordConfirmCodeResponseSchema>>
      recoverPasswordConfirmCode({
    required String email,
    required String code,
  }) async {
    return safeCall(
      call: () {
        final RecoverPasswordConfirmCodeBody body = RecoverPasswordConfirmCodeBody(
          email: email,
          code: code,
        );

        return _apiService.recoverPasswordConfirmCode(body);
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'RECOVER_PASSWORD_CACHE_NOT_FOUND':
            return const RecoverPasswordConfirmCodeFailure.requestNotFound();
          case 'RECOVER_PASSWORD_REQUEST_TIMED_OUT':
            return const RecoverPasswordConfirmCodeFailure.timedOut();
          case 'INVALID_CODE':
            return const RecoverPasswordConfirmCodeFailure.invalidCode();
        }
        return const RecoverPasswordConfirmCodeFailure.unknown();
      },
      onNetworkError: () => const RecoverPasswordConfirmCodeFailure.network(),
      onUnknownError: (_) => const RecoverPasswordConfirmCodeFailure.unknown(),
    );
  }

  Future<Either<RecoverPasswordFailure, AuthenticationPayloadSchema>> recoverPassword({
    required String uuid,
    required String newPassword,
  }) async {
    return safeCall(
      call: () {
        final RecoverPasswordBody body = RecoverPasswordBody(
          newPassword: newPassword,
          uuid: uuid,
        );

        return _apiService.recoverPassword(body);
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'RECOVER_PASSWORD_CACHE_NOT_FOUND':
            return const RecoverPasswordFailure.requestNotFound();
        }
        return const RecoverPasswordFailure.unknown();
      },
      onNetworkError: () => const RecoverPasswordFailure.network(),
      onUnknownError: (_) => const RecoverPasswordFailure.unknown(),
    );
  }
}
