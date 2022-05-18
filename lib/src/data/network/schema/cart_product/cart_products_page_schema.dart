import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_product_schema.dart';

part 'cart_products_page_schema.freezed.dart';

part 'cart_products_page_schema.g.dart';

@freezed
class CartProductsPageSchema with _$CartProductsPageSchema {
  const factory CartProductsPageSchema({
    List<CartProductSchema>? data,
    int? total,
  }) = _CartProductsPageSchema;

  factory CartProductsPageSchema.fromJson(Map<String, dynamic> json) =>
      _$CartProductsPageSchemaFromJson(json);
}
