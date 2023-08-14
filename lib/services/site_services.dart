

import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class SiteService extends HttpService {
  
  
  
  //get all sites
  getSites() async {
    var response = await get(Api.sites);
    return response;
  }
  

  // visit a site
  visitASite(String? siteId) async {
    var response = await post("${Api.sites}$siteId/visit");
    return response;
  }

}