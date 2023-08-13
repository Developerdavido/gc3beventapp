import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ConferenceBottomWidget extends StatelessWidget {
  final String? conferenceDate;
  final String? conferenceTheme;
  final VoidCallback? attendConference;
  const ConferenceBottomWidget({Key? key, this.conferenceDate, this.attendConference, this.conferenceTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              conferenceDate ?? "",
              style:theme.textTheme.bodySmall!.copyWith(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              )
            ),
            Utils.verticalPadding(space: 12.h),
            SizedBox(
              width: 187.w,
              child: Text(
                conferenceTheme ?? "",
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                )
              ),
            )
          ],
        ),
        InkWell(
          onTap: attendConference,
          child: Container(
            width: 128.11.w,
            height: 49.65.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(65.r),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.arrow_up_right,
                  color: AppColors.lightBlue,
                  size: 24.sp,
                ),
                Utils.horizontalPadding(space: 16.31.w),
                Text(
                  'Attend',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: AppColors.lightBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  )
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
