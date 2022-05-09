import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response_schema.freezed.dart';

part 'error_response_schema.g.dart';

@freezed
class ErrorResponseSchema with _$ErrorResponseSchema {
  const factory ErrorResponseSchema({
    String? message,
  }) = _ErrorResponseSchema;

  factory ErrorResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseSchemaFromJson(json);
}
