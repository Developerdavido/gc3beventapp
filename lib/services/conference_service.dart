

import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class ConferenceService extends HttpService{
  
  getConferences() async {
    var response = await get(Api.conferences);
    return response;
  }
  
  
  //register for a conference
  registerForAConference(String? conferenceId) async {
    var response = await post("${Api.conferences}$conferenceId/register");
    return response;
  }
}