import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/services/router_service.dart';

class TopScreen extends StatelessWidget {
  final IconData? iconData;
  final bool? isBackIconVisible;
  final Widget? accountIcon;
  final bool? isAccountIconVisible;
  const TopScreen(
      {Key? key,
      this.iconData,
      this.isAccountIconVisible = false,
      this.isBackIconVisible = false,
      this.accountIcon,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
            visible: isBackIconVisible!,
            child: InkWell(
              onTap: (){
                locator<RouterService>().pop();
              },
              child: SizedBox(
                height: 24.h,
                width: 24.h,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  size: 24.w,
                ),
              ),
            )
        ),
        Visibility(
          visible: isAccountIconVisible!,
            child: accountIcon!)
      ],
    );
  }
}
