import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class MeetingDateAndTime extends StatelessWidget {
  final IconData? iconData;
  final String? data;
  const MeetingDateAndTime({Key? key, this.iconData, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 17.sp,
          color: AppColors.primaryColor
        ),
        Utils.horizontalPadding(space: 25.w),
        Text(
          data ?? "",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: AppColors.primaryColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
