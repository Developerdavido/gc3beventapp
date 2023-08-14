

import 'package:intl/intl.dart';

class Conference {
  int? id;
  String? theme;
  String? programOutline;
  DateTime? date;
  String? time;
  String? description;
  String? banner;
  Venue? venue;
  int? seats;
  List<Attendee>? attendees;
  List<Session>? sessions;

  getConferenceDate() {
    String formattedDate = DateFormat('dd MMM yyyy').format(date!);
    return formattedDate;
  }

  getConferenceTime(){
    DateTime dateTime = DateFormat('HH:mm:ss').parse(time!);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  Conference({
    this.id,
    this.theme,
    this.programOutline,
    this.date,
    this.time,
    this.description,
    this.banner,
    this.venue,
    this.seats,
    this.attendees,
    this.sessions,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
    id: json["id"],
    theme: json["theme"],
    programOutline: json["program_outline"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    description: json["description"],
    banner: json["banner"],
    venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
    seats: json["seats"],
    attendees: json["attendees"] == null ? [] : List<Attendee>.from(json["attendees"]!.map((x) => Attendee.fromJson(x))),
    sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "theme": theme,
    "program_outline": programOutline,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "description": description,
    "banner": banner,
    "venue": venue?.toJson(),
    "seats": seats,
    "attendees": attendees == null ? [] : List<dynamic>.from(attendees!.map((x) => x.toJson())),
    "sessions": sessions == null ? [] : List<dynamic>.from(sessions!.map((x) => x.toJson())),
  };
}

class Attendee {
  int? id;
  String? avatar;
  String? fullName;
  String? email;
  String? phone;
  String? country;

  Attendee({
    this.id,
    this.avatar,
    this.fullName,
    this.email,
    this.phone,
    this.country,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) => Attendee(
    id: json["id"],
    avatar: json["avatar"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "country": country,
  };
}

class Session {
  int? id;
  String? topic;
  String? time;
  String? speaker;

  getSessionTime(){
    DateTime dateTime = DateFormat('HH:mm:ss').parse(time!);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  Session({
    this.id,
    this.topic,
    this.time,
    this.speaker,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["id"],
    topic: json["topic"],
    time: json["time"],
    speaker: json["speaker"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic": topic,
    "time": time,
    "speaker": speaker,
  };
}

class Venue {
  int? id;
  String? name;
  String? address;
  String? country;
  String? city;
  double? lat;
  double? lon;

  Venue({
    this.id,
    this.name,
    this.address,
    this.country,
    this.city,
    this.lat,
    this.lon,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "country": country,
    "city": city,
    "lat": lat,
    "lon": lon,
  };
}
