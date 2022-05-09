import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/enum/gender.dart';

@injectable
class GenderMapper extends BaseMapper<String, Gender?> {
  @override
  String mapToLeft(Gender? r) {
    switch (r) {
      case Gender.male:
        return 'MALE';
      case Gender.female:
        return 'FEMALE';
      case Gender.other:
        return 'OTHER';
      default:
        return '';
    }
  }

  @override
  Gender? mapToRight(String l) {
    switch (l) {
      case 'MALE':
        return Gender.male;
      case 'FEMALE':
        return Gender.female;
      case 'OTHER':
        return Gender.other;
      default:
        return null;
    }
  }
}
