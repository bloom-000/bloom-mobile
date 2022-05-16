import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../common/bloc/bloc_provider_alias.dart';
import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import 'state/home_page_categories_cubit.dart';
import 'state/home_page_cubit.dart';
import 'state/home_page_products_cubit.dart';
import 'state/home_page_promoted_products_cubit.dart';
import 'state/home_page_trendy_products_cubit.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<BlocProviderAlias> blocs() {
    return <BlocProviderAlias>[
      BlocProvider<HomePageCubit>(
        create: (_) => getIt<HomePageCubit>(),
      ),
      BlocProvider<HomePagePromotedProductsCubit>(
        create: (_) => getIt<HomePagePromotedProductsCubit>()..init(),
      ),
      BlocProvider<HomePageTrendyProductsCubit>(
        create: (_) => getIt<HomePageTrendyProductsCubit>()..init(),
      ),
      BlocProvider<HomePageCategoriesCubit>(
        create: (_) => getIt<HomePageCategoriesCubit>()..init(),
      ),
      BlocProvider<HomePageProductsCubit>(
        create: (_) => getIt<HomePageProductsCubit>()..init(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(child: PromotedProducts()),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                TkHome.headerTrendyProducts.i18n,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: TrendyProductCategories()),
          const SliverSizedBox(height: 18),
          const SliverToBoxAdapter(child: TrendyProducts()),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                TkHome.headerFindMore.i18n,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: Products(),
          ),
        ],
      ),
    );
  }
}
