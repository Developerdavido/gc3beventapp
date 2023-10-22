import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class TabWidgets extends StatelessWidget {
  final String? imageData;
  final String? text;
  const TabWidgets({Key? key, this.imageData, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              height: 18.w,
              width: 18.w,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.onPrimaryColor
              ),
              child: SvgPicture.asset(imageData!, colorFilter: ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),)
          ),
          Utils.horizontalPadding(space: 8),
          Text(text!,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              //color: AppColors.onPrimaryColor,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
