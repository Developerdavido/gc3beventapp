

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/models/site.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class SiteProvider extends BaseProvider {
  bool gettingSitesList = false;

  List<Site> sites = [];

  //get conferences
  getAllSites({bool backgroundLoad = false, bool refresh = false}) async {
    try {
      if (!backgroundLoad) {
        gettingSitesList = true;
      }
      if (refresh) {
        updateUi(()=> gettingSitesList = true);
      }
      var response = await site.getSites();
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingSitesList = false);
      if (apiResponse.allGood!) {
        sites = apiResponse.listData
            .map<Site>((e) => Site.fromJson(e))
            .toList();
      } else {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      updateUi(() => gettingSitesList = false);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }

  visitASite(String? siteId) async {
    setUiState(UIState.loading);
    try {
      var response = await site.visitASite(siteId);
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      setUiState(UIState.done);
      if (apiResponse.allGood!) {
        log(apiResponse.code.toString());
      }
      dialog.showResponseDialog(
        context: router.navigatorKey.currentState!.context,
        apiResponse: apiResponse,
        barrierDismissible: true,
      );
    } on DioException catch (e) {
      setUiState(UIState.done);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }
}