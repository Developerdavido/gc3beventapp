import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';

class ConferenceTopWidget extends StatelessWidget {
  final String? conferenceDate;
  const ConferenceTopWidget({Key? key, this.conferenceDate,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightPrimaryColor
          ),
          child: Center(
            child: SizedBox(
              width: 24.w,
              child: Text(conferenceDate!,
                style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Row(
// children: [
// Container(
// height: 33.75.h,
// color: Colors.transparent,
// child: Row(
// children: [
// Transform.translate(
// offset: Offset(26.w, 0),
// child: CircleAvatar(
// backgroundColor: AppColors.lightGrey,
// radius: 17.r,
// child:
// attendeeImage == null ?
// Center(
// child: Icon(Icons.person, size: 24.sp, color: AppColors.grey,),
// )
// : CircleAvatar(
// radius: 17.r,
// foregroundImage: NetworkImage(attendeeImage!)
// ),
// ),
// ),
// Transform.translate(
// offset: Offset(-26.w, 0),
// child: Container(
// height: 33.75.h,
// width: 33.75.h,
// decoration: const BoxDecoration(
// shape: BoxShape.circle,
// color: AppColors.primaryColor
// ),
// child: Center(
// child: Text(
// Utils.getNumberEquivalent(numberOfAttendees ?? 0),
// style: theme.textTheme.labelSmall!.copyWith(
// color: AppColors.secondaryColor,
// fontSize: 12.sp
// ),
// ),
// ),
// ),
// ),
//
// ],
// ),
// ),
// Utils.horizontalPadding(space: 16.25.w),
// Text(conferenceTitle ?? "",
// style: theme.textTheme.labelSmall!.copyWith(
// fontSize: 14.sp,
// color: AppColors.onPrimaryColor,
// fontWeight: FontWeight.w500
// ),
// )
// ],
// ),
