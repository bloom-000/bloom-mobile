import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/sign_up_page_cubit.dart';

class LegalTerms extends StatelessWidget {
  const LegalTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      children: <Widget>[
        BlocBuilder<SignUpPageCubit, SignUpPageState>(
          buildWhen: (SignUpPageState previous, SignUpPageState current) =>
              previous.agreedToLegalTerms != current.agreedToLegalTerms,
          builder: (_, SignUpPageState state) {
            return Checkbox(
              value: state.agreedToLegalTerms,
              onChanged: (bool? value) =>
                  context.read<SignUpPageCubit>().onToggleLegalTerms(value: value),
              visualDensity: VisualDensity.compact,
            );
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: TkSignUp.legalCaptionStart.i18n,
              style: const TextStyle(fontSize: 15),
              children: <InlineSpan>[
                TextSpan(
                  text: TkSignUp.privacyPolicy.i18n,
                  style: TextStyle(color: theme.colorScheme.secondary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = context.read<SignUpPageCubit>().onPrivacyPolicyPressed,
                ),
                TextSpan(text: ' ${TkCommon.and.i18n} '),
                TextSpan(
                  text: TkSignUp.termsOfService.i18n,
                  style: TextStyle(color: theme.colorScheme.secondary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = context.read<SignUpPageCubit>().onTermsOfServicePressed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
