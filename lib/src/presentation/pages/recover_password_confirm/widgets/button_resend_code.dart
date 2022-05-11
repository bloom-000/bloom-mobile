import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/recover_password_confirm_page_cubit.dart';

class ButtonResendCode extends StatelessWidget {
  const ButtonResendCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<RecoverPasswordConfirmPageCubit, RecoverPasswordConfirmPageState>(
      buildWhen: (
        RecoverPasswordConfirmPageState previous,
        RecoverPasswordConfirmPageState current,
      ) =>
          previous.sendCodeTimeout != current.sendCodeTimeout,
      builder: (_, RecoverPasswordConfirmPageState state) {
        return state.sendCodeTimeout > 0
            ? Text(
                '${TkRecoverPasswordConfirm.captionResendIn.i18n} ${state.sendCodeTimeout}',
                textAlign: TextAlign.center,
              )
            : Text.rich(
                TextSpan(
                  text: TkRecoverPasswordConfirm.captionDidntGetCode.i18n,
                  children: <InlineSpan>[
                    TextSpan(
                        text: TkRecoverPasswordConfirm.buttonResend.i18n,
                        style: TextStyle(color: theme.colorScheme.secondary),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              context.read<RecoverPasswordConfirmPageCubit>().onSendCodePressed)
                  ],
                ),
                textAlign: TextAlign.center,
              );
      },
    );
  }
}
