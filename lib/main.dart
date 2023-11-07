import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/config/env.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/config/providers.dart';
import 'package:gc3bapp/config/router.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/screens/registration_screen/registration_screen.dart';
import 'package:gc3bapp/services/connection_service.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/theme/theme.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  APiEnvironment.setUpEnv(Environment.staging);
  setUpLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.lightBlue
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  .then((value) => runApp(const MyApp()));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator<ConnectionService>().checkConnection();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    locator<ConnectionService>().closeConnection();
  }


  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.light();
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MultiProvider(
            providers: providers,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'CSA app',
              theme: theme,
              onGenerateRoute: generateRoute,
              initialRoute: AppRoute.splashRoute,
              navigatorKey: locator<RouterService>().navigatorKey,
            ),
          );
        });
  }
}

