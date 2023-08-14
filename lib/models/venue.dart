class Venue {
  int? id;
  String? name;
  String? address;
  String? country;
  String? city;
  double? lat;
  double? lon;
  List<Conference>? conferences;

  Venue({
    this.id,
    this.name,
    this.address,
    this.country,
    this.city,
    this.lat,
    this.lon,
    this.conferences,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"],
    conferences: json["conferences"] == null ? [] : List<Conference>.from(json["conferences"]!.map((x) => Conference.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "country": country,
    "city": city,
    "lat": lat,
    "lon": lon,
    "conferences": conferences == null ? [] : List<dynamic>.from(conferences!.map((x) => x.toJson())),
  };
}

class Conference {
  int? id;
  String? theme;
  DateTime? date;
  String? time;
  String? description;
  String? banner;

  Conference({
    this.id,
    this.theme,
    this.date,
    this.time,
    this.description,
    this.banner,
  });

  factory Conference.fromJson(Map<String, dynamic> json) =>
      Conference(
        id: json["id"],
        theme: json["theme"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        description: json["description"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "theme": theme,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month
            .toString().padLeft(2, '0')}-${date!.day.toString().padLeft(
            2, '0')}",
        "time": time,
        "description": description,
        "banner": banner,
      };

}