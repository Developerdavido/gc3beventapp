

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ConferenceIndicator{
  String? title;
  bool? onIndicatorClicked = false;
  IconData? iconData;

  ConferenceIndicator({this.onIndicatorClicked = false, this.title, this.iconData});

  static List<ConferenceIndicator> conferenceIndicators = [
    ConferenceIndicator(title: "Show your QR code", onIndicatorClicked: true, iconData: Icons.qr_code_2_outlined),
    ConferenceIndicator(title: "Sessions", onIndicatorClicked: false, iconData: Icons.backpack_outlined),
    ConferenceIndicator(title: "Meetings", onIndicatorClicked: false, iconData: CupertinoIcons.book),
  ];
}
