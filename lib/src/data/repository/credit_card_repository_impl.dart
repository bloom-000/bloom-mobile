import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failure/credit_card/delete_credit_card_failure.dart';
import '../../domain/failure/credit_card/get_default_credit_card_failure.dart';
import '../../domain/failure/credit_card/update_credit_card_failure.dart';
import '../../domain/model/credit_card/credit_card.dart';
import '../../domain/repository/credit_card_repository.dart';
import '../network/mapper/credit_card/credit_card_mapper.dart';
import '../network/remote_service/credit_card_remote_service.dart';
import '../network/schema/credit_card/credit_card_schema.dart';

@LazySingleton(as: CreditCardRepository)
class CreditCardRepositoryImpl implements CreditCardRepository {
  CreditCardRepositoryImpl(
    this._creditCardRemoteService,
    this._creditCardMapper,
  );

  final CreditCardRemoteService _creditCardRemoteService;
  final CreditCardMapper _creditCardMapper;

  @override
  Future<Either<SimpleActionFailure, CreditCard>> createCreditCard({
    required String cardNumber,
    required String cardHolderName,
    required String cvv,
    required bool isDefault,
    required DateTime expiryDate,
  }) async {
    final Either<SimpleActionFailure, CreditCardSchema> result =
        await _creditCardRemoteService.createCreditCard(
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      cvv: cvv,
      isDefault: isDefault,
      expiryDate: expiryDate.toIso8601String(),
    );

    return result.map(_creditCardMapper.mapToRight);
  }

  @override
  Future<Either<UpdateCreditCardFailure, CreditCard>> updateCreditCard({
    required String creditCardId,
    String? cardNumber,
    String? cardHolderName,
    String? cvv,
    bool? isDefault,
    DateTime? expiryDate,
  }) async {
    final Either<UpdateCreditCardFailure, CreditCardSchema> result =
        await _creditCardRemoteService.updateCreditCard(
      creditCardId: creditCardId,
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      cvv: cvv,
      isDefault: isDefault,
      expiryDate: expiryDate?.toIso8601String(),
    );

    return result.map(_creditCardMapper.mapToRight);
  }

  @override
  Future<Either<DeleteCreditCardFailure, Unit>> deleteCreditCard({
    required String creditCardId,
  }) async =>
      _creditCardRemoteService.deleteCreditCard(creditCardId: creditCardId);

  @override
  Future<Either<GetDefaultCreditCardFailure, CreditCard>> getDefaultCreditCard() async {
    final Either<GetDefaultCreditCardFailure, CreditCardSchema> result =
        await _creditCardRemoteService.getDefaultCreditCard();

    return result.map(_creditCardMapper.mapToRight);
  }

  @override
  Future<Either<FetchFailure, List<CreditCard>>> getCreditCards() async {
    final Either<FetchFailure, List<CreditCardSchema>> result =
        await _creditCardRemoteService.getCreditCards();

    return result.map((List<CreditCardSchema> r) => r.map(_creditCardMapper.mapToRight).toList());
  }
}
