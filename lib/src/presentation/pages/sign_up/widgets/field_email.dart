import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/sign_up_page_cubit.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 512,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counterText: '',
        hintText: TkFieldHint.emailAddress.i18n,
      ),
      onChanged: context.read<SignUpPageCubit>().onEmailChanged,
      validator: (_) => context.read<SignUpPageCubit>().state.email.failureToString(
            (ValueFailure l) => l.when(
              empty: () => TkValidationError.fieldIsRequired.i18n,
              invalid: () => TkValidationError.invalidEmail.i18n,
            ),
          ),
    );
  }
}
