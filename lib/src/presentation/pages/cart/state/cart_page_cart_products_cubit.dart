import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../common/bloc/data_pager_with_page_cubit.dart';
import '../../../../domain/failure/cart_product/upsert_cart_product_failure.dart';
import '../../../../domain/model/cart_product/cart_product.dart';
import '../../../../domain/repository/cart_product_repository.dart';
import '../../../i18n/translation_keys.dart';
import '../../../notifier/failure_notifiers/upsert_cart_product_failure_notifier.dart';
import '../../../overlay/dialog/core/dialog_manager.dart';

@injectable
class CartPageCartProductsCubit extends DataPagerWithPageCubit<FetchFailure, CartProduct> {
  CartPageCartProductsCubit(
    this._cartProductRepository,
    this._dialogManager,
    this._upsertCartProductFailureNotifier,
  );

  final CartProductRepository _cartProductRepository;
  final DialogManager _dialogManager;
  final UpsertCartProductFailureNotifier _upsertCartProductFailureNotifier;

  @override
  Future<Either<FetchFailure, DataPage<CartProduct>>> provideDataPage(int page) async =>
      _cartProductRepository.getCartProducts(page: page);

  Future<void> onCartProductRemovePressed(CartProduct cartProduct) async =>
      _upsertNewCartProductQuantity(cartProduct, 0);

  Future<void> onCartProductDecrementPressed(CartProduct cartProduct) async =>
      _upsertNewCartProductQuantity(cartProduct, cartProduct.quantity - 1);

  Future<void> onCartProductIncrementPressed(CartProduct cartProduct) async =>
      _upsertNewCartProductQuantity(cartProduct, cartProduct.quantity + 1);

  Future<void> _upsertNewCartProductQuantity(CartProduct cartProduct, int newQuantity) async {
    if (newQuantity == 0) {
      final bool didConfirm = await _dialogManager.showConfirmationDialog(
        caption: TkCart.warningCaptionRemoveCartProduct.i18n,
      );
      if (!didConfirm) {
        return;
      }
    }

    final Either<UpsertCartProductFailure, Unit> result =
        await _cartProductRepository.upsertCartProduct(
      productId: cartProduct.productId,
      quantity: newQuantity,
    );

    result.fold(
      _upsertCartProductFailureNotifier.notify,
      (_) async {
        final DataState<FetchFailure, DataPage<CartProduct>>? newState =
            await state.modifyIfHasDataAndGet((DataPage<CartProduct> data) {
          final List<CartProduct> items = List<CartProduct>.of(data.items);

          if (newQuantity == 0) {
            items.remove(cartProduct);
          } else {
            final int index = items.indexOf(cartProduct);
            items.removeAt(index);
            items.insert(index, cartProduct.copyWith(quantity: newQuantity));
          }

          return data.copyWith(
            items: items,
            count: newQuantity == 0 ? data.count - 1 : data.count,
          );
        });

        if (newState != null) {
          emit(newState);
        }
      },
    );
  }
}
