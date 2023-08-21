import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/account_widget.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/hotel_booking.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/news_and_feeds.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/upcoming_events.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';



class ManageConferences extends StatelessWidget {
  const ManageConferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.verticalPadding(space: 51.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w),
          child: TopScreen(
            isBackIconVisible: false,
            isAccountIconVisible: true,
            accountIcon: Consumer<AuthProvider>(
              builder: (context, auth, child){
                return AccountWidget(
                  onAccountTap: (){
                    locator<RouterService>().push(AppRoute.profileRoute, args: auth.authModal?.user);
                  },
                );
              },

            ),
          ),
        ),
        Utils.verticalPadding(space: 55.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.h),
          child: const TitleText(titleText: "Manage \nConference",),
        ),
        Utils.verticalPadding(space: 15.h),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UpcomingEvents(
                          imageAsset: "assets/images/event_image.png",
                          text: "Upcoming \nEvents ",
                          onEventsTap: (){
                            locator<RouterService>().push(AppRoute.conferencesRoute);
                          },
                        ),
                        Utils.horizontalPadding(space: 12.w),
                        NewsAndFeeds(
                          onFeedTap: (){
                            locator<RouterService>().push(AppRoute.incidenceReportRoute);
                          },
                          onNewsTap: (){
                            locator<RouterService>().push(AppRoute.newsAndSocialRoute);
                          },
                        )
                      ],
                    ),
                    Utils.verticalPadding(space: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UpcomingEvents(
                          width: 185.w,
                          imageAsset: "assets/images/site_image.png",
                          text: "Site Visits",
                          onEventsTap: (){
                            locator<RouterService>().push(AppRoute.sitesRoute);
                          },
                        ),
                        Utils.horizontalPadding(space: 12.w),
                        UpcomingEvents(
                          width: 185.w,
                          imageAsset: "assets/images/venue_image.png",
                          text: "Venue",
                          onEventsTap: (){
                            locator<RouterService>().push(AppRoute.venueRoute);
                          },
                        ),

                      ],
                    ),
                    Utils.verticalPadding(space: 12.w),
                    HotelBooking(
                      onBtnTap: (){
                        locator<RouterService>().push(AppRoute.hotelRoute);
                      },
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
