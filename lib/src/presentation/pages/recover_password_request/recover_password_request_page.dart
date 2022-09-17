import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/helper_line.dart';
import 'state/recover_password_request_page_cubit.dart';
import 'widgets/widgets.dart';

class RecoverPasswordRequestPage extends StatelessWidget {
  const RecoverPasswordRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecoverPasswordRequestPageCubit>(
      create: (_) => getIt<RecoverPasswordRequestPageCubit>(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TapOutsideToClearFocus(
      child: Scaffold(
        appBar: AppBar(
          leading: DefaultBackButton(color: theme.colorScheme.onBackground),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 42),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    TkRecoverPasswordRequest.header.i18n,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              BlocBuilder<RecoverPasswordRequestPageCubit, RecoverPasswordRequestPageState>(
                buildWhen: (
                  RecoverPasswordRequestPageState previous,
                  RecoverPasswordRequestPageState current,
                ) =>
                    previous.validateForm != current.validateForm,
                builder: (_, RecoverPasswordRequestPageState state) {
                  return ValidatedForm(
                    showErrors: state.validateForm,
                    child: const SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverToBoxAdapter(child: FieldEmail()),
                    ),
                  );
                },
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 32, top: 8, right: 16),
                sliver: SliverToBoxAdapter(
                  child: HelperLine(text: TkRecoverPasswordRequest.helperCaption1.i18n),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: const SizedBox(
                    width: double.infinity,
                    child: ButtonContinue(),
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
