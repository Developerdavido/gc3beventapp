import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ProfileScreenElements extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  final VoidCallback? callback;
  final bool? isLogoutElement;
  const ProfileScreenElements({Key? key, this.isLogoutElement = false, this.iconData, this.text, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          color: AppColors.lightPrimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData, color: AppColors.black, size: 22.sp,),
            Utils.horizontalPadding(space: 20.w),
            Text(
              text!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 18,
                color: AppColors.grey
              ),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            Visibility(
              visible: !isLogoutElement!,
              child: Icon(Icons.arrow_forward_ios_sharp, color: AppColors.black, size: 22.sp,),)
          ],
        ),
      ),
    );
  }
}