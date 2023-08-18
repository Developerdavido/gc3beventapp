import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:gc3bapp/view_models/venue_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VenueProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    provider = context.read<VenueProvider>();
    provider?.getLocationOfUser();
    super.initState();

  }

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
                                containerColor: AppColors.primaryColor,
                                iconColor: AppColors.primaryColor,
                                circleAndIconColor: AppColors.lightBlue,
                                title: "Upcoming \nEvents",
                                svgAsset: "assets/svgs/ticket.svg",
                                titleColor: AppColors.onPrimaryColor,
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
                                containerColor: AppColors.lightBlue,
                                circleAndIconColor: AppColors.secondaryColor,
                                title: "Site Visits",
                                width: 185.w,
                                svgAsset: "assets/svgs/globe.svg",
                                iconColor: AppColors.lightBlue,
                                titleColor: AppColors.primaryColor,
                                onEventsTap: (){
                                  locator<RouterService>().push(AppRoute.sitesRoute);
                                },
                              ),
                              Utils.horizontalPadding(space: 12.w),
                              UpcomingEvents(
                                width: 185.w,
                                containerColor: AppColors.primaryColor,
                                circleAndIconColor: AppColors.lightBlue,
                                svgAsset: "assets/svgs/marker-pin.svg",
                                title: "Venue",
                                iconColor: AppColors.primaryColor,
                                titleColor: AppColors.onPrimaryColor,
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
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(31.r),
              child: Container(
                width: 422.w,
                height: 90.h,
                color: AppColors.lightGrey,
                child: NavigationBar(
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  indicatorColor: AppColors.lightBlue,
                  destinations: [
                    NavigationDestination(
                        icon: SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: SvgPicture.asset("assets/svgs/home.svg"),
                        ),
                        selectedIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: SvgPicture.asset("assets/svgs/home.svg"),
                            ),
                            Utils.horizontalPadding(space: 4.w),
                            Text("Home", style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: AppColors.black,
                              fontSize: 12.sp
                            ),)
                          ],
                        ),
                        label: "Home"),
                    NavigationDestination(icon: const Icon(CupertinoIcons.ticket), label: "My Tickets",
                    selectedIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.ticket, color: AppColors.black,size: 18.sp,),
                        Utils.horizontalPadding(space: 4.w),
                        Text("Tickets", style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.black,
                            fontSize: 12.sp
                        ),)
                      ],
                    ),),
                    NavigationDestination(
                        icon: const Icon(Icons.bookmark_border_outlined),
                        label: "My Events",
                      selectedIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_border_outlined, color: AppColors.black,size: 18.sp,),
                          Utils.horizontalPadding(space: 4.w),
                          Text("Events", style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: AppColors.black,
                              fontSize: 12.sp
                          ),)
                        ],
                      ),
                    ),
                  ],
                  selectedIndex: currentIndex!,
                  onDestinationSelected: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          )
        ));
  }
}
