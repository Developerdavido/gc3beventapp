import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';
import 'package:gc3bapp/screens/venues/venues_widgets/venue_bottom_widget.dart';
import 'package:gc3bapp/screens/venues/venues_widgets/venue_top_widget.dart';

class VenueCard extends StatelessWidget {
  final Venue? venue;
  const VenueCard({Key? key, this.venue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.5.h),
      child: Container(
        height: 259.h,
        width: 386.w,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(38.r)
        ),
        child: Stack(
          children: [
            Positioned(
                top: 27.h,
                left: 20.w,
                right: 20.w,
                child: VenueTopWidget(
                  venueTime: venue!.time!,
                  venueDate: venue!.date,
                )),
            Positioned(
              bottom: 27.h,
              left: 20.w,
              right: 20.w,
              child: VenueBottomWidget(
                venueName: venue!.name,
                onDirectionTap: (){

                },
              ))
          ],
        ),
      ),
    );;
  }
}
