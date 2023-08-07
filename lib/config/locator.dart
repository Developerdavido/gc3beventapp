


import 'package:gc3bapp/services/router_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

 void setUpLocator() {
      locator.registerLazySingleton<RouterService>(() => RouterService());
 }