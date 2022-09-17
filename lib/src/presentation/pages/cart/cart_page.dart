import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../common/bloc/bloc_provider_alias.dart';
import '../../../di/injection_config.dart';
import '../../i18n/translation_keys.dart';
import 'state/cart_page_cart_products_cubit.dart';
import 'state/cart_page_cubit.dart';
import 'widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static List<BlocProviderAlias> blocs() {
    return <BlocProviderAlias>[
      BlocProvider<CartPageCartProductsCubit>(
        create: (_) => getIt<CartPageCartProductsCubit>()..init(),
      ),
      BlocProvider<CartPageCubit>(
        create: (_) => getIt<CartPageCubit>(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(TkCart.header.i18n),
        titleTextStyle: TextStyle(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            onRefresh: context.read<CartPageCartProductsCubit>().onRefresh,
            child: const CartProducts(),
          ),
          const Positioned(
            right: 16,
            bottom: 16,
            child: ButtonCheckout(),
          )
        ],
      ),
    );
  }
}
