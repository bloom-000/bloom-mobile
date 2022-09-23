import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/recover_password_change_page_cubit.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<RecoverPasswordChangePageCubit, RecoverPasswordChangePageState>(
      buildWhen: (
        RecoverPasswordChangePageState previous,
        RecoverPasswordChangePageState current,
      ) =>
          previous.isPasswordFieldObscured != current.isPasswordFieldObscured,
      builder: (_, RecoverPasswordChangePageState state) {
        return TextFormField(
          maxLength: 512,
          obscureText: state.isPasswordFieldObscured,
          decoration: InputDecoration(
            hintText: TkFieldHint.newPassword.i18n,
            counterText: '',
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
              child: SvgPicture.asset(Assets.iconLock),
            ),
            suffixIcon: GestureDetector(
              onTap: context.read<RecoverPasswordChangePageCubit>().onPasswordEyePressed,
              child: SvgPicture.asset(
                state.isPasswordFieldObscured ? Assets.iconEye : Assets.iconEyeOff,
                fit: BoxFit.scaleDown,
                color: theme.secondaryHeaderColor,
              ),
            ),
          ),
          onChanged: context.read<RecoverPasswordChangePageCubit>().onPasswordChanged,
          validator: (_) =>
              context.read<RecoverPasswordChangePageCubit>().state.password.failureToString(
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
