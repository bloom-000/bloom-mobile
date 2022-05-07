import 'package:common_utilities/common_utilities.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AbstractComponentsModule {
  @lazySingleton
  EventBus get eventBus => EventBus();
}
