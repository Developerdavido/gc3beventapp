
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? btnText;
  final double? borderRadius;
  const CustomButton({Key? key, required this.onTap, this.btnText, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 379.w,
        height: 65.h,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 22.r),
          ),
        ),
        child: Center(
          child: Text(
            btnText!,
            style: TextStyle(
              color: AppColors.onPrimaryColor,
              fontSize: 20.sp,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
