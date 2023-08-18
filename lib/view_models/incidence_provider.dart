import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class IncidenceProvider extends BaseProvider {
  TextEditingController messageCtrl = TextEditingController();
  String? category = "";

  saveCategory(String value) {
    category = value;
    notifyListeners();
  }

  reportAnIncident() async {
    setUiState(UIState.loading);
    try {
      var response =
          await incidenceReport.postIncident(category, messageCtrl.text);
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      setUiState(UIState.done);
      if (apiResponse.allGood!) {
        if (apiResponse.code == 201) {
          clearFields();
          dialog.showAlertDialog(
              context: router.navigatorKey.currentState!.context,
              message:
                  "Report has been submitted. We will immediately get on it",
              type: AlertDialogType.success);
        }else {
          dialog.showResponseDialog(
            context: router.navigatorKey.currentState!.context,
            apiResponse: apiResponse,
            barrierDismissible: true,
          );
        }
      }
    } on DioException catch (e) {
      setUiState(UIState.done);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }

  clearFields(){
    category = "";
    messageCtrl.text = "";
  }
}


