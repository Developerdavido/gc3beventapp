import 'package:flutter/material.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return CustomTextField(
          controller: auth.passwordCtrl,
          inputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          hintText: "Password",
          isPasswordField: true,
          validator: (value){
            if (value!.isEmpty) {
              return "Password field must not be empty";
            }else if(value.length < 8){
              return "Password must not be less than 8 characters";
            }
            return null;
          },
        );
      },
    );
  }
}
