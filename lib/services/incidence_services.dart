import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class IncidenceService extends HttpService {


  List<String> incidenceType = [
    'Cyberbullying',
    'Dos/DDoS',
    'Fraud',
    'Malware',
    'Misinformation',
    'Online Blackmail',
    'Online Child Abuse',
    'Online impersonation',
    'Publication of Non-consensual intimate images',
    'Ransomware',
    'Service disruption',
    'Spam/Phishing',
    'Unauthorised Access',
    'Website Defacement',
    'Others',
  ];


  postIncident(String? category, String? message) async {
    Map<String, dynamic> body = {
      "category": category,
      "message": message
    };
    var response = await post(Api.incidents, body: body);
    return response;
  }
}
