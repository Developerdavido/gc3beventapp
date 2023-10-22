

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/models/venue.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';
import 'package:geolocator/geolocator.dart';

class VenueProvider extends BaseProvider {

  bool gettingVenuesList = false;

  Position? position;

  List<Venue> venues = [];

  //get conferences
  getAllVenues({bool backgroundLoad = false, bool refresh = false}) async {
    try {
      if (!backgroundLoad) {
        gettingVenuesList = true;
      }
      if (refresh) {
        updateUi(()=> gettingVenuesList = true);
      }
      var response = await venue.getVenues();
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingVenuesList = false);
      if (apiResponse.allGood!) {
        venues = apiResponse.listData
            .map<Venue>((e) => Venue.fromJson(e))
            .toList();
      } else {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      updateUi(() => gettingVenuesList = false);
      if (!backgroundLoad) {
        dialog.showAlertDialog(
            context: router.navigatorKey.currentState!.context,
            message: DioExceptionHandler.getMessage(e),
            type: AlertDialogType.error);
      }
    }
  }

  getLocationOfUser() async {
    position = await location.getCurrentUserLocation();
    notifyListeners();
  }
}