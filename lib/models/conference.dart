

import 'package:intl/intl.dart';

class Conference {
  int? id;
  String? theme;
  String? programOutline;
  DateTime? startDateTime;
  DateTime? endDateTime;
  String? description;
  String? banner;
  ConferenceVenue? conferenceVenue;
  int? seats;
  List<Attendee>? attendees;
  List<Session>? sessions;
  List<Meeting>? meetings;

  getConferenceDate(DateTime date) {
    String formattedDate = DateFormat('dd MMM yyyy').format(date);
    return formattedDate;
  }

  getConferenceTime(DateTime date){
    String formattedTime = DateFormat('h:mm a').format(date);
    return formattedTime;
  }

  Conference({
    this.id,
    this.theme,
    this.programOutline,
    this.startDateTime,
    this.endDateTime,
    this.description,
    this.banner,
    this.meetings,
    this.conferenceVenue,
    this.seats,
    this.attendees,
    this.sessions,
  });

  factory Conference.fromJson(Map<dynamic, dynamic> json) => Conference(
    id: json["id"],
    theme: json["theme"],
    programOutline: json["program_outline"],
    startDateTime: json["start_date_time"] == null ? null : DateTime.parse(json["start_date_time"]),
    endDateTime: json["end_date_time"] == null ? null : DateTime.parse(json['end_date_time']),
    description: json["description"],
    banner: json["banner"],
    conferenceVenue: json["venue"] == null ? null : ConferenceVenue.fromJson(json["venue"]),
    seats: json["seats"],
    attendees: json["attendees"] == null ? [] : List<Attendee>.from(json["attendees"]!.map((x) => Attendee.fromJson(x))),
    sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
    meetings: json["meetings"] == null ? [] : List<Meeting>.from(json["meetings"]!.map((x) => Meeting.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "theme": theme,
    "program_outline": programOutline,
    "start_date_time": "${startDateTime!.year.toString().padLeft(4, '0')}-${startDateTime!.month.toString().padLeft(2, '0')}-${startDateTime!.day.toString().padLeft(2, '0')}",
    "end_date_time": "${endDateTime!.year.toString().padLeft(4, '0')}-${endDateTime!.month.toString().padLeft(2, '0')}-${endDateTime!.day.toString().padLeft(2, '0')}",
    "description": description,
    "banner": banner,
    "venue": conferenceVenue?.toJson(),
    "seats": seats,
    "attendees": attendees == null ? [] : List<dynamic>.from(attendees!.map((x) => x.toJson())),
    "sessions": sessions == null ? [] : List<dynamic>.from(sessions!.map((x) => x.toJson())),
    "meetings": meetings == null ? [] : List<dynamic>.from(meetings!.map((x) => x.toJson())),
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
  String? programOutline;
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
    this.programOutline,
    this.speaker,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["id"],
    topic: json["topic"],
    time: json["time"],
    speaker: json["speaker"],
    programOutline: json["program_outline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic": topic,
    "time": time,
    "speaker": speaker,
    "program_outline": programOutline
  };
}

class Meeting {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isApproved;
  String? agenda;
  String? room;
  bool? hasTranslation;
  String? startTime;
  String? endTime;

  Meeting({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isApproved,
    this.agenda,
    this.room,
    this.hasTranslation,
    this.startTime,
    this.endTime,
  });

  getMeetingTime(){
    DateTime dateTime = DateFormat('HH:mm:ss').parse(startTime!);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isApproved: json["is_approved"],
    agenda: json["agenda"],
    room: json["room"],
    hasTranslation: json["has_translation"],
    startTime: json["start_time"],
    endTime: json["end_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_approved": isApproved,
    "agenda": agenda,
    "room": room,
    "has_translation": hasTranslation,
    "start_time": startTime,
    "end_time": endTime,
  };
}


class ConferenceVenue {
  int? id;
  String? name;
  String? address;
  String? country;
  String? city;
  double? lat;
  double? lon;

  ConferenceVenue({
    this.id,
    this.name,
    this.address,
    this.country,
    this.city,
    this.lat,
    this.lon,
  });

  factory ConferenceVenue.fromJson(Map<String, dynamic> json) => ConferenceVenue(
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
