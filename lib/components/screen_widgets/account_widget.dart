import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

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
              offset: Offset(14.0.w, 0),
              child: Container(
                height: 55.h,
                width: 55.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlue
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.bell,
                    color: AppColors.primaryColor,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
            Consumer<AuthProvider>(
              builder: (context, auth, child) {
                return CircleAvatar(
                  backgroundColor: AppColors.lightGrey,
                  radius: 35.r,
                  child:
                  auth.authModal?.user?.avatar == null?
                  Center(
                    child: Icon(Icons.person, size: 24.sp, color: AppColors.grey,),
                  )
                  : CircleAvatar(
                  radius: 35.r,
                  foregroundImage: NetworkImage(auth.authModal?.user?.avatar)
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
