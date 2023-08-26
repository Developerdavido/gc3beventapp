import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CSALogo extends StatelessWidget {
  final double? width;
  final double? height;
  const CSALogo({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 74.h,
      width: width ?? 74.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(39.r),
          child: Image.asset("assets/images/csa_logo.png", fit: BoxFit.cover,)),
    );
  }
}
