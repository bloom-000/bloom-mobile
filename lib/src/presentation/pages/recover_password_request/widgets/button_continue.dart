import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/loading_text_button.dart';
import '../state/recover_password_request_page_cubit.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordRequestPageCubit, RecoverPasswordRequestPageState>(
      buildWhen: (
        RecoverPasswordRequestPageState previous,
        RecoverPasswordRequestPageState current,
      ) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (_, RecoverPasswordRequestPageState state) {
        return LoadingTextButton(
          isLoading: state.isSubmitting,
          onPressed: context.read<RecoverPasswordRequestPageCubit>().onContinuePressed,
          label: TkCommon.continue_.i18n,
        );
      },
    );
  }
}
