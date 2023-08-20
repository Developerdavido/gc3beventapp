import 'package:flutter/material.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

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
