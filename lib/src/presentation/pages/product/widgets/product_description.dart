import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/product/product.dart';
import '../state/product_page_product_cubit.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPageProductCubit, DataState<FetchFailure, Product>>(
      builder: (_, DataState<FetchFailure, Product> state) {
        return state.maybeWhen(
          success: (Product data) => data.description != null
              ? Text(
                  data.description ?? '',
                  style: const TextStyle(fontSize: 15),
                )
              : const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
