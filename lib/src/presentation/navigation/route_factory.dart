import 'package:flutter/material.dart';

import '../pages/init/init_page.dart';
import '../pages/main/main_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../pages/welcome/welcome_page.dart';
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
    default:
      throw Exception('route ${settings.name} is not supported');
  }
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
