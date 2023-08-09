

import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/view_models/base_provider.dart';

class AuthProvider extends BaseProvider {

  TextEditingController emailCtrl  = TextEditingController();
  TextEditingController passwordCtrl  = TextEditingController();
  TextEditingController confirmPasswordCtrl  = TextEditingController();
  TextEditingController fullNameCtrl  = TextEditingController();
  TextEditingController countryCtrl  = TextEditingController();
  TextEditingController phoneCtrl  = TextEditingController();
  String? countryCode = "GH";
  String? phoneNumber;
}