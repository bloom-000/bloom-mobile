import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../i18n/translation_keys.dart';
import '../../../values/assets.dart';
import '../state/welcome_page_cubit.dart';

class ImagePager extends StatelessWidget {
  const ImagePager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        PageView(
          controller: context.read<WelcomePageCubit>().pageController,
          children: <Widget>[
            Image.asset(
              Assets.imageWelcomePager1,
              fit: BoxFit.cover,
            ),
            Image.asset(
              Assets.imageWelcomePager1,
              fit: BoxFit.cover,
            ),
            Image.asset(
              Assets.imageWelcomePager1,
              fit: BoxFit.cover,
            ),
            Image.asset(
              Assets.imageWelcomePager1,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 72,
          child: BlocBuilder<WelcomePageCubit, WelcomePageState>(
            buildWhen: (WelcomePageState previous, WelcomePageState current) =>
                previous.pageIndex != current.pageIndex,
            builder: (_, WelcomePageState state) {
              String text = '';
              switch (state.pageIndex) {
                case 0:
                  text = TkWelcome.captionPage1.i18n;
                  break;
                case 1:
                  text = TkWelcome.captionPage2.i18n;
                  break;
                case 2:
                  text = TkWelcome.captionPage3.i18n;
                  break;
                case 3:
                  text = TkWelcome.captionPage4.i18n;
                  break;
              }

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                  return Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  key: ValueKey<int>(state.pageIndex),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 16,
          right: 0,
          bottom: 42,
          child: PageIndicator(
            controller: context.read<WelcomePageCubit>().pageController,
            count: 4,
            effect:
                const ScrollingDotsEffect(dotHeight: 8, dotWidth: 8, activeDotColor: Colors.white),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}
