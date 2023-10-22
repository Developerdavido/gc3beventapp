import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_bottm_widget.dart';
import 'package:gc3bapp/screens/conference_screen/conference_widgets/conference_top_widget.dart';

class ConferenceCard extends StatelessWidget {
  final Conference? conference;
  const ConferenceCard({Key? key, this.conference,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.5.h),
      child: CachedNetworkImage(
        imageUrl: conference?.banner ?? "",
        imageBuilder: (context, imageProvider) => Container(
          height: 260.h,
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
            height: 380.h,
            decoration: BoxDecoration(
                color: AppColors.lightBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(38.r),
            )),
              Positioned(
                top: 14.h,
                  right: 27.w,
                  child: ConferenceTopWidget(
                    conferenceDate: conference!.getShortenedDate(
                        conference!.startDateTime!),
                  )),
              Positioned(
                  bottom: 6.h,
                  left: 6.w,
                  right: 6.w,
                  child: ConferenceBottomWidget(
                    conference: conference,
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
