

import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class ConferenceService extends HttpService{
  
  getConferences() async {
    var response = await get(Api.conferences);
    return response;
  }
  
  
  //register for a conference
  registerForAConference(String? conferenceId, {String? organization, String? description}) async {
    Map<String, dynamic> body = {
      "organization" : organization,
      "description" : description
    };
    var response = await post("${Api.conferences}$conferenceId/register", body: body);
    return response;
  }


  fetchConference(int? id) async {
    var response = await get("${Api.conferences}$id/");
    return response;
  }

  //join a meeting
  joinAMeeting(String? meetingId, bool? isTranslation) async {
    Map<String, dynamic> body = {"translation_requirement" : isTranslation.toString()};
    var response = await post("${Api.meetings}$meetingId/join/", body: body);
    return response;
  }
  //get all meetings
  getMeetings() async {
    var response = await get("${Api.meetings}");
    return response;
  }
}