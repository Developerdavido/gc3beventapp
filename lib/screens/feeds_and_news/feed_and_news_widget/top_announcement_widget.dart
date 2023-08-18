import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc3bapp/constants/utils.dart';

import '../../../constants/colors.dart';

class TopAnnouncementWidget extends StatelessWidget {
  const TopAnnouncementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.w,
          width: 20.w,
          child: SvgPicture.asset("assets/svgs/announcement.svg", colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.color),),
        ),
        Utils.horizontalPadding(space: 4.w),
        Text(
          'Announcement',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppColors.primaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
          )
        )
      ],
    );
  }
}
