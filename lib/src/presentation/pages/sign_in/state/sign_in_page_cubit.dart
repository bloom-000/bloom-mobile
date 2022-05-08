import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../navigation/page_navigator.dart';

part 'sign_in_page_cubit.freezed.dart';

@freezed
class SignInPageState with _$SignInPageState {
  const factory SignInPageState({
    required Email email,
    required Password password,
    required bool isPasswordFieldObscured,
    required bool validateForm,
  }) = _SignInPageState;

  factory SignInPageState.initial() => SignInPageState(
        email: Email.empty(),
        password: Password.empty(),
        isPasswordFieldObscured: true,
        validateForm: false,
      );
}

@injectable
class SignInPageCubit extends Cubit<SignInPageState> {
  SignInPageCubit(
    this._pageNavigator,
  ) : super(SignInPageState.initial());

  final PageNavigator _pageNavigator;

  void onEmailChanged(String email) => emit(state.copyWith(email: Email(email)));

  void onPasswordChanged(String password) => emit(state.copyWith(password: Password(password)));

  void onPasswordEyePressed() =>
      emit(state.copyWith(isPasswordFieldObscured: !state.isPasswordFieldObscured));

  void onForgotPasswordChanged() {}

  void onSignInPressed() {
    emit(state.copyWith(validateForm: true));
  }

  void onGooglePressed() {}

  void onFacebookPressed() {}

  void onApplePressed() {}

  void onSignUpPressed() => _pageNavigator.toSignUpPage();
}
