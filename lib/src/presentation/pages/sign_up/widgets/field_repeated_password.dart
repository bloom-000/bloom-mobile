import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/sign_up_page_cubit.dart';

class FieldRepeatedPassword extends StatelessWidget {
  const FieldRepeatedPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SignUpPageCubit, SignUpPageState>(
      buildWhen: (SignUpPageState previous, SignUpPageState current) =>
          previous.isRepeatedPasswordFieldObscured != current.isRepeatedPasswordFieldObscured,
      builder: (_, SignUpPageState state) {
        return TextFormField(
          maxLength: 512,
          obscureText: state.isRepeatedPasswordFieldObscured,
          decoration: InputDecoration(
            hintText: TkFieldHint.repeatPassword.i18n,
            counterText: '',
            suffixIcon: GestureDetector(
              onTap: context.read<SignUpPageCubit>().onRepeatedPasswordEyePressed,
              child: SvgPicture.asset(
                state.isRepeatedPasswordFieldObscured ? Assets.iconEye : Assets.iconEyeOff,
                width: 18,
                height: 18,
                fit: BoxFit.scaleDown,
                color: theme.secondaryHeaderColor,
              ),
            ),
          ),
          onChanged: context.read<SignUpPageCubit>().onRepeatedPasswordChanged,
          validator: (_) => context.read<SignUpPageCubit>().state.repeatedPassword.value.fold(
                (RepeatedPasswordFailure l) => l.when(
                  empty: () => TkValidationError.fieldIsRequired.i18n,
                  doesNotMatch: () => TkValidationError.repeatedPasswordDoesNotMatch.i18n,
                ),
                (_) => null,
              ),
        );
      },
    );
  }
}
