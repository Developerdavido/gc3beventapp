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
import 'package:gc3bapp/screens/venues/venues_widgets/venue_card.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/venue_provider.dart';
import 'package:provider/provider.dart';

class VenuesScreen extends StatefulWidget {
  const VenuesScreen({Key? key}) : super(key: key);

  @override
  State<VenuesScreen> createState() => _VenuesScreenState();
}

class _VenuesScreenState extends State<VenuesScreen> {

  VenueProvider? venueVm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleGetVenues();
  }

  _handleGetVenues() {
    venueVm = context.read<VenueProvider>();
    venueVm?.getLocationOfUser();
    if (venueVm!.venues.isEmpty) {
      venueVm!.getAllVenues();
    }

  }

  @override
  Widget build(BuildContext context) {
    venueVm = context.watch<VenueProvider>();
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
                child: const TitleText(titleText: "Conference Venues",),
              ),
              Utils.verticalPadding(space: 22.h),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: venueVm!.gettingVenuesList
                          ? Center(
                        child: SpinKitWanderingCubes(
                          color: AppColors.primaryColor,
                          size: 50.sp,
                        ),
                      )
                          : venueVm!.venues.isEmpty
                          ? EmptyListState(
                        message: "No Venues found for you at the moment",
                      )
                          : ListView.builder(
                          itemCount: venueVm?.venues.length,
                          itemBuilder: (context, index) {
                            final venue = venueVm?.venues[index];
                            return GestureDetector(
                              onTap: (){
                                locator<RouterService>().push(AppRoute.venueDetail, args: venue);
                              },
                              child: VenueCard(
                                venue: venue,
                              ),
                            );
                          })
                  ))
            ],
          ),
        ));
  }
}
