import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_delivery_address_body.freezed.dart';

part 'create_delivery_address_body.g.dart';

@freezed
class CreateDeliveryAddressBody with _$CreateDeliveryAddressBody {
  const factory CreateDeliveryAddressBody({
    required String fullName,
    required String phoneNumber,
    required String country,
    required String city,
    required String streetAddress,
    required String postalCode,
    required bool isDefault,
  }) = _CreateDeliveryAddressBody;

  factory CreateDeliveryAddressBody.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryAddressBodyFromJson(json);
}
