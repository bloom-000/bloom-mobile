import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_schema.freezed.dart';

part 'product_image_schema.g.dart';

@freezed
class ProductImageSchema with _$ProductImageSchema {
  const factory ProductImageSchema({
    String? id,
    String? imagePath,
    int? order,
    String? productId,
  }) = _ProductImageSchema;

  factory ProductImageSchema.fromJson(Map<String, dynamic> json) =>
      _$ProductImageSchemaFromJson(json);
}
