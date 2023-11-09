import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/csa_logo.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/profile_screen/profile_pic_widget/profile_pic_widget.dart';
import 'package:gc3bapp/screens/scanning_screen/scanning_screen_widgets/capture_qr_code.dart';
import 'package:gc3bapp/screens/scanning_screen/scanning_screen_widgets/confirm_user_attendance.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class ScanningScreen extends StatelessWidget {
  final ConferenceProvider? confVm;
  final Function(String)? onCapture;
  const ScanningScreen({Key? key, this.confVm, this.onCapture}) : super(key: key);

  // ConferenceProvider? confVm;
  @override
  Widget build(BuildContext context) {
    //confVm = context.watch<ConferenceProvider>();
    var scanQr = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightGrey, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          height: 0.4.sh,
          width: 0.4.sh,
          child: CaptureQRCode(
            mobileScannerController: confVm?.scannerController,
            onDetect: (capture) async {
              final List<Barcode>? barcodes = capture.barcodes;
              //confVm!.setScanning(false);
              if (barcodes != null) {
                for(var barcode in barcodes){
                 //show that the user is validated hit the endpoint
                  String? url = barcode.displayValue;
                  onCapture!(url!);
                  locator<RouterService>().pop();
                  // if (!confirmUser) {
                  //   confVm!.setScanning(true);
                  // }

                }
              }
            },
          ),
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.onPrimaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(39.r), topRight: Radius.circular(39.r))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Utils.verticalPadding(space: 0.05.sh),
          const Center(child: CSALogo()),
          Utils.verticalPadding(space: 16.h),
          Text(
            "Scan the qr-code on the users device to confirm registration for the conference.",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          Utils.verticalPadding(space: 0.02.sh),
          scanQr
        ],
      ),
    );
  }
}
