import 'package:common_models/common_models.dart';

import '../failure/cart_product/upsert_cart_product_failure.dart';
import '../model/cart_product/cart_product.dart';

abstract class CartProductRepository {
  Future<Either<UpsertCartProductFailure, Unit>> upsertCartProduct({
    required String productId,
    required int quantity,
  });

  Future<Either<FetchFailure, DataPage<CartProduct>>> getCartProducts({
    required int page,
  });

  Future<Either<FetchFailure, List<CartProduct>>> getAllCartProducts();
}
