import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../values/assets.dart';
import '../state/main_page_cubit.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color? selectedIconColor = theme.bottomNavigationBarTheme.selectedIconTheme?.color;
    final Color? unselectedIconColor = theme.bottomNavigationBarTheme.unselectedIconTheme?.color;

    return BlocBuilder<MainPageCubit, MainPageState>(
      buildWhen: (MainPageState previous, MainPageState current) =>
          previous.pageIndex != current.pageIndex,
      builder: (_, MainPageState state) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.iconHome,
                color: state.pageIndex == 0 ? selectedIconColor : unselectedIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.iconShoppingCart,
                color: state.pageIndex == 1 ? selectedIconColor : unselectedIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.iconHeart,
                color: state.pageIndex == 2 ? selectedIconColor : unselectedIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.iconUser,
                color: state.pageIndex == 3 ? selectedIconColor : unselectedIconColor,
              ),
              label: '',
            ),
          ],
          currentIndex: state.pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: context.read<MainPageCubit>().onBottomNavItemPressed,
          type: BottomNavigationBarType.fixed,
        );
      },
    );
  }
}
