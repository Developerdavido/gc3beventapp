import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/services/router_service.dart';

class LandingSreen extends StatelessWidget {
  const LandingSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: Image.asset("assets/images/landing_image.png", fit: BoxFit.cover,)),
            Positioned(
              top: 177.h,
                left: 55.w,
                right: 55.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Cyber',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onPrimaryColor,
                          fontSize: 96.sp,
                          fontWeight: FontWeight.w600,
                        )
                    ),
                    Text(
                        'Resilience for Development',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.onPrimaryColor,
                          fontSize: 48.sp,
                          fontWeight: FontWeight.w300,
                        )
                    ),
                    Utils.verticalPadding(space: 12.h),
                    Text(
                      '29-30 Nov. 2023\nAccra | Ghana',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.onPrimaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      )
                    ),
                  ],
                )
            ),
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
      ),
    );
  }
}

