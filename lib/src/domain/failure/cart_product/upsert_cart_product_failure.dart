import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_cart_product_failure.freezed.dart';

@freezed
class UpsertCartProductFailure with _$UpsertCartProductFailure {
  const factory UpsertCartProductFailure.network() = _Network;

  const factory UpsertCartProductFailure.unknown() = _Unknown;

  const factory UpsertCartProductFailure.productNotFound() = _ProductNotFound;

  const factory UpsertCartProductFailure.insufficientStockQuantity() = _InsufficientStockQuantity;
}
