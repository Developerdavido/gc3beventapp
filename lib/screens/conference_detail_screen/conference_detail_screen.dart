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
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/conference_details_attendees.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/custom_sliver_appbar_delegate.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/join_conference_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/meetings_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/program_item_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/sessions_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/show_user_qr_code.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_event_details.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/custom_bottom_sheet.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
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

                          ),
                          ),
                          Positioned(
                            left: 46.w,
                            right: 46.w,
                            bottom: 82.h,
                            child: ConferenceDetailTitleWidget(
                                conference: widget.conference),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          CustomBottomSheet(
            maxChildSize: conferenceVm.isUserPresent ? 0.65 : 0.5,
            widgets: [
            Column(
              children: [
                Utils.verticalPadding(space: 9.h),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5.h,
                    width: 47.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.grey
                    ),
                  ),
                ),
                Utils.verticalPadding(space: 13),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                  child: ConferenceEventDetails(
                    conference: widget.conference,
                  ),
                ),
                Utils.verticalPadding(space: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                  child: ConferenceEventAttendees(
                    conference: widget.conference,
                  ),
                ),
               Utils.verticalPadding(space: 10.h),
                conferenceVm.isUserPresent ? ProgramItemWidget(
                  conferenceIndicator: ConferenceIndicator.conferenceIndicators[0],
                  onTap: (){
                    locator<DialogService>().showCustomDialog(context: context, customDialog: ShowUserQrCode(conf: widget.conference,));
                  },
                ) : JoinConferenceWidget(
                  btnTap: (){
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
                Utils.verticalPadding(space: 10.h),

              ],
            )
          ],),
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
