import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class NewsAndFeeds extends StatelessWidget {
  final VoidCallback? onFeedTap;
  final VoidCallback? onNewsTap;
  const NewsAndFeeds({Key? key, this.onFeedTap, this.onNewsTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 182.h,
      width: 116.w,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(31.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onNewsTap,
            child: Container(
              height: 87.h,
              width: 112.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31.r),
                color: AppColors.primaryColor
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.feed_outlined, size: 24.w, color: AppColors.onPrimaryColor,),
                    Utils.verticalPadding(space: 8.h),
                    Text(
                      "News & More",
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: AppColors.onPrimaryColor,
                        fontSize: 14

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onFeedTap,
            child: Container(
              height: 87.h,
              width: 112.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31.r),
                  color: AppColors.onPrimaryColor
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.chat_bubble_2, size: 24.w, color: AppColors.primaryColor,),
                    Utils.verticalPadding(space: 8.h),
                    Text(
                      "Feedback",
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
