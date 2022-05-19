import 'package:common_models/common_models.dart';
import 'package:common_network_components/common_network_components.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failure/cart_product/upsert_cart_product_failure.dart';
import '../api/api_service.dart';
import '../schema/cart_product/cart_product_schema.dart';
import '../schema/cart_product/cart_products_page_schema.dart';
import '../schema/cart_product/upsert_cart_product_body.dart';
import '../schema/common/error_response_schema.dart';

@lazySingleton
class CartProductRemoteService extends BaseService {
  CartProductRemoteService(
    this._apiService,
  );

  final ApiService _apiService;

  Future<Either<UpsertCartProductFailure, Unit>> upsertCartProduct({
    required String productId,
    required int quantity,
  }) async {
    return safeCall(
      call: () async {
        final UpsertCartProductBody body = UpsertCartProductBody(
          productId: productId,
          quantity: quantity,
        );

        await _apiService.upsertCartProduct(body);

        return unit;
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'PRODUCT_NOT_FOUND':
            return const UpsertCartProductFailure.productNotFound();
          case 'INSUFFICIENT_STOCK_QUANTITY':
            return const UpsertCartProductFailure.insufficientStockQuantity();
        }
        return const UpsertCartProductFailure.unknown();
      },
      onNetworkError: () => const UpsertCartProductFailure.network(),
      onUnknownError: (_) => const UpsertCartProductFailure.unknown(),
    );
  }

  Future<Either<FetchFailure, CartProductsPageSchema>> getCartProducts({
    required int page,
    required int pageSize,
  }) async =>
      safeFetch(() => _apiService.getCartProducts(page, pageSize));

  Future<Either<FetchFailure, List<CartProductSchema>>> getAllCartProducts() async =>
      safeFetch(() => _apiService.getAllCartProducts());
}
