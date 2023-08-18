import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/components/screen_widgets/custom_hotel_direction_widget.dart';
import 'package:gc3bapp/components/screen_widgets/custom_loader.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/site.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_card_bottom_widget.dart';
import 'package:gc3bapp/view_models/site_provider.dart';
import 'package:provider/provider.dart';

class SiteDetail extends StatefulWidget {
  final Site? site;
  const SiteDetail({Key? key, this.site}) : super(key: key);

  @override
  State<SiteDetail> createState() => _SiteDetailState();
}

class _SiteDetailState extends State<SiteDetail> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
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
                              widget.site!.image ?? "",
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
                                widget.site!.isFavorite =
                                    !widget.site!.isFavorite!;
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
                                  widget.site!.isFavorite!
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 39.0.w, vertical: 20.h),
                        child: Column(
                          children: [
                            HotelCardBottomWidget(
                              hotelName: widget.site?.name ?? "",
                              hotelLocation:
                                  "${widget.site?.lat}, ${widget.site?.lon}",
                              ratingOrCost: widget.site!.cost,
                              isSite: true,
                            ),
                            Utils.verticalPadding(space: 46.h),
                            SizedBox(
                              width: 339.w,
                              child: Text(
                                widget.site?.description ?? "",
                                style: theme.textTheme.labelSmall!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                            Utils.verticalPadding(space: 8.h),
                            // CustomHotelDirectionWidget(
                            //   iconData: "assets/svgs/Icon.svg",
                            //   width: 353.w,
                            //   titleWidget: Text(
                            //     "Distance from conference",
                            //     style: theme.textTheme.labelSmall!.copyWith(
                            //       fontSize: 14.sp,
                            //       fontWeight: FontWeight.w400,
                            //       color: AppColors.black,
                            //       letterSpacing: 0.25,
                            //     ),
                            //   ),
                            //   trailingWidget: Text(
                            //     "5.6 kilometers",
                            //     style: theme.textTheme.labelSmall!.copyWith(
                            //       fontSize: 15.sp,
                            //       fontWeight: FontWeight.w600,
                            //       color: AppColors.blue,
                            //       letterSpacing: 0.25,
                            //     ),
                            //   ),
                            // ),
                            // Utils.verticalPadding(space: 8.h),
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
                                    "(cost per 1 person)",
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
                                "\$ ${widget.site?.cost}",
                                style: theme.textTheme.labelSmall!.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blue,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                            Utils.verticalPadding(space: 34.h),
                            Consumer<SiteProvider>(
                              builder: (context, siteVm, child) {
                                return CustomButton(
                                    btnText:
                                        "Visit ${widget.site!.getFirstNameOfHotel()}",
                                    borderRadius: 93.r,
                                    onTap: () {
                                      siteVm.visitASite("${widget.site!.id!}");
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Consumer<SiteProvider>(
            builder: (context, site, child) {
              return Visibility(
                  visible: site.isLoading,
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
