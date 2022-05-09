import 'package:flutter/material.dart';

import '../../../di/injection_config.dart';
import '../../../domain/manager/authentication_manager.dart';
import '../../navigation/page_navigator.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await getIt<AuthenticationManager>().signOut();
            getIt<PageNavigator>().toWelcomePage();
          },
          child: const Text('Sign out'),
        ),
      ),
    );
  }
}
