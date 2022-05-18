import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

import 'route_args/product_page_args.dart';
import 'route_args/recover_password_change_page_args.dart';
import 'route_args/recover_password_confirm_page_args.dart';
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

  void toTermsOfServicePage() => GlobalNavigator.pushNamed(Routes.termsOfService);

  void toPrivacyPolicyPage() => GlobalNavigator.pushNamed(Routes.privacyPolicy);

  void toRecoverPasswordRequestPage() => GlobalNavigator.pushNamed(Routes.recoverPasswordRequest);

  void toRecoverPasswordConfirmPage(RecoverPasswordConfirmPageArgs args) =>
      GlobalNavigator.pushNamed(Routes.recoverPasswordConfirm, arguments: args);

  void toRecoverPasswordChangePage(RecoverPasswordChangePageArgs args) =>
      GlobalNavigator.pushNamed(Routes.recoverPasswordChange, arguments: args);

  void toProductPage(ProductPageArgs args) =>
      GlobalNavigator.pushNamed(Routes.product, arguments: args);
}
