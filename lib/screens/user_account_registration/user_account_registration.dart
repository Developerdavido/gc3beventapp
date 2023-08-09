import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/components/screen_widgets/csa_logo.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/app_constants.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/account_message.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/confirm_password.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/email.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/full_name.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/password.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/phone.dart';
import 'package:gc3bapp/screens/user_account_registration/account_reg_widgets/terms_and_conditions.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class UserAccountRegistration extends StatefulWidget {
  const UserAccountRegistration({Key? key}) : super(key: key);

  @override
  State<UserAccountRegistration> createState() => _UserAccountRegistrationState();
}

class _UserAccountRegistrationState extends State<UserAccountRegistration> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 26.w, top: 67.h),
                child: const TopScreen(
                  isBackIconVisible: true,
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
                              child: const TitleText(titleText: "Account \nRegistration",),
                            ),
                            Utils.verticalPadding(space: 52.h),
                            const Center(child: CSALogo()),
                            Utils.verticalPadding(space: 51.h),
                            FullName(),
                            Email(),
                            Phone(),
                            Utils.verticalPadding(space: 12.h),
                            const Password(),
                            const ConfirmPassword(),
                            Utils.verticalPadding(space: 17.h),
                           Center(child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 43.w),
                             child: const TermsAndConditions(),
                           )),
                            Utils.verticalPadding(space: 55.h),
                            CustomButton(
                              btnText: 'Register',
                                onTap: (){
                              locator<RouterService>().push(AppRoute.homeRoute);
                            }),
                            Utils.verticalPadding(space: 17.h),
                            Center(
                              child: AccountMessage(
                                title: "Have an account? ",
                                actionText: "Log In",
                                onTap: (){
                                  locator<RouterService>().push(AppRoute.userLoginRoute);
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
