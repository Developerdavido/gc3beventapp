import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class AccountMessage extends StatefulWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? actionText;
  const AccountMessage({Key? key, this.onTap, this.title, this.actionText}) : super(key: key);

  @override
  State<AccountMessage> createState() => _AccountMessageState();
}

class _AccountMessageState extends State<AccountMessage> {
  TapGestureRecognizer? _tapGestureRecognizer;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = widget.onTap;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tapGestureRecognizer!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: widget.title,
              style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black
              )
          ),
          TextSpan(
              text: widget.actionText,
              style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
              ),
              recognizer: _tapGestureRecognizer
          ),
        ],
      ),
    );;
  }
}
