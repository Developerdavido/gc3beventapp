import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/auth_model.dart';
import 'package:gc3bapp/screens/profile_screen/profile_pic_widget/my_conference_card.dart';
import 'package:gc3bapp/screens/profile_screen/profile_pic_widget/profile_pic_widget.dart';
import 'package:gc3bapp/screens/profile_screen/profile_pic_widget/profile_ui_widgets.dart';
import 'package:gc3bapp/screens/profile_screen/profile_screen_elements.dart';
import 'package:gc3bapp/screens/scanning_screen/scanning_screen.dart';
import 'package:gc3bapp/screens/scanning_screen/scanning_screen_widgets/confirm_user_attendance.dart';
import 'package:gc3bapp/services/auth_service.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final User? user;
  const ProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Utils.verticalPadding(space: 0.1.sh),
                ProfilePictureWidget(
                  user: widget.user!,
                ),
                Utils.verticalPadding(space: 22.h),
                Text(
                  widget.user!.fullName!,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 22,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.user!.email!,
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
                        Consumer<ConferenceProvider>(
                          builder: (context, cVm, _) {
                            cVm.getUserInConference(widget.user!.id);
                            return ProfileUiWidgets(
                              profileTitle: "My conferences",
                              height: 0.2.sh,
                              widget: cVm.userConferences.isEmpty ?
                                  Container(
                                    child: Center(
                                      child: Text(
                                          "You have not registered for any conference",
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColors.grey,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                  : ListView.builder(
                                  itemCount: cVm.userConferences.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                    var conf = cVm.userConferences[index];
                                    return MyConferenceCard(conference: conf,
                                      onTap: (){
                                      cVm.setChosenConference(conf);
                                      locator<RouterService>().push(AppRoute.conferenceDetailsRoute);
                                      cVm.checkIfUserIsAttendingConference(widget.user!.id!, cVm.currentConference!);
                                      },
                                    );
                                  }),
                            );
                          },

                        ),
                        widget.user!.isStaff! ? Utils.verticalPadding(space: 22.h) : Container(),
                        Visibility(
                          visible: widget.user!.isStaff!,
                          child: Consumer2<ConferenceProvider, AuthProvider>(
                            builder: (context, confVm, authVm, child) {
                              return ProfileScreenElements(
                                iconData: Icons.qr_code_scanner,
                                text: "Scan QR Code",
                                callback: () {
                                  confVm.scannerController = MobileScannerController(
                                      detectionSpeed: DetectionSpeed.noDuplicates);
                                  locator<DialogService>().showCustomModal(
                                      barrierColor: AppColors.grey.withOpacity(0.3),
                                      context: context,
                                      customModal: ScanningScreen(confVm: confVm,
                                        onCapture: (url) async {
                                          bool confirmUser = await confVm.confirmUserInConference(url);
                                          if (confirmUser) {
                                            locator<DialogService>().showCustomDialog(context: context, customDialog: ConfirmUserAttendance(
                                              iconData: Icons.check_circle_outline,
                                              message: "User confirmed",
                                              onBtnTap: (){
                                                locator<RouterService>().pop();
                                                // confVm!.setScanning(true);
                                              },
                                            ));
                                          }
                                        },
                                      ));
                                },
                              );
                            }
                          ),
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
          Consumer<ConferenceProvider>(
            builder: (context, confVm, child) {
              return Visibility(
                visible: confVm.isLoading,
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    color: AppColors.grey.withOpacity(0.2),
                    child: SpinKitCircle(size: 48.sp,
                      color: AppColors.primaryColor,
                    ),
                  ));
            }
          )
        ],
      ),
    );
  }
}
