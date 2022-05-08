import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/sign_up_page_cubit.dart';

class FieldBirthDate extends StatelessWidget {
  FieldBirthDate({Key? key}) : super(key: key);

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: context.read<SignUpPageCubit>().onBirthDatePressed,
      child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
        buildWhen: (SignUpPageState previous, SignUpPageState current) =>
            previous.birthDate != current.birthDate ||
            previous.validateForm != current.validateForm,
        builder: (_, SignUpPageState state) {
          return InputDecorator(
            decoration: InputDecoration(
              errorText: state.validateForm && state.birthDate == null
                  ? TkValidationError.fieldIsRequired.i18n
                  : null,
              suffixIcon: SvgPicture.asset(
                Assets.iconCalendar,
                width: 18,
                height: 18,
                fit: BoxFit.scaleDown,
                color: theme.secondaryHeaderColor,
              ),
            ),
            child: state.birthDate != null
                ? Text(_dateFormat.format(state.birthDate!))
                : Text(
                    TkFieldHint.birthDate.i18n,
                    style: TextStyle(color: theme.secondaryHeaderColor),
                  ),
          );
        },
      ),
    );
  }
}
