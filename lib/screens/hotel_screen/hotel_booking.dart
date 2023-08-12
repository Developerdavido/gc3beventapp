import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_card.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

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
                child: const TitleText(titleText: "Hotels",),
              ),
              Utils.verticalPadding(space: 22.h),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: ListView.builder(
                          itemCount: Hotel.hotels.length,
                          itemBuilder: (context, index) {
                            final hotel = Hotel.hotels[index];
                            return HotelCard(
                              hotel: hotel,
                            );
                          })
                  ))
            ],
          ),
        ));
  }
}
