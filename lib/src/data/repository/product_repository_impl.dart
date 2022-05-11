import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/enum/product_sort_option.dart';
import '../../domain/model/product/product.dart';
import '../../domain/repository/product_repository.dart';
import '../network/mapper/enum/product_sort_option_mapper.dart';
import '../network/mapper/product/product_mapper.dart';
import '../network/mapper/product/products_page_mapper.dart';
import '../network/remote_service/product_remote_service.dart';
import '../network/schema/product/product_schema.dart';
import '../network/schema/product/products_page_schema.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
    this._productsPageMapper,
    this._productMapper,
    this._productSortOptionMapper,
    this._productRemoteService,
  );

  final ProductsPageMapper _productsPageMapper;
  final ProductMapper _productMapper;
  final ProductSortOptionMapper _productSortOptionMapper;
  final ProductRemoteService _productRemoteService;

  @override
  Future<Either<FetchFailure, Product>> getProduct(String productId) async {
    final Either<FetchFailure, ProductSchema> result =
        await _productRemoteService.getProduct(productId);

    return result.map(_productMapper.mapToRight);
  }

  @override
  Future<Either<FetchFailure, DataPage<Product>>> getProducts({
    required int page,
    required int pageSize,
    List<String>? categoryIds,
    double? fromPrice,
    double? toPrice,
    List<ProductSortOption>? sortOptions,
    List<int>? ratings,
    String? searchKeyword,
  }) async {
    final Either<FetchFailure, ProductsPageSchema> result = await _productRemoteService.getProducts(
      categoryIds: categoryIds,
      fromPrice: fromPrice,
      toPrice: toPrice,
      sortOptions: sortOptions?.map(_productSortOptionMapper.mapToLeft).toList(),
      ratings: ratings,
      searchKeyword: searchKeyword,
      page: page,
      pageSize: pageSize,
    );

    return result.map(_productsPageMapper.mapToRight);
  }

  @override
  Future<Either<FetchFailure, List<Product>>> getPromotedProducts() async {
    final Either<FetchFailure, List<ProductSchema>> result =
        await _productRemoteService.getPromotedProducts();

    return result.map((List<ProductSchema> r) => r.map(_productMapper.mapToRight).toList());
  }
}
