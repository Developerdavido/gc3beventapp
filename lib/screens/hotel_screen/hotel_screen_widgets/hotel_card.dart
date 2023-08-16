import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_card_bottom_widget.dart';
import 'package:gc3bapp/services/router_service.dart';

class HotelCard extends StatelessWidget {
  final String? name;
  final String? location;
  final num? costOrRating;
  final bool? isSite;
  bool? isFavorited;
  final String? image;
  final VoidCallback? onCardTap;
  final VoidCallback? onFavoriteTap;
  final bool? isFull;
  HotelCard({Key? key,
    this.isSite = false,
    this.onFavoriteTap,
    this.location,
    this.name,
    this.image,
    this.isFull,
    this.onCardTap,
    this.costOrRating,
    this.isFavorited = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onCardTap,
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
                          child: image != null ? Image.network(image!, fit: BoxFit.cover,) : Container(color: AppColors.lightPurple,)
                      ),
                    ),
                    Positioned(
                      right: 23.69.w,
                        top: 13.h,
                        child:GestureDetector(
                          onTap: onFavoriteTap!,
                          child: Container(
                            height: 25.31.h,
                            width: 25.31.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor
                            ),
                            child: Center(
                              child: Icon(
                                isFavorited! ? Icons.favorite : Icons.favorite_border_outlined,
                                color: AppColors.lightBlue,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        )),
                    Visibility(
                      visible: isSite! && isFull!,
                      child: Positioned(
                          right: 23.69.w,
                          bottom: 19.h,
                          child:Container(
                            height: 28.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                color: AppColors.onPrimaryColor
                            ),
                            child: Center(
                              child: Text(
                                "Full",
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Utils.verticalPadding(space: 9.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: HotelCardBottomWidget(
                  hotelName: name!,
                  ratingOrCost: costOrRating,
                  hotelLocation: location,
                  isSite: isSite,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
