import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/conf_detail_item.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowUserQrCode extends StatelessWidget {
  final Conference? conf;
  const ShowUserQrCode({Key? key, this.conf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        backgroundColor: AppColors.onPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(39.r),
        ),
        child: Consumer2<AuthProvider, ConferenceProvider>(
          builder: (context,authVm, confVm, child) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.0.h,),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.lightPrimaryColor
                      ),
                      child: SizedBox(
                        height: 160.h,
                        width: 160.h,
                        child: Image.network(confVm.currentUserRegistration!.qrCode!),
                      ),
                    ),
                    Utils.verticalPadding(space: 24.h),
                    Text(
                      conf!.theme!,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Utils.verticalPadding(space: 38.h),
                    ConfQrCodeDetailItem(
                      headerLeft: "Attendee Name",
                      dataLeft: authVm.authModal!.user!.fullName,
                      headerRight: "Phone",
                      dataRight: authVm.authModal!.user!.phone,
                    ),
                    Utils.verticalPadding(space: 18.h),
                    ConfQrCodeDetailItem(
                      headerLeft: "Venue",
                      dataLeft: conf!.conferenceVenue!.name,
                      headerRight: "Seats",
                      dataRight: "${conf!.seats}",
                    ),
                    Utils.verticalPadding(space: 18.h),
                    ConfQrCodeDetailItem(
                      headerLeft: "Date",
                      dataLeft: conf!.getConferenceDate(conf!.startDateTime!),
                      headerRight: "Time",
                      dataRight: conf!.getConferenceTime(conf!.startDateTime!),
                    ),
                  ],
                )
            );
          },
        )
    );
  }
}
