import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';

class ConferenceEventDetails extends StatelessWidget {
  final Conference? conference;
  const ConferenceEventDetails({Key? key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.0.w),
          child: Text(
            "Event Details",
            style:theme.textTheme.headlineMedium!.copyWith(
              color: AppColors.secondaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 0,
            )
          ),
        ),
        Utils.verticalPadding(space: 19.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
          decoration: BoxDecoration(
            color: AppColors.onPrimaryColor,
            borderRadius: BorderRadius.circular(30.r)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 20.sp, color: AppColors.secondaryColor,),
                  Utils.horizontalPadding(space: 17.w),
                  Text(
                      conference?.conferenceVenue?.name ?? "",
                      style:theme.textTheme.headlineMedium!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      )
                  ),
                ],
              ),
              Utils.verticalPadding(space: 20.h),
              Row(
                children: [
                  Icon(Icons.access_time_rounded, size: 20.sp, color: AppColors.secondaryColor,),
                  Utils.horizontalPadding(space: 17.w),
                  Text(
                      "${conference!.getConferenceDate(conference!.startDateTime!)} - ${conference!.getConferenceTime(conference!.startDateTime!)}",
                      style:theme.textTheme.headlineMedium!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      )
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
