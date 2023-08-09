import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/components/screen_widgets/user_registration_account_widget.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/services/router_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              Utils.verticalPadding(space: 63.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 64.h),
                child: const TitleText(titleText: "User \nRegistration",),
              ),
              Utils.verticalPadding(space: 62.h),
              Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.h),
                      child: Column(
                        children: [
                          UserRegistrationAccountWidget(
                            onTap: (){
                              locator<RouterService>().push(AppRoute.accountRegistrationRoute);
                            },
                            label: "Account creation/\nRegistration Session",
                            labelColor: AppColors.onPrimaryColor,
                            titleColor: AppColors.onPrimaryColor,
                            title: "Participants",
                            containerColor: AppColors.primaryColor,
                            circleAndIconColor: AppColors.onPrimaryColor,
                          ),
                          Utils.verticalPadding(space: 36.h),
                          UserRegistrationAccountWidget(
                            onTap: (){
                              locator<RouterService>().push(AppRoute.accountRegistrationRoute);
                            },
                            label: "Users \nSession",
                            labelColor: AppColors.black,
                            titleColor: AppColors.black,
                            title: "Administration",
                            circleAndIconColor: AppColors.black,
                          ),

                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
