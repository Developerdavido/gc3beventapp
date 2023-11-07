import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';

class ConferenceEventAttendees extends StatelessWidget {
  final Conference? conference;
  const ConferenceEventAttendees({Key? key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          borderRadius: BorderRadius.circular(30.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Attending Event",
              style:theme.textTheme.headlineMedium!.copyWith(
                color: AppColors.secondaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                height: 0,
              )
          ),
          Utils.verticalPadding(space: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for(int i = 0; i < conference!.registrations!.length; i++)
                    // if (i <= 3)
                      Align(
                        widthFactor: 0.5,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColors.lightBlue,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(conference!.registrations![i].attendee!.avatar ?? ""),
                            radius: 24.r,
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.supervisor_account_rounded, size: 20.sp, color: AppColors.secondaryColor,),
                  Utils.horizontalPadding(space: 4.w),
                  Text(
                      Utils.getNumberEquivalent(conference!.registrations!.length ?? 0),
                      style:theme.textTheme.headlineMedium!.copyWith(
                        color: AppColors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
