import 'package:intl/intl.dart';

class SavedMeeting {
  int? id;
  ConferenceMeeting? conference;
  String? room;
  bool? hasTranslation;
  String? startTime;
  String? endTime;
  List<Participant>? participants;


  getConferenceDate(DateTime? date) {
    String formattedDate = DateFormat('dd MMM yyyy').format(date!);
    return formattedDate;
  }
  getSavedMeetingTime(String? date){
    DateTime dateTime = DateFormat('HH:mm:ss').parse(date!);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }


  SavedMeeting({
    this.id,
    this.conference,
    this.room,
    this.hasTranslation,
    this.startTime,
    this.endTime,
    this.participants,
  });

  factory SavedMeeting.fromJson(Map<String, dynamic> json) => SavedMeeting(
    id: json["id"],
    conference: json["conference"] == null ? null : ConferenceMeeting.fromJson(json["conference"]),
    room: json["room"],
    hasTranslation: json["has_translation"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    participants: json["participants"] == null ? [] : List<Participant>.from(json["participants"]!.map((x) => Participant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "conference": conference?.toJson(),
    "room": room,
    "has_translation": hasTranslation,
    "start_time": startTime,
    "end_time": endTime,
    "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x.toJson())),
  };
}

class ConferenceMeeting {
  int? id;
  String? theme;
  String? venue;
  DateTime? startDateTime;
  DateTime? date;

  ConferenceMeeting({
    this.id,
    this.theme,
    this.venue,
    this.startDateTime,
    this.date,
  });

  factory ConferenceMeeting.fromJson(Map<String, dynamic> json) => ConferenceMeeting(
    id: json["id"],
    theme: json["theme"],
    venue: json["venue"],
    startDateTime: json["start_date_time"] == null ? null : DateTime.parse(json["start_date_time"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "theme": theme,
    "venue": venue,
    "start_date_time": "${startDateTime!.year.toString().padLeft(4, '0')}-${startDateTime!.month.toString().padLeft(2, '0')}-${startDateTime!.day.toString().padLeft(2, '0')}",
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
  };
}

class Participant {
  int? id;
  String? avatar;
  String? fullName;
  String? email;
  String? phone;
  String? country;
  String? organization;
  String? description;

  Participant({
    this.id,
    this.avatar,
    this.fullName,
    this.email,
    this.phone,
    this.country,
    this.organization,
    this.description,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    id: json["id"],
    avatar: json["avatar"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    country: json["country"],
    organization: json["organization"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "country": country,
    "organization": organization,
    "description": description,
  };
}