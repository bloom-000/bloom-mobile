import 'package:common_models/common_models.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../domain/model/product/product.dart';
import '../state/home_page_trendy_products_cubit.dart';

class TrendyProducts extends StatelessWidget {
  const TrendyProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageTrendyProductsCubit, DataState<FetchFailure, DataPage<Product>>>(
      builder: (_, DataState<FetchFailure, DataPage<Product>> state) {
        return state.maybeWhen(
          success: (DataPage<Product> data) {
            return SizedBox(
              height: 100,
              child: PagedList<Product>(
                config: const ListBuilderConfig(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                data: data.items,
                totalCount: data.count,
                onScrolledToEnd: context.read<HomePageTrendyProductsCubit>().onScrolledToEnd,
                itemBuilder: (_, Product product) => _Item(product: product),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SafeImage(
        url: '${Constants.apiUrl}/${product.primaryImagePath}',
        width: 100,
        height: 100,
        placeholderColor: theme.colorScheme.secondaryContainer,
      ),
    );
  }
}
