import 'package:flutter/material.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class FullName extends StatelessWidget {
  const FullName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child){
        return CustomTextField(
          controller: auth.fullNameCtrl,
          inputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          hintText: "Full Name",
          validator: (value){
            if (value!.isEmpty) {
              return "Name must not be empty";
            }else if(value.length < 3){
              return "Name must not be less than 3 characters";
            }
            return null;
          },
        );
      },
    );
  }
}
