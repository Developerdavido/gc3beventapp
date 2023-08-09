import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class ForgotPassword extends StatelessWidget {
  final VoidCallback? onForgotTap;
  const ForgotPassword({Key? key, this.onForgotTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onForgotTap,
      child: Text(
        'Forget Password?',
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black
        )
      ),
    );
  }
}
