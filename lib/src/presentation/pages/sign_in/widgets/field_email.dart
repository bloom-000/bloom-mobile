import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/sign_in_page_cubit.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 512,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: TkFieldHint.emailAddress.i18n,
        counterText: '',
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: SvgPicture.asset(Assets.iconEmail),
        ),
      ),
      onChanged: context.read<SignInPageCubit>().onEmailChanged,
      validator: (_) => context.read<SignInPageCubit>().state.email.value.fold(
            (l) => l.when(
              empty: () => TkValidationError.fieldIsRequired.i18n,
              invalid: () => TkValidationError.invalidEmail.i18n,
            ),
            (_) => null,
          ),
    );
  }
}
