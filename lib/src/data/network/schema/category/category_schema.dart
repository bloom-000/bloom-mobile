import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_schema.freezed.dart';

part 'category_schema.g.dart';

@freezed
class CategorySchema with _$CategorySchema {
  const factory CategorySchema({
    String? id,
    String? name,
    String? description,
  }) = _CategorySchema;

  factory CategorySchema.fromJson(Map<String, dynamic> json) => _$CategorySchemaFromJson(json);
}
