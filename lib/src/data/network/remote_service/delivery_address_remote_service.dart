import 'package:common_models/common_models.dart';
import 'package:common_network_components/common_network_components.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failure/delivery_address/delete_delivery_address_failure.dart';
import '../../../domain/failure/delivery_address/get_default_delivery_address_failure.dart';
import '../../../domain/failure/delivery_address/update_delivery_address_failure.dart';
import '../api/api_service.dart';
import '../schema/common/error_response_schema.dart';
import '../schema/delivery_address/create_delivery_address_body.dart';
import '../schema/delivery_address/delivery_address_schema.dart';
import '../schema/delivery_address/update_delivery_address_body.dart';

@lazySingleton
class DeliveryAddressRemoteService extends BaseService {
  DeliveryAddressRemoteService(
    this._apiService,
  );

  final ApiService _apiService;

  Future<Either<SimpleActionFailure, DeliveryAddressSchema>> createDeliveryAddress({
    required String fullName,
    required String phoneNumber,
    required String country,
    required String city,
    required String streetAddress,
    required String postalCode,
    required bool isDefault,
  }) async {
    return safeSimpleCall(() {
      final CreateDeliveryAddressBody body = CreateDeliveryAddressBody(
        fullName: fullName,
        phoneNumber: phoneNumber,
        country: country,
        city: city,
        streetAddress: streetAddress,
        postalCode: postalCode,
        isDefault: isDefault,
      );

      return _apiService.createDeliveryAddress(body);
    });
  }

  Future<Either<UpdateDeliveryAddressFailure, DeliveryAddressSchema>> updateDeliveryAddress({
    required String deliveryAddressId,
    String? fullName,
    String? phoneNumber,
    String? country,
    String? city,
    String? streetAddress,
    String? postalCode,
    bool? isDefault,
  }) async {
    return safeCall(
      call: () {
        final UpdateDeliveryAddressBody body = UpdateDeliveryAddressBody(
          fullName: fullName,
          phoneNumber: phoneNumber,
          country: country,
          city: city,
          streetAddress: streetAddress,
          postalCode: postalCode,
          isDefault: isDefault,
        );

        return _apiService.updateDeliveryAddress(deliveryAddressId, body);
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'CANT_EDIT_OTHERS_DELIVERY_ADDRESS':
            return const UpdateDeliveryAddressFailure.cantEditOthersDeliveryAddress();
          case 'DELIVERY_ADDRESS_NOT_FOUND':
            return const UpdateDeliveryAddressFailure.notFound();
        }
        return const UpdateDeliveryAddressFailure.unknown();
      },
      onNetworkError: () => const UpdateDeliveryAddressFailure.network(),
      onUnknownError: (_) => const UpdateDeliveryAddressFailure.unknown(),
    );
  }

  Future<Either<DeleteDeliveryAddressFailure, Unit>> deleteDeliveryAddress({
    required String deliveryAddressId,
  }) async {
    return safeCall(
      call: () async {
        await _apiService.deleteDeliveryAddress(deliveryAddressId);

        return unit;
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'CANT_DELETE_OTHERS_DELIVERY_ADDRESS':
            return const DeleteDeliveryAddressFailure.cantDeleteOthersDeliveryAddress();
          case 'DELIVERY_ADDRESS_NOT_FOUND':
            return const DeleteDeliveryAddressFailure.notFound();
        }
        return const DeleteDeliveryAddressFailure.unknown();
      },
      onNetworkError: () => const DeleteDeliveryAddressFailure.network(),
      onUnknownError: (_) => const DeleteDeliveryAddressFailure.unknown(),
    );
  }

  Future<Either<GetDefaultDeliveryAddressFailure, DeliveryAddressSchema>>
      getDefaultDeliveryAddress() async {
    return safeCall(
      call: () => _apiService.getDefaultDeliveryAddress(),
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'DEFAULT_DELIVERY_ADDRESS_NOT_FOUND':
            return const GetDefaultDeliveryAddressFailure.notFound();
        }
        return const GetDefaultDeliveryAddressFailure.unknown();
      },
      onNetworkError: () => const GetDefaultDeliveryAddressFailure.network(),
      onUnknownError: (_) => const GetDefaultDeliveryAddressFailure.unknown(),
    );
  }

  Future<Either<FetchFailure, List<DeliveryAddressSchema>>> getDeliveryAddresses() =>
      safeFetch(() => _apiService.getDeliveryAddresses());
}
