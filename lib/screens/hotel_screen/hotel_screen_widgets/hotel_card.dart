import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_card_bottom_widget.dart';
import 'package:gc3bapp/services/router_service.dart';

class HotelCard extends StatefulWidget {
  final Hotel? hotel;
  const HotelCard({Key? key, this.hotel}) : super(key: key);

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        locator<RouterService>().push(AppRoute.hotelDetailsRoute, args: widget.hotel);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.5.h),
        child: Container(
          height: 263.h,
          width: 386.w,
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(38.r)
          ),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
                width: 386.w,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(38.r),
                      child: SizedBox(
                          height: 180.h,
                          width: 386.w,
                          child: Image.asset(widget.hotel!.image!, fit: BoxFit.cover,)),
                    ),
                    Positioned(
                      right: 23.69.w,
                        top: 13.h,
                        child:GestureDetector(
                          onTap: (){
                            setState(() {
                              widget.hotel!.isFavorited = !widget.hotel!.isFavorited!;
                            });
                          },
                          child: Container(
                            height: 25.31.h,
                            width: 25.31.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor
                            ),
                            child: Center(
                              child: Icon(
                                widget.hotel!.isFavorited! ? Icons.favorite : Icons.favorite_border_outlined,
                                color: AppColors.lightBlue,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ) )
                  ],
                ),
              ),
              Utils.verticalPadding(space: 9.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: HotelCardBottomWidget(
                  hotelName: widget.hotel!.name,
                  rating: widget.hotel!.rating,
                  hotelLocation: widget.hotel!.locationName,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
