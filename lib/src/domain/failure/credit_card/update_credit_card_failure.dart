import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_credit_card_failure.freezed.dart';

@freezed
class UpdateCreditCardFailure with _$UpdateCreditCardFailure {
  const factory UpdateCreditCardFailure.network() = _Network;

  const factory UpdateCreditCardFailure.unknown() = _Unknown;

  const factory UpdateCreditCardFailure.notFound() = _NotFound;

  const factory UpdateCreditCardFailure.cantEditOthersCreditCard() = _CantEditOthersCreditCard;
}
