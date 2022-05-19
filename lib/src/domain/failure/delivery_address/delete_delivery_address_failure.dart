import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_delivery_address_failure.freezed.dart';

@freezed
class DeleteDeliveryAddressFailure with _$DeleteDeliveryAddressFailure {
  const factory DeleteDeliveryAddressFailure.network() = _Network;

  const factory DeleteDeliveryAddressFailure.unknown() = _Unknown;

  const factory DeleteDeliveryAddressFailure.notFound() = _NotFound;

  const factory DeleteDeliveryAddressFailure.cantDeleteOthersDeliveryAddress() =
      _CantDeleteOthersDeliveryAddress;
}
