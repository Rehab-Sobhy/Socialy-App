import 'dart:typed_data';

class UsersData {
  String? name;
  String? password;
  String? email;
  String? title;

  Uint8List imgpath;

  UsersData({
    required this.email,
    required this.password,
    required this.imgpath,
    required this.name,
    required this.title,
  });

  Map<String, dynamic> ToMap() {
    return {
      "name": name,
      "password": password,
      "email": email,
      "tilte": title,
      "imgpath": imgpath,
    };
  }
}
