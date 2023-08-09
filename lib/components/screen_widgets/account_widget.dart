import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class AccountWidget extends StatelessWidget {
  final VoidCallback? onAccountTap;
  const AccountWidget({Key? key, this.onAccountTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAccountTap,
      child: Container(
        height: 55.h,
        color: Colors.transparent,
        child: Row(
          children: [
            Transform.translate(
              offset: const Offset(14.0, 0),
              child: Container(
                padding: EdgeInsets.all(16.w),
                height: 55.h,
                width: 55.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor
                ),
                child: Icon(
                  CupertinoIcons.bell,
                  color: AppColors.onPrimaryColor,
                  size: 24.sp,
                ),
              ),
            ),
            const CircleAvatar(
                backgroundColor: AppColors.grey,
                radius: 35,
                child:
                // user!.user?.avatar == null?
                Center(
                  child: Icon(Icons.person, size: 48, color: AppColors.primaryColor,),
                ),
                    // : CircleAvatar(
                    // radius: 35,
                    // foregroundImage: NetworkImage(user!.user!.avatar!)
                //),
            ),
          ],
        ),
      ),
    );
  }
}
