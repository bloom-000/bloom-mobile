import 'package:common_models/common_models.dart';

import '../enum/product_sort_option.dart';
import '../model/product/product.dart';

abstract class ProductRepository {
  Future<Either<FetchFailure, Product>> getProduct(String productId);

  Future<Either<FetchFailure, List<Product>>> getPromotedProducts();

  Future<Either<FetchFailure, DataPage<Product>>> getProducts({
    required int page,
    required int pageSize,
    List<String>? categoryIds,
    double? fromPrice,
    double? toPrice,
    List<ProductSortOption>? sortOptions,
    List<int>? ratings,
    String? searchKeyword,
  });
}
