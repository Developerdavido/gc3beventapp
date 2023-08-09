import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class UpcomingEvents extends StatelessWidget {
  final VoidCallback? onEventsTap;
  final Color? containerColor;
  final IconData? iconData;
  final Color? circleAndIconColor;
  final String? title;
  final Color? titleColor;
  final double? width;
  const UpcomingEvents({Key? key,this.width, this.titleColor, this.onEventsTap, this.title, this.iconData, this.circleAndIconColor, this.containerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
              child: GestureDetector(
                onTap: onEventsTap,
                child: Container(
                    height: 45.h,
                    width: 45.h,
                    padding: EdgeInsets.all(11.w),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: circleAndIconColor!),
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      iconData ?? CupertinoIcons.arrow_up_right,
                      color: circleAndIconColor,
                      size: 24.w,
                    )
                ),
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
    );
  }
}
