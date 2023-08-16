import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_card.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/hotel_provider.dart';
import 'package:provider/provider.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  HotelProvider? hotelVm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleGetHotels();
  }

  _handleGetHotels() {
    hotelVm = context.read<HotelProvider>();
    if (hotelVm!.hotels.isEmpty) {
      hotelVm!.getHotels();
    }
  }

  @override
  Widget build(BuildContext context) {
    hotelVm = context.watch<HotelProvider>();
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
                      child: hotelVm!.gettingHotelsList
                          ? Center(
                        child: SpinKitWanderingCubes(
                          color: AppColors.primaryColor,
                          size: 50.sp,
                        ),
                      )
                          : hotelVm!.hotels.isEmpty
                          ? EmptyListState(
                        message: "No Hotels found for you at the moment",
                      )
                          : ListView.builder(
                          itemCount: hotelVm?.hotels.length,
                          itemBuilder: (context, index) {
                            final hotel = hotelVm?.hotels[index];
                            return HotelCard(
                              name: hotel?.name ?? "",
                              location: "${hotel?.lat}, ${hotel?.lon}",
                              costOrRating: 3.5,
                              isSite: false,
                              image: hotel?.image,
                              isFavorited: hotel?.isFavorite,
                              onCardTap: (){
                                locator<RouterService>().push(AppRoute.hotelDetailsRoute, args: hotel);
                              },
                              onFavoriteTap: (){
                                setState(() {
                                  hotel?.isFavorite = !hotel.isFavorite!;
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
