import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ConferenceTopWidget extends StatelessWidget {
  final String? conferenceTitle;
  final String? conferenceTime;
  final num? numberOfAttendees;
  final String? attendeeImage;
  const ConferenceTopWidget({Key? key, this.conferenceTitle,this.attendeeImage, this.conferenceTime, this.numberOfAttendees,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 33.75.h,
              color: Colors.transparent,
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(26.w, 0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 17.r,
                      child:
                      attendeeImage == null ?
                      Center(
                        child: Icon(Icons.person, size: 24.sp, color: AppColors.grey,),
                      )
                      : CircleAvatar(
                      radius: 17.r,
                      foregroundImage: NetworkImage(attendeeImage!)
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-26.w, 0),
                    child: Container(
                      height: 33.75.h,
                      width: 33.75.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.black
                      ),
                      child: Center(
                        child: Text(
                          "${numberOfAttendees ?? 0}",
                          style: theme.textTheme.labelSmall!.copyWith(
                            color: AppColors.onPrimaryColor,
                            fontSize: 12.sp
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Utils.horizontalPadding(space: 16.25.w),
            Text(conferenceTitle ?? "",
              style: theme.textTheme.labelSmall!.copyWith(
                fontSize: 14.sp,
                color: AppColors.onPrimaryColor,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
        Container(
          height: 28.h,
          width: 73.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.lightBlue
          ),
          child: Center(
            child: Text(conferenceTime!,
              style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        )
      ],
    );
  }
}
