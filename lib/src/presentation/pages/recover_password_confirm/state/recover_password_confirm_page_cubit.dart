import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/recover_password_change_page_args.dart';
import '../../../navigation/route_args/recover_password_confirm_page_args.dart';

part 'recover_password_confirm_page_cubit.freezed.dart';

@freezed
class RecoverPasswordConfirmPageState with _$RecoverPasswordConfirmPageState {
  const factory RecoverPasswordConfirmPageState({
    required String code,
    required bool canContinue,
  }) = _RecoverPasswordConfirmPageState;

  factory RecoverPasswordConfirmPageState.initial() => const RecoverPasswordConfirmPageState(
        code: '',
        canContinue: false,
      );
}

@injectable
class RecoverPasswordConfirmPageCubit extends Cubit<RecoverPasswordConfirmPageState> {
  RecoverPasswordConfirmPageCubit(
    this._pageNavigator,
  ) : super(RecoverPasswordConfirmPageState.initial());

  final PageNavigator _pageNavigator;

  late final RecoverPasswordConfirmPageArgs _args;

  void init(RecoverPasswordConfirmPageArgs args) {
    _args = args;

    _sendVerificationCode();
  }

  void onCodeChanged(String code) =>
      emit(state.copyWith(code: code, canContinue: code.length == 5));

  Future<void> onContinuePressed() async {
    if (state.code.length != 5) {
      return;
    }

    const RecoverPasswordChangePageArgs args = RecoverPasswordChangePageArgs(
      uuid: '',
    );

    _pageNavigator.toRecoverPasswordChangePage(args);
  }

  Future<void> _sendVerificationCode() async {}
}
