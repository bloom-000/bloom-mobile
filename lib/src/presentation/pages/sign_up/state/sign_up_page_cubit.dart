import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../domain/enum/gender.dart';
import '../../../../domain/failure/authentication/sign_up_failure.dart';
import '../../../../domain/manager/authentication_manager.dart';
import '../../../i18n/i18n_extensions/gender_i18n_extension.dart';
import '../../../i18n/translation_keys.dart';
import '../../../navigation/page_navigator.dart';
import '../../../notifier/failure_notifiers/sign_up_failure_notifier.dart';
import '../../../overlay/bottom_sheet/core/bottom_sheet_manager.dart';
import '../../../overlay/dialog/core/dialog_manager.dart';

part 'sign_up_page_cubit.freezed.dart';

@freezed
class SignUpPageState with _$SignUpPageState {
  const factory SignUpPageState({
    required Name fullName,
    required Email email,
    DateTime? birthDate,
    Gender? gender,
    required Password password,
    required RepeatedPassword repeatedPassword,
    required bool isPasswordFieldObscured,
    required bool isRepeatedPasswordFieldObscured,
    required bool validateForm,
    required bool agreedToLegalTerms,
    required bool isSubmitting,
  }) = _SignUpPageState;

  factory SignUpPageState.initial() => SignUpPageState(
        fullName: Name.empty(),
        email: Email.empty(),
        password: Password.empty(),
        repeatedPassword: RepeatedPassword.empty(),
        isPasswordFieldObscured: true,
        isRepeatedPasswordFieldObscured: true,
        validateForm: false,
        agreedToLegalTerms: false,
        isSubmitting: false,
      );
}

@injectable
class SignUpPageCubit extends Cubit<SignUpPageState> {
  SignUpPageCubit(
    this._bottomSheetManager,
    this._dialogManager,
    this._pageNavigator,
    this._authenticationManager,
    this._signUpFailureNotifier,
  ) : super(SignUpPageState.initial());

  final BottomSheetManager _bottomSheetManager;
  final DialogManager _dialogManager;
  final PageNavigator _pageNavigator;
  final AuthenticationManager _authenticationManager;
  final SignUpFailureNotifier _signUpFailureNotifier;

  String _repeatedPasswordValue = '';

  void onFullNameChanged(String fullName) => emit(state.copyWith(fullName: Name(fullName)));

  void onEmailChanged(String email) => emit(state.copyWith(email: Email(email)));

  Future<void> onBirthDatePressed() async {
    final DateTime? selectedDate = await _dialogManager.showMinimalDatePicker();
    if (selectedDate == null) {
      return;
    }

    emit(state.copyWith(birthDate: selectedDate));
  }

  Future<void> onGenderPressed() async {
    final Gender? selectedGender = await _bottomSheetManager.showOptionSelector(
      header: TkOptionSelectorHeader.gender.i18n,
      options: Gender.values,
      toStringMapper: (Gender option) => option.translate(),
    );
    if (selectedGender == null) {
      return;
    }

    emit(state.copyWith(gender: selectedGender));
  }

  void onPasswordChanged(String password) => emit(state.copyWith(
        password: Password(password),
        repeatedPassword: RepeatedPassword(password, _repeatedPasswordValue),
      ));

  void onRepeatedPasswordChanged(String repeatedPassword) {
    _repeatedPasswordValue = repeatedPassword;
    emit(state.copyWith(
      repeatedPassword: RepeatedPassword(state.password.get ?? '', repeatedPassword),
    ));
  }

  void onPasswordEyePressed() =>
      emit(state.copyWith(isPasswordFieldObscured: !state.isPasswordFieldObscured));

  void onRepeatedPasswordEyePressed() =>
      emit(state.copyWith(isRepeatedPasswordFieldObscured: !state.isRepeatedPasswordFieldObscured));

  void onToggleLegalTerms({required bool? value}) =>
      emit(state.copyWith(agreedToLegalTerms: value ?? false));

  void onPrivacyPolicyPressed() => _pageNavigator.toPrivacyPolicyPage();

  void onTermsOfServicePressed() => _pageNavigator.toTermsOfServicePage();

  Future<void> onSignUpPressed() async {
    emit(state.copyWith(validateForm: true));

    if (state.fullName.invalid ||
        state.email.invalid ||
        state.birthDate == null ||
        state.gender == null ||
        state.password.invalid ||
        state.repeatedPassword.invalid ||
        !state.agreedToLegalTerms) {
      return;
    }

    emit(state.copyWith(isSubmitting: true));
    final Either<SignUpFailure, Unit> result = await _authenticationManager.signUp(
      fullName: state.fullName.getOrThrow,
      email: state.email.getOrThrow,
      birthDate: state.birthDate!,
      gender: state.gender!,
      password: state.password.getOrThrow,
    );
    emit(state.copyWith(isSubmitting: false));

    result.fold(
      _signUpFailureNotifier.notify,
      (_) => _pageNavigator.toMainPage(),
    );
  }
}
