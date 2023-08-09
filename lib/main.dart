import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/config/router.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/screens/registration_screen/registration_screen.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.light();
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CSA app',
            theme: theme,
            onGenerateRoute: generateRoute,
            initialRoute: AppRoute.userRegistrationRoute,
            navigatorKey: locator<RouterService>().navigatorKey,
          );
        });
  }
}

