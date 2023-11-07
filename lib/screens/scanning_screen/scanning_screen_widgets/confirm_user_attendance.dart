import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ConfirmUserAttendance extends StatelessWidget {
  final String? message;
  final IconData? iconData;
  final VoidCallback? onBtnTap;
  const ConfirmUserAttendance({Key? key, this.message, this.iconData, this.onBtnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(39.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.w,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Utils.verticalPadding(space: 32.h),
              //place image here
              Icon(iconData,
                size: 24.sp,
                color: AppColors.primaryColor,
              ),
              Utils.verticalPadding(space: 12.h),
              Text(
                message ?? "",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black
                ),
                textAlign: TextAlign.center,
              ),
              Utils.verticalPadding(space: 18.h),
              CustomButton(
                  btnText: "Ok",
                  onTap: onBtnTap!)
            ],
          )
        )
    );
  }
}
