import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class FeedIcon extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  const FeedIcon({Key? key, this.iconData, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 18.sp,
          color: AppColors.blue,
        ),
        Utils.horizontalPadding(space: 4.w),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          )
        )
      ],
    );
  }
}
