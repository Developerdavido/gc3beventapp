

import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class HotelService extends HttpService {


  getAllHotels() async {
    var response = await get(Api.hotels);
    return response;
  }
}