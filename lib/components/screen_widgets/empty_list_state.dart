import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class EmptyListState extends StatelessWidget {
  final String? message;
  const EmptyListState({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 65.h,
              width: 65.h,
              child: SvgPicture.asset("assets/svgs/no_file.svg", fit: BoxFit.contain,)),
          Utils.verticalPadding(space: 8.h),
          Text(message!,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
