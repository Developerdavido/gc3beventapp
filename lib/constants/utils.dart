

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/services/router_service.dart';

import '../config/locator.dart';

class Utils {

  //vertical padding
  static verticalPadding({double space = 16}) => SizedBox(height: space,);
  //horizontal padding
  static horizontalPadding({double space = 16}) => SizedBox(width: space,);

  static showSnackBar({String? message}) => Flushbar(
    backgroundColor: AppColors.primaryColor,
    message: message,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    messageColor: AppColors.onPrimaryColor,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    messageSize: 18,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    duration: const Duration(seconds: 5),
  ).show(locator<RouterService>().navigatorKey.currentState!.context);


  static showConnectionSnackBar( {String? buttonTitle, String? message, Color? color, int? timeout,  VoidCallback? onBtnPressed, bool? barrierDismissible}) => Flushbar(
    backgroundColor: color ?? AppColors.primaryColor,
    message: message,
    margin: EdgeInsets.all(8.w),
    borderRadius: BorderRadius.circular(8.w),
    messageColor: AppColors.onPrimaryColor,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    messageSize: 16.sp,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    isDismissible: barrierDismissible ?? true,
    barBlur: 38,
    duration: Duration(seconds: timeout ?? 5),
  ).show(locator<RouterService>().navigatorKey.currentState!.context);

  static getNumberEquivalent(num number) {
    if ( number < 100) {
      return "$number";
    } else if (number > 100 && number < 100) {
      return "99+";
    } else if (number >= 1000) {
      var value = number.toString();
      return "${value[0]}K+";
    }
  }
}