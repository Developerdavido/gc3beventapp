import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/account_message.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/email.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/forgot_password.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/password.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/phone.dart';
import 'package:gc3bapp/services/router_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 26.w, top: 67.h),
                child: const TopScreen(
                  isBackIconVisible: false,
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SingleChildScrollView(
                      child: Form(
                        key: key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Utils.verticalPadding(space: 63.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.h),
                              child: const TitleText(titleText: "Account \nLogin",),
                            ),
                            Utils.verticalPadding(space: 117.h),
                            Email(),
                            const Password(),
                            Utils.verticalPadding(space: 22.h),
                            ForgotPassword(
                              onForgotTap: (){},
                            ),
                            Utils.verticalPadding(space: 65.h),
                            CustomButton(
                                btnText: 'Login',
                                onTap: (){
                                  locator<RouterService>().push(AppRoute.homeRoute);
                                }),
                            Utils.verticalPadding(space: 17.h),
                            Center(
                              child: AccountMessage(
                                title: "Dont have an account? ",
                                actionText: "Register",
                                onTap: (){
                                  locator<RouterService>().push(AppRoute.accountRegistrationRoute);
                                },
                              ),
                            ),
                            Utils.verticalPadding(space: 83.h),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
