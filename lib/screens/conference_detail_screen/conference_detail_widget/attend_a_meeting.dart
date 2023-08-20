import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/conference_description.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/conference_organization.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class AttendAMeeting extends StatelessWidget {
  final Conference? conference;
  const AttendAMeeting({Key? key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(39.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.w,),
        child: Consumer<ConferenceProvider>(
          builder: (context, confVm, child){
            return Form(
              key: confVm.conferenceKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Utils.verticalPadding(space: 32.h),
                  Text(
                      "Attend a meeting",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  Utils.verticalPadding(space: 12.h),
                  Text(
                    "Please fill in the following details",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Utils.verticalPadding(space: 32.h),
                  ConferenceOrganization(),
                  ConferenceDescription(),
                  confVm.isLoading
                      ? SpinKitCircle(size: 32.sp,
                    color: AppColors.primaryColor,
                  )
                      : CustomButton(
                      btnText: "Join Conference",
                      onTap: (){
                       if ( confVm.conferenceKey.currentState!.validate()) {
                         confVm.joinAConference("${conference!.id}");
                       }
                      })
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
