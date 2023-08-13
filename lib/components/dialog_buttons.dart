import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class DialogButtons extends StatelessWidget {
  final double? height;
  final String? okayText;
  final String? cancelText;
  final bool? showOkayBtn;
  final bool? showCancelBtn;
  final VoidCallback? onOkayButtonPressed;
  final VoidCallback? onCancelButtonPressed;
  final Color? color;
  final bool? isLoading;

  const DialogButtons({
    Key? key,
    this.height,
    this.okayText = "OK",
    this.cancelText = "CANCEL",
    this.onOkayButtonPressed,
    this.onCancelButtonPressed,
    this.color,
    this.showOkayBtn = true,
    this.showCancelBtn = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: mainAxisAlignment(),
        children: <Widget>[
          cancelBtn(context),
          okayBtn(context, 1.sh, 1.sw),
        ],
      ),
    );
  }

  MainAxisAlignment mainAxisAlignment() {
    if (showOkayBtn! && showCancelBtn!) {
      return MainAxisAlignment.spaceBetween;
    } else {
      return MainAxisAlignment.center;
    }
  }

  Widget okayBtn(context, double screenHeight, double width) {
    final _okayBtn =
    GestureDetector(
      onTap: onOkayButtonPressed,
      child: Container(
        padding: EdgeInsets.all(screenHeight * 0.01.h),
        width: width * 0.3.w,
        height: screenHeight * 0.08.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r)
        ),
        child: Center(
          child: _buildButtonData(true, okayText!),
        ),

      ),
    );

    if (showOkayBtn! && showCancelBtn!) {
      return Expanded(child: _okayBtn);
    } else if (showOkayBtn! && !showCancelBtn!) {
      return _okayBtn;
    } else {
      return Container();
    }
  }

  Widget cancelBtn(context) {
    final _cancelBtn = GestureDetector(
      onTap: onCancelButtonPressed,
      child: Container(
        // color: Colors.grey,
        child: Center(
          child: _buildButtonData(false, cancelText!),
        ),
      ),
    );

    if (showOkayBtn! && showCancelBtn!) {
      return Expanded(child: _cancelBtn);
    } else if (showCancelBtn! && !showOkayBtn!) {
      return _cancelBtn;
    } else {
      return Container();
    }
  }

  Widget _buildButtonData(bool isOkayBtn, String text) {
    final color = isOkayBtn ? Colors.white : Colors.grey;
    final btnText = Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 18.0.sp,
      ),
    );

    final loader = SizedBox(
      height: 10.h,
      width: 10.h,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 2,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        isOkayBtn
            ? isLoading!
            ? loader
            : btnText
            : btnText
      ],
    );
  }
}