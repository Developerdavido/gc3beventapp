import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/auth_model.dart';


class ProfilePictureWidget extends StatelessWidget {
  final User user;
  const ProfilePictureWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: AppColors.lightPurple,
        radius: 65.r,
        child: user.avatar == null? Center(
          child: Icon(Icons.person, size: 48.sp, color: AppColors.primaryColor,),
        ) : CircleAvatar(
            radius: 65.r,
            foregroundImage: NetworkImage(user.avatar!)
        )
    );
  }
}