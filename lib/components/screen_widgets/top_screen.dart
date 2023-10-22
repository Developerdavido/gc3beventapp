import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/csa_logo.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/services/router_service.dart';

class TopScreen extends StatelessWidget {
  final bool? isBackIconVisible;
  final Widget? accountIcon;
  final IconData? iconData;
  final Color? iconColor;
  final bool? isAccountIconVisible;
  const TopScreen(
      {Key? key,
      this.isAccountIconVisible = false,
      this.isBackIconVisible = false,
        this.iconData,
        this.iconColor,
      this.accountIcon,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBackIconVisible!
            ? InkWell(
          onTap: (){
            locator<RouterService>().pop();
          },
          child: SizedBox(
            height: 24.h,
            width: 24.h,
            child: Icon(
              iconData ?? CupertinoIcons.arrow_left,
              color: iconColor ?? AppColors.black,
              size: 24.w,
            ),
          ),
        )
            : CSALogo(
          height: 55.h,
          width: 55.h,
        ),
        Visibility(
          visible: isAccountIconVisible!,
            child: accountIcon ?? Container())
      ],
    );
  }
}
