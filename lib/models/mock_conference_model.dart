

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

 class Venue{
  String? date;
  String? time;
  Gps? coordinates;
  String? name;

  Venue({this.date, this.time, this.coordinates, this.name});


  static List<Venue> venues = [
    Venue(
      date: "August 15-17, 2023",
      time: "2:00 PM",
      name: "Grand Summit Convention Center",
      coordinates: Gps(
        longitude: 0.0,
        latitude: 0.0
      )
    ),
    Venue(
        date: "September 5-7, 2023",
        time: "2:00 PM",
        name: "Riverfront Convention Hall",
        coordinates: Gps(
            longitude: 0.0,
            latitude: 0.0
        )
    ),
    Venue(
        date: "October 10-12, 2023",
        time: "2:00 PM",
        name: "Oceanview Conference Hall",
        coordinates: Gps(
            longitude: 0.0,
            latitude: 0.0
        )
    ),
  ];


}

class Gps {
  double? latitude;
  double? longitude;

  Gps({this.latitude, this.longitude});
}

class Hotel{
  String? name;
  String? locationName;
  String? image;
  num? rating;
  bool? isFavorited = false;
  num? cost;
  Gps? gps;
  String? description;

  Hotel({this.name, this.image, this.locationName, this.rating, this.isFavorited = false, this.cost,
      this.gps, this.description});


  static List<Hotel> hotels = [
    Hotel(
      name: "Crystal Oasis Hotel",
      locationName: "Evergreen Events Center",
      rating: 4.9,
      isFavorited: false,
      image: "assets/images/crystal.jpeg",
      cost: 49.99,
      gps: Gps(
        latitude: 0.0,
        longitude: 0.0
      ),
      description: "Crystal Oasis Hotel offers a convenient and relaxing stay for conference attendees. A short drive or a leisurely walk along the scenic riverfront will lead you to the conference venue, ensuring you arrive at your meetings feeling refreshed and ready to engage in fruitful discussions."
    ),
    Hotel(
        name: "Azure View Lodge",
        locationName: "Ocean Breeze Pavilion",
        rating: 3.5,
        isFavorited: false,
        image: "assets/images/azure.jpeg",
        cost: 34.99,
        gps: Gps(
            latitude: 0.0,
            longitude: 0.0
        ),
        description: "Azure View Lodge offers a convenient and relaxing stay for conference attendees. A short drive or a leisurely walk along the scenic riverfront will lead you to the conference venue, ensuring you arrive at your meetings feeling refreshed and ready to engage in fruitful discussions."
    ),
    Hotel(
        name: "Chipotles Serene Lodge",
        locationName: "Evergreen Events Center",
        rating: 4.9,
        isFavorited: false,
        image: "assets/images/evergreen.jpeg",
        cost: 69.99,
        gps: Gps(
            latitude: 0.0,
            longitude: 0.0
        ),
        description: "Chipotles Serene Lodge offers a convenient and relaxing stay for conference attendees. A short drive or a leisurely walk along the scenic riverfront will lead you to the conference venue, ensuring you arrive at your meetings feeling refreshed and ready to engage in fruitful discussions."
    ),
  ];
}