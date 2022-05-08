import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/sign_up_page_cubit.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<SignUpPageCubit>().onSignUpPressed,
      child: Text(TkCommon.signUp.i18n),
    );
  }
}
