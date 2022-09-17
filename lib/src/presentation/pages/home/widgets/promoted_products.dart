import 'package:common_models/common_models.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../common/constants.dart';
import '../../../../domain/model/product/product.dart';
import '../../../i18n/translation_keys.dart';
import '../state/home_page_promoted_products_cubit.dart';

class PromotedProducts extends StatelessWidget {
  const PromotedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<HomePagePromotedProductsCubit, DataState<FetchFailure, List<Product>>>(
      builder: (_, DataState<FetchFailure, List<Product>> state) {
        return state.maybeWhen(
          success: (List<Product> data) => Carousel(
            indicatorOptions: CarouselIndicatorOptions(
              dotWidth: 6,
              dotHeight: 6,
            ),
            height: 175,
            itemCount: data.length,
            itemBuilder: (_, int index) {
              final Product product = data[index];

              final int discount =
                  ((product.price - (product.oldPrice ?? product.price)) / product.price * 100)
                      .round();

              return ColoredBox(
                color: theme.colorScheme.secondaryContainer,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 16,
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  product.name,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text.rich(
                                  TextSpan(
                                    text: '$discount%',
                                    style: TextStyle(
                                      color: theme.colorScheme.secondary,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    children: <InlineSpan>[
                                      const TextSpan(text: ' '),
                                      TextSpan(
                                        text: TkCommon.off.i18n,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () => context
                                      .read<HomePagePromotedProductsCubit>()
                                      .onShopNowPressed(product),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    ),
                                  ),
                                  child: Text(TkHome.buttonShopNow.i18n),
                                ),
                              ],
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: SafeImage(
                              url: '${Constants.apiUrl}/${product.primaryImagePath}',
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          orElse: () => Carousel(
            height: 175,
            itemCount: 1,
            itemBuilder: (_, __) => Container(
              height: 175,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}
