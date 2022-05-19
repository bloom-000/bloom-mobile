import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failure/delivery_address/delete_delivery_address_failure.dart';
import '../../domain/failure/delivery_address/get_default_delivery_address_failure.dart';
import '../../domain/failure/delivery_address/update_delivery_address_failure.dart';
import '../../domain/model/delivery_address/delivery_address.dart';
import '../../domain/repository/delivery_address_repository.dart';
import '../network/mapper/delivery_address/delivery_address_mapper.dart';
import '../network/remote_service/delivery_address_remote_service.dart';
import '../network/schema/delivery_address/delivery_address_schema.dart';

@LazySingleton(as: DeliveryAddressRepository)
class DeliveryAddressRepositoryImpl implements DeliveryAddressRepository {
  DeliveryAddressRepositoryImpl(
    this._deliveryAddressRemoteService,
    this._deliveryAddressMapper,
  );

  final DeliveryAddressRemoteService _deliveryAddressRemoteService;
  final DeliveryAddressMapper _deliveryAddressMapper;

  @override
  Future<Either<SimpleActionFailure, DeliveryAddress>> createDeliveryAddress({
    required String fullName,
    required String phoneNumber,
    required String country,
    required String city,
    required String streetAddress,
    required String postalCode,
    required bool isDefault,
  }) async {
    final Either<SimpleActionFailure, DeliveryAddressSchema> result =
        await _deliveryAddressRemoteService.createDeliveryAddress(
      fullName: fullName,
      phoneNumber: phoneNumber,
      country: country,
      city: city,
      streetAddress: streetAddress,
      postalCode: postalCode,
      isDefault: isDefault,
    );

    return result.map(_deliveryAddressMapper.mapToRight);
  }

  @override
  Future<Either<UpdateDeliveryAddressFailure, DeliveryAddress>> updateDeliveryAddress({
    required String deliveryAddressId,
    String? fullName,
    String? phoneNumber,
    String? country,
    String? city,
    String? streetAddress,
    String? postalCode,
    bool? isDefault,
  }) async {
    final Either<UpdateDeliveryAddressFailure, DeliveryAddressSchema> result =
        await _deliveryAddressRemoteService.updateDeliveryAddress(
      deliveryAddressId: deliveryAddressId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      country: country,
      city: city,
      streetAddress: streetAddress,
      postalCode: postalCode,
      isDefault: isDefault,
    );

    return result.map(_deliveryAddressMapper.mapToRight);
  }

  @override
  Future<Either<DeleteDeliveryAddressFailure, Unit>> deleteDeliveryAddress({
    required String deliveryAddressId,
  }) async =>
      _deliveryAddressRemoteService.deleteDeliveryAddress(deliveryAddressId: deliveryAddressId);

  @override
  Future<Either<GetDefaultDeliveryAddressFailure, DeliveryAddress>>
      getDefaultDeliveryAddress() async {
    final Either<GetDefaultDeliveryAddressFailure, DeliveryAddressSchema> result =
        await _deliveryAddressRemoteService.getDefaultDeliveryAddress();

    return result.map(_deliveryAddressMapper.mapToRight);
  }

  @override
  Future<Either<FetchFailure, List<DeliveryAddress>>> getDeliveryAddresses() async {
    final Either<FetchFailure, List<DeliveryAddressSchema>> result =
        await _deliveryAddressRemoteService.getDeliveryAddresses();

    return result
        .map((List<DeliveryAddressSchema> r) => r.map(_deliveryAddressMapper.mapToRight).toList());
  }
}
