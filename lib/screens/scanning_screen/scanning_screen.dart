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

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({Key? key}) : super(key: key);

  @override
  _ScanningScreenState createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  ConferenceProvider? confVm;
  AuthProvider? authVm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confVm = context.read<ConferenceProvider>();
    authVm = context.read<AuthProvider>();
    confVm!.scannerController = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (confVm!.isScanning) {
      confVm!.scannerController = MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    confVm = context.watch<ConferenceProvider>();
    var scanQr = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightGrey, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          height: 0.5.sh,
          width: 0.5.sh,
          child: !confVm!.isScanning || confVm!.isLoading ? Center(
            child: SpinKitCircle(size: 32.sp,
              color: AppColors.primaryColor,
            )
          ) : CaptureQRCode(
            mobileScannerController: confVm?.scannerController,
            onDetect: (capture) async {
              final List<Barcode>? barcodes = capture.barcodes;
              confVm!.setScanning(false);
              if (barcodes != null) {
                for(var barcode in barcodes){
                 //show that the user is validated hit the endpoint
                  String? url = barcode.displayValue;
                  bool confirmUser = await confVm!.confirmUserInConference(url);
                  if (confirmUser) {
                    locator<DialogService>().showCustomDialog(context: context, customDialog: ConfirmUserAttendance(
                      iconData: Icons.check_circle_outline,
                      message: "User confirmed",
                      onBtnTap: (){
                        locator<RouterService>().pop();
                        confVm!.setScanning(true);
                      },
                    ));
                  }if (!confirmUser) {
                    confVm!.setScanning(true);
                  }

                }
              }
            },
          ),
        ),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Utils.verticalPadding(space: 0.1.sh),
            const Center(child: CSALogo()),
            Utils.verticalPadding(space: 22.h),
            Text(
              "Scan the qr-code on the users device to confirm registration for the conference.",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 22.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Utils.verticalPadding(space: 0.05.sh),
            scanQr
          ],
        ),
      ),
    );
  }
}
