import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_delivery_address_failure.freezed.dart';

@freezed
class UpdateDeliveryAddressFailure with _$UpdateDeliveryAddressFailure {
  const factory UpdateDeliveryAddressFailure.network() = _Network;

  const factory UpdateDeliveryAddressFailure.unknown() = _Unknown;

  const factory UpdateDeliveryAddressFailure.notFound() = _NotFound;

  const factory UpdateDeliveryAddressFailure.cantEditOthersDeliveryAddress() =
      _CantEditOthersDeliveryAddress;
}
