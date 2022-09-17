import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/loading_text_button.dart';
import '../state/sign_in_page_cubit.dart';

class ButtonSignIn extends StatelessWidget {
  const ButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInPageCubit, SignInPageState>(
      buildWhen: (SignInPageState previous, SignInPageState current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (_, SignInPageState state) {
        return LoadingTextButton(
          onPressed: context.read<SignInPageCubit>().onSignInPressed,
          isLoading: state.isSubmitting,
          label: TkCommon.signIn.i18n,
        );
      },
    );
  }
}
