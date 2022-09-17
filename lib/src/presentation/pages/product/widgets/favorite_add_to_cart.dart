import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../widgets/loading_text_button.dart';
import '../state/product_page_cubit.dart';

class FavoriteAddToCart extends StatelessWidget {
  const FavoriteAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(border: Border.all()),
          child: IconButton(
            onPressed: context.read<ProductPageCubit>().onHeartPressed,
            icon: const Icon(Icons.favorite_border),
            constraints: BoxConstraints.tight(const Size.square(40)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: BlocBuilder<ProductPageCubit, ProductPageState>(
            builder: (_, ProductPageState state) {
              return LoadingTextButton(
                isLoading: state.addToCartInProgress,
                onPressed: context.read<ProductPageCubit>().onAddToCartPressed,
                label: TkProduct.addToCart.i18n,
              );
            },
          ),
        )
      ],
    );
  }
}
