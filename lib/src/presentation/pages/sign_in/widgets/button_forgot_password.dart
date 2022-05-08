import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/sign_in_page_cubit.dart';

class ButtonForgotPassword extends StatelessWidget {
  const ButtonForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: context.read<SignInPageCubit>().onForgotPasswordChanged,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(TkSignIn.buttonForgotPassword.i18n),
    );
  }
}
