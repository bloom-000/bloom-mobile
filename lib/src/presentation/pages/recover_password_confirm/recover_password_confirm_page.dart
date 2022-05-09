import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import '../../navigation/route_args/recover_password_confirm_page_args.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/helper_line.dart';
import 'state/recover_password_confirm_page_cubit.dart';
import 'widgets/widgets.dart';

class RecoverPasswordConfirmPage extends StatelessWidget {
  const RecoverPasswordConfirmPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final RecoverPasswordConfirmPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecoverPasswordConfirmPageCubit>(
      create: (_) => getIt<RecoverPasswordConfirmPageCubit>()..init(args),
      child: _Content(args: args),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.args,
  }) : super(key: key);

  final RecoverPasswordConfirmPageArgs args;

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
                    TkRecoverPasswordConfirm.header.i18n,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                sliver: SliverToBoxAdapter(child: FieldCode()),
              ),
              for (final String caption in <String>[
                '${TkRecoverPasswordConfirm.helperCaption1.i18n} ${args.email}',
                TkRecoverPasswordConfirm.helperCaption2.i18n
              ])
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  sliver: SliverToBoxAdapter(
                    child: HelperLine(text: caption),
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
