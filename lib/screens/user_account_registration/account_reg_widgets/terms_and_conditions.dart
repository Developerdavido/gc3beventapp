import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  TapGestureRecognizer? _tapGestureRecognizer;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tapGestureRecognizer!.dispose();
  }

  void _handlePress() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your Terms and conditions clicked")));
  }

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthProvider>(context);
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: authVm.selectedTermsAndCondition,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            side: BorderSide(width: 0.5),
            onChanged: (value){
              authVm.changeSelectedTermsAndCondition(value!);
            }),
        Utils.horizontalPadding(space: 11.w),
        SizedBox(
          width: 294.w,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'I accept and agree to comply your ',
                  style: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black
                  )
                ),
                TextSpan(
                  text: 'Terms and Conditions and Privacy policy',
                  style: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryColor,
                    decoration: TextDecoration.underline
                  ),
                  recognizer: _tapGestureRecognizer
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
