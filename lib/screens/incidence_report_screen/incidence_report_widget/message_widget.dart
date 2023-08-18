import 'package:flutter/material.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/view_models/incidence_provider.dart';
import 'package:provider/provider.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IncidenceProvider>(
      builder: (context, incidenceVm, child) {
        return CustomTextField(
          controller: incidenceVm.messageCtrl,
          inputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          minLines: 3,
          maxLines: 6,
          hintText: "Fill in your report here",
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
