import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/saved_meetings_model.dart';
import 'package:gc3bapp/screens/meeting_screen/meeting_widgets/meeting_date_and_time.dart';

class MeetingCard extends StatelessWidget {
  final SavedMeeting? meeting;
  const MeetingCard({Key? key, this.meeting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 21.w),
      child: Container(
        width: 386.w,
        height: 249.h,
        decoration: ShapeDecoration(
          color: AppColors.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38.r),
          ),
          image: DecorationImage(
              image: AssetImage("assets/images/meet.png",),
              fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            Positioned(
                top: 13.h,
                left: 27.w,
                right: 27.w,
                child: Container(
                    width: 332.w,
                    padding: EdgeInsets.symmetric(
                        horizontal: 13.66.w, vertical: 9.66.w),
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(39.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MeetingDateAndTime(
                          iconData: Icons.calendar_month_rounded,
                          data: meeting?.getConferenceDate(meeting!.conference!.date),
                        ),
                        MeetingDateAndTime(
                          iconData: Icons.access_time_rounded,
                          data:
                              '${meeting!.getSavedMeetingTime(meeting!.startTime!)} - ${meeting!.getSavedMeetingTime(meeting!.endTime!)}',
                        ),
                      ],
                    ))),
            Positioned(
              left: 41.w,
              top: 94.h,
              child: SizedBox(
                width: 235.w,
                child: Text(
                  meeting!.conference?.theme ?? "",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.onPrimaryColor,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Positioned(
              left: 41.w,
              top: 151.h,
              child: SizedBox(
                  width: 235.w,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/users.svg",
                        height: 24.h,
                        width: 24.h,
                        colorFilter: ColorFilter.mode(
                            AppColors.primaryColor, BlendMode.srcIn),
                      ),
                      Utils.horizontalPadding(space: 9.w),
                      Text(
                        meeting!.room ?? "",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: AppColors.onPrimaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
