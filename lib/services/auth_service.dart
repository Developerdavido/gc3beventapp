import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/storage_key.dart';
import 'package:gc3bapp/models/auth_model.dart';
import 'package:gc3bapp/services/http_service.dart';
import 'package:gc3bapp/services/local_storage_service.dart';
import 'package:gc3bapp/services/router_service.dart';

class AuthService extends HttpService {
  //auto login

  //get when the user is authenticated
  Future<bool> isAuthenticated() async {
    try {
      AuthModal userModel = AuthModal.fromJson(
          await localStorage.readModel(LocalStorageKey.authKey));

      String bearerToken = userModel.token!;

      if (bearerToken == null || bearerToken == "") {
        print("bearerToken is empty.");
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  //register user
  registerUser(
      {String? fullName,
      String? phone,
      String? email,
      String? country,
      String? avatar,
      String? password,
      String? confirmPassword}) async {
    Map<String, dynamic> body = {
      "full_name" : fullName,
      "phone" : phone,
      "email" : email,
      "country" : country,
      "avatar" : avatar,
      'organization': null,
      'description': null,
      "password1" : password,
      "password2" : confirmPassword,
    };
    
    var response = await loginPost(Api.register, body: body);
    return response;
  }

  //login user
  loginUser(
      {
        String? email,
        String? password,
       }) async {
    Map<String, dynamic> body = {
      "email" : email,
      "password" : password,
    };
    var response = await loginPost(Api.login, body: body);
    return response;
  }

  logout()async{
    await LocalStorageService().deleteModel(LocalStorageKey.authKey);
    locator<RouterService>().pushNamedAndRemoveUntil(AppRoute.userLoginRoute);
  }
}
