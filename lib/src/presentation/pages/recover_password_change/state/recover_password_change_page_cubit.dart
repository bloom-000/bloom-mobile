import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failure/authentication/recover_password_failure.dart';
import '../../../../domain/manager/authentication_manager.dart';
import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/recover_password_change_page_args.dart';
import '../../../notifier/failure_notifiers/recover_password_failure_notifier.dart';

part 'recover_password_change_page_cubit.freezed.dart';

@freezed
class RecoverPasswordChangePageState with _$RecoverPasswordChangePageState {
  const factory RecoverPasswordChangePageState({
    required Password password,
    required RepeatedPassword repeatedPassword,
    required bool validateForm,
    required bool isPasswordFieldObscured,
    required bool isRepeatedPasswordFieldObscured,
    required bool isSubmitting,
  }) = _RecoverPasswordChangePageState;

  factory RecoverPasswordChangePageState.initial() => RecoverPasswordChangePageState(
        password: Password.empty(),
        repeatedPassword: RepeatedPassword.empty(),
        validateForm: false,
        isPasswordFieldObscured: true,
        isRepeatedPasswordFieldObscured: true,
        isSubmitting: false,
      );
}

@injectable
class RecoverPasswordChangePageCubit extends Cubit<RecoverPasswordChangePageState> {
  RecoverPasswordChangePageCubit(
    this._pageNavigator,
    this._authenticationManager,
    this._recoverPasswordFailureNotifier,
  ) : super(RecoverPasswordChangePageState.initial());

  final PageNavigator _pageNavigator;
  final AuthenticationManager _authenticationManager;
  final RecoverPasswordFailureNotifier _recoverPasswordFailureNotifier;

  late final RecoverPasswordChangePageArgs _args;

  String _repeatedPasswordValue = '';

  void init(RecoverPasswordChangePageArgs args) => _args = args;

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

  Future<void> onChangePasswordPressed() async {
    emit(state.copyWith(validateForm: true));

    if (state.password.invalid || state.repeatedPassword.invalid) {
      return;
    }

    emit(state.copyWith(isSubmitting: true));
    final Either<RecoverPasswordFailure, Unit> result =
        await _authenticationManager.recoverPassword(
      uuid: _args.uuid,
      newPassword: state.password.getOrThrow,
    );
    emit(state.copyWith(isSubmitting: false));

    result.fold(
      _recoverPasswordFailureNotifier.notify,
      (_) => _pageNavigator.toMainPage(),
    );
  }
}
