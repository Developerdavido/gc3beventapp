import 'package:flutter/material.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/config/app_constants.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class Email extends StatelessWidget {
  const Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return CustomTextField(
          controller: auth.emailCtrl,
          inputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          hintText: "Email",
          validator: (value){
            if (value!.isEmpty) {
              return "Email must not be empty";
            }else if(!AppConstants.emailRegex.hasMatch(value)){
              return "Email is not a valid";
            }
            return null;
          },
        );
      },
    );
  }
}
