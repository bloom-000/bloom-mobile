import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/category/category.dart';

part 'event_product.freezed.dart';

@freezed
class EventProduct with _$EventProduct {
  const factory EventProduct.trendyProductsCategoryChanged(Category category) =
      _TrendyProductsCategoryChanged;
}
