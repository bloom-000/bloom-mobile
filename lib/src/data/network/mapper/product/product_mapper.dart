import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/category/category.dart';
import '../../../../domain/model/product/product.dart';
import '../../../../domain/model/product/product_image.dart';
import '../../schema/product/product_schema.dart';
import '../category/category_mapper.dart';
import 'product_image_mapper.dart';

@lazySingleton
class ProductMapper extends BaseMapper<ProductSchema, Product> {
  ProductMapper(
    this._categoryMapper,
    this._productImageMapper,
  );

  final CategoryMapper _categoryMapper;
  final ProductImageMapper _productImageMapper;

  @override
  Product mapToRight(ProductSchema l) {
    final DateTime? createdAt = l.createdAt != null ? DateTime.tryParse(l.createdAt!) : null;
    final DateTime? updatedAt = l.updatedAt != null ? DateTime.tryParse(l.updatedAt!) : null;

    final Category? category = l.category != null ? _categoryMapper.mapToRight(l.category!) : null;
    final List<ProductImage> images =
        l.images?.map(_productImageMapper.mapToRight).toList() ?? <ProductImage>[];

    return Product(
      id: l.id ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
      name: l.name ?? '',
      categoryId: l.categoryId ?? '',
      description: l.description,
      price: l.price ?? 0,
      oldPrice: l.oldPrice,
      stockQuantity: l.stockQuantity ?? 0,
      isPromotion: l.isPromotion ?? false,
      primaryImagePath: l.primaryImagePath ?? '',
      rating: l.rating ?? 0,
      category: category,
      images: images,
    );
  }
}
