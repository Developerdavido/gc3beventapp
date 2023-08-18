import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/feeds_and_news/feed_and_news_widget/feed_icon.dart';


class SocialMediaAndFeedsCard extends StatelessWidget {
  const SocialMediaAndFeedsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 340.w,
          child: Text(
            'Ransomware Attacks Surge Globally',
            style: theme.textTheme.titleMedium!.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            )
          ),
        ),
        Utils.verticalPadding(space: 10.h),
        Container(
          width: 372.w,
          height: 191.h,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/site_one.jpeg"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        Utils.verticalPadding(space: 10.h),
        SizedBox(
          width: 350.w,
          height: 110.h,
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'In an increasingly digitalized world, critical infrastructure sectors face escalating cyber threats that have far-reaching implications for society... ',
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    TextSpan(
                        text: 'More',
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: AppColors.blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        )
                    ),
                  ],
                ),
              ),
              Utils.verticalPadding(space: 17.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FeedIcon(
                        iconData: Icons.bookmark_border_outlined,
                        text: "Save",
                      ),
                      Utils.horizontalPadding(space: 29.w),
                      FeedIcon(
                        iconData: Icons.message_outlined,
                        text: "${160}",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Lydia',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )
                      ),
                      Utils.horizontalPadding(space: 4.w),
                      Icon(Icons.circle, color: AppColors.blue, size: 4.sp,),
                      Utils.horizontalPadding(space: 4.w),
                      Text(
                          '12h',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: AppColors.blue,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ),
        Utils.verticalPadding(space: 26.h),
      ],
    );
  }
}
