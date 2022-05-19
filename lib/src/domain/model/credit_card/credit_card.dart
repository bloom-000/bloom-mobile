import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card.freezed.dart';

@freezed
class CreditCard with _$CreditCard {
  const factory CreditCard({
    required String id,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String userId,
    required String number,
    required String holderName,
    required String cvv,
    required DateTime? expiryDate,
    required bool isDefault,
  }) = _CreditCard;
}
