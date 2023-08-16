

import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';

class VenueService extends HttpService {

  getVenues() async {
    var response = await get(Api.venues);
    return response;
  }

  //get the dierction to the venues
  showDirectionWithFirstMap(double latitude, double longitude, String title) async {
    final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showDirections(
        destination: Coords(latitude, longitude),
        destinationTitle: title
    );
  }

  calculateDistanceInMeters ({double? startLatitude, double? startLongitude, double? endLatitude, double? endLongitude}){
    double distanceInMeters = Geolocator.distanceBetween(startLatitude ?? 0.0, startLongitude ?? 0.0, endLatitude!, endLongitude!);
    return distanceInMeters != null ? (distanceInMeters / 1000).round() : 0;
  }


}