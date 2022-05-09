import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/authentication/sign_in_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

@injectable
class SignInFailureNotifier extends FailureNotifier<SignInFailure> {
  SignInFailureNotifier(
    this._toastNotifier,
  );

  final ToastNotifier _toastNotifier;

  @override
  void notify(SignInFailure failure) {
    failure.when(
      network: () => _toastNotifier.notifyNetworkError(),
      unknown: () => _toastNotifier.notifyUnknownError(),
      invalidEmailOrPassword: () => _toastNotifier.notifyError(
        message: TkError.invalidEmailOrPassword.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
