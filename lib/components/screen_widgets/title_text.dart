import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String? titleText;
  const TitleText({Key? key, this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      titleText!,
      style: theme.textTheme.titleMedium!
    );
  }
}
