import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/services/incidence_services.dart';
import 'package:gc3bapp/view_models/incidence_provider.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineBorder = OutlineInputBorder(
        borderSide: const BorderSide(
          color:Colors.transparent,
        ), borderRadius: BorderRadius.circular(22.r)
    );
    return Consumer<IncidenceProvider>(
      builder: (context, incidenceVm, child){
        return DropdownButtonFormField<String>(
          hint: Text(
            "Select issue category",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 16.sp,
                color: AppColors.grey
            ),
          ),
          iconSize: 14.sp,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w
            ),
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
            filled: true,
            fillColor: AppColors.lightGrey,
          ),
          dropdownColor: AppColors.lightGrey,
          onChanged: (String? newValue) {
           incidenceVm.saveCategory(newValue!);
          },
          items: locator<IncidenceService>().incidenceType.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                    fontSize: 14.sp
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
