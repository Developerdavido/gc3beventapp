import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';

class UpcomingEvents extends StatelessWidget {
  final VoidCallback? onEventsTap;
  final String? imageAsset;
  final String? text;
  final double? width;
  const UpcomingEvents({Key? key,this.width, this.text, this.imageAsset,this.onEventsTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEventsTap,
      child: Container(
        height: 182.h,
        width: width ?? 254.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31.r),
          ),
          image: DecorationImage(
            image: AssetImage(imageAsset!,),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            Positioned.fill(child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(31.r),
              ),
            )),
            Positioned(
              left: 22.w,
              top: 22.h,
              child: SizedBox(
                width: 150.w,
                child: Text(
                  text ?? "",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onPrimaryColor,
                    fontSize: 24.sp
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
