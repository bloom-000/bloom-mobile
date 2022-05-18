import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/bloc/data_pager_with_page_cubit.dart';
import '../../../../domain/model/product/product.dart';
import '../../../../domain/repository/product_repository.dart';
import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/product_page_args.dart';

@injectable
class HomePageProductsCubit extends DataPagerWithPageCubit<FetchFailure, Product> {
  HomePageProductsCubit(
    this._productRepository,
    this._pageNavigator,
  );

  final ProductRepository _productRepository;
  final PageNavigator _pageNavigator;

  @override
  Future<Either<FetchFailure, DataPage<Product>>> provideDataPage(int page) async =>
      _productRepository.getProducts(page: page);

  void onProductPressed(Product product) {
    final ProductPageArgs args = ProductPageArgs(
      productId: product.id,
    );

    _pageNavigator.toProductPage(args);
  }
}
