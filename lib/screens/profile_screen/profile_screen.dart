import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/auth_model.dart';
import 'package:gc3bapp/screens/profile_screen/profile_pic_widget/profile_pic_widget.dart';
import 'package:gc3bapp/screens/profile_screen/profile_screen_elements.dart';
import 'package:gc3bapp/services/auth_service.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final User? user;
  const ProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Utils.verticalPadding(space: 50.h),
            // TopScreen(
            //   isBackIconVisible: false,
            //   isAccountIconVisible: false,
            // ),
            ProfilePictureWidget(
              user: user!,
            ),
            Utils.verticalPadding(space: 22.h),
            Text(
              user!.fullName!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 22,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
            Text(
              user!.email!,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 18, color: AppColors.grey),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Utils.verticalPadding(space: 55.h),
                    ProfileScreenElements(
                      iconData: Icons.report_gmailerrorred,
                      text: "Report an incident ",
                      callback: () {
                        locator<RouterService>().push(AppRoute.incidenceReportRoute);
                      },
                    ),
                    Utils.verticalPadding(space: 22.h),
                    ProfileScreenElements(
                      iconData: Icons.privacy_tip_outlined,
                      text: "Privacy",
                      callback: () {},
                    ),
                    Utils.verticalPadding(space: 22.h),
                    ProfileScreenElements(
                      iconData: Icons.help_outline,
                      text: "Help and support",
                      callback: () {},
                    ),
                    Utils.verticalPadding(space: 22.h),
                    Consumer<AuthProvider>(
                      builder: (context, authVm, child) {
                        return ProfileScreenElements(
                          isLogoutElement: true,
                          iconData: Icons.logout,
                          text: "Logout",
                          callback: () {
                            locator<AuthService>().logout();
                          },
                        );
                      },
                    ),
                    Utils.verticalPadding(space: 22.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
