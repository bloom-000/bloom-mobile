import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/i18n_extensions/gender_i18n_extension.dart';
import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/sign_up_page_cubit.dart';

class FieldGender extends StatelessWidget {
  const FieldGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: context.read<SignUpPageCubit>().onGenderPressed,
      child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
        buildWhen: (SignUpPageState previous, SignUpPageState current) =>
            previous.gender != current.gender || previous.validateForm != current.validateForm,
        builder: (_, SignUpPageState state) {
          return InputDecorator(
            decoration: InputDecoration(
              errorText: state.validateForm && state.birthDate == null
                  ? TkValidationError.fieldIsRequired.i18n
                  : null,
              suffixIcon: SvgPicture.asset(
                Assets.iconChevronDown,
                width: 18,
                height: 18,
                fit: BoxFit.scaleDown,
                color: theme.secondaryHeaderColor,
              ),
            ),
            child: state.gender != null
                ? Text(state.gender!.translate())
                : Text(
                    TkFieldHint.gender.i18n,
                    style: TextStyle(color: theme.secondaryHeaderColor),
                  ),
          );
        },
      ),
    );
  }
}
