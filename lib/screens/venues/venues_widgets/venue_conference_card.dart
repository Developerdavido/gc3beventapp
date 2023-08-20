import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/venue.dart';


class ConferenceVenueCard extends StatelessWidget {
  final VenueConference? venueConference;
  const ConferenceVenueCard({Key? key, this.venueConference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.0.w),
      child: Container(
        padding: EdgeInsets.only(top: 4),
        width: 206.w,
        height: 235.h,
        decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(31.r),
        ),
        child: Column(
          children: [
            Container(
              width: 198.w,
              height: 137.h,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: NetworkImage(venueConference!.banner ?? ""),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.r),
                ),
              ),
            ),
            Utils.verticalPadding(space: 18.h),
            SizedBox(
              width: 182.w,
              child: Text(
                venueConference!.theme!,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
