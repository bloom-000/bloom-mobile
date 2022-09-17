import 'package:common_models/common_models.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../domain/model/product/product.dart';
import '../state/home_page_products_cubit.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageProductsCubit, DataState<FetchFailure, DataPage<Product>>>(
      builder: (_, DataState<FetchFailure, DataPage<Product>> state) {
        return state.maybeWhen(
          success: (DataPage<Product> data) => PagedGrid<Product>.sliver(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 240,
            ),
            data: data.items,
            totalCount: 4,
            onScrolledToEnd: context.read<HomePageProductsCubit>().onScrolledToEnd,
            itemBuilder: (_, Product product) => _Item(product: product),
          ),
          orElse: () => const SliverToBoxAdapter(),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.read<HomePageProductsCubit>().onProductPressed(product),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 4 / 3,
              child: SafeImage(
                url: '${Constants.apiUrl}/${product.primaryImagePath}',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            if (product.description != null) ...<Widget>[
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
