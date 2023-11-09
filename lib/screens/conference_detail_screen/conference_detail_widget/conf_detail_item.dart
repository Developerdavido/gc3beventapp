import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ConfQrCodeDetailItem extends StatelessWidget {
  final String? headerLeft;
  final String? dataLeft;
  final String? headerRight;
  final String? dataRight;
  const ConfQrCodeDetailItem(
      {Key? key,
      this.headerLeft,
      this.headerRight,
      this.dataLeft,
      this.dataRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           headerLeft ?? "",
           style: Theme.of(context).textTheme.labelMedium!.copyWith(
             color: AppColors.grey,
             fontSize: 14.sp,
             fontWeight: FontWeight.w400,
           ),
           textAlign: TextAlign.left,
         ),
         Text(
           dataLeft ?? "",
           style: Theme.of(context).textTheme.headlineMedium!.copyWith(
             color: AppColors.black,
             fontSize: 18.sp,
             fontWeight: FontWeight.w500,
           ),
           textAlign: TextAlign.left,
         )
       ],
      ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              headerRight ?? "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.right,
            ),
            Text(
              dataRight ?? "",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            )
          ],
        )
      ],
    );
  }
}
