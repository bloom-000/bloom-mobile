import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../domain/model/product/product.dart';
import '../../../i18n/translation_keys.dart';
import '../state/product_page_product_cubit.dart';

class NameReview extends StatelessWidget {
  const NameReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<ProductPageProductCubit, DataState<FetchFailure, Product>>(
      builder: (_, DataState<FetchFailure, Product> state) {
        return state.maybeWhen(
          success: (Product data) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  data.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: List<Widget>.generate(
                      5,
                      (_) => const Icon.new(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '(${123} ${TkProduct.reviews.i18n})',
                    style: TextStyle(color: theme.secondaryHeaderColor, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
