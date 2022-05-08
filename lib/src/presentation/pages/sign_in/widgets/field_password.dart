import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/sign_in_page_cubit.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SignInPageCubit, SignInPageState>(
      buildWhen: (SignInPageState previous, SignInPageState current) =>
          previous.isPasswordFieldObscured != current.isPasswordFieldObscured,
      builder: (_, SignInPageState state) {
        return TextFormField(
          maxLength: 512,
          obscureText: state.isPasswordFieldObscured,
          decoration: InputDecoration(
            hintText: TkFieldHint.password.i18n,
            counterText: '',
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
              child: SvgPicture.asset(Assets.iconLock),
            ),
            suffixIcon: GestureDetector(
              onTap: context.read<SignInPageCubit>().onPasswordEyePressed,
              child: SvgPicture.asset(
                state.isPasswordFieldObscured ? Assets.iconEye : Assets.iconEyeOff,
                width: 18,
                height: 18,
                fit: BoxFit.scaleDown,
                color: theme.secondaryHeaderColor
              ),
            ),
          ),
          onChanged: context.read<SignInPageCubit>().onPasswordChanged,
          validator: (_) => context.read<SignInPageCubit>().state.password.value.fold(
                (PasswordFailure l) => l.maybeWhen(
                  empty: () => TkValidationError.fieldIsRequired.i18n,
                  tooShort: () => TkValidationError.passwordIsTooShort.i18n,
                  orElse: () => '',
                ),
                (_) => null,
              ),
        );
      },
    );
  }
}
