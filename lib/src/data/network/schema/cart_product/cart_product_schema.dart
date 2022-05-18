import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product_schema.dart';

part 'cart_product_schema.freezed.dart';

part 'cart_product_schema.g.dart';

@freezed
class CartProductSchema with _$CartProductSchema {
  const factory CartProductSchema({
    String? id,
    ProductSchema? product,
  }) = _CartProductSchema;

  factory CartProductSchema.fromJson(Map<String, dynamic> json) =>
      _$CartProductSchemaFromJson(json);
}
