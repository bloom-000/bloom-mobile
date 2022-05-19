import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_delivery_address_body.freezed.dart';

part 'update_delivery_address_body.g.dart';

@freezed
class UpdateDeliveryAddressBody with _$UpdateDeliveryAddressBody {
  const factory UpdateDeliveryAddressBody({
    required String? fullName,
    required String? phoneNumber,
    required String? country,
    required String? city,
    required String? streetAddress,
    required String? postalCode,
    required bool? isDefault,
  }) = _UpdateDeliveryAddressBody;

  factory UpdateDeliveryAddressBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeliveryAddressBodyFromJson(json);
}
