import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_credit_card_body.freezed.dart';

part 'create_credit_card_body.g.dart';

@freezed
class CreateCreditCardBody with _$CreateCreditCardBody {
  const factory CreateCreditCardBody({
    required String cardNumber,
    required String cardHolderName,
    required String cvv,
    required bool isDefault,
    required String expiryDate,
  }) = _CreateCreditCardBody;

  factory CreateCreditCardBody.fromJson(Map<String, dynamic> json) =>
      _$CreateCreditCardBodyFromJson(json);
}
