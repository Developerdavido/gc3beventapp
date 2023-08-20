import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/conference_indicator.dart';

class ProgramItemWidget extends StatelessWidget {
  final ConferenceIndicator? conferenceIndicator;
  final VoidCallback? onTap;
  ProgramItemWidget({Key? key, this.conferenceIndicator, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 87.h,
        width: 376.w,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          borderRadius: BorderRadius.circular(30.r)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(conferenceIndicator!.title!,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              Icon(conferenceIndicator!.iconData!, color: AppColors.black, size: 24.sp,),
            ],
          ),
        ),
      ),
    );
  }
}
