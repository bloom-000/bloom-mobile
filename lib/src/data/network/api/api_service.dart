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
import '../schema/cart_product/cart_product_schema.dart';
import '../schema/cart_product/cart_products_page_schema.dart';
import '../schema/cart_product/upsert_cart_product_body.dart';
import '../schema/category/category_schema.dart';
import '../schema/credit_card/create_credit_card_body.dart';
import '../schema/credit_card/credit_card_schema.dart';
import '../schema/credit_card/update_credit_card_body.dart';
import '../schema/delivery_address/create_delivery_address_body.dart';
import '../schema/delivery_address/delivery_address_schema.dart';
import '../schema/delivery_address/update_delivery_address_body.dart';
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

  @GET('/cart-products')
  Future<CartProductsPageSchema> getCartProducts(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @POST('/cart-products')
  Future<void> upsertCartProduct(@Body() UpsertCartProductBody body);

  @GET('/cart-products/all')
  Future<List<CartProductSchema>> getAllCartProducts();

  @POST('/delivery-addresses')
  Future<DeliveryAddressSchema> createDeliveryAddress(@Body() CreateDeliveryAddressBody body);

  @PATCH('/delivery-addresses/{id}')
  Future<DeliveryAddressSchema> updateDeliveryAddress(
    @Path('id') String id,
    @Body() UpdateDeliveryAddressBody body,
  );

  @DELETE('/delivery-addresses/{id}')
  Future<void> deleteDeliveryAddress(@Path('id') String id);

  @GET('/delivery-addresses/default')
  Future<DeliveryAddressSchema> getDefaultDeliveryAddress();

  @GET('/delivery-addresses')
  Future<List<DeliveryAddressSchema>> getDeliveryAddresses();

  @POST('/credit-cards')
  Future<CreditCardSchema> createCreditCard(@Body() CreateCreditCardBody body);

  @PATCH('/credit-cards/{id}')
  Future<CreditCardSchema> updateCreditCard(
    @Path('id') String id,
    @Body() UpdateCreditCardBody body,
  );

  @DELETE('/credit-cards/{id}')
  Future<void> deleteCreditCard(@Path('id') String id);

  @GET('/credit-cards/default')
  Future<CreditCardSchema> getDefaultCreditCard();

  @GET('/credit-cards')
  Future<List<CreditCardSchema>> getCreditCards();
}
