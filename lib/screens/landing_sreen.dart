import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/services/router_service.dart';

class LandingSreen extends StatelessWidget {
  const LandingSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/landing_image.png", fit: BoxFit.cover,)),
          Positioned(
            top: 283.h,
              left: 25.w,
              right: 25.w,
              child: Text(
                "Manage Create & Schedule Events",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.onPrimaryColor,
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w600
                ),
              )),

          Positioned(
              bottom: 137.h,
              left: 25.w,
              right: 25.w,
              child: CustomButton(
                  btnText: 'Sign Up',
                  onTap: (){
                    locator<RouterService>().push(AppRoute.accountRegistrationRoute);
                  })),

          Positioned(
              bottom: 62.h,
              left: 25.w,
              right: 25.w,
              child: CustomButton(
                  btnText: 'Login',
                  btnColor: AppColors.onPrimaryColor,
                  textColor: AppColors.primaryColor,
                  onTap: (){
                    locator<RouterService>().push(AppRoute.userLoginRoute);
                  })),

        ],
      )
    );
  }
}
