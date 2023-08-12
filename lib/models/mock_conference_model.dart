

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MockConferenceModel {
  String? conferenceTheme;
  String? conferenceTime;
  String? conferenceSpeaker;
  String? attendees;
  String? location;
  String? image;

  MockConferenceModel({this.conferenceTheme, this.attendees, this.conferenceSpeaker, this.location, this.conferenceTime, this.image});

  static List<MockConferenceModel> conferences = [
    MockConferenceModel(
      conferenceTheme: "AI in Cybersecurity",
      conferenceTime: "29 Jul 2023",
      location: "AV Copeland",
      image: "assets/images/user_image.jpeg",
      conferenceSpeaker: "Madelyn Philips",
      attendees: "1.7k"
    ),
    MockConferenceModel(
        conferenceTheme: "Blockchain and Cybersecurity",
        conferenceTime: "2 Aug 2023",
        location: "AV Copeland",
        image: "assets/images/user_image.jpeg",
        conferenceSpeaker: "Madelyn Philips",
        attendees: "1.7k"
    ),
    MockConferenceModel(
        conferenceTheme: "Internet of Things (IoT) Security",
        conferenceTime: "29 Jul 2023",
        location: "AV Copeland",
        image: "assets/images/user_image.jpeg",
        conferenceSpeaker: "Madelyn Philips",
        attendees: "1.7k"
    )
  ];
}

class ConferenceIndicator{
  String? title;
  bool? onIndicatorClicked = false;
  IconData? iconData;

  ConferenceIndicator({this.onIndicatorClicked = false, this.title, this.iconData});

  static List<ConferenceIndicator> conferenceIndicators = [
    ConferenceIndicator(title: "Join", onIndicatorClicked: false, iconData: CupertinoIcons.tv),
    ConferenceIndicator(title: "Program Outline", onIndicatorClicked: false, iconData: CupertinoIcons.book),
    ConferenceIndicator(title: "Sessions", onIndicatorClicked: false, iconData: Icons.backpack_outlined),
  ];
}

class ProgramOutline{
  String? title;
  String? time;

  ProgramOutline({this.title, this.time});

  static List<ProgramOutline> outlines = [
    ProgramOutline(
      title: "First speech by CSA director Ghana",
      time: "10:00"
    ),
    ProgramOutline(
        title: "First coffee break and Networking",
        time: "11:30"
    ),
    ProgramOutline(
        title: "Recognizing and avoiding phishing attacks",
        time: "12:00"
    ),

  ];

  static List<ProgramOutline> sessions = [
    ProgramOutline(
        title: "Understanding common cyber threats and risks",
        time: "2:00pm"
    ),
    ProgramOutline(
        title: "Best practices for creating strong passwords",
        time: "2:00pm"
    ),
    ProgramOutline(
        title: "Recognizing and avoiding phishing attacks",
        time: "2:00pm"
    ),

  ];
}