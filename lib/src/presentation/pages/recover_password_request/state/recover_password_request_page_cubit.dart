import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/recover_password_confirm_page_args.dart';

part 'recover_password_request_page_cubit.freezed.dart';

@freezed
class RecoverPasswordRequestPageState with _$RecoverPasswordRequestPageState {
  const factory RecoverPasswordRequestPageState({
    required Email email,
    required bool validateForm,
  }) = _RecoverPasswordRequestPageState;

  factory RecoverPasswordRequestPageState.initial() => RecoverPasswordRequestPageState(
        email: Email.empty(),
        validateForm: false,
      );
}

@injectable
class RecoverPasswordRequestPageCubit extends Cubit<RecoverPasswordRequestPageState> {
  RecoverPasswordRequestPageCubit(
    this._pageNavigator,
  ) : super(RecoverPasswordRequestPageState.initial());

  final PageNavigator _pageNavigator;

  void onEmailChanged(String email) => emit(state.copyWith(email: Email(email)));

  void onContinuePressed() {
    emit(state.copyWith(validateForm: true));

    if (!state.email.isValid) {
      return;
    }

    final RecoverPasswordConfirmPageArgs args = RecoverPasswordConfirmPageArgs(
      email: state.email.getOrThrow,
    );

    _pageNavigator.toRecoverPasswordConfirmPage(args);
  }
}
