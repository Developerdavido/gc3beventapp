
class Site {
  int? id;
  String? image;
  String? name;
  DateTime? dateAndTime;
  String? description;
  String? type;
  double? lat;
  double? lon;
  double? cost;
  bool? isFavorite;
  int? availableSlots;
  List<VisitorsList>? visitorsList;
  DateTime? createdAt;

  Site({
    this.id,
    this.image,
    this.name,
    this.dateAndTime,
    this.description,
    this.type,
    this.lat,
    this.cost,
    this.isFavorite = false,
    this.lon,
    this.availableSlots,
    this.visitorsList,
    this.createdAt,
  });

  getFirstNameOfHotel() {
    var nameList = name!.split(" ");
    return nameList[0];
  }

  bool isFull(){
    return availableSlots == visitorsList?.length;
  }

  factory Site.fromJson(Map<String, dynamic> json) => Site(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    dateAndTime: json["date_and_time"] == null ? null : DateTime.parse(json["date_and_time"]),
    description: json["description"],
    type: json["type"],
    lat: json["lat"],
    lon: json["lon"],
    cost: json["cost"],
    availableSlots: json["available_slots"],
    visitorsList: json["visitors_list"] == null ? [] : List<VisitorsList>.from(json["visitors_list"]!.map((x) => VisitorsList.fromJson(x))),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "date_and_time": dateAndTime?.toIso8601String(),
    "description": description,
    "type": type,
    "lat": lat,
    "lon": lon,
    "cost": cost,
    "available_slots": availableSlots,
    "visitors_list": visitorsList == null ? [] : List<dynamic>.from(visitorsList!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
  };
}

class VisitorsList {
  int? id;
  String? avatar;
  String? fullName;
  String? email;
  String? phone;
  String? country;

  VisitorsList({
    this.id,
    this.avatar,
    this.fullName,
    this.email,
    this.phone,
    this.country,
  });

  factory VisitorsList.fromJson(Map<String, dynamic> json) => VisitorsList(
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
