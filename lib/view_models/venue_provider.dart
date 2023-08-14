

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/models/venue.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class VenueProvider extends BaseProvider {

  bool gettingVenuesList = false;

  List<Venue> venues = [];

  //get conferences
  getAllVenues() async {
    try {
      gettingVenuesList = true;
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
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }
}