import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product.dart';

part 'cart_product.freezed.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required String id,
    required int quantity,
    required String productId,
    required Product? product,
  }) = _CartProduct;
}
