import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class ConferenceBottomWidget extends StatelessWidget {
  final Conference? conference;
  const ConferenceBottomWidget({Key? key,this.conference,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.r),
        color: AppColors.lightPrimaryColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    conference?.theme ?? "",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    )
                ),
                Text(
                  "${conference?.conferenceVenue?.name ?? ""} | ${conference!.getConferenceTime(
                      conference!.startDateTime!)}",
                  style:theme.textTheme.bodySmall!.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  )
                ),

              ],
            ),
          ),
          Utils.horizontalPadding(space: 16.w),
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: ShapeDecoration(
              color: AppColors.secondaryColor ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(65.r),
              ),
            ),
            child: Text(
                '\$15',
                style: theme.textTheme.bodySmall!.copyWith(
                  color: AppColors.onPrimaryColor,
                  fontSize: 18.5.sp,
                  fontWeight: FontWeight.w600,
                )
            ),
          )
        ],
      ),
    );
  }
}
