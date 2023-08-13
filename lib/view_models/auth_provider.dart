import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/models/api_response.dart';
import 'package:gc3bapp/models/error_handler.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class AuthProvider extends BaseProvider {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  String? countryCode = "GH";
  String? phoneNumber;

  //login the user
  login() async {
    setUiState(UIState.loading);
    try {
      var response = await auth.loginUser(
        password: passwordCtrl.text.trim(),
        email: emailCtrl.text.trim()
      );
      setUiState(UIState.done);
      log("auth response${response.toString()}");
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        clearFields();
      }
      dialog.showResponseDialog(context: router.navigatorKey.currentState!.context,
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

  //register a new user
  register() async {
    setUiState(UIState.loading);
    try {
      var response = await auth.registerUser(
          password: passwordCtrl.text.trim(),
          email: emailCtrl.text.trim(),
          phone: phoneCtrl.text.trim(),
          country: countryCode,
          avatar: null,
          fullName: fullNameCtrl.text.trim(),
          confirmPassword: confirmPasswordCtrl.text.trim()
      );
      setUiState(UIState.done);
      log("auth response${response.toString()}");
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        clearFields();
      }
      dialog.showResponseDialog(context: router.navigatorKey.currentState!.context,
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

  clearFields() {
    emailCtrl.text = "";
    passwordCtrl.text = "";
    confirmPasswordCtrl.text = "";
    fullNameCtrl.text = "";
    countryCtrl.text = "";
    phoneCtrl.text = "";
  }
}
