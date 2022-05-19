import 'package:common_models/common_models.dart';

import '../failure/credit_card/delete_credit_card_failure.dart';
import '../failure/credit_card/get_default_credit_card_failure.dart';
import '../failure/credit_card/update_credit_card_failure.dart';
import '../model/credit_card/credit_card.dart';

abstract class CreditCardRepository {
  Future<Either<SimpleActionFailure, CreditCard>> createCreditCard({
    required String cardNumber,
    required String cardHolderName,
    required String cvv,
    required bool isDefault,
    required DateTime expiryDate,
  });

  Future<Either<UpdateCreditCardFailure, CreditCard>> updateCreditCard({
    required String creditCardId,
    String? cardNumber,
    String? cardHolderName,
    String? cvv,
    bool? isDefault,
    DateTime? expiryDate,
  });

  Future<Either<DeleteCreditCardFailure, Unit>> deleteCreditCard({
    required String creditCardId,
  });

  Future<Either<GetDefaultCreditCardFailure, CreditCard>> getDefaultCreditCard();

  Future<Either<FetchFailure, List<CreditCard>>> getCreditCards();
}
