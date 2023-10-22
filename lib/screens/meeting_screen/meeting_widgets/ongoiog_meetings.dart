import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/screens/meeting_screen/meeting_widgets/meeting_card.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class OnGoingMeetingScreen extends StatefulWidget {
  final ScrollController? controller;
  const OnGoingMeetingScreen({Key? key, this.controller}) : super(key: key);

  @override
  State<OnGoingMeetingScreen> createState() => _OnGoingMeetingScreenState();
}

class _OnGoingMeetingScreenState extends State<OnGoingMeetingScreen> {
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
            : conferenceVm.onGoingMeetings.isEmpty
            ? EmptyListState(
          message:
          "You do not have any saved on-going meetings at the moment",
        )
            : ListView.builder(
          controller: widget.controller,
            reverse: true,
            itemCount: conferenceVm.onGoingMeetings.length,
            itemBuilder: (context, index) {
              final meeting =
              conferenceVm.onGoingMeetings[index];
              return MeetingCard(meeting: meeting);
            })
    );
  }
}
