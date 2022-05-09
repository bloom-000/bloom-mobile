import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/authentication/sign_up_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

@injectable
class SignUpFailureNotifier extends FailureNotifier<SignUpFailure> {
  final ToastNotifier _toastNotifier;

  SignUpFailureNotifier(this._toastNotifier);

  @override
  void notify(SignUpFailure failure) {
    failure.when(
      unknown: () => _toastNotifier.notifyUnknownError(),
      network: () => _toastNotifier.notifyNetworkError(),
      emailAlreadyInUse: () => _toastNotifier.notifyError(
        message: TkError.emailAlreadyInUse.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
