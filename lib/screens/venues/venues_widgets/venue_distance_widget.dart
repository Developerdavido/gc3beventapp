import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class VenueDistance extends StatelessWidget {
  final num? distance;
  const VenueDistance({Key? key, this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Distance',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                )),
        Utils.verticalPadding(space: 7.h),
        Text(
          '${distance} km',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.blue,
                fontSize: 36.sp,
                fontWeight: FontWeight.w600,
              ),
        )
      ],
    );
  }
}
