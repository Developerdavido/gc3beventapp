import 'package:flutter/material.dart';
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
          okayBtn(context, screenHeight, width),
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
        padding: EdgeInsets.all(screenHeight * 0.01),
        width: width * 0.3,
        height: screenHeight * 0.08,
        color: AppColors.primaryColor,
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
        fontSize: 18.0,
      ),
    );

    const loader = SizedBox(
      height: 10,
      width: 10,
      child: CircularProgressIndicator(
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