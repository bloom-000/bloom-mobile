import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../values/assets.dart';
import '../state/sign_in_page_cubit.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _SocialButton(
          onPressed: context.read<SignInPageCubit>().onGooglePressed,
          assetName: Assets.iconGoogle,
        ),
        const SizedBox(width: 20),
        _SocialButton(
          onPressed: context.read<SignInPageCubit>().onFacebookPressed,
          assetName: Assets.iconFacebook,
        ),
        const SizedBox(width: 20),
        _SocialButton(
          onPressed: context.read<SignInPageCubit>().onApplePressed,
          assetName: Assets.iconApple,
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.onPressed,
    required this.assetName,
  });

  final VoidCallback onPressed;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Expanded(
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        color: theme.primaryColor,
        onPressed: onPressed,
        highlightColor: theme.primaryColorLight,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}
