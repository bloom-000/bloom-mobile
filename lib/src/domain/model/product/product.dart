import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/category.dart';
import 'product_image.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String categoryId,
    required String? description,
    required double price,
    required double? oldPrice,
    required int stockQuantity,
    required bool isPromotion,
    required String primaryImagePath,
    required double rating,
    required Category? category,
    required List<ProductImage> images,
  }) = _Product;
}
