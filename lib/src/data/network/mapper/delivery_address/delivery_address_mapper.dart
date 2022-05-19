import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/delivery_address/delivery_address.dart';
import '../../schema/delivery_address/delivery_address_schema.dart';

@lazySingleton
class DeliveryAddressMapper extends BaseMapper<DeliveryAddressSchema, DeliveryAddress> {
  @override
  DeliveryAddress mapToRight(DeliveryAddressSchema l) {
    return DeliveryAddress(
      id: l.id ?? '',
      createdAt: l.createdAt != null ? DateTime.tryParse(l.createdAt!) : null,
      updatedAt: l.updatedAt != null ? DateTime.tryParse(l.updatedAt!) : null,
      userId: l.userId ?? '',
      fullName: l.fullName ?? '',
      phoneNumber: l.phoneNumber ?? '',
      country: l.country ?? '',
      city: l.city ?? '',
      streetAddress: l.streetAddress ?? '',
      postalCode: l.postalCode ?? '',
      isDefault: l.isDefault ?? false,
    );
  }
}
