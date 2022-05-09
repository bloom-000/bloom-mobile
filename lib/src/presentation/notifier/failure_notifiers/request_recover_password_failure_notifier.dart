import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../domain/failure/authentication/request_recover_password_failure.dart';
import '../../i18n/translation_keys.dart';
import '../core/failure_notifier.dart';
import '../core/toast_notifier.dart';

@injectable
class RequestRecoverPasswordFailureNotifier extends FailureNotifier<RequestRecoverPasswordFailure> {
  RequestRecoverPasswordFailureNotifier(
    this._toastNotifier,
  );

  final ToastNotifier _toastNotifier;

  @override
  void notify(RequestRecoverPasswordFailure failure) {
    failure.when(
      network: () => _toastNotifier.notifyUnknownError(),
      unknown: () => _toastNotifier.notifyUnknownError(),
      userNotFound: () => _toastNotifier.notifyError(
        message: TkError.userNotFoundWithEmail.i18n,
        title: TkCommon.error.i18n,
      ),
    );
  }
}
