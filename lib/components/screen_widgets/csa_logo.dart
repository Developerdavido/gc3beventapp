import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CSALogo extends StatelessWidget {
  const CSALogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74.h,
      width: 74.h,
      child: Image.asset("assets/images/csa_logo.png", fit: BoxFit.contain,),
    );
  }
}
