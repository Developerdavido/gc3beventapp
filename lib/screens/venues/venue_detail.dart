import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/custom_loader.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/models/venue.dart';
import 'package:gc3bapp/screens/venues/venues_widgets/venue_conference_card.dart';
import 'package:gc3bapp/screens/venues/venues_widgets/venue_distance_widget.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/services/venues_services.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/venue_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class VenueDetail extends StatefulWidget {
  final Venue? venue;
  const VenueDetail({Key? key, this.venue}) : super(key: key);

  @override
  State<VenueDetail> createState() => _VenueDetailState();
}

class _VenueDetailState extends State<VenueDetail>
    with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animatedMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _animatedMapController.mapController,
            options: MapOptions(
                center: LatLng(widget.venue!.lat!, widget.venue!.lon!),
                zoom: 18),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.gc3bapp.gc3bapp',
              ),
              AnimatedMarkerLayer(
                markers: [
                  AnimatedMarker(
                      point: LatLng(widget.venue!.lat!, widget.venue!.lon!),
                      builder: (_, __) => Icon(
                            Icons.location_on,
                            color: AppColors.primaryColor,
                            size: 48.sp,
                          ))
                ],
              )
            ],
          ),
          Positioned(
            left: 26.w,
            top: 67.h,
            child: const TopScreen(
              isBackIconVisible: true,
            ),
          ),
          Positioned(
              left: 38.w,
              top: 139.h,
              child: Consumer<VenueProvider>(
                builder: (context, venueVm, child) {
                  return VenueDistance(
                    distance: locator<VenueService>().calculateDistanceInMeters(
                            startLatitude: venueVm.position?.latitude,
                            startLongitude: venueVm.position?.longitude,
                            endLatitude: widget.venue?.lat,
                            endLongitude: widget.venue?.lon) ??
                        0,
                  );
                },
              )),
          Positioned(
              left: 0.w,
              bottom: 52.h,
              child: Consumer<ConferenceProvider>(
                builder: (context, conferenceVm, child){
                  return Container(
                    height: 240.h,
                    width: 1.sw,
                    child: Center(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.venue!.venueConference!.length,
                          itemBuilder: (context, index) {
                            final venueConf = widget.venue!.venueConference![index];
                            return GestureDetector(
                              onTap: () async {
                                var conference = await conferenceVm.getAConference(venueConf.id);
                                if (conference != null) {
                                  locator<RouterService>().push(AppRoute.conferenceDetailsRoute, args: conference);
                                }
                              },
                              child: ConferenceVenueCard(
                                venueConference: venueConf,
                              ),
                            );
                          }),
                    ),
                  );
                },
              )),
          Consumer<ConferenceProvider>(
            builder: (context, conference, child){
              return  Visibility(
                  visible: conference.isLoading,
                  child: const CustomLoader(color: AppColors.primaryColor,));
            },
          ),
        ],
      ),
    );
  }
}
