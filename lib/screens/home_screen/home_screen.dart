import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/account_widget.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/hotel_booking.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/news_and_feeds.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/upcoming_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int? currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.verticalPadding(space: 51.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: TopScreen(
                  isBackIconVisible: false,
                  isAccountIconVisible: true,
                  accountIcon: AccountWidget(
                    onAccountTap: (){},
                  ),
                ),
              ),
              Utils.verticalPadding(space: 55.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: const TitleText(titleText: "Manage \nConference",),
              ),
              Utils.verticalPadding(space: 55.h),
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
                                containerColor: AppColors.primaryColor,
                                iconData: CupertinoIcons.ticket,
                                circleAndIconColor: AppColors.onPrimaryColor,
                                title: "Upcoming \nEvents",
                                titleColor: AppColors.onPrimaryColor,
                                onEventsTap: (){

                                },
                              ),
                              Utils.horizontalPadding(space: 12.w),
                              NewsAndFeeds(
                                onFeedTap: (){},
                                onNewsTap: (){},
                              )
                            ],
                          ),
                          Utils.verticalPadding(space: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UpcomingEvents(
                                containerColor: AppColors.lightBlue,
                                iconData: CupertinoIcons.globe,
                                circleAndIconColor: AppColors.primaryColor,
                                title: "Site Visits",
                                width: 185.w,
                                titleColor: AppColors.primaryColor,
                                onEventsTap: (){

                                },
                              ),
                              Utils.horizontalPadding(space: 12.w),
                              UpcomingEvents(
                                width: 185.w,
                                containerColor: AppColors.primaryColor,
                                iconData: CupertinoIcons.map_pin_ellipse,
                                circleAndIconColor: AppColors.onPrimaryColor,
                                title: "Venue",
                                titleColor: AppColors.onPrimaryColor,
                                onEventsTap: (){

                                },
                              ),

                            ],
                          ),
                          Utils.verticalPadding(space: 12.w),
                          HotelBooking(
                            onBtnTap: (){
                            },
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: AppColors.primaryColor,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(icon: Icon(CupertinoIcons.ticket), label: "My Tickets"),
              NavigationDestination(icon: Icon(Icons.bookmark_border_outlined), label: "My Events"),
            ],
            selectedIndex: currentIndex!,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ));
  }
}
