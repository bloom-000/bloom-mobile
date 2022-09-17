import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/loading_text_button.dart';
import '../state/recover_password_confirm_page_cubit.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordConfirmPageCubit, RecoverPasswordConfirmPageState>(
      buildWhen: (
        RecoverPasswordConfirmPageState previous,
        RecoverPasswordConfirmPageState current,
      ) =>
          previous.canContinue != current.canContinue ||
          previous.isSubmitting != current.isSubmitting,
      builder: (_, RecoverPasswordConfirmPageState state) {
        return LoadingTextButton(
          onPressed: state.canContinue
              ? context.read<RecoverPasswordConfirmPageCubit>().onContinuePressed
              : null,
          label: TkCommon.continue_.i18n,
          isLoading: state.isSubmitting,
        );
      },
    );
  }
}
