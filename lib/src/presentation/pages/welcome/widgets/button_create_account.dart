import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/welcome_page_cubit.dart';

class ButtonCreateAccount extends StatelessWidget {
  const ButtonCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        onPressed: context.read<WelcomePageCubit>().onCreateAccountPressed,
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
