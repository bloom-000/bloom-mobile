import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_schema.dart';

part 'products_page_schema.freezed.dart';

part 'products_page_schema.g.dart';

@freezed
class ProductsPageSchema with _$ProductsPageSchema {
  const factory ProductsPageSchema({
    List<ProductSchema>? data,
    int? count,
  }) = _ProductsPageSchema;

  factory ProductsPageSchema.fromJson(Map<String, dynamic> json) =>
      _$ProductsPageSchemaFromJson(json);
}
