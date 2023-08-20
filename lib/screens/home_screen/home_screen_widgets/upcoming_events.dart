import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/colors.dart';

class UpcomingEvents extends StatelessWidget {
  final VoidCallback? onEventsTap;
  final String? svgAsset;
  final double? width;
  const UpcomingEvents({Key? key,this.width, this.svgAsset,this.onEventsTap,}) : super(key: key);

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
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(31.r),
            child: SvgPicture.asset(svgAsset!, fit: BoxFit.cover, height: 182.h, width: width ?? 254.w,))
      ),
    );
  }
}
