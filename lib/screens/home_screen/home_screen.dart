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
import 'package:gc3bapp/screens/TicketsScreen/tickets_screen.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/hotel_booking.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/news_and_feeds.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/upcoming_events.dart';
import 'package:gc3bapp/screens/manage_conference_screen/manage_conference.dart';
import 'package:gc3bapp/screens/meeting_screen/meeting_screen.dart';
import 'package:gc3bapp/screens/saved_events_screen/saved_events.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
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

  final screens = [
    ManageConferences(),
    TicketsScreen(),
    MeetingScreen()
  ];

  int? currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final conferenceVm = Provider.of<ConferenceProvider>(context);
    return SafeArea(
        child: Scaffold(
          body: screens[currentIndex!],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(31.r), topLeft: Radius.circular(31.r),),
            child: Container(
              width: 422.w,
              height: 117.h,
              color: AppColors.lightBlue,
              child: NavigationBar(
                height: 117.h,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorColor: AppColors.primaryColor,
                backgroundColor: AppColors.lightBlue,
                destinations: [
                  NavigationDestination(
                      icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset("assets/svgs/home.svg", colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),)
                      ),
                      selectedIcon: SvgPicture.asset("assets/svgs/home.svg", colorFilter: ColorFilter.mode(AppColors.onPrimaryColor, BlendMode.srcIn),),
                      label: "Home"),
                  NavigationDestination(icon:
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset("assets/svgs/ticket.svg", colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),)),
                  selectedIcon: SvgPicture.asset("assets/svgs/ticket.svg", colorFilter: ColorFilter.mode(AppColors.onPrimaryColor, BlendMode.srcIn),),
                  label: "My Tickets",),
                  NavigationDestination(
                      icon: SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset("assets/svgs/bookmark.svg", colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),)),
                      label: "My Events",
                    selectedIcon: SvgPicture.asset("assets/svgs/bookmark.svg", colorFilter: ColorFilter.mode(AppColors.onPrimaryColor, BlendMode.srcIn),),
                  ),
                ],
                selectedIndex: currentIndex!,
                onDestinationSelected: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  if (currentIndex == 2) {
                    if (conferenceVm.meetings.isNotEmpty) {
                      return;
                    }
                    conferenceVm.getYourMeetings();
                  }
                },
              ),
            ),
          )
        ));
  }
}
