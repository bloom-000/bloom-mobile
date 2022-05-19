import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_address_schema.freezed.dart';

part 'delivery_address_schema.g.dart';

@freezed
class DeliveryAddressSchema with _$DeliveryAddressSchema {
  const factory DeliveryAddressSchema({
    String? id,
    String? userId,
    String? createdAt,
    String? updatedAt,
    String? fullName,
    String? phoneNumber,
    String? country,
    String? city,
    String? streetAddress,
    String? postalCode,
    bool? isDefault,
  }) = _DeliveryAddressSchema;

  factory DeliveryAddressSchema.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressSchemaFromJson(json);
}
