import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_card.dart';
import 'package:gc3bapp/services/router_service.dart';

class ConferenceScreen extends StatefulWidget {
  const ConferenceScreen({Key? key}) : super(key: key);

  @override
  State<ConferenceScreen> createState() => _ConferenceScreenState();
}

class _ConferenceScreenState extends State<ConferenceScreen> {
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
              child: const  TopScreen(
                isBackIconVisible: true,
              ),
            ),
            Utils.verticalPadding(space: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 49.w),
              child: const TitleText(titleText: "Conferences",),
            ),
            Utils.verticalPadding(space: 22.h),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  child: ListView.builder(
                    itemCount: MockConferenceModel.conferences.length,
                      itemBuilder: (context, index) {
                      final conference = MockConferenceModel.conferences[index];
                      return ConferenceCard(
                        attendConference: (){
                          locator<RouterService>().push(AppRoute.conferenceDetailsRoute, args: conference);
                        },
                        conferenceDate: conference.conferenceTime,
                        conferenceTheme: conference.conferenceTheme,
                      );
                      })
                ))
          ],
        ),
      ),
    );
  }
}

