import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection_config.dart';
import 'state/sign_up_page_cubit.dart';
import 'widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpPageCubit>(
      create: (_) => getIt<SignUpPageCubit>(),
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
          children: <Widget>[
            const HeaderContainer(),
            Expanded(
              child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
                buildWhen: (SignUpPageState previous, SignUpPageState current) =>
                    previous.validateForm != current.validateForm,
                builder: (_, SignUpPageState state) {
                  return ValidatedForm(
                    showErrors: state.validateForm,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        const SliverSizedBox(height: 42),
                        const SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: FieldFullName(),
                          ),
                        ),
                        const SliverSizedBox(height: 20),
                        const SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: FieldEmail(),
                          ),
                        ),
                        const SliverSizedBox(height: 20),
                        SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: FieldBirthDate(),
                          ),
                        ),
                        const SliverSizedBox(height: 20),
                        const SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: FieldGender(),
                          ),
                        ),
                        const SliverSizedBox(height: 20),
                        const SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: FieldPassword(),
                          ),
                        ),
                        const SliverSizedBox(height: 20),
                        const SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: FieldRepeatedPassword(),
                          ),
                        ),
                        const SliverSizedBox(height: 20),
                        const SliverPadding(
                          padding: padding,
                          sliver: SliverToBoxAdapter(
                            child: LegalTerms(),
                          ),
                        ),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: const SizedBox(
                              width: double.infinity,
                              child: ButtonSignUp(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
