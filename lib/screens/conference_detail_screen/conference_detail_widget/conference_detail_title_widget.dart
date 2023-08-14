import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';

class ConferenceDetailTitleWidget extends StatelessWidget {
  final Conference? conference;
  const ConferenceDetailTitleWidget({Key? key, this.conference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                style: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 16.sp
                ),
                children: [
                  TextSpan(
                      text: conference!.getConferenceDate(),
                      style: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onPrimaryColor)),
                  //TODO: add the location of the conference
                  TextSpan(
                    text: " | ${conference?.venue?.name}",
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Utils.verticalPadding(space: 12.h),
            SizedBox(
              width: 289.w,
              child: Text(
                  conference!.theme!,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
            Utils.verticalPadding(space: 43.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 17.r,
                      child:
                      conference?.banner == null?
                      Center(
                        child: Icon(Icons.person, size: 24.sp, color: AppColors.grey,),
                      )
                      : CircleAvatar(
                      radius: 17.r,
                      foregroundImage: NetworkImage(conference!.banner!)
                      ),
                    ),
                    Utils.horizontalPadding(space: 4.w),
                    //TODO: Add the conference speaker
                    Text(
                      "${""}",
                      style: theme.textTheme.headlineSmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "${conference!.attendees!.length}",
                          style: theme.textTheme.headlineSmall!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onPrimaryColor)),
                      TextSpan(
                        text: getAttendee(),
                        style: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Utils.verticalPadding(space: 25.h)
          ],
        ),
    );
  }

  getAttendee(){
    if (conference!.attendees!.length > 1) {
      return " Attendees";
    } else {
      return " Attendee";
    }
  }
}
