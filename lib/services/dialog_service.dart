
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gc3bapp/components/custom_alert_dialog.dart';
import 'package:gc3bapp/models/api_response.dart';

enum AlertDialogType {success, error, warning, confirm, custom}

class DialogService {
  Future<bool?>? showAlertDialog({
    required BuildContext context,
    required String message,
    required AlertDialogType type,
    String? title,
    String? okayText = "OK",
    String? cancelText = "CANCEL",
    bool? showCancelBtn = false,
    bool? showOkayBtn = true,
    bool? showTitle = true,
    VoidCallback? onOkayBtnTap,
    VoidCallback? onCancelBtnTap,
    bool? barrierDismissible = true,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible!,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: CustomAlertDialog(
            message: message,
            type: type,
            title: title,
            okayText: okayText,
            cancelText: cancelText,
            showCancelBtn: showCancelBtn,
            showOkayBtn: showOkayBtn,
            showTitle: showTitle,
            onOkayBtnTap: onOkayBtnTap,
            onCancelBtnTap: onCancelBtnTap,
          ),
        );
      },
    );
  }

  bool showResponseDialog({
    required BuildContext context,
    required ApiResponse apiResponse,
    bool? disableSuccess = false,
    String? message,
    VoidCallback? onOkayBtnTap,
    bool? barrierDismissible = true,
  }) {
    if (apiResponse.allGood!) {
      if (!disableSuccess!) {
        showAlertDialog(
          context: context,
          message: message ?? apiResponse.message!,
          type: AlertDialogType.success,
          onOkayBtnTap: onOkayBtnTap,
          barrierDismissible: barrierDismissible,
        );
      }
    } else {
      showAlertDialog(
        context: context,
        message: apiResponse.message!,
        type: AlertDialogType.error,
        onOkayBtnTap: onOkayBtnTap,
        barrierDismissible: barrierDismissible,
      );

      return false;
    }
    return true;
  }

  Future<T?>? showCustomDialog<T>({
    required BuildContext context,
    required Widget customDialog,
    bool? barrierDismissible = true,
    bool? automaticallyClosed = false,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 2)).then((value) {
            if (automaticallyClosed!) {
              Navigator.pop(context);
            }
          });
          return customDialog;
        });
  }

  Future<T?>? showCustomModal<T>({
    required BuildContext context,
    required Widget customModal,
    Color? backgroundColor = Colors.transparent,
    Color? barrierColor = Colors.transparent,
    AnimationController? animationController,
    bool? isScrollControlled = true,
  }) {
    return showModalBottomSheet(
        backgroundColor: backgroundColor,
        isScrollControlled: isScrollControlled!,
        barrierColor: barrierColor,
        elevation: 0.0,
        transitionAnimationController: animationController,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return customModal;
        });
  }

}