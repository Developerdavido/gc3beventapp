import 'package:flutter/material.dart';

class MyPopUpMenuItem {

  String? title;
  IconData? iconData;
  VoidCallback? onTap;

  MyPopUpMenuItem({this.title, this.onTap, this.iconData});
}