import 'package:common_models/common_models.dart';

import '../failure/delivery_address/delete_delivery_address_failure.dart';
import '../failure/delivery_address/get_default_delivery_address_failure.dart';
import '../failure/delivery_address/update_delivery_address_failure.dart';
import '../model/delivery_address/delivery_address.dart';

abstract class DeliveryAddressRepository {
  Future<Either<SimpleActionFailure, DeliveryAddress>> createDeliveryAddress({
    required String fullName,
    required String phoneNumber,
    required String country,
    required String city,
    required String streetAddress,
    required String postalCode,
    required bool isDefault,
  });

  Future<Either<UpdateDeliveryAddressFailure, DeliveryAddress>> updateDeliveryAddress({
    required String deliveryAddressId,
    String? fullName,
    String? phoneNumber,
    String? country,
    String? city,
    String? streetAddress,
    String? postalCode,
    bool? isDefault,
  });

  Future<Either<DeleteDeliveryAddressFailure, Unit>> deleteDeliveryAddress({
    required String deliveryAddressId,
  });

  Future<Either<GetDefaultDeliveryAddressFailure, DeliveryAddress>> getDefaultDeliveryAddress();

  Future<Either<FetchFailure, List<DeliveryAddress>>> getDeliveryAddresses();
}
