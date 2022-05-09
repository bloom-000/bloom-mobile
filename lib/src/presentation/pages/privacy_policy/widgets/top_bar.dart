import 'package:flutter/material.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/default_back_button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(0, 56);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(TkPrivacyPolicy.header.i18n),
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: theme.textTheme.bodyText1?.color,
      ),
      centerTitle: true,
      leading: DefaultBackButton(color: theme.colorScheme.onBackground),
    );
  }
}
