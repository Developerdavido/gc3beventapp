import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class JoinConferenceWidget extends StatelessWidget {
  final VoidCallback? btnTap;
  final String? price;
  const JoinConferenceWidget({Key? key, this.btnTap, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 21.h),
      decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r) )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: Column(
              children: [
                Text("Price",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    )),
                Utils.verticalPadding(space: 12.h),
                Text(
                  '\$15',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: AppColors.black,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: btnTap,
            child: Container(
              height: 87.h,
              padding: EdgeInsets.symmetric(horizontal: 72.w, vertical: 29.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                'Attend',
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: AppColors.onPrimaryColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
