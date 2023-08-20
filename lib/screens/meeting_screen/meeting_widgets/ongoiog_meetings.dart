import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/screens/meeting_screen/meeting_widgets/meeting_card.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class UpComingMeeting extends StatefulWidget {
  const UpComingMeeting({Key? key}) : super(key: key);

  @override
  State<UpComingMeeting> createState() => _UpComingMeetingState();
}

class _UpComingMeetingState extends State<UpComingMeeting> {
  @override
  Widget build(BuildContext context) {
    final conferenceVm = Provider.of<ConferenceProvider>(context);
    return Scaffold(
        body: conferenceVm.gettingMeetingsList
            ? Center(
          child: SpinKitWanderingCubes(
            color: AppColors.primaryColor,
            size: 50.sp,
          ),
        )
            : conferenceVm.meetings.isEmpty
            ? EmptyListState(
          message:
          "You do not have any saved on-going meetings at the moment",
        )
            : ListView.builder(
            itemCount: conferenceVm.meetings.length,
            itemBuilder: (context, index) {
              final meeting =
              conferenceVm.meetings[index];
              return MeetingCard(meeting: meeting);
            })
    );
  }
}
