import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_credit_card_body.freezed.dart';

part 'update_credit_card_body.g.dart';

@freezed
class UpdateCreditCardBody with _$UpdateCreditCardBody {
  const factory UpdateCreditCardBody({
    required String? cardNumber,
    required String? cardHolderName,
    required String? cvv,
    required bool? isDefault,
    required String? expiryDate,
  }) = _UpdateCreditCardBody;

  factory UpdateCreditCardBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateCreditCardBodyFromJson(json);
}
