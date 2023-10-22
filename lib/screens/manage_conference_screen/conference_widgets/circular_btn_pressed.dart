import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularBtn extends StatelessWidget {
  final IconData? data;
  final VoidCallback? onPressed;
  final Color? btnColor;
  final Color? containerColor;
  const CircularBtn({Key? key, this.btnColor, this.onPressed, this.data, this.containerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: containerColor,
        ),
        child: Center(
          child: Icon(data, color: btnColor, size: 18.sp,),
        ),
      ),
    );
  }
}
