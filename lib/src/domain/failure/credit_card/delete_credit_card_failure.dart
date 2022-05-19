import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_credit_card_failure.freezed.dart';

@freezed
class DeleteCreditCardFailure with _$DeleteCreditCardFailure {
  const factory DeleteCreditCardFailure.network() = _Network;

  const factory DeleteCreditCardFailure.unknown() = _Unknown;

  const factory DeleteCreditCardFailure.notFound() = _NotFound;

  const factory DeleteCreditCardFailure.cantDeleteOthersCreditCard() = _CantDeleteOthersCreditCard;
}
