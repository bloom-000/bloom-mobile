import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import 'app_locales.dart';
import 'translation_keys.dart';

@injectable
class AppTranslations extends Translations {
  @override
  Map<Locale, Map<String, String>> get keys => <Locale, Map<String, String>>{
        AppLocales.localeEn: _enUs,
      };

  final Map<String, String> _enUs = <String, String>{
    TkCommon.signIn: 'Sign in',

    TkWelcome.captionPage1: 'Esuada fames ac turpis egestas. Integer orci dui, vehicula in urna sed, sollicitudin tempus risus',
    TkWelcome.captionPage2: 'Phasellus semper, erat ut scelerisque pellentesque',
    TkWelcome.captionPage3: 'Amet libero. Sed vel sem sed dolor egestas fermentum in in urna. Sed volutpat, sem id',
    TkWelcome.captionPage4: 'Donec tincidunt tellus lacus. Ut vehicula',
    TkWelcome.bottomCaption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tincidunt, mauris',
    TkWelcome.buttonCreateAccount: 'Or create account',
  };
}
