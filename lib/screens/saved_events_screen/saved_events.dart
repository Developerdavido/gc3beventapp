import 'package:flutter/material.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';

class SavedEvents extends StatelessWidget {
  const SavedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: EmptyListState(
            message: "Content on this page coming soon!!!",
          ),
        )
    );
  }
}
