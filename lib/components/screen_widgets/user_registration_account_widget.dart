import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class UserRegistrationAccountWidget extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final Color? circleAndIconColor;
  final Color? titleColor;
  final String? title;
  const UserRegistrationAccountWidget({Key? key, this.label, this.title, this.titleColor, this.labelColor, this.circleAndIconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 376.w,
      height: 182.h,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              right: 6.w,
              top: 5.h,
              child: Container(
                height: 45.h,
                width: 45.h,
                padding: EdgeInsets.all(11.w),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8, color: circleAndIconColor!),
                ),
                child: Icon(
                  CupertinoIcons.arrow_up_right,
                  color: circleAndIconColor,
                  size: 24.w,
                )
              )),
          Positioned(
            top: 17.h,
            left: 24.w,
            child: SizedBox(
              width: 147.w,
              child: Text(
                label!,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: labelColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400
                )
              ),
            ),
          ),
          Positioned(
            bottom: 17.h,
            left: 24.w,
            child: Text(
                title!,
                style: theme.textTheme.titleLarge!.copyWith(
                    color: titleColor,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w400
                )
            ),
          ),
        ],
      ),
    );
  }
}
