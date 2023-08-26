import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/csa_logo.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/storage_key.dart';
import 'package:gc3bapp/models/auth_model.dart';
import 'package:gc3bapp/services/auth_service.dart';
import 'package:gc3bapp/services/local_storage_service.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthProvider? vm;

  _handleLogin() {
    vm = context.read<AuthProvider>();
    locator<AuthService>().isAuthenticated().then((value) {
      if (value) {
        locator<LocalStorageService>().readModel(LocalStorageKey.authKey).then((value) {
          if (value != null) {
            vm!.authModal = AuthModal.fromJson(value);
            locator<RouterService>().pushNamedAndRemoveUntil(AppRoute.homeRoute);
          }
        });
      }else {
        locator<RouterService>().pushNamedAndRemoveUntil(AppRoute.landingPageRoute);
      }
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), _handleLogin);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Container(
              height: 136.h,
              width: 136.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CSALogo(
                  height: 260.h,
                  width: 260.h,
                ),
              ),
            ),
            Spacer(),
            Text(
              "Powered by Omni Strategies",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.grey,
                  fontSize: 12
              ),
            ),
            Utils.verticalPadding(space: 16.h)
          ],
        ),
      )
    );
  }
}
