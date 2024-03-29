import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/bloc_provider_alias.dart';
import '../../../di/injection_config.dart';
import '../cart/cart_page.dart';
import '../home/home_page.dart';
import 'state/main_page_cubit.dart';
import 'widgets/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProviderAlias>[
        BlocProvider<MainPageCubit>(
          create: (_) => getIt<MainPageCubit>(),
        ),
        ...HomePage.blocs(),
        ...CartPage.blocs(),
      ],
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MainBottomNav(),
      body: SafeArea(
        child: MainContent(),
      ),
    );
  }
}
