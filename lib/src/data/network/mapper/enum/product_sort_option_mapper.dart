import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/enum/product_sort_option.dart';

@injectable
class ProductSortOptionMapper extends BaseMapper<String, ProductSortOption?> {
  @override
  String mapToLeft(ProductSortOption? r) {
    switch (r) {
      case ProductSortOption.priceLowToHigh:
        return 'PRICE_LOW_TO_HIGH';
      case ProductSortOption.priceHighToLow:
        return 'PRICE_HIGH_TO_LOW';
      case ProductSortOption.nameAToZ:
        return 'NAME_A_TO_Z';
      case ProductSortOption.nameZToA:
        return 'NAME_Z_TO_A';
      case ProductSortOption.creationDateHighToLow:
        return 'CREATION_DATE_HIGH_TO_LOW';
      case ProductSortOption.creationDateLowToHigh:
        return 'CREATION_DATE_LOW_TO_HIGH';
      default:
        return '';
    }
  }
}
