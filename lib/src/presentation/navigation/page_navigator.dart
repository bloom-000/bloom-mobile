import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

import 'routes.dart';

@lazySingleton
class PageNavigator {
  void pop<T extends Object?>({
    T? result,
  }) =>
      GlobalNavigator.pop(result: result);

  void toWelcomePage() => GlobalNavigator.pushNamedAndRemoveAll(Routes.welcome);

  void toMainPage() => GlobalNavigator.pushNamedAndRemoveAll(Routes.main);

  void toSignUpPage() => GlobalNavigator.pushNamed(Routes.signUp);

  void toSignInPage() => GlobalNavigator.pushNamed(Routes.signIn);
}
