import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../state/cart_page_cubit.dart';

class ButtonCheckout extends StatelessWidget {
  const ButtonCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<CartPageCubit>().onCheckoutPressed,
      child: Text(TkCart.proceedToCheckout.i18n),
    );
  }
}
