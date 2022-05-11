import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/category_schema.dart';
import 'product_image_schema.dart';

part 'product_schema.freezed.dart';

part 'product_schema.g.dart';

@freezed
class ProductSchema with _$ProductSchema {
  const factory ProductSchema({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? categoryId,
    String? description,
    double? price,
    double? oldPrice,
    int? stockQuantity,
    bool? isPromotion,
    String? primaryImagePath,
    double? rating,
    CategorySchema? category,
    List<ProductImageSchema>? images,
  }) = _ProductSchema;

  factory ProductSchema.fromJson(Map<String, dynamic> json) => _$ProductSchemaFromJson(json);
}
