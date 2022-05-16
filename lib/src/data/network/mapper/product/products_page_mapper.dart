import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/product/product.dart';
import '../../schema/product/products_page_schema.dart';
import 'product_mapper.dart';

@lazySingleton
class ProductsPageMapper extends BaseMapper<ProductsPageSchema, DataPage<Product>> {
  ProductsPageMapper(
    this._productMapper,
  );

  final ProductMapper _productMapper;

  @override
  DataPage<Product> mapToRight(ProductsPageSchema l) {
    final List<Product> items =
        l.data?.map(_productMapper.mapToRight).toList() ?? List<Product>.empty();

    return DataPage<Product>(
      items: items,
      count: l.total ?? 0,
    );
  }
}
