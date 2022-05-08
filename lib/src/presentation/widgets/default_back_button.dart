import 'package:flutter/material.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const BackButtonIcon(),
      color: color,
      splashRadius: 24,
      onPressed: () => Navigator.maybePop(context),
    );
  }
}
