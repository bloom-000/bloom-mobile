import 'package:flutter/material.dart';

class LoadingTextButton extends StatelessWidget {
  const LoadingTextButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.label,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label),
          const SizedBox(width: 8),
          SizedBox.square(
            dimension: 15,
            child: CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
              strokeWidth: 1,
            ),
          ),
        ],
      ) : Text(label),
    );
  }
}
