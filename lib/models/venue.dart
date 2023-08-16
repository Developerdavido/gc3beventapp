class Venue {
  int? id;
  String? name;
  String? address;
  String? country;
  String? image;
  String? city;
  double? lat;
  double? lon;
  List<VenueConference>? venueConference;

  Venue({
    this.id,
    this.name,
    this.address,
    this.country,
    this.city,
    this.image,
    this.lat,
    this.lon,
    this.venueConference,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    image: json["image"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"],
    venueConference: json["conferences"] == null ? [] : List<VenueConference>.from(json["conferences"]!.map((x) => VenueConference.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "country": country,
    "city": city,
    "lat": lat,
    "image": image,
    "lon": lon,
    "conferences": venueConference == null ? [] : List<dynamic>.from(venueConference!.map((x) => x.toJson())),
  };
}

class VenueConference {
  int? id;
  String? theme;
  DateTime? date;
  String? time;
  String? description;
  String? banner;

  VenueConference({
    this.id,
    this.theme,
    this.date,
    this.time,
    this.description,
    this.banner,
  });

  factory VenueConference.fromJson(Map<String, dynamic> json) =>
      VenueConference(
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