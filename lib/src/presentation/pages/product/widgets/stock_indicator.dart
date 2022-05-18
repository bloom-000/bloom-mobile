import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../domain/model/product/product.dart';
import '../../../i18n/translation_keys.dart';
import '../state/product_page_product_cubit.dart';

class StockIndicator extends StatelessWidget {
  const StockIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BlocBuilder<ProductPageProductCubit, DataState<FetchFailure, Product>>(
        builder: (_, DataState<FetchFailure, Product> state) {
          return state.maybeWhen(
            success: (Product data) => Text(
              '${data.stockQuantity} ${TkProduct.inStock.i18n}',
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
