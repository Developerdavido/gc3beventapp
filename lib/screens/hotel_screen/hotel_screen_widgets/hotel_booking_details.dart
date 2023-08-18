import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/components/screen_widgets/custom_hotel_direction_widget.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/hotel.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_card_bottom_widget.dart';
import 'package:gc3bapp/services/router_service.dart';

class HotelBookingDetails extends StatefulWidget {
  final Hotel? hotel;
  const HotelBookingDetails({Key? key, this.hotel}) : super(key: key);

  @override
  State<HotelBookingDetails> createState() => _HotelBookingDetailsState();
}

class _HotelBookingDetailsState extends State<HotelBookingDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
          height: 351.h,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(39.r),
                bottomRight: Radius.circular(39.r)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(39.r),
                      bottomRight: Radius.circular(39.r)),
                  child: SizedBox(
                      height: 351.h,
                      width: 1.sw,
                      child: Image.network(
                        widget.hotel!.image!,
                        fit: BoxFit.cover,
                      ))),
              Positioned(
                top: 31.h,
                left: 31.w,
                right: 31.w,
                child: TopScreen(
                    isBackIconVisible: true,
                    isAccountIconVisible: true,
                    iconColor: AppColors.black,
                    accountIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.hotel!.isFavorite = !widget.hotel!.isFavorite!;
                        });
                      },
                      child: Container(
                        height: 25.31.h,
                        width: 25.31.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor),
                        child: Center(
                          child: Icon(
                            widget.hotel!.isFavorite!
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColors.lightBlue,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
        Utils.verticalPadding(space: 16.h),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39.r),
                  color: AppColors.lightGrey),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 39.0.w, vertical: 20.h),
                  child: Column(
                    children: [
                      HotelCardBottomWidget(
                        hotelName: widget.hotel!.name,
                        hotelLocation:
                            "${widget.hotel?.lat}, ${widget.hotel?.lon}",
                        ratingOrCost: 3.5,
                      ),
                      Utils.verticalPadding(space: 46.h),
                      SizedBox(
                        width: 339.w,
                        child: Text(
                          widget.hotel!.description!,
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                      Utils.verticalPadding(space: 8.h),
                      CustomHotelDirectionWidget(
                        iconData: "assets/svgs/Icon.svg",
                        width: 353.w,
                        titleWidget: Text(
                          "Distance from conference",
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            letterSpacing: 0.25,
                          ),
                        ),
                        trailingWidget: Text(
                          "5.6 kilometers",
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                      Utils.verticalPadding(space: 8.h),
                      CustomHotelDirectionWidget(
                        iconData: "assets/svgs/coins-hand.svg",
                        width: 307.w,
                        titleWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Price",
                              style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                                letterSpacing: 0.25,
                              ),
                            ),
                            Text(
                              "(cost per 1 night)",
                              style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ],
                        ),
                        trailingWidget: Text(
                          "\$ ${widget.hotel!.rate}",
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                      Utils.verticalPadding(space: 34.h),
                      CustomButton(
                          btnText:
                              "Book ${widget.hotel!.getFirstNameOfHotel()!}",
                          borderRadius: 93.r,
                          width: 249.31.w,
                          onTap: () {
                            //TODO: open the browser to get enter the hotel page
                            locator<RouterService>().push(
                                AppRoute.hotelWebViewRoute,
                                args: widget.hotel);
                          })
                    ],
                  ),
                ),
              )),
        ),
      ],
    )));
  }
}
