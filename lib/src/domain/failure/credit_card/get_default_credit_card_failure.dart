import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_default_credit_card_failure.freezed.dart';

@freezed
class GetDefaultCreditCardFailure with _$GetDefaultCreditCardFailure {
  const factory GetDefaultCreditCardFailure.network() = _Network;

  const factory GetDefaultCreditCardFailure.unknown() = _Unknown;

  const factory GetDefaultCreditCardFailure.notFound() = _NotFound;
}
