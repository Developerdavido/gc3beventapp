import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class CustomHotelDirectionWidget extends StatelessWidget {
  final double? width;
  final String? iconData;
  final Widget? trailingWidget;
  final Widget? titleWidget;
  const CustomHotelDirectionWidget(
      {Key? key,
      this.titleWidget,
      this.trailingWidget,
      this.iconData,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      width: width,
      height: 74.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: AppColors.onPrimaryColor),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20.h,
              width: 20.h,
              child: SvgPicture.asset(
                iconData!,

              ),
            ),
            SizedBox(
              width: 118.w,
                child: titleWidget!),
            trailingWidget!,

          ],
        ),
      ),
    );
  }
}
