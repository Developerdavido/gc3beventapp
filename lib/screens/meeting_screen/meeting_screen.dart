import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/account_widget.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/meeting_screen/meeting_widgets/upcoming_meeting.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
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
              Utils.verticalPadding(space: 22.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 49.w),
                child: const TitleText(titleText: "Meeting \nSchedules",),
              ),
              Utils.verticalPadding(space: 44.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                child: SizedBox(
                  height: 60.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 0.6.sw,
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
                                text: "Upcoming",
                              ),
                              Tab(text: "On Going")
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Utils.verticalPadding(space: 16.94.h),
              Expanded(
                  child: TabBarView(
                    children: [
                      UpcomingMeeting(),
                      UpcomingMeeting(),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
