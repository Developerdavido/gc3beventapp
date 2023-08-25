import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/custom_loader.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/conference_indicator.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/attend_a_meeting.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/conference_detail_title_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/custom_sliver_appbar_delegate.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/meetings_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/program_item_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/sessions_widget.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class ConferenceDetailScreen extends StatefulWidget {
  final Conference? conference;
  const ConferenceDetailScreen({Key? key, this.conference}) : super(key: key);

  @override
  State<ConferenceDetailScreen> createState() => _ConferenceDetailScreenState();
}

class _ConferenceDetailScreenState extends State<ConferenceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final conferenceVm = Provider.of<ConferenceProvider>(context);
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 575.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(39.r),
                            bottomRight: Radius.circular(39.r)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                              height: 575.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(39.r),
                              )),
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(39.r),
                                  bottomRight: Radius.circular(39.r)),
                              child: SizedBox(
                                  height: 575.h,
                                  width: 1.sw,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: widget.conference!.banner ?? "",
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        Center(child: SizedBox(
                                          height: 40.h,
                                            width: 40.h,
                                            child: CircularProgressIndicator(value: downloadProgress.progress))),
                                  ))),
                          Container(
                              height: 575.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(39.r),
                                    bottomRight: Radius.circular(39.r)),
                              )),
                          Positioned(
                            top: 31.h,
                            left: 31.w,
                            right: 31.w,
                            child: TopScreen(
                                isBackIconVisible: true,
                                isAccountIconVisible: true,
                                iconColor: AppColors.onPrimaryColor,
                                accountIcon: Container(
                                  height: 24.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: AppColors.primaryColor),
                                  child: Center(
                                    child: Text(
                                        Utils.getNumberEquivalent(widget.conference!.attendees!.length ?? 0),
                                        style: theme.textTheme.labelSmall!
                                            .copyWith(
                                          color: AppColors.onPrimaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                )),
                          ),
                          Positioned(
                            left: 46.w,
                            right: 46.w,
                            bottom: 32.h,
                            child: ConferenceDetailTitleWidget(
                                conference: widget.conference),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Utils.verticalPadding(space: 7.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(39.r),
                          color: AppColors.lightPurple),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0.w, vertical: 18.h),
                        child: Column(children: [
                          ProgramItemWidget(
                            conferenceIndicator:
                                ConferenceIndicator.conferenceIndicators[0],
                            onTap: () {
                              locator<DialogService>().showCustomDialog(context: context, customDialog: AttendAMeeting(
                                conference: widget.conference,
                              ));
                            },
                          ),
                          Utils.verticalPadding(space: 10.h),
                          ProgramItemWidget(
                            conferenceIndicator:
                                ConferenceIndicator.conferenceIndicators[1],
                            onTap: () {
                              locator<DialogService>().showCustomModal(
                                  barrierColor:
                                      AppColors.primaryColor.withOpacity(0.8),
                                  isScrollControlled:
                                      widget.conference!.sessions!.length < 4
                                          ? false
                                          : true,
                                  context: context,
                                  customModal: SessionsWidget(
                                    height:
                                        widget.conference!.sessions!.length < 4
                                            ? null
                                            : widget.conference!.sessions!
                                                    .length *
                                                0.3.sw,
                                    conference: widget.conference,
                                  ));
                            },
                          ),
                          Utils.verticalPadding(space: 10.h),
                          ProgramItemWidget(
                            conferenceIndicator:
                                ConferenceIndicator.conferenceIndicators[2],
                            onTap: () {
                              locator<DialogService>().showCustomModal(
                                  barrierColor:
                                      AppColors.primaryColor.withOpacity(0.8),
                                  isScrollControlled:
                                      widget.conference!.meetings!.length < 4
                                          ? false
                                          : true,
                                  context: context,
                                  customModal: MeetingsWidget(
                                    height:
                                        widget.conference!.meetings!.length < 4
                                            ? null
                                            : widget.conference!.meetings!
                                                    .length *
                                                0.3.sw,
                                    conference: widget.conference,
                                  ));
                            },
                          ),
                        ]),
                      )),
                ),
              ),
            ],
          ),
          Consumer<ConferenceProvider>(
            builder: (context, conference, child) {
              return Visibility(
                  visible: conference.isLoading,
                  child: const CustomLoader(
                    color: AppColors.lightBlue,
                  ));
            },
          ),
        ],
      ),
    ));
  }
}
