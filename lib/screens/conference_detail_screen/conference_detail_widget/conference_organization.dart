import 'package:flutter/material.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class ConferenceOrganization extends StatelessWidget {
  const ConferenceOrganization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConferenceProvider>(
      builder: (context, confVm, child) {
        return CustomTextField(
          controller: confVm.organizationCtrl,
          inputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          minLines: 2,
          maxLines: 6,
          hintText: "Enter organization details here",
          validator: (value){
            if (value!.isEmpty) {
              return "Message field must not be empty";
            }
            return null;
          },
        );
      },
    );
  }
}
