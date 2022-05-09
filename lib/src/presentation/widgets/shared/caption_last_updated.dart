import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../i18n/translation_keys.dart';

class CaptionLastUpdated extends StatelessWidget {
  const CaptionLastUpdated({
    Key? key,
    required this.lastUpdatedAt,
  }) : super(key: key);

  final DateTime lastUpdatedAt;

  @override
  Widget build(BuildContext context) {
    final DateFormat _dateFormat = DateFormat('MMMM dd, yyyy', StaticI18N.locale?.languageCode);
    final ThemeData theme = Theme.of(context);

    return Text(
      '${TkCommon.lastUpdatedAt.i18n} ${_dateFormat.format(lastUpdatedAt)}',
      style: TextStyle(color: theme.secondaryHeaderColor),
    );
  }
}
