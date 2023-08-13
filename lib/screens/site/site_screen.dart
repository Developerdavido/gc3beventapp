import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/utils.dart';

import '../../models/mock_conference_model.dart';
import '../hotel_screen/hotel_screen_widgets/hotel_card.dart';

class SiteScreen extends StatefulWidget {
  const SiteScreen({Key? key}) : super(key: key);

  @override
  State<SiteScreen> createState() => _SiteScreenState();
}

class _SiteScreenState extends State<SiteScreen> {
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
                child: const TitleText(titleText: "Site Visits",),
              ),
              Utils.verticalPadding(space: 22.h),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: ListView.builder(
                          itemCount: HotelOrSite.sites.length,
                          itemBuilder: (context, index) {
                            final site = HotelOrSite.sites[index];
                            return HotelCard(
                              name: site.name,
                              location: site.locationName,
                              costOrRating: site.cost,
                              isSite: true,
                              image: site.image,
                              isFavorited: site.isFavorited,
                              isFull: site.isFull,
                              onCardTap: (){
                                //locator<RouterService>().push(AppRoute.hotelDetailsRoute, args: hotel);
                              },
                              onFavoriteTap: (){
                                setState(() {
                                  site.isFavorited = !site.isFavorited!;
                                });
                              },
                            );
                          })
                  ))
            ],
          ),
        ));
  }
}
