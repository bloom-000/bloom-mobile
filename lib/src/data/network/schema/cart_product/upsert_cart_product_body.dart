import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_cart_product_body.freezed.dart';

part 'upsert_cart_product_body.g.dart';

@freezed
class UpsertCartProductBody with _$UpsertCartProductBody {
  const factory UpsertCartProductBody({
    required String productId,
    required int quantity,
  }) = _UpsertCartProductBody;

  factory UpsertCartProductBody.fromJson(Map<String, dynamic> json) =>
      _$UpsertCartProductBodyFromJson(json);
}
