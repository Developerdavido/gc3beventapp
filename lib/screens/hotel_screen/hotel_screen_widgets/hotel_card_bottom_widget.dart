import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class HotelCardBottomWidget extends StatelessWidget {
  final String? hotelName;
  final String? hotelLocation;
  final num? ratingOrCost;
  final bool? isSite;
  const HotelCardBottomWidget({Key? key,this.isSite = false, this.hotelName, this.hotelLocation, this.ratingOrCost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelName!,
          style: theme.textTheme.bodySmall!.copyWith(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        Utils.verticalPadding(space: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.blue,
                  size: 18.sp,
                ),
                Utils.horizontalPadding(space: 7.w),
                Text(
                    hotelLocation!,
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: AppColors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ],
            ),
            isSite! ?
            Container(
              height: 28.h,
              padding: EdgeInsets.symmetric(horizontal: 7.w, ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  color: AppColors.lightBlue
              ),
              child: Center(
                child: Text(
                  "\$$ratingOrCost",
                  style: theme.textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.primaryColor
                  ),
                ),
              ),
            )
                : Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.yellow,
                  size: 20.sp,
                ),
                Utils.horizontalPadding(space: 7.w),
                Text(
                    "$ratingOrCost",
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
