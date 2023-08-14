import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/mock_conference_model.dart';

class ProgramItemWidget extends StatelessWidget {
  final List<Session>? programOutline;
  final ConferenceIndicator? conferenceIndicator;
  final VoidCallback? onTap;
  ProgramItemWidget({Key? key, this.programOutline, this.conferenceIndicator, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 18.h),
        child: Stack(
          children: [
            AnimatedContainer(
              height: conferenceIndicator!.onIndicatorClicked == true ? (programOutline!.length * 170.h) : 60.h,
              width: 376.w,
              decoration: BoxDecoration(
                color: AppColors.onPrimaryColor,
                borderRadius: BorderRadius.circular(30.r)
              ),
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              duration: const Duration(milliseconds: 800
              ),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 87.h,),
                  Column(
                    children:  programOutline!.map((e) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.radio_button_on_rounded),
                      title: Text(
                        e.topic!,
                        style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 18.sp,
                            color:  AppColors.black,
                            fontWeight: FontWeight.w400

                        ),
                      ),
                      trailing: Text(
                        e.getSessionTime()!,
                        style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 18.sp,
                            color:  AppColors.black,
                            fontWeight: FontWeight.w400

                        ),
                      ),
                    )).toList(),
                  )
                ]
              )
            ),
            Container(
              height: 87.h,
              width: 376.w,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              decoration: BoxDecoration(
                color: conferenceIndicator!.onIndicatorClicked == true ? AppColors.primaryColor : AppColors.onPrimaryColor,
                borderRadius: BorderRadius.circular(30.r)
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(conferenceIndicator!.title!,
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 20.sp,
                        color: conferenceIndicator!.onIndicatorClicked == true ? AppColors.onPrimaryColor : AppColors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(conferenceIndicator!.iconData!, color: conferenceIndicator!.onIndicatorClicked == true ? AppColors.onPrimaryColor :AppColors.black, size: 24.sp,),
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
