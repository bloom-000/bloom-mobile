import 'package:static_i18n/static_i18n.dart';

import '../../../domain/enum/gender.dart';
import '../translation_keys.dart';

extension GenderI18nX on Gender {
  String translate() {
    switch (this) {
      case Gender.male:
        return TkEnum.gender.male.i18n;
      case Gender.female:
        return TkEnum.gender.female.i18n;
      case Gender.other:
        return TkEnum.gender.other.i18n;
    }
  }
}
