import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_default_delivery_address_failure.freezed.dart';

@freezed
class GetDefaultDeliveryAddressFailure with _$GetDefaultDeliveryAddressFailure {
  const factory GetDefaultDeliveryAddressFailure.network() = _Network;

  const factory GetDefaultDeliveryAddressFailure.unknown() = _Unknown;

  const factory GetDefaultDeliveryAddressFailure.notFound() = _NotFound;
}
