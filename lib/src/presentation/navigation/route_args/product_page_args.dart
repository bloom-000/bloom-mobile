import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_page_args.freezed.dart';

@freezed
class ProductPageArgs with _$ProductPageArgs {
  const factory ProductPageArgs({
    required String productId,
  }) = _ProductPageArgs;
}
