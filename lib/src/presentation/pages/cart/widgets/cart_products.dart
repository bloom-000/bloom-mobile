import 'package:common_models/common_models.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../common/constants.dart';
import '../../../../domain/model/cart_product/cart_product.dart';
import '../state/cart_page_cart_products_cubit.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartPageCartProductsCubit, DataState<FetchFailure, DataPage<CartProduct>>>(
      builder: (_, DataState<FetchFailure, DataPage<CartProduct>> state) {
        return state.maybeWhen(
          success: (DataPage<CartProduct> data) => PagedList<CartProduct>(
            data: data.items,
            totalCount: data.count,
            onScrolledToEnd: context.read<CartPageCartProductsCubit>().onScrolledToEnd,
            itemBuilder: (_, CartProduct cartProduct) => _Item(cartProduct: cartProduct),
          ),
          failure: (FetchFailure failure, DataPage<CartProduct>? data) =>
              RefreshableList<CartProduct>(
            data: data?.items,
            itemBuilder: (_, CartProduct cartProduct) => _Item(cartProduct: cartProduct),
            onRefreshPressed: context.read<CartPageCartProductsCubit>().onRefreshPressed,
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: StaticI18N.locale?.languageCode, name: '');

    return Container(
      height: 84,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: <Widget>[
          SafeImage(
            url: '${Constants.apiUrl}/${cartProduct.product?.primaryImagePath}',
            width: 78,
            height: 78,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cartProduct.product?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cartProduct.product?.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => context
                          .read<CartPageCartProductsCubit>()
                          .onCartProductDecrementPressed(cartProduct),
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: theme.primaryColor,
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 18,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(cartProduct.quantity.toString()),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => context
                          .read<CartPageCartProductsCubit>()
                          .onCartProductIncrementPressed(cartProduct),
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: theme.colorScheme.secondary,
                        ),
                        child: const Icon(Icons.add, size: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Material(
                type: MaterialType.transparency,
                child: IconButton(
                  onPressed: () => context
                      .read<CartPageCartProductsCubit>()
                      .onCartProductRemovePressed(cartProduct),
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  alignment: const Alignment(1.0, -.8),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
              Text(
                '\$${currencyFormat.format(cartProduct.quantity * (cartProduct.product?.price ?? 0))}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
