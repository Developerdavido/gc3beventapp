import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/custom_list_shimmer.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_card.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/custom_bottom_sheet.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class ConferenceScreen extends StatefulWidget {
  final ScrollController? controller;
  const ConferenceScreen({Key? key, this.controller}) : super(key: key);

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
      conferenceVm!.getAllConferences(backgroundLoad: false);
    } else {
      conferenceVm!.getAllConferences(backgroundLoad: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    conferenceVm = context.watch<ConferenceProvider>();
    final authVm = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: conferenceVm!.gettingConferenceList
                        ? CustomListShimmer(conferenceList: true,)
                        : conferenceVm!.conferences.isEmpty
                            ? EmptyListState(
                                message:
                                    "No Conferences found for you at the moment",
                              )
                            : RefreshIndicator.adaptive(
                                color: AppColors.primaryColor,
                                onRefresh: () async {
                                  await conferenceVm!
                                      .getAllConferences(refresh: true);
                                },
                                child: ListView.builder(
                                  controller: widget.controller,
                                    reverse: true,
                                    itemCount: conferenceVm!.conferences.length,
                                    itemBuilder: (context, index) {
                                      final conference =
                                          conferenceVm!.conferences[index];
                                      return GestureDetector(
                                        onTap: (){
                                          locator<RouterService>().push(
                                              AppRoute.conferenceDetailsRoute,
                                              args: conference);
                                        },
                                        child: ConferenceCard(
                                          conference: conference,
                                        ),
                                      );
                                    }),
                              )))
          ],
        ),
      ),
    );
  }
}
