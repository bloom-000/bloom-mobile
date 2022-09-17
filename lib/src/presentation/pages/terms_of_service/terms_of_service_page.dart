import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection_config.dart';
import 'state/terms_of_service_page_cubit.dart';
import 'widgets/widgets.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TermsOfServicePageCubit>(
      create: (_) => getIt<TermsOfServicePageCubit>()..init(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverSizedBox(height: 16),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 6),
              sliver: SliverToBoxAdapter(child: CaptionLastUpdated()),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: DocumentParagraphs(),
            ),
          ],
        ),
      ),
    );
  }
}
