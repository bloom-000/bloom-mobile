import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import 'state/sign_in_page_cubit.dart';
import 'widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInPageCubit>(
      create: (_) => getIt<SignInPageCubit>(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapOutsideToClearFocus(
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(child: HeaderContainer()),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: BlocBuilder<SignInPageCubit, SignInPageState>(
                    buildWhen: (SignInPageState previous, SignInPageState current) =>
                        previous.validateForm != current.validateForm,
                    builder: (_, SignInPageState state) {
                      return ValidatedForm(
                        showErrors: state.validateForm,
                        child: Column(
                          children: <Widget>[
                            const Spacer(),
                            const FieldEmail(),
                            const SizedBox(height: 16),
                            const FieldPassword(),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: ButtonForgotPassword(),
                            ),
                            const Spacer(),
                            const SizedBox(
                              width: double.infinity,
                              child: ButtonSignIn(),
                            ),
                            const SizedBox(height: 42),
                            Text(TkSignIn.captionContinueWith.i18n),
                            const SizedBox(height: 32),
                            const SocialButtons(),
                            const SizedBox(height: 52),
                            const ButtonSignUp(),
                            const SizedBox(height: 18),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
