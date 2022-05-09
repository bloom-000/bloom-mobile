import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/authentication/recover_password_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

class RecoverPasswordFailureNotifier extends FailureNotifier<RecoverPasswordFailure> {
  RecoverPasswordFailureNotifier(
    this._toastNotifier,
  );

  final ToastNotifier _toastNotifier;

  @override
  void notify(RecoverPasswordFailure failure) {
    failure.when(
      network: () => _toastNotifier.notifyNetworkError(),
      unknown: () => _toastNotifier.notifyUnknownError(),
      requestNotFound: () => _toastNotifier.notifyError(
        message: TkError.recoverPasswordRequestNotFound.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
