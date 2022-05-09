import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import '../../navigation/route_args/recover_password_change_page_args.dart';
import '../../widgets/default_back_button.dart';
import 'state/recover_password_change_page_cubit.dart';
import 'widgets/widgets.dart';

class RecoverPasswordChangePage extends StatelessWidget {
  const RecoverPasswordChangePage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final RecoverPasswordChangePageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecoverPasswordChangePageCubit>(
      create: (_) => getIt<RecoverPasswordChangePageCubit>()..init(args),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TapOutsideToClearFocus(
      child: Scaffold(
        appBar: AppBar(
          leading: DefaultBackButton(color: theme.colorScheme.onBackground),
        ),
        body: SafeArea(
          child: BlocBuilder<RecoverPasswordChangePageCubit, RecoverPasswordChangePageState>(
            buildWhen: (
              RecoverPasswordChangePageState previous,
              RecoverPasswordChangePageState current,
            ) =>
                previous.validateForm != current.validateForm,
            builder: (_, RecoverPasswordChangePageState state) {
              return ValidatedForm(
                showErrors: state.validateForm,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 42),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          TkRecoverPasswordChange.header.i18n,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      sliver: SliverToBoxAdapter(child: FieldPassword()),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      sliver: SliverToBoxAdapter(child: FieldRepeatedPassword()),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: const SizedBox(
                          width: double.infinity,
                          child: ButtonChangePassword(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
