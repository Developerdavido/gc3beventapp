

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ConferenceIndicator{
  String? title;
  bool? onIndicatorClicked = false;
  IconData? iconData;

  ConferenceIndicator({this.onIndicatorClicked = false, this.title, this.iconData});

  static List<ConferenceIndicator> conferenceIndicators = [
    ConferenceIndicator(title: "Join", onIndicatorClicked: true, iconData: CupertinoIcons.tv),
    // ConferenceIndicator(title: "Program Outline", onIndicatorClicked: false, iconData: CupertinoIcons.book),
    ConferenceIndicator(title: "Sessions", onIndicatorClicked: false, iconData: Icons.backpack_outlined),
  ];
}
