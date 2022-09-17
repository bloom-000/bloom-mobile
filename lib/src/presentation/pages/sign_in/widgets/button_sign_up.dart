import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/sign_in_page_cubit.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text.rich(
      TextSpan(
        text: TkSignIn.captionDontHaveAccount.i18n,
        children: <InlineSpan>[
          TextSpan(
            text: ' ${TkCommon.signUp.i18n}',
            style: TextStyle(color: theme.colorScheme.secondary),
            recognizer: TapGestureRecognizer()
              ..onTap = context.read<SignInPageCubit>().onSignUpPressed,
          ),
        ],
      ),
    );
  }
}
