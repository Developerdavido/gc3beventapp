import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class TopFeedsTitle extends StatelessWidget {
  const TopFeedsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      child: Text(
          'Enhance Your Digital Defenses!',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24.sp,
              height: 1,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor
          )
      ),
    );
  }
}
