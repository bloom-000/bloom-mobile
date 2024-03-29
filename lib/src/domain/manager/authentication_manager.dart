import 'package:common_models/common_models.dart';

import '../enum/gender.dart';
import '../failure/authentication/recover_password_confirm_code_failure.dart';
import '../failure/authentication/recover_password_failure.dart';
import '../failure/authentication/recover_password_send_verification_code_failure.dart';
import '../failure/authentication/request_recover_password_failure.dart';
import '../failure/authentication/sign_in_failure.dart';
import '../failure/authentication/sign_up_failure.dart';
import '../model/authentication/recover_password_confirm_code_response.dart';

abstract class AuthenticationManager {
  Future<bool> isAuthenticated();

  Future<void> signOut();

  Future<Either<SignInFailure, Unit>> signIn({
    required String email,
    required String password,
  });

  Future<Either<SignUpFailure, Unit>> signUp({
    required String fullName,
    required String email,
    required DateTime birthDate,
    required Gender gender,
    required String password,
  });

  Future<Either<RequestRecoverPasswordFailure, Unit>> requestRecoverPassword({
    required String email,
  });

  Future<Either<RecoverPasswordConfirmCodeFailure, RecoverPasswordConfirmCodeResponse>>
      recoverPasswordConfirmCode({
    required String email,
    required String code,
  });

  Future<Either<RecoverPasswordFailure, Unit>> recoverPassword({
    required String uuid,
    required String newPassword,
  });

  Future<Either<RecoverPasswordSendVerificationCodeFailure, Unit>>
      recoverPasswordSendVerificationCode({
    required String email,
  });
}
