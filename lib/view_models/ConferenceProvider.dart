import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';
import 'package:intl/intl.dart';

import '../models/saved_meetings_model.dart' as savedMeeting;

class ConferenceProvider extends BaseProvider {
  GlobalKey<FormState> conferenceKey = GlobalKey<FormState>();
  TextEditingController organizationCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  bool gettingConferenceList = false;
  bool gettingMeetingsList  = false;

  List<Conference> conferences = [];
  List<Conference> activeConferences = [];

  List<savedMeeting.SavedMeeting> meetings = [];
  List<savedMeeting.SavedMeeting> upComingMeetings = [];
  List<savedMeeting.SavedMeeting> onGoingMeetings = [];



  //get conferences
  getAllConferences({bool backgroundLoad = false, bool refresh = false}) async {
    try {
      if (!backgroundLoad) {
        gettingConferenceList = true;
      }
      if (refresh) {
        updateUi(()=> gettingConferenceList = true);
      }
      var response = await conference.getConferences();
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingConferenceList = false);
      if (apiResponse.allGood!) {
        conferences = apiResponse.listData
            .map<Conference>((e) => Conference.fromJson(e))
            .toList();
        getAllActiveConferences();
      } else {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      updateUi(() => gettingConferenceList = false);
      if (!backgroundLoad) {
        dialog.showAlertDialog(
            context: router.navigatorKey.currentState!.context,
            message: DioExceptionHandler.getMessage(e),
            type: AlertDialogType.error);
      }
    }
  }

  joinAConference(String? conferenceId) async {
    setUiState(UIState.loading);
    try {
      var response = await conference.registerForAConference(
          conferenceId,
          organization: organizationCtrl.text.trim(),
          description: descriptionCtrl.text.trim());
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      setUiState(UIState.done);
      if (apiResponse.allGood!) {
        log(apiResponse.code.toString());

      }
      clearFields();
      router.pop();
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

  // join a meeting
  joinAMeeting(String? meetingId, bool? containsTranslation) async {
    setUiState(UIState.loading);
    try {
      var response = await conference.joinAMeeting(meetingId, containsTranslation);
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

  getYourMeetings({bool backgroundLoad = false, bool refresh = false}) async {
    try {
      if (!backgroundLoad) {
        gettingMeetingsList = true;
      }
      if (refresh) {
        updateUi(()=> gettingMeetingsList = true);
      }
      var response = await conference.getMeetings();
      log(response.toString());
      var apiResponse = ApiResponse.parse(response);
      updateUi(() => gettingMeetingsList  = false);
      if (apiResponse.allGood!) {
        meetings = apiResponse.listData
            .map<savedMeeting.SavedMeeting>((e) => savedMeeting.SavedMeeting.fromJson(e))
            .toList();
        var today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
        upComingMeetings = meetings.where((element) => element.conference!.startDateTime!.isBefore(today)).toList();
        onGoingMeetings = meetings.where((element) => element.conference!.startDateTime!.isAtSameMomentAs(today)).toList();
      } else {
        dialog.showResponseDialog(
          context: router.navigatorKey.currentState!.context,
          apiResponse: apiResponse,
          barrierDismissible: true,
        );
      }
    } on DioException catch (e) {
      updateUi(() => gettingMeetingsList  = false);
      if (!backgroundLoad) {
        dialog.showAlertDialog(
            context: router.navigatorKey.currentState!.context,
            message: DioExceptionHandler.getMessage(e),
            type: AlertDialogType.error);
      }
    }
  }


  //check if the use is in the conference
  bool isUserInConference(int? userId, Conference? conference){
    bool found = false;
    var attendees = conference?.attendees;
    for(var attendee in attendees!){
      if(attendee.id == userId){
        found = true;
        break;
      }
    }
    log(found.toString());
    return found;

  }

  removeActiveConference(Conference conference){
    activeConferences.remove(conference);
    notifyListeners();
  }

  getAllActiveConferences(){
    DateTime today = DateTime.now();
    if (conferences.isNotEmpty) {
      for(var conference in conferences){
        if (conference.startDateTime!.isAtSameMomentAs(today)) {
          activeConferences.add(conference);
        }
      }
    }
  }

  clearFields(){
    organizationCtrl.text = "";
    descriptionCtrl.text = "";
  }

}
