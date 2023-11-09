import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyConferenceCard extends StatelessWidget {
  final Conference? conference;
  final VoidCallback? onTap;
  const MyConferenceCard({Key? key, this.conference, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(color: AppColors.onPrimaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.5.sw,
                    child: Text(conference?.theme ?? "",
                        style: theme.textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Text(
                      "${conference?.conferenceVenue?.name ?? ""} | ${conference?.getConferenceTime(conference!.startDateTime!)}",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: AppColors.grey,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              QrImageView(
                size: 80.h,
                data: conference!.theme!,
              ),
              Icon(
                Icons.keyboard_arrow_right_sharp,
                color: AppColors.black,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
