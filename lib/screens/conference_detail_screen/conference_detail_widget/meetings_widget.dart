import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class MeetingsWidget extends StatelessWidget {
  final Conference? conference;
  final double? height;
  const MeetingsWidget({Key? key, this.conference, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(39.r),
                topLeft: Radius.circular(39.r)),
            color: AppColors.onPrimaryColor),
        child:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 5.h,
                  width: 47.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.grey
                  ),
                ),
              ),
          Utils.verticalPadding(space: 16.sp),
          Column(
            children: conference!.meetings!.isNotEmpty ? conference!.meetings!
                .map((e) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      e.getMeetingTime()!,
                      style: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    title: Text(
                      e.agenda!,
                      style: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    subtitle: e.hasTranslation! ? Text(
                      "Translation included",
                      style: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400),
                    ): Container(),
                    trailing: Consumer<ConferenceProvider>(
                      builder: (context, confVm, child){
                        return GestureDetector(
                          onTap: () {
                            //join a meeting
                            confVm.joinAMeeting("${e.id!}", e.hasTranslation);

                          },
                          child: Text(
                            "Join",
                            style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      },
                    )))
                .toList() :
            [
                  Align(
                    alignment: Alignment.center,
                    child: EmptyListState(
                      message: "There are no meetings available for this conference",
                    ),
                  )
            ],
          )
        ]));
  }
}
