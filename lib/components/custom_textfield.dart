import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';


class CustomTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool? isPasswordField;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final TextEditingController? controller;
  const CustomTextField({Key? key,
    this.focusNode,
    this.inputAction,
    this.isPasswordField = false,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.controller,
    this.hintText,
    this.enabled = true,
    this.suffix,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var outlineBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color:Colors.transparent,
      ), borderRadius: BorderRadius.circular(22.r)
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 1.sw,
          child: TextFormField(
            textInputAction: widget.inputAction,
            autofocus: false,
            focusNode: widget.focusNode,
            validator: widget.validator,
            decoration: InputDecoration(
              isDense: false,
              filled: true,
              fillColor: AppColors.lightGrey,
              errorMaxLines: 2,
              hintStyle: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.grey
              ),
              errorStyle: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16.sp,
                  color: Colors.red,
                fontWeight: FontWeight.w400
              ),
              hintText: widget.hintText,
              focusedBorder: outlineBorder,
              disabledBorder: outlineBorder,
              enabledBorder: outlineBorder,
              border: outlineBorder,
              suffix: widget.isPasswordField!
                  ? _buildPasswordFieldVisibilityToggle()
                  : widget.suffix,
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
            ),
            keyboardType: widget.keyboardType,
            style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.black,
                fontSize: 16.sp
            ),
            cursorColor: AppColors.black,
            obscureText: widget.isPasswordField! ? _obscureText : false,
            controller: widget.controller,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            enabled: widget.enabled,
          ),
        ),
        Utils.verticalPadding(space: 12.h),
      ],
    );
  }
  Widget _buildPasswordFieldVisibilityToggle() {
    return InkWell(
      child: Text(
        _obscureText?"Show":"Hide",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18.sp,
            color: AppColors.grey
        ),
      ),
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
