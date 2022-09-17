import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/loading_text_button.dart';
import '../state/recover_password_change_page_cubit.dart';

class ButtonChangePassword extends StatelessWidget {
  const ButtonChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordChangePageCubit, RecoverPasswordChangePageState>(
      buildWhen: (
        RecoverPasswordChangePageState previous,
        RecoverPasswordChangePageState current,
      ) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (_, RecoverPasswordChangePageState state) {
        return LoadingTextButton(
          isLoading: state.isSubmitting,
          onPressed: context.read<RecoverPasswordChangePageCubit>().onChangePasswordPressed,
          label: TkRecoverPasswordChange.buttonChangePassword.i18n,
        );
      },
    );
  }
}
