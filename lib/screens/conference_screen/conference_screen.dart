import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_card.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class ConferenceScreen extends StatefulWidget {
  const ConferenceScreen({Key? key}) : super(key: key);

  @override
  State<ConferenceScreen> createState() => _ConferenceScreenState();
}

class _ConferenceScreenState extends State<ConferenceScreen> {
  ConferenceProvider? conferenceVm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conferenceVm = context.read<ConferenceProvider>();
    handleGetConferences();
  }

  handleGetConferences() {
    if (conferenceVm!.conferences.isEmpty) {
      conferenceVm!.getAllConferences();
    }
  }

  @override
  Widget build(BuildContext context) {
    conferenceVm = context.watch<ConferenceProvider>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.verticalPadding(space: 51.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              child: const TopScreen(
                isBackIconVisible: true,
              ),
            ),
            Utils.verticalPadding(space: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 49.w),
              child: const TitleText(
                titleText: "Conferences",
              ),
            ),
            Utils.verticalPadding(space: 22.h),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: conferenceVm!.gettingConferenceList
                        ? Center(
                            child: SpinKitWanderingCubes(
                              color: AppColors.primaryColor,
                              size: 50.sp,
                            ),
                          )
                        : conferenceVm!.conferences.isEmpty
                            ? EmptyListState(
                                message:
                                    "No Conferences found for you at the moment",
                              )
                            : ListView.builder(
                                itemCount: conferenceVm!.conferences.length,
                                itemBuilder: (context, index) {
                                  final conference =
                                      conferenceVm!.conferences[index];
                                  return ConferenceCard(
                                    attendConference: () {
                                      locator<RouterService>().push(
                                          AppRoute.conferenceDetailsRoute,
                                          args: conference);
                                    },
                                    conferenceDate:
                                        conference.getConferenceDate(),
                                    conferenceImage: conference.banner,
                                    attendeeImage:
                                        conference.attendees!.isNotEmpty
                                            ? conference.attendees?.last.avatar
                                            : "",
                                    conferenceTheme: conference.theme,
                                    conferenceTime:
                                        conference.getConferenceTime(),
                                    numberOfAttendees:
                                        conference.attendees!.length,
                                  );
                                })))
          ],
        ),
      ),
    );
  }
}
