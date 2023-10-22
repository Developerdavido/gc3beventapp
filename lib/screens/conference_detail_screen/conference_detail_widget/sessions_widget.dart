import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';

class SessionsWidget extends StatelessWidget {
  final double? height;
  final Conference? conference;
  const SessionsWidget({Key? key, this.height, this.conference})
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
            children: conference!.sessions!.isNotEmpty ? conference!.sessions!
                .map((e) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.circle_rounded,
                        size: 16.sp,
                      ),
                      title: Text(
                        e.topic!,
                        style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        e.getSessionTime()!,
                        style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ))
                .toList() :
            [
              Align(
                alignment: Alignment.center,
                child: EmptyListState(
                  message: "There are no sessions available for this conference",
                ),
              )
            ],
          )
        ]));
  }
}
