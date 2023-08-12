import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';

class ConferenceDetailTitleWidget extends StatelessWidget {
  final MockConferenceModel? conference;
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
                      text: conference!.conferenceTime,
                      style: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onPrimaryColor)),
                  TextSpan(
                    text: " | ${conference!.location}",
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
                  conference!.conferenceTheme!,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 36.sp,
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
                      // user!.user?.avatar == null?
                      Center(
                        child: Icon(Icons.person, size: 24.sp, color: AppColors.grey,),
                      ),
                      // : CircleAvatar(
                      // radius: 35,
                      // foregroundImage: NetworkImage(user!.user!.avatar!)
                      //),
                    ),
                    Utils.horizontalPadding(space: 4.w),
                    Text(
                      "${conference!.conferenceSpeaker}",
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
                          text: conference!.attendees,
                          style: theme.textTheme.headlineSmall!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onPrimaryColor)),
                      TextSpan(
                        text: " Attendees",
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
}
