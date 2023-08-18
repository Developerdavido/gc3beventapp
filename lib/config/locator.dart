


import 'package:gc3bapp/services/auth_service.dart';
import 'package:gc3bapp/services/conference_service.dart';
import 'package:gc3bapp/services/connection_service.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/services/hotel_services.dart';
import 'package:gc3bapp/services/http_service.dart';
import 'package:gc3bapp/services/incidence_services.dart';
import 'package:gc3bapp/services/local_storage_service.dart';
import 'package:gc3bapp/services/locator_service.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/services/site_services.dart';
import 'package:gc3bapp/services/venues_services.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

 void setUpLocator() {
      locator.registerLazySingleton<HttpService>(() => HttpService());
      locator.registerLazySingleton<AuthService>(() => AuthService());
      locator.registerLazySingleton<ConferenceService>(() => ConferenceService());
      locator.registerLazySingleton<SiteService>(() => SiteService());
      locator.registerLazySingleton<VenueService>(() => VenueService());
      locator.registerLazySingleton<HotelService>(() => HotelService());
      locator.registerLazySingleton<RouterService>(() => RouterService());
      locator.registerLazySingleton<IncidenceService>(() => IncidenceService());
      locator.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
      locator.registerLazySingleton<DialogService>(() => DialogService());
      locator.registerLazySingleton<ConnectionService>(() => ConnectionService());
      locator.registerLazySingleton<LocationService>(() => LocationService());
 }