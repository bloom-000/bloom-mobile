import 'package:common_models/common_models.dart';
import 'package:common_network_components/common_network_components.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failure/credit_card/delete_credit_card_failure.dart';
import '../../../domain/failure/credit_card/get_default_credit_card_failure.dart';
import '../../../domain/failure/credit_card/update_credit_card_failure.dart';
import '../api/api_service.dart';
import '../schema/common/error_response_schema.dart';
import '../schema/credit_card/create_credit_card_body.dart';
import '../schema/credit_card/credit_card_schema.dart';
import '../schema/credit_card/update_credit_card_body.dart';

@lazySingleton
class CreditCardRemoteService extends BaseService {
  CreditCardRemoteService(
    this._apiService,
  );

  final ApiService _apiService;

  Future<Either<SimpleActionFailure, CreditCardSchema>> createCreditCard({
    required String cardNumber,
    required String cardHolderName,
    required String cvv,
    required bool isDefault,
    required String expiryDate,
  }) async {
    return safeSimpleCall(() {
      final CreateCreditCardBody body = CreateCreditCardBody(
        cardNumber: cardNumber,
        cardHolderName: cardHolderName,
        cvv: cvv,
        isDefault: isDefault,
        expiryDate: expiryDate,
      );

      return _apiService.createCreditCard(body);
    });
  }

  Future<Either<UpdateCreditCardFailure, CreditCardSchema>> updateCreditCard({
    required String creditCardId,
    String? cardNumber,
    String? cardHolderName,
    String? cvv,
    bool? isDefault,
    String? expiryDate,
  }) async {
    return safeCall(
      call: () {
        final UpdateCreditCardBody body = UpdateCreditCardBody(
          cardNumber: cardNumber,
          cardHolderName: cardHolderName,
          cvv: cvv,
          isDefault: isDefault,
          expiryDate: expiryDate,
        );

        return _apiService.updateCreditCard(creditCardId, body);
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'CANT_EDIT_OTHERS_CREDIT_CARD':
            return const UpdateCreditCardFailure.cantEditOthersCreditCard();
          case 'CREDIT_CARD_NOT_FOUND':
            return const UpdateCreditCardFailure.notFound();
        }
        return const UpdateCreditCardFailure.unknown();
      },
      onNetworkError: () => const UpdateCreditCardFailure.network(),
      onUnknownError: (_) => const UpdateCreditCardFailure.unknown(),
    );
  }

  Future<Either<DeleteCreditCardFailure, Unit>> deleteCreditCard({
    required String creditCardId,
  }) async {
    return safeCall(
      call: () async {
        await _apiService.deleteCreditCard(creditCardId);

        return unit;
      },
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'CANT_DELETE_OTHERS_CREDIT_CARD':
            return const DeleteCreditCardFailure.cantDeleteOthersCreditCard();
          case 'CREDIT_CARD_NOT_FOUND':
            return const DeleteCreditCardFailure.notFound();
        }
        return const DeleteCreditCardFailure.unknown();
      },
      onNetworkError: () => const DeleteCreditCardFailure.network(),
      onUnknownError: (_) => const DeleteCreditCardFailure.unknown(),
    );
  }

  Future<Either<GetDefaultCreditCardFailure, CreditCardSchema>> getDefaultCreditCard() async {
    return safeCall(
      call: () => _apiService.getDefaultCreditCard(),
      onResponseError: (Response<dynamic>? response) {
        final ErrorResponseSchema errorResponse =
            ErrorResponseSchema.fromJson(response!.data! as Map<String, dynamic>);
        switch (errorResponse.message) {
          case 'DEFAULT_CREDIT_CARD_NOT_FOUND':
            return const GetDefaultCreditCardFailure.notFound();
        }
        return const GetDefaultCreditCardFailure.unknown();
      },
      onNetworkError: () => const GetDefaultCreditCardFailure.network(),
      onUnknownError: (_) => const GetDefaultCreditCardFailure.unknown(),
    );
  }

  Future<Either<FetchFailure, List<CreditCardSchema>>> getCreditCards() async =>
      safeFetch(() => _apiService.getCreditCards());
}
