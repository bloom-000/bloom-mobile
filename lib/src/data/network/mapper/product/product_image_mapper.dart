import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/product/product_image.dart';
import '../../schema/product/product_image_schema.dart';

@lazySingleton
class ProductImageMapper extends BaseMapper<ProductImageSchema, ProductImage> {
  @override
  ProductImage mapToRight(ProductImageSchema l) {
    return ProductImage(
      id: l.id ?? '',
      imagePath: l.imagePath ?? '',
      order: l.order ?? -1,
      productId: l.productId ?? '',
    );
  }
}
