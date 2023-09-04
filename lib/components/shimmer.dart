import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerWidgetType { list, hotelList}

class ShimmerWidget extends StatelessWidget {
  final ShimmerWidgetType? type;

  const ShimmerWidget({
    Key? key,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.3),
      child: _buildType(context),
    );
  }

  Widget _buildType(context) {
    if (type == ShimmerWidgetType.hotelList){
      return _buildList(context);
    }else {
      return _block(context);
    }
  }


  Widget _block(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Container(
        height: 259.h,
        width: 386.w,
        decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          borderRadius: BorderRadius.circular(22.r),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180.h,
            width: 386.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.r),
            ),
          ),
          Utils.verticalPadding(space: 12.w),
          Container(
            height: 10.h,
            width: width * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.r),
            ),
          ),
          Utils.verticalPadding(space: 12.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10.h,
                width: width * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.r),
                ),
              ),
              Utils.horizontalPadding(space: 12.w),
              Container(
                height: 10.h,
                width: width * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
