import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';

class UpcomingEvents extends StatelessWidget {
  final VoidCallback? onEventsTap;
  final Color? containerColor;
  final Color? iconColor;
  final IconData? iconData;
  final Color? circleAndIconColor;
  final String? svgAsset;
  final String? title;
  final Color? titleColor;
  final double? width;
  const UpcomingEvents({Key? key,this.width, this.svgAsset, this.titleColor, this.iconColor, this.onEventsTap, this.title, this.iconData, this.circleAndIconColor, this.containerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onEventsTap,
      child: Container(
        height: 182.h,
        width: width ?? 254.w,
        decoration: ShapeDecoration(
          color: containerColor ?? AppColors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31.r),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                right: 6.w,
                top: 5.h,
                child: Container(
                    height: 45.h,
                    width: 45.h,
                    decoration: BoxDecoration(
                        color: circleAndIconColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(svgAsset!),
                      )
                    )
                )),
            Positioned(
              bottom: 17.h,
              left: 24.w,
              child: Text(
                  title!,
                  style: theme.textTheme.headlineSmall!.copyWith(
                      color: titleColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
