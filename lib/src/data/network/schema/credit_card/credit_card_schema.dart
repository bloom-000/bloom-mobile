import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_schema.freezed.dart';

part 'credit_card_schema.g.dart';

@freezed
class CreditCardSchema with _$CreditCardSchema {
  const factory CreditCardSchema({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? userId,
    String? number,
    String? holderName,
    String? cvv,
    String? expiryDate,
    bool? isDefault,
  }) = _CreditCardSchema;

  factory CreditCardSchema.fromJson(Map<String, dynamic> json) => _$CreditCardSchemaFromJson(json);
}
