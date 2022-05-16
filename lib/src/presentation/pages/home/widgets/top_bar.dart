import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../values/assets.dart';
import '../state/home_page_cubit.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(0, 56);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            onPressed: context.read<HomePageCubit>().onSearchPressed,
            icon: SvgPicture.asset(Assets.iconSearch),
            splashRadius: 20,
          ),
          IconButton(
            onPressed: context.read<HomePageCubit>().onPackagePressed,
            icon: SvgPicture.asset(Assets.iconPackage),
            splashRadius: 20,
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
