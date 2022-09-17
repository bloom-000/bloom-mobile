import 'package:flutter/material.dart';

class HelperLine extends StatelessWidget {
  const HelperLine({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.secondaryHeaderColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: theme.secondaryHeaderColor),
          ),
        ),
      ],
    );
  }
}
