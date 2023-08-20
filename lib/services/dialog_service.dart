import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_alert_dialog.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/api_response.dart';

enum AlertDialogType { success, error, warning, confirm, custom }

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
    bool? showTitle = false,
    VoidCallback? onOkayBtnTap,
    VoidCallback? onCancelBtnTap,
    bool? barrierDismissible = true,
  }) {
    return showGeneralDialog(
        barrierDismissible: barrierDismissible!,
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        barrierColor: AppColors.primaryColor.withOpacity(0.3),
        barrierLabel: "response dialog barrier",
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (context, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
              scale: curve,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0.r),
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
              ));
        });
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
    return showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        barrierDismissible: barrierDismissible!,
        barrierColor: AppColors.primaryColor.withOpacity(0.3),
        barrierLabel: "dialog barrier",
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (context, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          Future.delayed(const Duration(seconds: 2)).then((value) {
            if (automaticallyClosed!) {
              Navigator.pop(context);
            }
          });
          return Transform.scale(scale: curve, child: customDialog);
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
