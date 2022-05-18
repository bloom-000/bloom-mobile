import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/product/product.dart';
import '../../../../domain/repository/product_repository.dart';
import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/product_page_args.dart';

@injectable
class HomePagePromotedProductsCubit extends Cubit<DataState<FetchFailure, List<Product>>> {
  HomePagePromotedProductsCubit(
    this._productRepository,
    this._pageNavigator,
  ) : super(DataState<FetchFailure, List<Product>>.idle());

  final ProductRepository _productRepository;
  final PageNavigator _pageNavigator;

  final PageController pageController = PageController();

  void init() => _fetchPromotedProducts();

  @override
  Future<void> close() async {
    pageController.dispose();

    super.close();
  }

  Future<void> _fetchPromotedProducts() async {
    emit(DataState<FetchFailure, List<Product>>.loading());
    final Either<FetchFailure, List<Product>> result =
        await _productRepository.getPromotedProducts();
    emit(DataState<FetchFailure, List<Product>>.fromEither(result));
  }

  void onShopNowPressed(Product product) {
    final ProductPageArgs args = ProductPageArgs(
      productId: product.id,
    );

    _pageNavigator.toProductPage(args);
  }
}
