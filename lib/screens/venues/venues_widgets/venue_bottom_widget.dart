import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class VenueBottomWidget extends StatelessWidget {
  final String? venueName;
  final VoidCallback? onDirectionTap;
  const VenueBottomWidget({Key? key, this.venueName, this.onDirectionTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Venue",
                style:theme.textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                )
            ),
            Utils.verticalPadding(space: 12.h),
            SizedBox(
              width: 187.w,
              child: Text(
                  venueName ?? "",
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  )
              ),
            )
          ],
        ),
        InkWell(
          onTap: onDirectionTap,
          child: Container(
            width: 128.11.w,
            height: 49.65.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(65.r),
              ),
            ),
            child: Center(
              child: Text(
                  'Direction',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: AppColors.lightBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  )
              ),
            ),
          ),
        )
      ],
    );
  }
}
