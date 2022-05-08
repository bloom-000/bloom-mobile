import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import 'state/welcome_page_cubit.dart';
import 'widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomePageCubit>(
      create: (_) => getIt<WelcomePageCubit>()..init(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 16);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Expanded(
              flex: 4,
              child: ImagePager(),
            ),
            Padding(
              padding: padding,
              child: Text(
                TkWelcome.bottomCaption.i18n,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(padding: padding, child: ButtonSignIn()),
            const SizedBox(height: 12),
            const Padding(padding: padding, child: ButtonCreateAccount()),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
