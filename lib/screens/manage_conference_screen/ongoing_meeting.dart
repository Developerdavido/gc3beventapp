import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/manage_conference_screen/conference_widgets/circular_btn_pressed.dart';

class OngoingMeeting extends StatelessWidget {
  final VoidCallback? onCancel;
  final VoidCallback? onTap;
  final String? eventTitle;
  const OngoingMeeting({Key? key, this.onTap, this.onCancel, this.eventTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.0.h),
      child: Container(
        width: 0.9.sw,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.circular(23.r),
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.supervisor_account_rounded, size: 24.sp, color: AppColors.secondaryColor,
            ),
            Utils.horizontalPadding(space: 6.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("IT department brainstorming session",
                  style: theme.textTheme.headlineMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 0,
                  ),
                ),
                Text("ongoing meeting",
                  style: theme.textTheme.labelSmall!.copyWith(
                    color: AppColors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            Spacer(),
            CircularBtn(
              btnColor: AppColors.secondaryColor,
              containerColor: AppColors.pink,
              data: Icons.clear,
              onPressed: onCancel,
            ),
            CircularBtn(
              btnColor: AppColors.onPrimaryColor,
              containerColor: AppColors.secondaryColor,
              data: Icons.arrow_forward_rounded,
              onPressed: onTap,
            ),
          ],
        )
        ),
    );
  }
}
