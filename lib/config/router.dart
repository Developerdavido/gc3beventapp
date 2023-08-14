
import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_screen.dart';
import 'package:gc3bapp/screens/conference_screen/conference_screen.dart';
import 'package:gc3bapp/screens/home_screen/home_screen.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_booking.dart';
import 'package:gc3bapp/screens/hotel_screen/hotel_screen_widgets/hotel_booking_details.dart';
import 'package:gc3bapp/screens/login_screen/login_screen.dart';
import 'package:gc3bapp/screens/registration_screen/registration_screen.dart';
import 'package:gc3bapp/screens/site/site_screen.dart';
import 'package:gc3bapp/screens/splash_screen/splash_screen.dart';
import 'package:gc3bapp/screens/user_account_registration/user_account_registration.dart';
import 'package:gc3bapp/screens/venues/venues_screen.dart';

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
    case AppRoute.venueRoute:
      return CupertinoPageRoute(builder: (_)=> const VenuesScreen());
    case AppRoute.hotelRoute:
      return CupertinoPageRoute(builder: (_)=> const HotelScreen());
    case AppRoute.sitesRoute:
      return CupertinoPageRoute(builder: (_)=> const SiteScreen());
    case AppRoute.hotelDetailsRoute:
      return CupertinoPageRoute(builder: (_)=> HotelBookingDetails(hotel: settings.arguments as HotelOrSite,));
    case AppRoute.conferenceDetailsRoute:
      return CupertinoPageRoute(builder: (_)=> ConferenceDetailScreen(conference: settings.arguments as Conference,));
    default:
      return CupertinoPageRoute(builder: (_)=> const SplashScreen());
  }

}