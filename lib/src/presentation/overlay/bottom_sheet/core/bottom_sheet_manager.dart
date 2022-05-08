import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

import '../option_selector_bs.dart';

@lazySingleton
class BottomSheetManager {
  Future<T?> showOptionSelector<T extends Object?>({
    required String header,
    required List<T> options,
    required String Function(T option) toStringMapper,
  }) async {
    return GlobalNavigator.bottomSheet(OptionSelectorBS<T>(
      header: header,
      options: options,
      toStringMapper: toStringMapper,
    ));
  }
}
