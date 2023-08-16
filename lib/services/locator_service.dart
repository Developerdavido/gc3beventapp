 import 'package:geolocator/geolocator.dart';

class LocationService {
   /// Determine the current position of the device.
   ///
   /// When the location services are not enabled or permissions
   /// are denied the `Future` will return an error.
  //get current location
  Future<Position> getCurrentUserLocation() async {
    await Geolocator.requestPermission().then((value) {
    }).onError((error, stackTrace) async{
      await Geolocator.requestPermission();
      print("Error"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

}