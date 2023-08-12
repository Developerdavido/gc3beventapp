import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  final String? titleText;
  const TitleText({Key? key, this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 233.w,
      child: Text(
        titleText!,
        style: theme.textTheme.titleMedium!
      ),
    );
  }
}
