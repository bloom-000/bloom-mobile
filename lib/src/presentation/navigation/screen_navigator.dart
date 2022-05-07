import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PageNavigator {
  static void pop<T extends Object?>({
    T? result,
  }) =>
      GlobalNavigator.pop(result: result);
}
