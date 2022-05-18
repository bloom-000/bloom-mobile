import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/cart_product/cart_product.dart';
import '../../schema/cart_product/cart_products_page_schema.dart';
import 'cart_product_mapper.dart';

@LazySingleton()
class CartProductsPageMapper extends BaseMapper<CartProductsPageSchema, DataPage<CartProduct>> {
  CartProductsPageMapper(
    this._cartProductMapper,
  );

  final CartProductMapper _cartProductMapper;

  @override
  DataPage<CartProduct> mapToRight(CartProductsPageSchema l) {
    final List<CartProduct> items =
        l.data?.map(_cartProductMapper.mapToRight).toList() ?? <CartProduct>[];

    return DataPage<CartProduct>(
      items: items,
      count: l.total ?? 0,
    );
  }
}
