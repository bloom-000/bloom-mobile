import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/cart_product/cart_product.dart';
import '../../../../domain/repository/cart_product_repository.dart';

@injectable
class CheckoutPageCartProductsCubit extends Cubit<DataState<FetchFailure, List<CartProduct>>> {
  CheckoutPageCartProductsCubit(
    this._cartProductRepository,
  ) : super(DataState<FetchFailure, List<CartProduct>>.idle());

  final CartProductRepository _cartProductRepository;

  void init() => _fetchAllCartProducts();

  Future<void> _fetchAllCartProducts() async {
    emit(DataState<FetchFailure, List<CartProduct>>.loading());
    final Either<FetchFailure, List<CartProduct>> result =
        await _cartProductRepository.getAllCartProducts();
    emit(DataState<FetchFailure, List<CartProduct>>.fromEither(result));
  }
}
