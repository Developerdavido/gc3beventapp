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
import 'package:gc3bapp/screens/feeds_and_news/social_and_feed.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/hotel_booking.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/news_and_feeds.dart';
import 'package:gc3bapp/screens/home_screen/home_screen_widgets/upcoming_events.dart';
import 'package:gc3bapp/screens/manage_conference_screen/manage_conference.dart';
import 'package:gc3bapp/screens/meeting_screen/meeting_screen.dart';
import 'package:gc3bapp/screens/profile_screen/profile_screen.dart';
import 'package:gc3bapp/screens/saved_events_screen/saved_events.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:gc3bapp/view_models/venue_provider.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VenueProvider? provider;
  AuthProvider? authVm;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    provider = context.read<VenueProvider>();
    authVm = context.read<AuthProvider>();
    provider?.getLocationOfUser();
    super.initState();

  }

  // final screens = [
  //   ManageConferences(),
  //   TicketsScreen(),
  //   MeetingScreen(),
  //   ProfileScreen(user: authVm!.authModal?.user,)
  // ];

  int? currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final conferenceVm = Provider.of<ConferenceProvider>(context);
    final screens = [
      ManageConferences(controller: controller),
      SocialAndFeed(),
      MeetingScreen(),
      ProfileScreen(user: authVm!.authModal?.user,)
    ];
    authVm = context.watch<AuthProvider>();
    return SafeArea(
        child: Scaffold(
          body: screens[currentIndex!],
          bottomNavigationBar: ScrollToHide(
            scrollController: controller,
            height: 90.h,
            child: Container(
              width: 422.w,
              height: 90.h,
              color: AppColors.onPrimaryColor,
              child: NavigationBar(
                height: 90.h,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorColor: Colors.transparent,
                surfaceTintColor: AppColors.onPrimaryColor,
                backgroundColor: AppColors.onPrimaryColor,
                destinations: [
                  NavigationDestination(
                      icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset("assets/svgs/home.svg", colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),)
                      ),
                      selectedIcon: SvgPicture.asset("assets/svgs/home.svg", colorFilter: ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),),
                      label: "Home"),
                  NavigationDestination(icon:
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset("assets/svgs/announcement.svg", colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),)),
                  selectedIcon: SvgPicture.asset("assets/svgs/announcement.svg", colorFilter: ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),),
                  label: "My Feed",),
                  NavigationDestination(
                      icon: SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset("assets/svgs/bookmark.svg", colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),)),
                      label: "Saved Events",
                    selectedIcon: SvgPicture.asset("assets/svgs/bookmark.svg", colorFilter: ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),),
                  ),
                  NavigationDestination(
                    icon: SizedBox(
                        height: 32.h,
                        width: 32.h,
                        child: CircleAvatar(
                          backgroundColor: AppColors.lightGrey,
                          radius: 16.r,
                          child:
                          authVm!.authModal?.user?.avatar == null?
                          Center(
                            child: Icon(Icons.person, size: 32.sp, color: AppColors.grey,),
                          )
                              : CircleAvatar(
                              radius: 16.r,
                              foregroundImage: NetworkImage(authVm!.authModal?.user?.avatar)
                          ),
                        )
                    ),
                    label: "Profile",
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
