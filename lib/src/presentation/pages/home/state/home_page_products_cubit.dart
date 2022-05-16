import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/bloc/data_pager_with_page_cubit.dart';
import '../../../../domain/model/product/product.dart';
import '../../../../domain/repository/product_repository.dart';

@injectable
class HomePageProductsCubit extends DataPagerWithPageCubit<FetchFailure, Product> {
  HomePageProductsCubit(
    this._productRepository,
  );

  final ProductRepository _productRepository;

  @override
  Future<Either<FetchFailure, DataPage<Product>>> provideDataPage(int page) async =>
      _productRepository.getProducts(page: page);
}
