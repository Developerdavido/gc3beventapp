

class AuthModal {
  String? token;
  User? user;

  AuthModal({
    this.token,
    this.user,
  });

  factory AuthModal.fromJson(Map<dynamic, dynamic> json) => AuthModal(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  dynamic avatar;
  String? fullName;
  String? email;
  String? phone;
  String? country;

  User({
    this.id,
    this.avatar,
    this.fullName,
    this.email,
    this.phone,
    this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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