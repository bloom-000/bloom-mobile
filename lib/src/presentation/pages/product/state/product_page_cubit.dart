import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failure/cart_product/upsert_cart_product_failure.dart';
import '../../../../domain/repository/cart_product_repository.dart';
import '../../../navigation/route_args/product_page_args.dart';
import '../../../notifier/failure_notifiers/upsert_cart_product_failure_notifier.dart';

part 'product_page_cubit.freezed.dart';

@freezed
class ProductPageState with _$ProductPageState {
  const factory ProductPageState({
    required int quantity,
    required bool addToCartInProgress,
  }) = _ProductPageState;

  factory ProductPageState.initial() => const ProductPageState(
        quantity: 1,
        addToCartInProgress: false,
      );
}

@injectable
class ProductPageCubit extends Cubit<ProductPageState> {
  ProductPageCubit(
    this._cartProductRepository,
    this._upsertCartProductFailureNotifier,
  ) : super(ProductPageState.initial());

  final CartProductRepository _cartProductRepository;
  final UpsertCartProductFailureNotifier _upsertCartProductFailureNotifier;

  late final ProductPageArgs _args;

  void init(ProductPageArgs args) => _args = args;

  Future<void> onAddToCartPressed() async {
    emit(state.copyWith(addToCartInProgress: true));
    final Either<UpsertCartProductFailure, Unit> result =
        await _cartProductRepository.addProductToCart(
      productId: _args.productId,
      quantity: state.quantity,
    );
    result.fold(
      _upsertCartProductFailureNotifier.notify,
      (_) {},
    );
    emit(state.copyWith(addToCartInProgress: false));
  }

  void onHeartPressed() {}

  void onIncrementPressed() => emit(state.copyWith(quantity: state.quantity + 1));

  void onDecrementPressed() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }
}
