import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_bottm_widget.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_top_widget.dart';

class ConferenceCard extends StatelessWidget {
  final String? conferenceTheme;
  final String? conferenceDate;
  final String? conferenceTime;
  final String? conferenceImage;
  final num? numberOfAttendees;
  final VoidCallback? attendConference;
  final String? attendeeImage;
  final bool? userInConference;
  const ConferenceCard({Key? key,this.conferenceImage, this.userInConference, this.conferenceTime, this.attendeeImage,  this.numberOfAttendees, this.conferenceTheme, this.conferenceDate, this.attendConference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.5.h),
      child: CachedNetworkImage(
        imageUrl: conferenceImage ?? "",
        imageBuilder: (context, imageProvider) =>Container(
          height: 259.h,
          width: 386.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(38.r),
            image: DecorationImage(
                image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(AppColors.lightPurple, BlendMode.colorBurn)
            )
          ),
          child: Stack(
            children: [
            Container(
            height: 259.h,
            width: 386.w,
            decoration: BoxDecoration(
                color: AppColors.lightBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(38.r),
            )),
              Positioned(
                top: 27.h,
                  left: 20.w,
                  right: 20.w,
                  child: ConferenceTopWidget(
                    conferenceTitle: "",
                    conferenceTime: conferenceTime,
                    attendeeImage: attendeeImage,
                    numberOfAttendees: numberOfAttendees,
                  )),
              Positioned(
                  bottom: 27.h,
                  left: 20.w,
                  right: 20.w,
                  child: ConferenceBottomWidget(
                    conferenceDate: conferenceDate,
                    conferenceTheme: conferenceTheme,
                    attendConference: attendConference,
                    userInConference: userInConference!,
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
