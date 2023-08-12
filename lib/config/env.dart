

import 'package:gc3bapp/constants/api_constants.dart';

enum Environment {staging, dev,  prod}

abstract class APiEnvironment {
  static String? baseUrl;
  static String? mobileMode; //mobile-mode for http headers
  static late Environment _environment;
  static Environment get environment => _environment;

  static Future<void> setUpEnv(Environment env) async {

    _environment = env;

    switch (env) {
      case Environment.staging :
        {
          baseUrl = Api.stagingBaseUrl;
        }
        break;
      case Environment.dev :
        {
          baseUrl = Api.devBaseUrl;
          mobileMode = 'dev';
        }
        break;
      case Environment.prod:
        {
          baseUrl = Api.prodBaseUrl;
          mobileMode = "prod";
        }
        break;
    }


  }
}