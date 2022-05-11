import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants.dart';
import '../schema/authentication/authentication_payload_schema.dart';
import '../schema/authentication/recover_password_body.dart';
import '../schema/authentication/recover_password_confirm_code_body.dart';
import '../schema/authentication/recover_password_confirm_code_response_schema.dart';
import '../schema/authentication/recover_password_send_verification_code_body.dart';
import '../schema/authentication/request_recover_password_body.dart';
import '../schema/authentication/sign_in_body.dart';
import '../schema/authentication/sign_up_body.dart';
import '../schema/category/category_schema.dart';
import '../schema/product/product_schema.dart';
import '../schema/product/products_page_schema.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.apiUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/authentication/sign-in')
  Future<AuthenticationPayloadSchema> signIn(@Body() SignInBody body);

  @POST('/authentication/sign-up')
  Future<AuthenticationPayloadSchema> signUp(@Body() SignUpBody body);

  @POST('/authentication/recover-password/request')
  Future<void> requestRecoverPassword(@Body() RequestRecoverPasswordBody body);

  @POST('/authentication/recover-password/confirm-code')
  Future<RecoverPasswordConfirmCodeResponseSchema> recoverPasswordConfirmCode(
    @Body() RecoverPasswordConfirmCodeBody body,
  );

  @POST('/authentication/recover-password')
  Future<AuthenticationPayloadSchema> recoverPassword(@Body() RecoverPasswordBody body);

  @POST('/authentication/recover-password/send-verification-code')
  Future<void> recoverPasswordSendVerificationCode(
    @Body() RecoverPasswordSendVerificationCodeBody body,
  );

  @GET('/products/promoted')
  Future<List<ProductSchema>> getPromotedProducts();

  @GET('/products/{id}')
  Future<ProductSchema> getProduct(@Path('id') String id);

  @GET('/products')
  Future<ProductsPageSchema> getProducts(
    @Query('categoryIds') List<String>? categoryIds,
    @Query('fromPrice') double? fromPrice,
    @Query('toPrice') double? toPrice,
    @Query('sortOptions') List<String>? sortOptions,
    @Query('ratings') List<int>? ratings,
    @Query('searchKeyword') String? searchKeyword,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET('/categories/all')
  Future<List<CategorySchema>> getAllCategories();
}
