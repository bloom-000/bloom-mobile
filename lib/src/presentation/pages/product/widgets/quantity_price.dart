import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../domain/model/product/product.dart';
import '../state/product_page_cubit.dart';
import '../state/product_page_product_cubit.dart';

class QuantityPrice extends StatelessWidget {
  const QuantityPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat numberFormat =
        NumberFormat.currency(locale: StaticI18N.locale?.languageCode, name: '');

    return BlocBuilder<ProductPageProductCubit, DataState<FetchFailure, Product>>(
      builder: (_, DataState<FetchFailure, Product> productState) {
        return productState.maybeWhen(
          success: (Product data) => BlocBuilder<ProductPageCubit, ProductPageState>(
            builder: (_, ProductPageState state) {
              return Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: theme.colorScheme.secondary,
                    ),
                    child: Row(
                      children: <Widget>[
                        Material(
                          type: MaterialType.transparency,
                          child: IconButton(
                            onPressed: context.read<ProductPageCubit>().onDecrementPressed,
                            constraints: BoxConstraints.tight(const Size.square(36)),
                            icon: const Icon(Icons.remove),
                            iconSize: 18,
                            splashRadius: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          state.quantity.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 12),
                        Material(
                          type: MaterialType.transparency,
                          child: IconButton(
                            onPressed: context.read<ProductPageCubit>().onIncrementPressed,
                            constraints: BoxConstraints.tight(const Size.square(36)),
                            icon: const Icon(Icons.add),
                            iconSize: 18,
                            splashRadius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: '\$${numberFormat.format(state.quantity * data.price)}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.8,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'usd',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: theme.secondaryHeaderColor,
                                letterSpacing: 0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              );
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
