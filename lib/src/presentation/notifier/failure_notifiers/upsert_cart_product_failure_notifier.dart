import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/cart_product/upsert_cart_product_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

@injectable
class UpsertCartProductFailureNotifier extends FailureNotifier<UpsertCartProductFailure> {
  UpsertCartProductFailureNotifier(
    this._toastNotifier,
  );

  final ToastNotifier _toastNotifier;

  @override
  void notify(UpsertCartProductFailure failure) {
    failure.when(
      network: () => _toastNotifier.notifyNetworkError(),
      unknown: () => _toastNotifier.notifyUnknownError(),
      productNotFound: () => _toastNotifier.notifyError(
        message: TkError.productNotFound.i18n,
        title: TkCommon.error.i18n,
      ),
      insufficientStockQuantity: () => _toastNotifier.notifyError(
        message: TkError.insufficientStockQuantity.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
