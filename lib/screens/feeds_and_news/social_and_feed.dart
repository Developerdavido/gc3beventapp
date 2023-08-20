import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/pop_up_menu_item.dart';
import 'package:gc3bapp/screens/feeds_and_news/feed_and_news_widget/post_pop_up_menu_btn.dart';
import 'package:gc3bapp/screens/feeds_and_news/feed_and_news_widget/top_announcement_widget.dart';
import 'package:gc3bapp/screens/feeds_and_news/feed_and_news_widget/top_feeds_subtitle.dart';
import 'package:gc3bapp/screens/feeds_and_news/feed_and_news_widget/top_feeds_title.dart';
import 'package:gc3bapp/screens/feeds_and_news/social_page.dart';

class SocialAndFeed extends StatefulWidget {
  const SocialAndFeed({Key? key}) : super(key: key);

  @override
  State<SocialAndFeed> createState() => _SocialAndFeedState();
}

class _SocialAndFeedState extends State<SocialAndFeed> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
                body: Column(
          children: [
            Container(
                height: 274.h,
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                decoration: BoxDecoration(
                  color: AppColors.lightPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(39.r),
                      bottomRight: Radius.circular(39.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Utils.verticalPadding(space: 67.h),
                    TopScreen(
                      isBackIconVisible: true,
                      isAccountIconVisible: false,
                      iconColor: AppColors.black,
                    ),
                    Utils.verticalPadding(space: 24.h),
                    TopAnnouncementWidget(),
                    Utils.verticalPadding(space: 24.h),
                    TopFeedsTitle(),
                    Utils.verticalPadding(space: 13.h),
                    TopFeedsSubtitle(),
                  ],
                )),
            Utils.verticalPadding(space: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0.w),
              child: SizedBox(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 0.5.sw,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(50.r), // Create  border
                          color: AppColors.lightBlue.withOpacity(0.3)),
                      child: TabBar(
                        indicatorWeight: 0,
                          dividerColor: Colors.transparent,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 4.w),
                          labelColor: AppColors.lightPurple,
                          indicator: BoxDecoration(
                            border: null,
                              borderRadius:
                                  BorderRadius.circular(50.r), // Creates border
                              color: AppColors.primaryColor),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16.30.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                          unselectedLabelColor: AppColors.primaryColor,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16.30.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                          tabs: [
                            Tab(
                              text: "News",
                            ),
                            Tab(text: "Feeds")
                          ]),
                    ),
                    PostPopUpMenuBtn(
                      menuItemColor: AppColors.primaryColor,
                      items: [],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Popular Posts",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                          ),
                          Utils.horizontalPadding(space: 5.w),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20.sp,
                            color: AppColors.black,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Utils.verticalPadding(space: 25.h),
            Expanded(
                child: TabBarView(
                  children: [
                    SocialPage(),
                    SocialPage(),
                  ],
                )
            )
          ],
        ))));
  }
}
