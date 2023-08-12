import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class VenueTopWidget extends StatelessWidget {
  final String? venueDate;
  final String? venueTime;
  const VenueTopWidget({Key? key, this.venueDate, this.venueTime}) : super(key: key);

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
              width: 33.75.w,
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
              )
            ),
            Utils.horizontalPadding(space: 5.25.w),
            Text(venueDate ?? "",
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
            child: Text(venueTime ?? "",
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
