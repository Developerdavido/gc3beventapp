import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ProfileUiWidgets extends StatelessWidget {
  final double? height;
  final String? profileTitle;
  final Widget? widget;
  const ProfileUiWidgets({Key? key, this.profileTitle, this.widget, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.lightPrimaryColor
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profileTitle!,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color:  AppColors.primaryColor
            ),
            textAlign: TextAlign.left,
          ),
          Utils.verticalPadding(space: 16.h),
          Expanded(child: widget!)
        ],
      ),
    );
  }
}
