import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants.dart';
import '../schema/authentication/authentication_payload_schema.dart';
import '../schema/authentication/recover_password_body.dart';
import '../schema/authentication/recover_password_confirm_code_body.dart';
import '../schema/authentication/recover_password_confirm_code_response_schema.dart';
import '../schema/authentication/request_recover_password_body.dart';
import '../schema/authentication/sign_in_body.dart';
import '../schema/authentication/sign_up_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.apiUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/authentication/sign-in')
  Future<AuthenticationPayloadSchema> signIn(@Body() SignInBody body);

  @POST('/authentication/sign-up')
  Future<AuthenticationPayloadSchema> signUp(@Body() SignUpBody body);

  @POST('/authentication/request-recover-password')
  Future<void> requestRecoverPassword(@Body() RequestRecoverPasswordBody body);

  @POST('/authentication/recover-password-confirm-code')
  Future<RecoverPasswordConfirmCodeResponseSchema> recoverPasswordConfirmCode(
    @Body() RecoverPasswordConfirmCodeBody body,
  );

  @POST('/authentication/recover-password')
  Future<AuthenticationPayloadSchema> recoverPassword(@Body() RecoverPasswordBody body);
}
