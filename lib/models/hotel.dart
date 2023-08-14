

class Hotel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isApproved;
  String? image;
  String? name;
  String? description;
  num? rate;
  num? lat;
  num? lon;
  bool? isFavorite;
  String? bookingUrl;

  Hotel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isApproved,
    this.image,
    this.name,
    this.description,
    this.rate,
    this.isFavorite = false,
    this.lat,
    this.lon,
    this.bookingUrl,
  });


  getFirstNameOfHotel() {
    var nameList = name!.split(" ");
    return nameList[0];
  }

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isApproved: json["is_approved"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    rate: json["rate"],
    lat: json["lat"],
    lon: json["lon"],
    bookingUrl: json["booking_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_approved": isApproved,
    "image": image,
    "name": name,
    "description": description,
    "rate": rate,
    "lat": lat,
    "lon": lon,
    "booking_url": bookingUrl,
  };
}