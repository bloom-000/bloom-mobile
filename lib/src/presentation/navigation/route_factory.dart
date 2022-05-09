import 'package:flutter/material.dart';

import '../pages/init/init_page.dart';
import '../pages/main/main_page.dart';
import '../pages/privacy_policy/privacy_policy_page.dart';
import '../pages/recover_password_change/recover_password_change_page.dart';
import '../pages/recover_password_confirm/recover_password_confirm_page.dart';
import '../pages/recover_password_request/recover_password_request_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../pages/terms_of_service/terms_of_service_page.dart';
import '../pages/welcome/welcome_page.dart';
import 'route_args/recover_password_change_page_args.dart';
import 'route_args/recover_password_confirm_page_args.dart';
import 'routes.dart';

Route<dynamic>? routeFactory(RouteSettings settings) {
  switch (settings.name) {
    case Routes.root:
      return _createRootPageRoute(settings);
    case Routes.welcome:
      return _createWelcomePageRoute(settings);
    case Routes.main:
      return _createMainPageRoute(settings);
    case Routes.signIn:
      return _createSignInPageRoute(settings);
    case Routes.signUp:
      return _createSignUpPageRoute(settings);
    case Routes.termsOfService:
      return _createTermsOfServicePageRoute(settings);
    case Routes.privacyPolicy:
      return _createPrivacyPolicyPageRoute(settings);
    case Routes.recoverPasswordRequest:
      return _createRecoverPasswordRequestPageRoute(settings);
    case Routes.recoverPasswordConfirm:
      return _createRecoverPasswordConfirmPageRoute(settings);
    case Routes.recoverPasswordChange:
      return _createRecoverPasswordChangePageRoute(settings);
    default:
      throw Exception('route ${settings.name} is not supported');
  }
}

Route<void> _createRecoverPasswordChangePageRoute(RouteSettings settings) {
  if (settings.arguments == null || settings.arguments is! RecoverPasswordChangePageArgs) {
    throw Exception('args type of $RecoverPasswordChangePageArgs is required');
  }

  final RecoverPasswordChangePageArgs args = settings.arguments! as RecoverPasswordChangePageArgs;

  return MaterialPageRoute<void>(
    builder: (_) => RecoverPasswordChangePage(args: args),
    settings: settings,
  );
}

Route<void> _createRecoverPasswordConfirmPageRoute(RouteSettings settings) {
  if (settings.arguments == null || settings.arguments is! RecoverPasswordConfirmPageArgs) {
    throw Exception('args type of $RecoverPasswordConfirmPageArgs is required');
  }

  final RecoverPasswordConfirmPageArgs args = settings.arguments! as RecoverPasswordConfirmPageArgs;

  return MaterialPageRoute<void>(
    builder: (_) => RecoverPasswordConfirmPage(args: args),
    settings: settings,
  );
}

Route<void> _createRecoverPasswordRequestPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const RecoverPasswordRequestPage(),
    settings: settings,
  );
}

Route<void> _createPrivacyPolicyPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const PrivacyPolicyPage(),
    settings: settings,
  );
}

Route<void> _createTermsOfServicePageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const TermsOfServicePage(),
    settings: settings,
  );
}

Route<void> _createSignUpPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const SignUpPage(),
    settings: settings,
  );
}

Route<void> _createSignInPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const SignInPage(),
    settings: settings,
  );
}

Route<void> _createMainPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const MainPage(),
    settings: settings,
  );
}

Route<void> _createWelcomePageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const WelcomePage(),
    settings: settings,
  );
}

Route<void> _createRootPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const InitPage(),
    settings: settings,
  );
}
