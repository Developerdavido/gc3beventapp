import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/components/screen_widgets/account_widget.dart';
import 'package:gc3bapp/components/screen_widgets/tab_widgets.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/conference_screen/conference_screen.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/hotel_booking.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/news_and_feeds.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/upcoming_events.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_booking.dart';
import 'package:gc3bapp/screens/manage_conference_screen/ongoing_meeting.dart';
import 'package:gc3bapp/screens/site/site_screen.dart';
import 'package:gc3bapp/screens/venues/venues_screen.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';



class ManageConferences extends StatelessWidget {
  const ManageConferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.verticalPadding(space: 51.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: TopScreen(
                    isBackIconVisible: false,
                    isAccountIconVisible: true,
                    accountIcon: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome, ',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: auth.authModal?.user?.fullName!.split(' ')[0],
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              Consumer<ConferenceProvider>(
                builder: (BuildContext context, cVm, Widget? child) {
                  return Visibility(
                      visible: cVm.activeConferences.isNotEmpty,
                      child: SizedBox(
                        height: 83.h,
                        child: Column(
                          children: [
                            Utils.verticalPadding(space: 26.h),
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cVm.activeConferences.length,
                                  itemBuilder: (context, index){
                                    var conference = cVm.activeConferences[index];
                                    return OngoingMeeting(
                                      eventTitle: conference.theme,
                                      onTap: (){
                                        locator<RouterService>().push(AppRoute.conferenceDetailsRoute, args: conference);
                                        cVm.removeActiveConference(conference);
                                      },
                                      onCancel: cVm.removeActiveConference(conference),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ));
                },
              ),
              Utils.verticalPadding(space: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                child: SizedBox(
                  height: 48.h,
                  child: Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50.r), // Create  border
                    ),
                    child: TabBar(
                        indicatorWeight: 0,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
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
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onPrimaryColor
                        ),
                        unselectedLabelColor: AppColors.primaryColor,
                        unselectedLabelStyle:
                        Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs: [
                          Tab(text: "Upcoming Events",),
                          Tab(text: "Venue"),
                          Tab(text: "Site Visits"),
                          Tab(text: "Hotels"),
                        ]),
                  ),
                ),
              ),
              Utils.verticalPadding(space: 18.h),
              Expanded(
                  child: TabBarView(
                    children: [
                      ConferenceScreen(),
                      VenuesScreen(),
                      SiteScreen(),
                      HotelScreen()
                    ],
                  ))
            ],
          ),
        );
  }
}
