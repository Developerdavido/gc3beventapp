

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/models/hotel.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class HotelProvider extends BaseProvider {
  bool gettingHotelsList = false;

  List<Hotel> hotels = [];

  //get conferences
  getHotels({bool backgroundLoad = false, bool refresh = false}) async {
    try {
      if (!backgroundLoad) {
        gettingHotelsList = true;
      }
      if (refresh) {
        updateUi(()=> gettingHotelsList = true);
      }
      var response = await hotel.getAllHotels();
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingHotelsList = false);
      if (apiResponse.allGood!) {
        hotels = apiResponse.listData
            .map<Hotel>((e) => Hotel.fromJson(e))
            .toList();
      } else {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      updateUi(() => gettingHotelsList = false);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }
}