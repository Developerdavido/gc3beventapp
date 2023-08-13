import 'package:gc3bapp/constants/api_constants.dart';
import 'package:gc3bapp/services/http_service.dart';

class AuthService extends HttpService {
  //auto login

  //get when the user is authenticated
  // Future<bool> isAuthenticated() async {
  //   try {
  //     AuthModal userModel = AuthModal.fromJson(
  //         await localStorage.readModel(StorageConstants.authModalKey));
  //
  //     String bearerToken = userModel.token!;
  //
  //     if (bearerToken == null || bearerToken == "") {
  //       print("bearerToken is empty.");
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  //   return true;
  // }

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
      "password1" : password,
      "password2" : confirmPassword,
    };
    
    var response = await post(Api.register, body);
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
      "password1" : password,
    };
    var response = await post(Api.login, body);
    return response;
  }
}
