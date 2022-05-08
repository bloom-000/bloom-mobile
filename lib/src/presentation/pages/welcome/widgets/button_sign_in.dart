import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/welcome_page_cubit.dart';

class ButtonSignIn extends StatelessWidget {
  const ButtonSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<WelcomePageCubit>().onSignInPressed,
      child: Text(TkCommon.signIn.i18n),
    );
  }
}
