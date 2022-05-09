import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/authentication/recover_password_confirm_code_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

@injectable
class RecoverPasswordConfirmCodeFailureNotifier
    extends FailureNotifier<RecoverPasswordConfirmCodeFailure> {
  RecoverPasswordConfirmCodeFailureNotifier(
    this._toastNotifier,
  );

  final ToastNotifier _toastNotifier;

  @override
  void notify(RecoverPasswordConfirmCodeFailure failure) {
    failure.when(
      unknown: () => _toastNotifier.notifyUnknownError(),
      network: () => _toastNotifier.notifyNetworkError(),
      requestNotFound: () => _toastNotifier.notifyError(
        message: TkError.recoverPasswordRequestNotFound.i18n,
        title: TkCommon.error.i18n,
      ),
      timedOut: () => _toastNotifier.notifyError(
        message: TkError.recoverPasswordRequestTimedOut.i18n,
        title: TkCommon.error.i18n,
      ),
      invalidCode: () => _toastNotifier.notifyError(
        message: TkError.recoverPasswordInvalidCode.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
