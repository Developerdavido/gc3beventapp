

import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class VenueService extends HttpService {


  getVenues() async {
    var response = await get(Api.venues);
    return response;
  }
}