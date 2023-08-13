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
        locator<RouterService>().pushNamedAndRemoveUntil(AppRoute.userLoginRoute);
      }
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleLogin();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 136.h,
                  width: 136.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGrey
                  ),
                  child: Center(
                    child: CSALogo(
                      height: 111.82.h,
                      width: 111.82.h,
                    ),
                  ),
                ),
              ),),
          Positioned(
            left: 0,
              right: 0,
              bottom: 77.h,
              child: Text(
                'GC3B EVENT MOBILE',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                )
              ))
        ],
      )
    );
  }
}
