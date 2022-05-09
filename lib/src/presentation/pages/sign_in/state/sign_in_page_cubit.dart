import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failure/authentication/sign_in_failure.dart';
import '../../../../domain/manager/authentication_manager.dart';
import '../../../navigation/page_navigator.dart';
import '../../../notifier/failure_notifiers/sign_in_failure_notifier.dart';

part 'sign_in_page_cubit.freezed.dart';

@freezed
class SignInPageState with _$SignInPageState {
  const factory SignInPageState({
    required Email email,
    required Password password,
    required bool isPasswordFieldObscured,
    required bool validateForm,
    required bool isSubmitting,
  }) = _SignInPageState;

  factory SignInPageState.initial() => SignInPageState(
        email: Email.empty(),
        password: Password.empty(),
        isPasswordFieldObscured: true,
        validateForm: false,
        isSubmitting: false,
      );
}

@injectable
class SignInPageCubit extends Cubit<SignInPageState> {
  SignInPageCubit(
    this._pageNavigator,
    this._authenticationManager,
    this._signInFailureNotifier,
  ) : super(SignInPageState.initial());

  final PageNavigator _pageNavigator;
  final AuthenticationManager _authenticationManager;
  final SignInFailureNotifier _signInFailureNotifier;

  void onEmailChanged(String email) => emit(state.copyWith(email: Email(email)));

  void onPasswordChanged(String password) => emit(state.copyWith(password: Password(password)));

  void onPasswordEyePressed() =>
      emit(state.copyWith(isPasswordFieldObscured: !state.isPasswordFieldObscured));

  void onForgotPasswordChanged() => _pageNavigator.toRecoverPasswordRequestPage();

  Future<void> onSignInPressed() async {
    emit(state.copyWith(validateForm: true));

    if (!state.email.isValid || !state.password.isValid) {
      return;
    }

    emit(state.copyWith(isSubmitting: true));
    final Either<SignInFailure, Unit> result = await _authenticationManager.signIn(
      email: state.email.getOrThrow,
      password: state.password.getOrThrow,
    );
    emit(state.copyWith(isSubmitting: false));

    result.fold(
      _signInFailureNotifier.notify,
      (_) => _pageNavigator.toMainPage(),
    );
  }

  void onGooglePressed() {}

  void onFacebookPressed() {}

  void onApplePressed() {}

  void onSignUpPressed() => _pageNavigator.toSignUpPage();
}
