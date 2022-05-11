import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/authentication/recover_password_send_verification_code_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

@injectable
class RecoverPasswordSendVerificationCodeFailureNotifier
    extends FailureNotifier<RecoverPasswordSendVerificationCodeFailure> {
  RecoverPasswordSendVerificationCodeFailureNotifier(
    this._toastNotifier,
  );

  final ToastNotifier _toastNotifier;

  @override
  void notify(RecoverPasswordSendVerificationCodeFailure failure) {
    failure.when(
      network: () => _toastNotifier.notifyNetworkError(),
      unknown: () => _toastNotifier.notifyUnknownError(),
      timedOut: () => _toastNotifier.notifyError(
        message: TkError.recoverPasswordRequestTimedOut.i18n,
        title: TkCommon.error.i18n,
      ),
      requestNotFound: () => _toastNotifier.notifyError(
        message: TkError.recoverPasswordRequestNotFound.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
