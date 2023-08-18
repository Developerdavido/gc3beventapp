import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class TopFeedsSubtitle extends StatelessWidget {
  const TopFeedsSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 254.w,
      child: Text(
          'Join our Cybersecurity Learning Journey',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColors.primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          )
      ),
    );
  }
}
