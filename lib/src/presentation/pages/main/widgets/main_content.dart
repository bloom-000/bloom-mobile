import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cart_page.dart';
import '../../favorites/favorites_page.dart';
import '../../home/home_page.dart';
import '../../profile/profile_page.dart';
import '../state/main_page_cubit.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      buildWhen: (MainPageState previous, MainPageState current) =>
          previous.pageIndex != current.pageIndex,
      builder: (_, MainPageState state) {
        switch (state.pageIndex) {
          case 0:
            return const HomePage();
          case 1:
            return const CartPage();
          case 2:
            return const FavoritesPage();
          case 3:
            return const ProfilePage();
          default:
            return Container(color: Colors.red);
        }
      },
    );
  }
}
