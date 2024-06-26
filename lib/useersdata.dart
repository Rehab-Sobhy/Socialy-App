import 'dart:typed_data';

class UsersData {
  String? name;
  String? password;
  String? email;
  String? title;

  final String imageUrl;

  // final List following;
  // final List follower;

  UsersData({
    //required this.follower,
    //required this.following,
    required this.email,
    required this.password,
    required this.name,
    required this.title,
    required this.imageUrl,
  });

  Map<String, dynamic> ToMap() {
    return {
      "name": name,
      "password": password,
      "email": email,
      "tilte": title,
      "imageUrl": imageUrl,
    };
  }
}
