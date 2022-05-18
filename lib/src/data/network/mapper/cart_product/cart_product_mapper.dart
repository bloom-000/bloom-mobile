import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/cart_product/cart_product.dart';
import '../../../../domain/model/product/product.dart';
import '../../schema/cart_product/cart_product_schema.dart';
import '../product/product_mapper.dart';

@lazySingleton
class CartProductMapper extends BaseMapper<CartProductSchema, CartProduct> {
  CartProductMapper(
    this._productMapper,
  );

  final ProductMapper _productMapper;

  @override
  CartProduct mapToRight(CartProductSchema l) {
    final Product? product = l.product != null ? _productMapper.mapToRight(l.product!) : null;

    return CartProduct(
      id: l.id ?? '',
      product: product,
    );
  }
}
