

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class ConferenceProvider extends BaseProvider {
  
  bool gettingConferenceList = false;

  List<Conference> conferences = [];
  
  //get conferences
  getAllConferences() async {

    try{
      gettingConferenceList = true;
      var response = await conference.getConferences();
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingConferenceList = false);
      if (apiResponse.allGood!) {
        conferences = apiResponse.listData.map<Conference>((e) => Conference.fromJson(e)).toList();
      }else {
        dialog.showResponseDialog(context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    }on DioException catch(e) {
      updateUi(() => gettingConferenceList = false);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }
}