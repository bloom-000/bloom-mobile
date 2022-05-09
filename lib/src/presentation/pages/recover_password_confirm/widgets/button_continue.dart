import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/recover_password_confirm_page_cubit.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordConfirmPageCubit, RecoverPasswordConfirmPageState>(
      buildWhen: (
        RecoverPasswordConfirmPageState previous,
        RecoverPasswordConfirmPageState current,
      ) =>
          previous.canContinue != current.canContinue,
      builder: (_, RecoverPasswordConfirmPageState state) {
        return TextButton(
          onPressed: state.canContinue
              ? context.read<RecoverPasswordConfirmPageCubit>().onContinuePressed
              : null,
          child: Text(TkCommon.continue_.i18n),
        );
      },
    );
  }
}
