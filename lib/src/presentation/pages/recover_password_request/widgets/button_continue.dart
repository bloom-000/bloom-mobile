import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/recover_password_request_page_cubit.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<RecoverPasswordRequestPageCubit>().onContinuePressed,
      child: Text(TkCommon.continue_.i18n),
    );
  }
}
