import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/sign_up_page_cubit.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SignUpPageCubit, SignUpPageState>(
      buildWhen: (SignUpPageState previous, SignUpPageState current) =>
          previous.isPasswordFieldObscured != current.isPasswordFieldObscured,
      builder: (_, SignUpPageState state) {
        return TextFormField(
          maxLength: 512,
          obscureText: state.isPasswordFieldObscured,
          decoration: InputDecoration(
            hintText: TkFieldHint.password.i18n,
            counterText: '',
            suffixIcon: GestureDetector(
              onTap: context.read<SignUpPageCubit>().onPasswordEyePressed,
              child: SvgPicture.asset(
                state.isPasswordFieldObscured ? Assets.iconEye : Assets.iconEyeOff,
                width: 18,
                height: 18,
                fit: BoxFit.scaleDown,
                color: theme.secondaryHeaderColor,
              ),
            ),
          ),
          onChanged: context.read<SignUpPageCubit>().onPasswordChanged,
          validator: (_) => context.read<SignUpPageCubit>().state.password.failureToString(
                (PasswordFailure l) => l.maybeWhen(
                  empty: () => TkValidationError.fieldIsRequired.i18n,
                  tooShort: () => TkValidationError.passwordIsTooShort.i18n,
                  orElse: () => '',
                ),
              ),
        );
      },
    );
  }
}
