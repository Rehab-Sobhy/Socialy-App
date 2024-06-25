import 'dart:typed_data';

class UsersData {
  String? name;
  String? password;
  String? email;
  String? title;

  String? profileimg;

  UsersData({
    required this.email,
    required this.password,
    required this.profileimg,
    required this.name,
    required this.title,
  });

  Map<String, dynamic> ToMap() {
    return {
      "name": name,
      "password": password,
      "email": email,
      "tilte": title,
      "profileimg": profileimg,
    };
  }
}
