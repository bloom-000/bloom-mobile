import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failure/cart_product/upsert_cart_product_failure.dart';
import '../../domain/model/cart_product/cart_product.dart';
import '../../domain/repository/cart_product_repository.dart';
import '../network/mapper/cart_product/cart_product_mapper.dart';
import '../network/mapper/cart_product/cart_products_page_mapper.dart';
import '../network/remote_service/cart_product_remote_service.dart';
import '../network/schema/cart_product/cart_product_schema.dart';
import '../network/schema/cart_product/cart_products_page_schema.dart';

@LazySingleton(as: CartProductRepository)
class CartProductRepositoryImpl implements CartProductRepository {
  CartProductRepositoryImpl(
    this._cartProductRemoteService,
    this._cartProductsPageMapper,
    this._cartProductMapper,
  );

  final CartProductRemoteService _cartProductRemoteService;
  final CartProductsPageMapper _cartProductsPageMapper;
  final CartProductMapper _cartProductMapper;

  @override
  Future<Either<UpsertCartProductFailure, Unit>> upsertCartProduct({
    required String productId,
    required int quantity,
  }) async {
    final Either<UpsertCartProductFailure, Unit> result =
        await _cartProductRemoteService.upsertCartProduct(
      productId: productId,
      quantity: quantity,
    );

    return result.map((_) => unit);
  }

  @override
  Future<Either<FetchFailure, DataPage<CartProduct>>> getCartProducts({
    required int page,
  }) async {
    final Either<FetchFailure, CartProductsPageSchema> result =
        await _cartProductRemoteService.getCartProducts(
      page: page,
      pageSize: 20,
    );

    return result.map(_cartProductsPageMapper.mapToRight);
  }

  @override
  Future<Either<FetchFailure, List<CartProduct>>> getAllCartProducts() async {
    final Either<FetchFailure, List<CartProductSchema>> result =
        await _cartProductRemoteService.getAllCartProducts();

    return result.map((List<CartProductSchema> r) => r.map(_cartProductMapper.mapToRight).toList());
  }
}
