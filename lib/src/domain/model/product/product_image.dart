import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image.freezed.dart';

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String id,
    required String imagePath,
    required int order,
    required String productId,
  }) = _ProductImage;
}
