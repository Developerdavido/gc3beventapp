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
    try {
      gettingConferenceList = true;
      var response = await conference.getConferences();
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingConferenceList = false);
      if (apiResponse.allGood!) {
        conferences = apiResponse.listData
            .map<Conference>((e) => Conference.fromJson(e))
            .toList();
      } else {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      updateUi(() => gettingConferenceList = false);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
  }

  joinAConference(String? conferenceId) async {
    setUiState(UIState.loading);
    try {
      var response = await conference.registerForAConference(conferenceId);
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


  //get a single conference
  Future<Conference>? getAConference(int? conferenceId) async {
    Conference? searchedConference;
    setUiState(UIState.loading);
    try {
      var response = await conference.fetchConference(conferenceId);
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      setUiState(UIState.done);
      if (apiResponse.allGood!) {
        searchedConference = Conference.fromJson(apiResponse.mappedObjects!);
      }else if(apiResponse.code != 200) {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      setUiState(UIState.done);
      dialog.showAlertDialog(
          context: router.navigatorKey.currentState!.context,
          message: DioExceptionHandler.getMessage(e),
          type: AlertDialogType.error);
    }
    return searchedConference!;
  }
}
