import 'dart:async';

import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failure/authentication/recover_password_confirm_code_failure.dart';
import '../../../../domain/failure/authentication/recover_password_send_verification_code_failure.dart';
import '../../../../domain/manager/authentication_manager.dart';
import '../../../../domain/model/authentication/recover_password_confirm_code_response.dart';
import '../../../navigation/page_navigator.dart';
import '../../../navigation/route_args/recover_password_change_page_args.dart';
import '../../../navigation/route_args/recover_password_confirm_page_args.dart';
import '../../../notifier/failure_notifiers/recover_password_confirm_code_failure_notifier.dart';
import '../../../notifier/failure_notifiers/recover_password_send_verification_code_failure_notifier.dart';

part 'recover_password_confirm_page_cubit.freezed.dart';

@freezed
class RecoverPasswordConfirmPageState with _$RecoverPasswordConfirmPageState {
  const factory RecoverPasswordConfirmPageState({
    required String code,
    required bool canContinue,
    required int sendCodeTimeout,
    required bool isSubmitting,
  }) = _RecoverPasswordConfirmPageState;

  factory RecoverPasswordConfirmPageState.initial() => const RecoverPasswordConfirmPageState(
        code: '',
        canContinue: false,
        sendCodeTimeout: 0,
        isSubmitting: false,
      );
}

@injectable
class RecoverPasswordConfirmPageCubit extends Cubit<RecoverPasswordConfirmPageState> {
  RecoverPasswordConfirmPageCubit(
    this._pageNavigator,
    this._authenticationManager,
    this._recoverPasswordConfirmCodeFailureNotifier,
    this._recoverPasswordSendVerificationCodeFailureNotifier,
  ) : super(RecoverPasswordConfirmPageState.initial());

  final PageNavigator _pageNavigator;
  final AuthenticationManager _authenticationManager;
  final RecoverPasswordConfirmCodeFailureNotifier _recoverPasswordConfirmCodeFailureNotifier;
  final RecoverPasswordSendVerificationCodeFailureNotifier
      _recoverPasswordSendVerificationCodeFailureNotifier;

  late final RecoverPasswordConfirmPageArgs _args;
  late final Timer _sendCodeTimer;

  void init(RecoverPasswordConfirmPageArgs args) {
    _args = args;

    _sendCodeTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.sendCodeTimeout > 0) {
        emit(state.copyWith(sendCodeTimeout: state.sendCodeTimeout - 1));
      }
    });
  }

  @override
  Future<void> close() async {
    _sendCodeTimer.cancel();

    super.close();
  }

  void onCodeChanged(String code) =>
      emit(state.copyWith(code: code, canContinue: code.length == 5));

  Future<void> onContinuePressed() async {
    if (state.code.length != 5) {
      return;
    }

    emit(state.copyWith(isSubmitting: true));
    final Either<RecoverPasswordConfirmCodeFailure, RecoverPasswordConfirmCodeResponse> result =
        await _authenticationManager.recoverPasswordConfirmCode(
      email: _args.email,
      code: state.code,
    );
    emit(state.copyWith(isSubmitting: false));

    result.fold(
      _recoverPasswordConfirmCodeFailureNotifier.notify,
      (RecoverPasswordConfirmCodeResponse r) {
        final RecoverPasswordChangePageArgs args = RecoverPasswordChangePageArgs(
          uuid: r.uuid,
        );

        _pageNavigator.toRecoverPasswordChangePage(args);
      },
    );
  }

  Future<void> onSendCodePressed() async {
    final Either<RecoverPasswordSendVerificationCodeFailure, Unit> result =
        await _authenticationManager.recoverPasswordSendVerificationCode(
      email: _args.email,
    );

    result.fold(
      _recoverPasswordSendVerificationCodeFailureNotifier.notify,
      (_) => emit(state.copyWith(sendCodeTimeout: 20)),
    );
  }
}
