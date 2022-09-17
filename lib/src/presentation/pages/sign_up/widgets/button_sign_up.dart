import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/loading_text_button.dart';
import '../state/sign_up_page_cubit.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpPageCubit, SignUpPageState>(
      buildWhen: (SignUpPageState previous, SignUpPageState current) =>
          previous.agreedToLegalTerms != current.agreedToLegalTerms,
      builder: (_, SignUpPageState state) {
        return LoadingTextButton(
          onPressed:
              state.agreedToLegalTerms ? context.read<SignUpPageCubit>().onSignUpPressed : null,
          isLoading: state.isSubmitting,
          label: TkCommon.signUp.i18n,
        );
      },
    );
  }
}
