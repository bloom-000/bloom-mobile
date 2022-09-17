import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/recover_password_confirm_page_cubit.dart';

class FieldCode extends StatelessWidget {
  const FieldCode({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    final double w =
        mediaQueryData.size.width < 360 ? (mediaQueryData.size.width - 5 * 12 - 32) / 5 : 50;

    return PinPut(
      eachFieldWidth: w,
      eachFieldHeight: w * 1.2,
      withCursor: true,
      fieldsCount: 5,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      onChanged: context.read<RecoverPasswordConfirmPageCubit>().onCodeChanged,
      inputDecoration: const InputDecoration(
        counterText: '',
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        filled: false,
      ),
      submittedFieldDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: theme.primaryColorLight),
      ),
      selectedFieldDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: theme.primaryColor),
      ),
      followingFieldDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: theme.secondaryHeaderColor),
      ),
      eachFieldMargin: const EdgeInsets.symmetric(horizontal: 6),
      fieldsAlignment: MainAxisAlignment.center,
      pinAnimationType: PinAnimationType.scale,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
