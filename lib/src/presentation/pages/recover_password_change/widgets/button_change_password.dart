import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/recover_password_change_page_cubit.dart';

class ButtonChangePassword extends StatelessWidget {
  const ButtonChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<RecoverPasswordChangePageCubit>().onChangePasswordPressed,
      child: Text(TkRecoverPasswordChange.buttonChangePassword.i18n),
    );
  }
}
