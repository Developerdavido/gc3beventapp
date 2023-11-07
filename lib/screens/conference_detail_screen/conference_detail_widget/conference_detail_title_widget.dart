import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';

class ConferenceDetailTitleWidget extends StatelessWidget {
  final Conference? conference;
  const ConferenceDetailTitleWidget({Key? key, this.conference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300.w,
              child: Text(
                  conference!.theme!,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
            Utils.verticalPadding(space: 8.h),
            Text(
              "${conference?.description}",
              style: theme.textTheme.headlineSmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.onPrimaryColor,
              ),
            ),

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
