import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';

class HotelBooking extends StatelessWidget {
  final VoidCallback? onBtnTap;
  const HotelBooking({Key? key, this.onBtnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onBtnTap,
      child: Container(
        width: 379.w,
        height: 76.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
        decoration: ShapeDecoration(
          color: AppColors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31.r),
          ),
          image:  DecorationImage(
                image: AssetImage("assets/images/hotel_image.png",),
                fit: BoxFit.cover
            )
        ),
        child: Text(
          "Hotel Booking",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.onPrimaryColor,
              fontSize: 24.sp
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "Hotel Booking",
        //       style: theme.textTheme.headlineSmall!.copyWith(
        //           color: AppColors.primaryColor,
        //           fontSize: 24.sp,
        //           fontWeight: FontWeight.w400
        //       )
        //     ),
        //     Container(
        //         height: 45.h,
        //         width: 45.h,
        //         decoration: const BoxDecoration(
        //             color: AppColors.primaryColor,
        //             shape: BoxShape.circle
        //         ),
        //         child: Center(
        //           child: SizedBox(
        //             height: 24.w,
        //             width: 24.w,
        //             child: SvgPicture.asset("assets/svgs/luggage.svg", colorFilter: ColorFilter.mode(AppColors.lightBlue, BlendMode.srcIn),),
        //           )
        //         )
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
