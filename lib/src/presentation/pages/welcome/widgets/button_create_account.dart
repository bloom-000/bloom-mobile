import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/welcome_page_cubit.dart';

class ButtonCreateAccount extends StatelessWidget {
  const ButtonCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        onPressed: context.read<WelcomePageCubit>().onCreateAccountPressed,
        textColor: theme.textTheme.bodyText1?.color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(TkWelcome.buttonCreateAccount.i18n),
            const SizedBox(width: 4),
            SvgPicture.asset(Assets.iconArrowRightLong),
          ],
        ),
      ),
    );
  }
}
