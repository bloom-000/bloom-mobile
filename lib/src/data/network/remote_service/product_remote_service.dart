import 'package:common_models/common_models.dart';
import 'package:common_network_components/common_network_components.dart';
import 'package:injectable/injectable.dart';

import '../api/api_service.dart';
import '../schema/product/product_schema.dart';
import '../schema/product/products_page_schema.dart';

@lazySingleton
class ProductRemoteService extends BaseService {
  ProductRemoteService(
    this._apiService,
  );

  final ApiService _apiService;

  Future<Either<FetchFailure, List<ProductSchema>>> getPromotedProducts() async =>
      safeFetch(() => _apiService.getPromotedProducts());

  Future<Either<FetchFailure, ProductSchema>> getProduct(String productId) async =>
      safeFetch(() => _apiService.getProduct(productId));

  Future<Either<FetchFailure, ProductsPageSchema>> getProducts({
    required List<String>? categoryIds,
    required double? fromPrice,
    required double? toPrice,
    required List<String>? sortOptions,
    required List<int>? ratings,
    required String? searchKeyword,
    required int page,
    required int pageSize,
  }) async =>
      safeFetch(() => _apiService.getProducts(
            categoryIds,
            fromPrice,
            toPrice,
            sortOptions,
            ratings,
            searchKeyword,
            page,
            pageSize,
          ));
}
