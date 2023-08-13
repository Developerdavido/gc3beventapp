import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class Phone extends StatelessWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var outlineBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color:Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(22.r)
    );
    return Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: AppColors.lightGrey,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 1.sw,
                  child: IntlPhoneField(
                    style: theme.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontSize: 16.sp),
                    autofocus: false,
                    controller: auth.phoneCtrl,
                    dropdownTextStyle: theme.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintStyle: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey),
                      filled: true,
                      fillColor: AppColors.lightGrey,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      labelStyle: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 16.sp),
                      hintText: "Phone number",
                      border: outlineBorder,
                      enabledBorder: outlineBorder,
                      disabledBorder: outlineBorder,
                      focusedBorder: outlineBorder,
                      errorStyle: theme.textTheme.headlineMedium!.copyWith(
                          fontSize: 16.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    languageCode: "en",
                    initialCountryCode: 'GH',
                    onChanged: (phone){

                    },
                    onCountryChanged: (country) {
                      auth.countryCode = country.code;
                    },
                  ),
                ),
                Utils.verticalPadding(space: 12.h),
              ],
            ),
          );
        });
  }
}
