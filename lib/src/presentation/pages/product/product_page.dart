import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/bloc_provider_alias.dart';
import '../../../di/injection_config.dart';
import '../../navigation/route_args/product_page_args.dart';
import 'state/product_page_cubit.dart';
import 'state/product_page_product_cubit.dart';
import 'widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.args,
  });

  final ProductPageArgs args;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProviderAlias>[
        BlocProvider<ProductPageCubit>(
          create: (_) => getIt<ProductPageCubit>()..init(args),
        ),
        BlocProvider<ProductPageProductCubit>(
          create: (_) => getIt<ProductPageProductCubit>()..init(args),
        ),
      ],
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: TopBar(
                      minExtent: 56 + mediaQueryData.padding.top,
                      maxExtent: mediaQueryData.size.height * .4,
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                    sliver: SliverToBoxAdapter(
                      child: NameReview(),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: ProductDescription(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: StockIndicator(),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: QuantityPrice(),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FavoriteAddToCart(),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
