import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/product/product.dart';
import '../../../../domain/repository/product_repository.dart';
import '../../../navigation/route_args/product_page_args.dart';

@injectable
class ProductPageProductCubit extends Cubit<DataState<FetchFailure, Product>> {
  ProductPageProductCubit(
    this._productRepository,
  ) : super(DataState<FetchFailure, Product>.idle());

  final ProductRepository _productRepository;

  late final ProductPageArgs _args;

  void init(ProductPageArgs args) {
    _args = args;

    _fetchProduct();
  }

  Future<void> _fetchProduct() async {
    emit(DataState<FetchFailure, Product>.loading());
    final Either<FetchFailure, Product> result =
        await _productRepository.getProduct(_args.productId);
    emit(DataState<FetchFailure, Product>.fromEither(result));
  }
}
