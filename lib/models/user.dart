class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    this.profilePhotoUrl,
    this.token,
  });

  int id;
  String name;
  String email;
  String username;
  String? profilePhotoUrl;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profilePhotoUrl: json["profile_photo_url"],
        token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "profile_photo_url": profilePhotoUrl,
        "access_token": token,
      };
}
