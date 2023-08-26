
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? btnText;
  final double? borderRadius;
  final double? width;
  final bool? enabled;
  final Color? btnColor;
  final Color? textColor;
  const CustomButton({Key? key,this.width, this.enabled = true, this.btnColor, this.textColor,  required this.onTap, this.btnText, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled! ? onTap : null,
      child: Container(
        width: width ?? 379.w,
        height: 65.h,
        decoration: ShapeDecoration(
          color: enabled! ? btnColor ?? AppColors.primaryColor : AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
          ),
        ),
        child: Center(
          child: Text(
            btnText!,
            style: TextStyle(
              color: enabled! ? textColor ?? AppColors.onPrimaryColor : AppColors.black,
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
