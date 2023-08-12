
import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_screen.dart';
import 'package:gc3bapp/screens/conference_screen/conference_screen.dart';
import 'package:gc3bapp/screens/home_screen/home_screen.dart';
import 'package:gc3bapp/screens/login_screen/login_screen.dart';
import 'package:gc3bapp/screens/registration_screen/registration_screen.dart';
import 'package:gc3bapp/screens/splash_screen/splash_screen.dart';
import 'package:gc3bapp/screens/user_account_registration/user_account_registration.dart';

Route<dynamic>  generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case AppRoute.userRegistrationRoute:
      return CupertinoPageRoute(builder: (_)=> const RegistrationScreen());
    case AppRoute.accountRegistrationRoute:
      return CupertinoPageRoute(builder: (_)=> const UserAccountRegistration());
    case AppRoute.conferencesRoute:
      return CupertinoPageRoute(builder: (_)=> const ConferenceScreen());
    case AppRoute.homeRoute:
      return CupertinoPageRoute(builder: (_)=> const HomeScreen());
    case AppRoute.userLoginRoute:
      return CupertinoPageRoute(builder: (_)=> const LoginScreen());
    case AppRoute.conferenceDetailsRoute:
      return CupertinoPageRoute(builder: (_)=> ConferenceDetailScreen(conference: settings.arguments as MockConferenceModel,));
    default:
      return CupertinoPageRoute(builder: (_)=> const SplashScreen());
  }

}