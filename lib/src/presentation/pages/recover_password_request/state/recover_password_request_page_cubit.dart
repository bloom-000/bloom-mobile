import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failure/authentication/request_recover_password_failure.dart';
import '../../../../domain/manager/authentication_manager.dart';
import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/recover_password_confirm_page_args.dart';
import '../../../notifier/failure_notifiers/request_recover_password_failure_notifier.dart';

part 'recover_password_request_page_cubit.freezed.dart';

@freezed
class RecoverPasswordRequestPageState with _$RecoverPasswordRequestPageState {
  const factory RecoverPasswordRequestPageState({
    required Email email,
    required bool validateForm,
    required bool isSubmitting,
  }) = _RecoverPasswordRequestPageState;

  factory RecoverPasswordRequestPageState.initial() => RecoverPasswordRequestPageState(
        email: Email.empty(),
        validateForm: false,
        isSubmitting: false,
      );
}

@injectable
class RecoverPasswordRequestPageCubit extends Cubit<RecoverPasswordRequestPageState> {
  RecoverPasswordRequestPageCubit(
    this._pageNavigator,
    this._authenticationManager,
    this._requestRecoverPasswordFailureNotifier,
  ) : super(RecoverPasswordRequestPageState.initial());

  final PageNavigator _pageNavigator;
  final AuthenticationManager _authenticationManager;
  final RequestRecoverPasswordFailureNotifier _requestRecoverPasswordFailureNotifier;

  void onEmailChanged(String email) => emit(state.copyWith(email: Email(email)));

  Future<void> onContinuePressed() async {
    emit(state.copyWith(validateForm: true));

    if (!state.email.isValid) {
      return;
    }

    final String email = state.email.getOrThrow;

    emit(state.copyWith(isSubmitting: true));
    final Either<RequestRecoverPasswordFailure, Unit> result =
        await _authenticationManager.requestRecoverPassword(email: email);
    emit(state.copyWith(isSubmitting: false));

    result.fold(
      _requestRecoverPasswordFailureNotifier.notify,
      (_) {
        final RecoverPasswordConfirmPageArgs args = RecoverPasswordConfirmPageArgs(
          email: email,
        );

        _pageNavigator.toRecoverPasswordConfirmPage(args);
      },
    );
  }
}
