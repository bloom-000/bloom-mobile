import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_address.freezed.dart';

@freezed
class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required String id,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String userId,
    required String fullName,
    required String phoneNumber,
    required String country,
    required String city,
    required String streetAddress,
    required String postalCode,
    required bool isDefault,
  }) = _DeliveryAddress;
}
